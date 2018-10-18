# GitFlow

Esse repositorios guarda comandos scripts que auxiliam na manutenção de um gitflow

## Para instalar:
• Fazer clone do projeto

• Executar `./setup.sh`

• Executar `source ~/.bashgitflowscripts`

## Comandos
alias gb='create_bugfix'
alias gh='create_hotfix'
alias gr='create_release'
alias gt='create_task'
alias gf='create_feature'
alias gs='create_story'
alias gst='create_subtask'

• `gb`: cria uma branch bugfix. Parâmetros: nome da branch no *formato APP-XXXX*

• `gh`: cria uma branch hotfix *sempre da master*. Parâmetros: nome da branch no *formato APP-XXXX*.

• `gr`: cria uma branch release *sempre da dev*. Parâmetros: nome do branch

• `gt`: cria uma branch task. Parâmetros: nome da branch no *formato APP-XXXX*

•  `gf`: cria uma branch feature *sempre da dev*. Parâmetros: nome da branch

• `gs`: cria uma branch story *sempre da feature*. Parâmetros: nome da branch no *formato APP-XXXX*

• `gst`: cria uma branch subtask *sempre da story*. Parâmetros: nome da branch no *formato APP-XXXX*
