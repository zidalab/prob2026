# 概率论与数理统计 课程网站

欢迎来到“概率论与数理统计”课程的官方网站。本仓库托管了课程网站的全部源代码与内容。

## 网站链接

**[https://zidalab.github.io/prob2026](https://zidalab.github.io/prob2026)**

## 课程简介

本课程面向 **2024级生物医学工程02班**，系统讲授概率论与数理统计的核心概念与方法，包括：

-   随机事件与概率
-   随机变量及其分布
-   多维分布与数字特征
-   大数定律与中心极限定理
-   抽样分布与参数估计

课程强调在医学与工程领域中的数据建模与推断思维，致力于理论与应用的结合。

## 授课信息

-   **时间**：第1–18周，周二第7–9节（14:15–16:40）
-   **地点**：深圳大学丽湖校区

## 教材

-   **《概率论与数理统计》（第四版）**，盛骤、谢式千、潘承毅，高等教育出版社。


## 技术栈

本网站使用 [Jekyll](https://jekyllrb.com/) 构建，并采用 [Just the Docs](https://just-the-docs.github.io/just-the-docs/) 主题。

## 如何本地运行

1.  **克隆仓库**:
    ```bash
    git clone https://github.com/zidalab/prob2026.git
    cd prob2026
    ```

2.  **安装依赖**:
    确保你已经安装了 [Ruby](https://www.ruby-lang.org/en/documentation/installation/) 和 [Bundler](https://bundler.io/)。
    ```bash
    bundle install
    ```

3.  **启动服务**:
    ```bash
    bundle exec jekyll serve --config _config.yml,_config.local.yml
    ```
    网站将在 `http://localhost:4000` 上运行。

    Windows 下也可以双击 `run.bat`。

## GitHub Pages 部署

网站使用 `Gemfile.lock` 中固定版本的 `just-the-docs` 主题；本地与 GitHub Actions 都使用 `theme: just-the-docs`，无需 `remote_theme`。

1. 在 GitHub 仓库的 **Settings → Pages → Build and deployment → Source** 中选择 **GitHub Actions**。
2. 提交并推送本次配置、工作流和脚本改动，包括删除 `.github/workflows/jekyll2.yml`。保留唯一的部署工作流 `.github/workflows/jekyll.yml`。
3. 每次更新 `main` 后，该工作流会构建网站，检查侧边栏、CSS、表格样式和七章 HTML 课件链接，再部署到 `https://zidalab.github.io/prob2026/`。

`_config.yml` 是 GitHub Pages 的正式配置，`_config.local.yml` 只覆盖本地地址。`_config.github-pages.yml` 保留为旧配置备份，部署时不使用；不要再用它替换 `_config.yml`。

推送前可以检查正式构建：

```bash
bundle exec jekyll build --config _config.yml
bundle exec ruby scripts/verify_site.rb _site /prob2026
```

## 贡献

欢迎对课程内容提出修改建议或报告问题。你可以通过以下方式贡献：

-   在 [Issues](https://github.com/zidalab/prob2026/issues) 页面提交问题。
-   Fork 本仓库，进行修改后提交 Pull Request。

## 许可

本课程网站的内容遵循 [MIT License](LICENSE) 许可。
