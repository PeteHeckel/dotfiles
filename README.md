Welcome to my dotfiles repo. But first consider how much of a nerd you are for
taking the time to look at my configuration files. As a nerd myself I appreciate
the interest

## `install`
First off on a clean system you can run the **`install`** script.
It will run through each directory looking for an install.sh script
which will install necessary dependencies for each application.

**TODO**: Update this to work with mingw-bash

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

**By default**, `secrets.local`, `path.local` and `variables.local` are sourced by 
the startup file and are intended to house paths to be included on the PATH and 
environment variables to set for every session.

## Functions

Generic shell utility functions are stored in the `functions` directory, and
the way that they are loaded differs depending on the shell being used.

### ZSH 

ZSH uses its `fpath` and `autoload` directives to load scripts as functions.
ZSH convention is that a function's completion script is named as the function
with a leading underscore. 

On startup, all scripts in the functions directory
is added to the `fpath`, and the `_*` scripts have the `#compdef <func>` directive
on the first line to tell zsh that this script should be associated with `<func>`
for completion directives (`_arguments` or `_files`, etc).

### Bash

With bash, we don't have an option to load files as shell functions without adding
the directory to our PATH, and we wish to avoid that. So to get around this, we
use the `_*` files as setup files that define the function and adds completion options.
All the underscore files are then sourced on startup so the function are available.

Within the underscore files, there must be conditional logic so that the bash
and ZSH differences are appropriately handled when each shell interacts with the script.
This is usually handled with a `[[ -v $ZSH ]]` conditional. Bash will ignore the
`#compdef ...` directive at the start of the file as a comment, which is very
convenient for us.


## Future Ideas
- Add auto package install
- Add in configuration differences between a WSL config and a pure linux config.
- Add a local file that keeps track of which modules are installed in the current environment
    - Add option to install select modules using shell scripts after the initial bootstrap has been done
