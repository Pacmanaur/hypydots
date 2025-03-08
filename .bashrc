#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\033[38;2;255;222;176m\] \[\033[38;2;255;200;50m\]\u@\h\[\033[0m\] \[\033[38;2;72;151;106m\]→ \[\033[38;2;168;153;132m\]\w\[\033[0m\]$(git_prompt_info)\n\[\033[38;2;214;121;33m\]❯❯❯\[\033[0m] '

fastfetch

git_prompt_info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return  # only display if inside a git repo
  local branch
  branch=$(git symbolic-ref HEAD 2>/dev/null) || return
  branch=${branch#refs/heads/}
  echo "($branch)"
}

