#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -h'
alias conda='opt/miniconda3/bin/conda'
PS1='[\u@\h \W]\$ '

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

alias sdl-config=sdl2-config
export PATH=$PATH:~/.local/bin:~/.cargo/bin
export EDITOR=vim

alias hy-vpn-connect='sudo systemctl start openvpn-client@openvpn'
alias hy-vpn-disconnect='sudo systemctl stop openvpn-client@openvpn'
alias hy-vpn-status='systemctl status openvpn-client@openvpn'

alias gvim-session='gvim -S Session.vim' 

condainit() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}
