# james's .bashrc

# The same home directories are used on multiple machines.  Some machines
# require slightly different configurations.  Please add your own
# configuration to the "Local definitions" section for the relevant machine.
# However, if the configuration is known to work on all machines then it can
# be written outside of the case statement below.

case "$HOSTNAME" in
    tensor*|cl1n*)
        # Local definitions
        module add intel
        ;;  
    tempest*|cyclone*|hurricane*|typhoon*)
        # Global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi  

        # Local definitions
        module add intel
        module load R/3.3.3
        module load encfs/1.8.1
        ;;  
    blizzard*|maelstrom*|monsoon*|squall*)
        # Global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi  

        # Local definitions
        module add intel
        module load R/3.3.3
        module load encfs/1.8.1
        
        # wsupload: function for uploading weather station video
        # args: start time, end time, frame rate
        # usage: wsupload "12:00" "14:00" 30
        wsupload() {
            cd ~/ccrcpi-scripts
            ./custom-youtube.sh . /srv/ccrc/data48/z3479352/ccrc-weather $1 $2 $3
        } 
        ;;  

    katana*|kc*)
        # Global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi  

        # Local definitions
        module add intel
        ;;  
    kdm*)
        # Global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi  

        # Local definitions
        ;;
    raijin*)
        
        # avoid sourcing multiple times
        [ -n "$nf_bashrc_sourced" ] && return

        # source global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi

        if [ -n "$PS1" ]; then

            # stuff for interactive sessions
            # (int. ses. aliases, noisy output, tty settings) go here
            true
        fi

        nf_bashrc_sourced=YES
        ;;
    rensa-sb2)
        echo "Interacting locally on rensa-sb2"
        export CLICOLOR=1
	    export LS_COLORS="ow=1;36;40:ex=1;33;40"
        # export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
        export SCREENDIR=$HOME/.screen

        # source NVM
        export NVM_DIR="$HOME/Code/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

        # local gem installation
        export GEM_HOME="$HOME/gems"
        export PATH="$HOME/gems/bin:$PATH"

        cd /rensa
        ;;
    *)  
        if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
            echo "No bashrc definitions for $HOSTNAME"
        else
            # put local shell (ie. not connected via SSH) defs here
            # export PATH="/Users/rensa/miniconda3/bin:$PATH"
            export CLICOLOR=1
	        export LS_COLORS="ow=1;36;40:ex=1;33;40"
            # export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd



        fi
        ;;  
esac

# added by Miniconda3 installer
# export PATH="/home/rensa/miniconda3/bin:$PATH"
