# zmodload zsh/zprof
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# --- Removed due to random fzf-tab crashes
# --- COMPLETION_WAITING_DOTS="true"

# TMUX
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOCONNECT="false"
ZSH_TMUX_AUTOSTART_ONCE="false"
ZSH_TMUX_FIXTERM="true"
ZSH_TMUX_UNICODE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z zsh-completions zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search macos tumult safe-paste web-search jump dirhistory vi-mode aws tmux fzf-tab podman direnv)

source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-history-substring-search keybinding
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^ ' autosuggest-accept


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

set -o vi
bindkey -v

# Pomodoro script aliases
alias pomo='$HOME/.scripts/pomodoro.sh'
alias pobr='$HOME/.scripts/pomodorobreak.sh'

# Use special open for xcode to use RAM disk and .xcworkspace directory
alias xopen='xopen.sh'

# Show current status of battery
alias battery='pmset -g batt'

# Hibernate MacOS
alias hibernate='$HOME/.scripts/hibernate.sh'

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Trim search on google
alias g="google"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
#for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#	alias "${method}"="lwp-request -m '${method}'"
#done

alias clock='while true; do tput clear; date +" %H : %M : %S " | toilet -F gay -f smmono9; sleep 1; done'
alias tn="(){tmux new -s $1}"
alias e="exit"
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias v='nvim'
alias vi='nvim'
alias j='jump'
alias l='ll'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias zshrc='nvim ~/.zshrc' # Quick access to the ~/.zshrc file
alias grep='grep --color'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias dir='ls -alrtGpFO'
alias ll='eza --icons -labh --group-directories-first --git'      #long list
alias llt='eza --icons -labh --sort=mod --reverse --group-directories-first --git'   #sorted by date,show type,human readable
alias llr='eza --icons -labhR --no-user --group-directories-first --git'   #recursive,show type,human readable
alias lll='eza --icons -labh --no-user --group-directories-first --git --total-size'   #recursive,show type,human readable
#alias fdir='find . -type d -name'
#alias ffile='find . -type f -name'
alias catimg='imgcat'
alias img='imgcat'
alias mdfind='mdfind -name'
alias lg='lazygit'

# Alias for open file in (neo)vim via toggleterm
# alias f=floaterm
# see https://github.com/nikvdp/neomux/blob/3e5e754b1019bad96b4a012eda500a48aed8543d/plugin/bin/funcs.sh
# alias no='nvr -l'
# alias nw='nvr -c "chdir $PWD"'
# alias f='no'
alias f="ton"
alias no="ton"

# Alias for tmux session selection script
# alias tm='~/.scripts/tm.sh'


# Alias for tmuxinator
alias tx='tmuxinator'
alias mux='tmuxinator'

# Alias for tmux
alias tks="tmux kill-session"

# zsh syntax highlighting
# TODO: Remove due to automatic loadin in plugins section
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=/usr/local/opt/python/libexec/bin:$PATH
PATH=/usr/local/opt/ruby/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin
PATH=/usr/local/opt/curl/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=~/.scripts:$PATH
PATH=~/.ebcli-virtual-env/executables:$PATH
PATH="$HOME/.local/share/nvim/mason/bin:$PATH"


# fzf-tab tmux
EZAPREVIEW='eza --icons -la --no-permissions --no-user --no-filesize --group-directories-first --git $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' fzf-preview $EZAPREVIEW
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview $EZAPREVIEW
zstyle ':fzf-tab:*' popup-min-size 100 0
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
zstyle ':fzf-tab:complete:*:options' fzf-preview
zstyle ':fzf-tab:complete:*:argument-1' fzf-preview

# --------------------------------------------------------------------------------------
# Define NNN configuration
BLK="00" CHR="03" DIR="04" EXE="01" REG="00" HARDLINK="06" SYMLINK="06" MISSING="01" ORPHAN="07" FIFO="07" SOCK="07" OTHER="01"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_OPTS="H"
export NNN_PLUG='f:finder;o:fzopen;d:diffs;x:preview-tui;y:nuke;'
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_TRASH="trash"
source ~/.zshrc.nnn.quitcd
#export NNN_OPENER=~/.config/nnn/plugins/nuke
alias n='n -eH'
alias nnn='n -eH'
# --------------------------------------------------------------------------------------

