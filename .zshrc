# ZSH Configuration

  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  # ENABLE_CORRECTION="true"
  COMPLETION_WAITING_DOTS="true"
  plugins=(git)

  source $ZSH/oh-my-zsh.sh

# User Configuration

  ## NVM

    export NVM_DIR="$HOME/.nvm"

    ### This loads nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  

    ### This loads nvm bash_completion
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  

    ### Auto-nvm use (from README)
    autoload -U add-zsh-hook
    load-nvmrc() {
      local node_version="$(nvm version)"
      local nvmrc_path="$(nvm_find_nvmrc)"

      if [ -n "$nvmrc_path" ]; then
        local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    
        if [ "$nvmrc_node_version" = "N/A" ]; then
          nvm install
        elif [ "$nvmrc_node_version" != "$node_version" ]; then
          nvm use
        fi
      elif [ "$node_version" != "$(nvm version default)" ]; then
        echo "Reverting to nvm default version"
        nvm use default
      fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc

