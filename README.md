Welcome to my dotfiles repo. But first consider how much of a nerd you are for
taking the time to look at my configuration files. As a nerd myself I appreciate
the interest

## `install`
First off on a clean system you can run the **`install`** script.
It will run through each directory looking for an install.sh script
which will install necessary dependencies for each application.

## `bootstrap`
The bootstrap script will configure git, then it will go through each
directory and symlink all files ending with `.symlink` in a directory
named the same as the topic directory with a leading period.

eg. dotfiles/git/gitconfig.symlink ---> ~/.gitconfig

The location that the `*.symlink` files get linked to can be customized with
a symlink.dir file in the topic directory. The symlink.dir file should only
contain **1 line** consisting of the directory that the *.symlink files should
be linked to instead of ~/.topic 

Any files with `.local` in the name will be ignored by git. These can be used to 
store local aliases, paths, environment variables, etc.

## Future Ideas
- Add in configuration differences between a WSL config and a pure linux config.
- Add a local file that keeps track of which modules are installed in the current environment
    - Add option to install select modules using shell scripts after the initial bootstrap has been done
