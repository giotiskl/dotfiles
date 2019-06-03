## My personal VIM Configuration

### Instructions
#### Plugin manager
To begin with Vundle has to be installed for the package management.
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

#### Setup vimrc
After cloning the repository:
* `cd` to the directory of the cloned repo
* Run `cp vimrc ~/.vimrc` 

#### Fuzzy finder
To navigate the project files, you can use fuzzy finder.

To install: 
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

To update:
```
cd ~/.fzf && git pull && ./install
```
