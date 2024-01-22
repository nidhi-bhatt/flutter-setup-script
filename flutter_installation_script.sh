sudo apt update -y && sudo apt upgrade -y
echo " "
read -p $'\e[36mDo you want to install snap? [y/n]\e[0m ' val
if [ "$val" = "y" ]; then
  	echo " "
	echo -e "${blue}Setting up snap..."
	read -p $'\e[36mAre you running this on Linux Mint 20 or above? [y/n]\e[0m ' val
	if [ "$val" = "y" ]; then
		echo " "
		echo -e "${blue}Installing snap for linux mint..."
		echo " "
		sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
		sudo apt update -y
		sudo apt install snapd
		sudo systemctl start snapd
		sudo systemctl enable snapd


	else 
		echo -e "${blue}Installing snap for other ubuntu based distros..."
		sudo apt update
		sudo apt install snapd
		sudo systemctl start snapd
		sudo systemctl enable snapd

	fi
else
	echo -e "${cyan}Moving on..."

fi

echo " "
sudo snap install android-studio --classic
#open android studio -> install SDK tools (i.e whatever is prompted) -> open a new project -> file->settings -> languages and frameworks-> android sdk -> command line tools install -> wait and after completion close
#add flutter and dart plugin too
source ~/.bashrc
sudo snap install flutter --classic
#check flutter doctor 
flutter doctor
#in case it shows android licenses not accepted -
flutter doctor --android-licenses -y 
#chrome to develop for web
echo " "
echo -e "${green}Installing google chrome..." 
echo " "
sudo apt update 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt install chrome-gnome-shell

echo " "
#installing vs code
sudo snap install code --classic
#open vscode and install the flutter extension (can install dart also if want)
#ctrl +shift+p this opens the command palette -> type flutter -> new project 

#install dart sdk
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

sudo apt-get update
sudo apt-get install dart

#ADD DART SDK path to android studio
#File-> Settings (ctrl+alt+s)
#Languages and Frameworks -> Dart
#Check "Enable Dart support for the project..."
#In "Dart SDK path" click in "..." and navigate to flutter SDK directory. Under that directory you'll find "bin/cache/dart-sdk". This is the dart sdk path you should use.
#Click "Apply"
#Close the project and open it again (sometimes you need this step, sometimes doesn't)

