# add modifications to python path etc
if [ -f ~/.py_mods ]; then
    . ~/.py_mods
fi

# add hacks specific to your device
if [ -f ~/.surface_hacks ]; then
    . ~/.surface_hacks
fi
