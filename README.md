Welcome to my dotfiles repo

Everything is topically organized in their own directories

The bootstrap script will configure git, then it will run through each
directory looking for an install.sh script. This script will install the
necessary dependencies for each topic. After running the installers, it will
again go through each directory and symlink all files ending with .symlink
in a directory named the same as the topic directory with a leading period.

eg dotfiles/vscode/settings.json.symlink -> ~/.vscode/settings.json

The location that the *.symlink files get linked to can be customized with
a symlink.dir file in the topic directory. The symlink.dir file should only
contain 1 line consisting of the directory that the *.symlink files should
be linked to instead of ~/.topic 

