@echo off
setlocal
pushd "%~dp0" || exit /b 1
where git.exe >nul 2>nul || goto :missing
where gh >nul 2>nul || goto :missing
if not exist "GITHUB.md" goto :wrong
if not exist ".agents\skills\" goto :wrong
set "GH_HOST=github.com"
call gh auth status --hostname github.com >nul 2>nul || goto :auth
if not exist ".git\" (
    git init -b main || goto :error
)
git remote get-url origin >nul 2>nul && goto :existing
git symbolic-ref --quiet HEAD >nul 2>nul || goto :error
git var GIT_AUTHOR_IDENT >nul 2>nul || goto :identity
git var GIT_COMMITTER_IDENT >nul 2>nul || goto :identity
git add -- .agents/skills .gitattributes .gitignore README.md SKILLS.md LICENSES.md GITHUB.md SHA256SUMS.txt Publish-to-GitHub.cmd || goto :error
git diff --cached --quiet --exit-code
if errorlevel 2 goto :error
if errorlevel 1 git commit -m "Add Skill archive" || goto :error
call gh repo create codex-skill-archive --private --source "." --remote origin --push || goto :error
echo.
echo Published the Skill archive as a private repository.
set "rc=0"
goto :finish
:missing
echo Install Git and GitHub CLI, or follow GITHUB.md for GitHub Desktop.
goto :failed
:auth
echo Sign in by running: gh auth login --hostname github.com
goto :failed
:identity
echo Git needs a commit name and email. Use GitHub Desktop or configure Git first.
goto :failed
:existing
echo This folder already has an origin remote. Use GITHUB.md to publish pending changes.
goto :failed
:wrong
echo Extract the complete GitHub upload ZIP before running this file.
goto :failed
:error
echo Publication did not finish. Read the Git or GitHub CLI message above and see GITHUB.md.
:failed
set "rc=1"
:finish
popd
if not defined SKILL_ARCHIVE_NO_PAUSE pause
exit /b %rc%
