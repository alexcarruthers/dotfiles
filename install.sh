sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cp $SCRIPT_DIR/.zshrc ~/.zshrc
cp $SCRIPT_DIR/.psqlrc ~/.psqlrc

mkdir -p ~/.config/nvim/
cp -r $SCRIPT_DIR/config/nvim/ ~/.config/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --noplugin --headless -c 'PlugInstall' -c 'qa'
