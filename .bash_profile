export WORKON_HOME=$HOME/.virtualenvs  # Or another directory of your choice
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

source /usr/local/etc/profile.d/bash_completion.sh
. ~/.bashrc

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Kubectl shell completion
source '/Users/frsmith/.kube/completion.bash.inc'
  

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/frsmith/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/frsmith/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/frsmith/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/frsmith/bin/google-cloud-sdk/completion.bash.inc'; fi
