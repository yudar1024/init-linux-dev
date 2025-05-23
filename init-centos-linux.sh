dnf install unzip zip zsh git tar net-tools util-linux-user -y
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install powerlevel10k
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cp .zshrc .zshrc.bak
sed -i "s?robbyrussell?powerlevel10k/powerlevel10k?" .zshrc
sed -i "s?plugins=(git)?plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)?" .zshrc

#install gobrew
curl -sLk https://raw.githubusercontent.com/kevincobain2000/gobrew/master/git.io.sh | sh
echo 'export GOROOT="$HOME/.gobrew/current/go"' >> .zshrc
echo 'export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"' >> .zshrc

#install sdkman
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# install fnm nodejs version management
curl -fsSL https://fnm.vercel.app/install | bash
source .zshrc
sudo chsh -s $(which zsh) $(whoami)
