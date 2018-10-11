# setting local path for brew packages
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH":

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# make life better with these aliases
alias josnpp='python -m json.tool'
alias serve='python -m SimpleHTTPServer 8000'
alias how-to-undo-last-commit-but-keep-changes='echo "git reset HEAD^"'
alias how-to-reset-git-branch='echo "git fetch";echo "git reset origin/whatever --hard"'
alias how-to-undo-cherry-pick='echo "git rebase -p --onto SHA^ SHA"'
alias how-to-rewrite-history='echo "git rebase -i HEAD~3"'
alias how-to-squash-and-go='echo "git reset --soft HEAD~3";echo "git commit -m \"New message for the combined commit\""'
alias add-key='ssh-add ~/.ssh/id_rsa'
alias reload-profile='source ~/.bash_profile'

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# git bash completion
GIT_PS1_SHOWDIRTYSTATE=true

# bash prompt
Reset="\[\033[0m\]"
Red="\[\033[1;31m\]"
Green="\[\033[1;32m\]"
Blue="\[\033[1;34m\]"

gitPs1()
{
        branch="$(git symbolic-ref HEAD 2> /dev/null)";

        if [ -n "$branch" ]; then
                printf " (%s)" "${branch##refs/heads/}";
        fi
}

export PS1="\D{%F %T} $Green\u@\h$Reset:$Blue\w$Reset"'$(git branch > /dev/null 2>&1; \
if [ $? -eq 0 ]; then \
        echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
        if [ $? -eq 0 ]; then \
                echo "'$Green'"; \
        else \
                echo "'$Red'"; \
        fi)$(gitPs1 " (%s)")'$Reset'"; \
fi)'"\n\$ "


# Set terminal title
function title {
    echo -ne "\033]0;"$*"\007"
}

# I can has colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


# Some tips from remy sharp, https://remysharp.com/2018/08/23/cli-improved
alias cat='bat'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
source ~/.fzf.bash
