# git aliases
alias gits="git status"
alias gitx="git checkout"
alias gita="git add . ; git commit -am"
alias gitm="git commit -m"

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
v(){
        # use: $ v myenvname
        source ~/venv/$1/bin/activate
}

v-reset(){
        # delete and recreate venv
        rm -r ~/venv/$1
        python3 -m venv ~/venv/$1
        source ~/venv/$1/bin/activate
}

