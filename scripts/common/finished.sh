echo
echo "-----------------------------------------"
echo "Done!"
echo "-----------------------------------------"

echo
echo "If hostname needs to be set consider"
echo "sudo scutil --set ComputerName newname"
echo "sudo scutil --set LocalHostName newname"
echo "sudo scutil --set HostName newname"

echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the installed tools."
echo "Rebooting is only necessary for keyboard repeat settings to work."

echo

echo "Finally, setting zsh as default shell"
chsh -s /usr/local/bin/zsh
echo "Et voilà"
