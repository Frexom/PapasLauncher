#Stopping at forst error
set -e

echo  -e "Using pol2095's Flash-Player-Projector-64-bit-standalone-install-for-Ubuntu\n\n"

hasFlash=true

#Check if flashplayer-projector is installed
if ! [ -x "$(command -v flashplayer-projector)" ]; then
    hasFlash=false
fi

#If not installed, download file and install it
if [ "$hasFlash" = false ]
then
    echo 'Command flashplayer-projector not found!'

    echo "Downloading..."
    wget http://pol2095.free.fr/flash_player_sa_linux.x86_64 -O flash.tar.gz -q
    echo -e "Done.\n"
    echo "Unzipping..."
    tar -xf flash.tar.gz
    rm -r flash.tar.gz LGPL/ license.pdf
    echo -e "Done\n"
else
    echo 'Command flashplayer-projector found!'
fi
echo ""

#Auto-complete papas command args
source ./papas-completion.sh


echo "Moving files..."

#check if dir exists, else creates it
mkdir -p $HOME/PapasLauncher/games

#Copies games to directory
cp -rn games/ $HOME/PapasLauncher/


#Installing flashplayer if needed
if [ "$hasFlash" = false ]
then
    mv flashplayer $HOME/.local/bin/flashplayer-projector
fi

#Installing papas and auto-complete
cp papas $HOME/.local/bin/papas
cp papas-completion.sh ~/PapasLauncher/papas-completion.sh

#Check if not sourced yet in .bashrc
if ! grep -Fxq "source ~/PapasLauncher/papas-completion.sh" ~/.bashrc
then
    echo "" >> ~/.bashrc
    echo "source ~/PapasLauncher/papas-completion.sh" >> ~/.bashrc
fi
. ~/PapasLauncher/papas-completion.sh
. ~/.bashrc

#Summary
echo -e "Done\n\nCommands added :"

if [ "$hasFlash" = false ]
then
    echo "-flashplayer-projector"
fi
echo "-papas"
