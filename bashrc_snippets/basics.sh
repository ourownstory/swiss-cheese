# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them into .bashrc directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
# add these lines to .bashrc to do so:

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.py_mods ]; then
    . ~/.py_mods
fi

# add hacks specific to your device
if [ -f ~/.surface_hacks ]; then
    . ~/.surface_hacks
fi
