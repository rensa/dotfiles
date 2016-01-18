# james's .bashrc

# The same home directories are used on multiple machines.  Some machines
# require slightly different configurations.  Please add your own
# configuration to the "Local definitions" section for the relevant machine.
# However, if the configuration is known to work on all machines then it can
# be written outside of the case statement below.

case "$HOSTNAME" in
    rensa-mbp)
        export PATH="/Users/rensa/miniconda3/bin:$PATH"
        
        # for opening files and folders in visual studio code
        code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}  
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
        module load R/3.0.3
        module load encfs/1.8.1
        ;;  
    blizzard*|maelstrom*|monsoon*|squall*)
    # Global definitions
    if [ -f /etc/bashrc ]; then
        . /etc/bashrc
    fi  

    # Local definitions
    module add intel
    module load R/3.0.3
    module load encfs/1.8.1
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
    *)  
        echo "No bashrc definitions for $HOSTNAME"
        ;;  
esac
