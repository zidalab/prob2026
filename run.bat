@echo off
cd /d "%~dp0"
bundle exec jekyll serve --config _config.yml,_config.local.yml
