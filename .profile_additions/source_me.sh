# Tested in Bash and ZSH. will grab the shell the terminal was launched in. Doesn't work in subshells
cur_shell=${SHELL/*\//} 

case $cur_shell in
bash)
  source ${HOME}/.profile_additions/.bash_specific.sh
  ;;
zsh)
  source ${HOME}/.profile_additions/.zsh_specific.sh
  ;;
esac
