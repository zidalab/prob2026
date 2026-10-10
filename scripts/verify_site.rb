require 'pathname'
require 'uri'

destination = Pathname.new(ARGV.fetch(0, '_site')).expand_path
baseurl = ARGV.fetch(1, '/prob2026').sub(%r{/$}, '')

def verify(condition, message)
  abort "Site verification failed: #{message}" unless condition
end

def read_output(path)
  verify(path.file?, "missing generated file #{path}")
  path.read(encoding: 'UTF-8')
end

schedule = nil
%w[index.html docs/schedule.html docs/instructors.html].each do |page|
  html = read_output(destination.join(page))
  verify(html.include?('class="side-bar"'), "missing theme sidebar in #{page}")
  %w[just-the-docs-default.css just-the-docs-head-nav.css].each do |name|
    href = "#{baseurl}/assets/css/#{name}"
    verify(html.include?(%Q(href="#{href}")), "incorrect stylesheet URL in #{page}: #{href}")
    read_output(destination.join('assets', 'css', name))
  end
  schedule = html if page == 'docs/schedule.html'
end

css = read_output(destination.join('assets/css/just-the-docs-default.css'))
%w[.side-bar .label-blue .label-red .schedule-toolbar .label-template].each do |selector|
  verify(css.include?(selector), "missing theme or custom CSS: #{selector}")
end
verify(css.match?(/\.main-content\s+table\s*\{/), 'missing custom table styles')

# Resolve relative lesson links against the published schedule URL.
page_url = "https://example.test#{baseurl}/docs/schedule.html"
(1..7).each do |chapter|
  href = "../assets/lecture_note_HTML/Chap#{chapter}.html"
  verify(schedule.include?(%Q(href="#{href}")), "missing chapter #{chapter} HTML link")
  target_url = URI.join(page_url, href)
  prefix = "#{baseurl}/"
  verify(target_url.path.start_with?(prefix), "chapter #{chapter} link escapes the site base URL")
  relative_path = target_url.path.delete_prefix(prefix)
  target = destination.join(relative_path)
  verify(target.file?, "broken chapter #{chapter} HTML link")
  source = Pathname.new(__dir__).parent.join(relative_path)
  verify(target.binread == source.binread, "chapter #{chapter} HTML was unexpectedly modified during build")
end

puts 'Verified theme layouts, stylesheet URLs, custom styles, and all seven HTML lessons.'
