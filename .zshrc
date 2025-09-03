# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR="nvim"

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export GO11MODULE=on

export TF_VAR_token=$(cat ~/.secrets/.terraform-personal_access_token.txt)
export KUBECONFIG="$HOME/.secrets/.lke-cluster-config.yaml"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dstufft"


# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 15


plugins=(git)

source $ZSH/oh-my-zsh.sh


## Kubernetes
# Aliases for Kubectl
source <(kubectl completion zsh)
alias k="kubectl"
complete -F __start_kubectl k
alias kg="kubectl get"
alias kd="kubectl describe"
alias ke="kubectl edit"
alias kgp="kubectl get po"
alias kgpw="kubectl get po -w"
alias kgpwide="kubectl get po -o wide"
alias kgpl="kubectl get po -l"
alias kgd="kubectl get deploy"
alias kgs="kubectl get sts"
alias kgsv="kubectl get svc"
alias kcx="kubectx"
alias kgcx="kubectl config current-context"
alias curr="kubectl config current-context && kubectl config view --minify -o jsonpath='{..namespace}'"
alias kns="kubens"
alias kgsec="kubectl get secrets"
alias kgcm="kubectl get cm"
alias kgi="kubectl get ingress"
alias kgs="kubectl get svc"
alias kgcj="kubectl get cronjob"
alias kgj="kubectl get job"
alias kga="kubectl get all"
alias kgaa="kubectl get all -A"
alias ked="kubectl edit deploy"
alias kep="kubectl edit po"
alias kl="kubectl logs"
alias klf="kubectl logs -f"
alias klp="kubectl logs -p"
alias kdsec="kubectl describe secret"
alias kdcm="kubectl describe configmap"
alias kdp="kubectl describe pod"
alias kdd="kubectl describe deploy"

# Variables for Kubectl
export do="--dry-run=client -o yaml"
export d="--dry-run=client"
export oy="-oyaml"

## Tmux
alias tns="tmux new -s x1"
