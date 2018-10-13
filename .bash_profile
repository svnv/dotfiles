# Add `~/bin` to the `$PATH`
export PATH="/usr/local/go/bin:$HOME/bin:$PATH:$HOME/go/bin:$PATH:";
export GOPATH="/Users/sven/go"
#export GOROOT="/usr/local/opt/go/libexec/bin"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# git bash completion
GIT_PS1_SHOWDIRTYSTATE=true

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# yubikey
export OPENSC_LIBS=$(brew --prefix opensc)/lib

# fzf
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
source ~/.fzf.bash