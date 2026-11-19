# Skill 归档与 GitHub 上传说明 V1

## 网页上传 ZIP

在 GitHub 仓库里选择 **Add file → Upload files**，拖入 `Skill_GitHub_上传包_V1.zip` 后提交。GitHub 将保留一个可下载的 ZIP。浏览器单个文件上限为 25 MiB。 [GitHub 网页上传规则](https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository)

## 发布可逐个浏览的 Skill 文件

1. 解压 `Skill_GitHub_上传包_V1.zip`，打开包含 `README.md` 的目录。
2. Windows 安装 Git 和 GitHub CLI 后，首次运行 `gh auth login --hostname github.com` 完成登录，并配置 Git 提交身份。
3. 双击 `Publish-to-GitHub.cmd`。它会提交归档文件，创建名为 `codex-skill-archive` 的私有仓库并推送。 [GitHub CLI 命令文档](https://cli.github.com/manual/gh_repo_create)

如果使用 GitHub Desktop，在解压目录运行 `git init -b main`，再从 Desktop 的 **File → Add local repository** 加入该目录。提交全部文件并点击 **Publish repository**。保存到已有仓库时，将解压后的文件放进该仓库，提交并推送。 [GitHub Desktop 发布文档](https://docs.github.com/en/desktop/adding-and-cloning-repositories/adding-an-existing-project-to-github-using-github-desktop?platform=windows)

如果命令显示仓库已存在，请把解压目录加入 GitHub Desktop 后核对目标再推送。已有 `origin` 时，可以在 Desktop 中查看远程仓库和未推送的提交。首次推送过程中如出现 GitHub HTTPS 认证提示，可按 GitHub CLI 的说明执行 `gh auth setup-git`。 [GitHub CLI Git 认证](https://cli.github.com/manual/gh_auth_setup-git)

## 本机备份

`Skill_本机归档_V1.zip` 带有完整索引、归档文件和校验清单，供本机留存和迁移。全量包包含带专有许可的插件缓存。日后发布其中其他 Skill 时，可先从索引查找许可和安装来源。
