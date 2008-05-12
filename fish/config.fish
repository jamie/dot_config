set PATH ~/bin $PATH
if test -d /usr/local/mysql/bin
  # OSX mysql
  set PATH $PATH /usr/local/mysql/bin
end

# OSX tweaks
if set -q Apple_PubSub_Socket_Render
  # Bind \cleft and \cright
  bind \e\[5D prevd-or-backward-word
  bind \e\[5C nextd-or-forward-word
end

cd ~
