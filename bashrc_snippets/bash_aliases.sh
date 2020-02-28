# git aliases
alias gs="git status"
alias gco="git checkout"
#alias gca="git commit -am"
alias gcm="git commit -m"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# cloud aliases
alias ssh_azure="ssh ourownstory@xx.xx.xxx.xxx"
alias tb_azure="tensorboard --logdir=results --host xx.xx.xxx.xxx --port 6006"
alias ssh_aws="ssh -i "~/../keyfile.pem" ec2-user@xx.xxx.xxx.xxx"
alias jupyter_aws="ssh -i "~/../keyfile.pem" -L 8888:localhost:8888 ec2-user@xx.xxx.xxx.xxx"

# venv aliases
alias venvxxx="source ~/venv/xxx/bin/activate"
