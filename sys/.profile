###################################
# Daantjie's startup configuration.
###################################

##########
# hardware

# Emulate a the middle mouse click on the Kensington Orbit Trackball
xinput --set-prop \
       --type=int \
       --format=8 \
       "Primax Kensington Eagle Trackball" \
       "Evdev Middle Button Emulation" "1"
