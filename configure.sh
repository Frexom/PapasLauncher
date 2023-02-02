#Stopping at first error
set -e

echo  -e "Using Adobe flashplayer Projector archive\n\n"

#Check if flashplayer-projector is installed
hasFlash=true
if ! [ -x "$(command -v flashplayer-projector)" ]; then
    hasFlash=false
fi

#Check different types of shell
#Bash
FILE=$HOME/.bashrc
hasBash=false
if test -f "$FILE"; then
    hasBash=true
fi

#Zsh
FILE=$HOME/.zshrc
hasZsh=false
if test -f "$FILE"; then
    hasZsh=true
fi

#Check if dir exists, else creates it
mkdir -p $HOME/.local/bin


#If not installed, download file and install it
if [ "$hasFlash" = false ]
then
    echo 'Command flashplayer-projector not found!'

    echo "Downloading..."
    wget https://ia601802.us.archive.org/23/items/adobe-flash-player-projector/flash_player_sa_linux.x86_64.tar.gz -O flash.tar.gz -q
    echo -e "Done.\n"
    echo "Extracting..."
    tar -xf flash.tar.gz
    rm -r flash.tar.gz LGPL/ license.pdf
    mv flashplayer $HOME/.local/bin/flashplayer-projector
    echo -e "Done\n"
else
    echo 'Command flashplayer-projector found!'
fi
echo ""


#Copy games to directory
echo "Moving files..."
mkdir -p $HOME/PapasLauncher/games
cp -rn games/ $HOME/PapasLauncher/


#Installing papas and auto-complete
cp papas $HOME/.local/bin/papas
cp papas-completion.sh ~/PapasLauncher/papas-completion.sh

echo -e "Done.\n"


echo "Installing commands..."
echo""
#Source the completion file
. ~/PapasLauncher/papas-completion.sh


#Adding new folder in PATH, and completion sourcing
if [ "$hasBash" = true ]
then
    echo -n "Installing in bash..."

    #Adding folder to PATH
    if ! grep -Fxq "export PATH=\$PATH:\$HOME/.local/bin" ~/.bashrc
    then
        echo "" >> ~/.bashrc
        echo "export PATH=\$PATH:\$HOME/.local/bin" >> ~/.bashrc
        export PATH=$PATH:$HOME/.local/bin
    fi

    #Adding autocomlpletion sourcing
    if ! grep -Fxq ". ~/PapasLauncher/papas-completion.sh" ~/.bashrc
    then
        echo "" >> ~/.bashrc
        echo ". ~/PapasLauncher/papas-completion.sh" >> ~/.bashrc
    fi

    echo "done"
fi


if [ "$hasZsh" = true ]
then
    echo -n "Installing in zsh..."

    #Adding folder to PATH
    if ! grep -Fxq "export PATH=\$PATH:\$HOME/.local/bin" ~/.zshrc
    then
        echo "" >> ~/.zshrc
        echo "export PATH=\$PATH:\$HOME/.local/bin" >> ~/.zshrc
        export PATH=$PATH:$HOME/.local/bin
    fi

    #Adding autocomlpletion sourcing
    if ! grep -Fxq ". ~/PapasLauncher/papas-completion.sh" ~/.zshrc
    then
        echo "" >> ~/.zshrc
        echo ". ~/PapasLauncher/papas-completion.sh" >> ~/.zshrc
    fi

    echo "done"
fi


#Summary
echo -e "\n\nCommands added :"

if [ "$hasFlash" = false ]
then
    echo "-flashplayer-projector"
fi
echo "-papas"


echo ""
echo "Note: If you get any 'libgtk-x11-2.0.so.0' missing, please install package 'gtx2'."
