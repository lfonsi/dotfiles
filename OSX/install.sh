#!/usr/bin/bash
DIRECTORY=$(pwd)'/backups'

echo "Installing luisf1821's dotfiles for OSX!"

echo "Starting file backup..."

if [ ! -d "$DIRECTORY" ]; then
  echo "Creating backup directory..."
  mkdir "backups"
  echo "---Backup directory created!"
fi

for file in ~/.bashrc; do
	FILE_NAME=$(basename $file)
	echo "---Backingup $file..."
	
	[ -r "$file" ] && [ -f "$file" ] && cp -i $file $DIRECTORY"/$FILE_NAME" && echo "---File $FILE_NAME backed up";
done;
unset file;

echo "Copying new dotfiles and configurations..."

for file in $(pwd)/.bashrc; do
	FILE_NAME=$(basename $file)
	echo "---Copying $file..."

	cp -f $file $HOME/"$FILE_NAME" && echo "---File $FILE_NAME copied"
done;
unset file

echo "Creating symlinks for auxiliary files..."

#if [ ! -d $HOME/.dotfiles ]; then
#	 mkdir $HOME/.dotfiles
#fi

	[ ! -d $HOME/.dotfiles ] && mkdir $HOME/.dotfiles

for file in $(pwd)/.dotfiles/.alias; do
	FILE_NAME=$(basename $file)
	if [ ! -L $HOME/.dotfiles/$FILE_NAME ]; then
		ln -s $file $HOME/.dotfiles && echo "---Symlink for $FILE_NAME created in $HOME/.dotfiles";
	fi
	#source $HOME/.dotfiles/$FILE_NAME
done;

source $HOME/.bashrc

echo "Installation completed! Enjoy :)"