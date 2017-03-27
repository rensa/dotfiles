# james's .bashrc

# The same home directories are used on multiple machines.  Some machines
# require slightly different configurations.  Please add your own
# configuration to the "Local definitions" section for the relevant machine.
# However, if the configuration is known to work on all machines then it can
# be written outside of the case statement below.

case "$HOSTNAME" in
    rensa-mbp)
        export PATH="/Users/rensa/miniconda3/bin:$PATH"
        export CLICOLOR=1
        export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd 
        ;;
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
        module load R/3.2.1
        module load encfs/1.8.1
        ;;  
    blizzard*|maelstrom*|monsoon*|squall*)
        # Global definitions
        if [ -f /etc/bashrc ]; then
            . /etc/bashrc
        fi  

        # Local definitions
        module add intel
        module load R/3.2.1
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
    *)  
        echo "No bashrc definitions for $HOSTNAME"
        ;;  
esac