export GEM_HOME="/Users/$USER/.gem"

export LC_ALL=de_DE.UTF-8
export LANG=de_DE.UTF-8

export DISPLAY=:0

# Fix issue with nnn and preview-tui
# https://github.com/jarun/nnn/issues/871
export PAGER='less -R'

# Default profile for aws
export AWS_DEFAULT_PROFILE=ContactService

# VOLTA -- node version management
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

#Fix issue with vim floaterm percentage sign
export PROMPT_EOL_MARK=""

#Deactivate auto update for TLDR
export TLDR_AUTO_UPDATE_DISABLED=true

# --------------------------------------------------------------------------------------
# Define history options
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
# --------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------
# FZF -- fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --no-ignore-vcs --exclude .git --exclude .DS_Store --exclude node_modules --exclude Library --exclude .marks'
export FZF_DEFAULT_OPTS='--multi --reverse --no-height --extended'
export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --no-ignore-vcs --exclude .git --exclude .DS_Store --exclude node_modules --exclude Library --exclude .marks'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --no-ignore-vcs --exclude .git --exclude .DS_Store --exclude node_modules --exclude Library --exclude .marks'
export FZF_ALT_C_OPTS='--border --info=inline'
export FZF_DEFAULT_OPTS='--multi --reverse --no-height --extended --color=bg+:#1d2021,bg:#282828,spinner:#fb4934,hl:#d8a657,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#a9b665,marker:#fb4934,fg+:#ebdbb2,prompt:#7daea3,hl+:#e78a4e'
# --------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------
# FZF -- git tool
# TODO: define workflow / tools / lazygit / nvim
# source ~/.scripts/external/fzf-git.sh/fzf-git.sh
# --------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------
# Github authentication for read access
export GITHUB_USER=$(security find-generic-password -s "GITHUB_READ_TOKEN" | grep -E "acct" | cut -d'"' -f4)
export GITHUB_TOKEN=$(security find-generic-password -a "$GITHUB_USER" -s "GITHUB_READ_TOKEN" -w)
# --------------------------------------------------------------------------------------

# --------------------------------------------------------------------------------------
# PLUGINS, SCRIPTS, TOOLS
# iTERM -- shell tools
# Remove for better performance
# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# HOMEBREW path
export HOMEBREW_PREFIX=$(brew --prefix)

# FUCK -- command correction
eval $(thefuck --alias)

# ZSH AUTOPAIR
source ~/.oh-my-zsh/custom/plugins/zsh-autopair/autopair.zsh
autopair-init

# ZOXIDE -- cd alternative
eval "$(zoxide init zsh)"

# FORGIT -- interactive git helper
[ -f "$HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh" ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

# FUNCTIONS
export FPATH="/Users/$USER/.zshfunc:$FPATH"
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -Uz volume
autoload -Uz omni
# --------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------
# LOCATEDB -- create repo list
# Repo db for nvim telescope repo list
# https://egeek.me/2020/04/18/enabling-locate-on-osx/
if which glocate > /dev/null; then
  alias locate="glocate -d $HOME/locatedb"

  # Using cache_list requires `LOCATE_PATH` environment var to exist in session.
  # trouble shoot: `echo $LOCATE_PATH` needs to return db path.
  [[ -f "$HOME/locatedb" ]] && export LOCATE_PATH="$HOME/locatedb"
fi

alias loaddb="gupdatedb --localpaths=$HOME --prunepaths=/Volumes --output=$HOME/locatedb"
# --------------------------------------------------------------------------------------


# --------------------------------------------------------------------------------------
# AUTO LS --- Add auto ll to cd
# Inspired by https://github.com/aikow/zsh-auto-ls
auto_ls() {
  ll
}
# Check if auto-ls has already been added to the chpwd_functions array. This
# ensures that resourcing the zshrc file doesnt cause ls to be run twice.
if [[ ! " ${chpwd_functions[*]} " =~ "auto_ls" ]]; then
  chpwd_functions=(auto_ls $chpwd_functions)
fi
# --------------------------------------------------------------------------------------

# zprof
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
