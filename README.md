## Basics

```
cd ~
git clone http://github.com/jackiekircher/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule init
git submodule update
mkdir backup
```


## Update plugin

```
cd ~/.vim/bundle/<plugin_name>
git pull origin master
```


## Update all plugins

`git submodule foreach git pull origin master`
