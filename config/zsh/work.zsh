# Perforce (p4)
# export P4CONFIG='.p4config'
# export P4USER='aschultz'
# export P4PORT='1999'
# End of Perforce

alias dmake="./scripts/docker/localcontainer/docker-u20-make -e ENABLE_CCACHE=${ENABLE_CCACHE} -e CCACHE_DIR=${CCACHE_DIR} -e CCACHE_MAXSIZE=${CCACHE_MAXSIZE} -e CCACHE_COMPILERCHECK=${CCACHE_COMPILERCHECK}"

# Icecream / Icemon
# export ENABLE_ICECC=0
# export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
idmake () {
    if ! systemctl is-active --quiet iceccd; then
        echo "Enabling Ice Cream" 
        sudo systemctl start iceccd
    fi
    if ! systemctl is-active --quiet iceccd; then
        echo "Failed to enable Ice Cream"
        return
    fi
    dmake -e ENABLE_ICECC=1 --fn -j44 $*
}
# End of Icecream / Icemon

export ROKU_BUILD_AUDIT_ENABLE=false
export HOST_MEDIA_DIR=/media/aschultz/NAIOMT
export PREFERRED_VIDEO_RESOLUTION=720
export ALSA_PLAYBACK_DEVICE="default:Generic"
export NATIVE_ETHERNET=enp6s0

