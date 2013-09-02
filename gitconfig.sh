git config --global user.name "Matthew Ireland"                 # writes to /.gitconfig, rather than .git/config.
                                                                # alternatively use --system to write to $(prefix)/etc/gitconfig
git config --global user.email "matthew@mti.me.uk"

git config --global credential.helper 'cache'                   # avoid having to type in credentials for github every push/pull
git config --global credential.helper 'cache --timeout=100000'  # max value for timeout (seconds)

git config --global core.editor emacs

git config --global help.autocorrect 1                          # if set to 1, git will automatically run the command if it has only one match (e.g. git com -> git commit)

git config --global color.ui true                               # turns on default colouring if output is to terminal
                                                                # (set to always if want regardless of the output - equiv to using --color flag)


# Uncomment below options for them to take effect
# git config --global commit.template $HOME/.gitmessage.txt       # sets the default message that appears in the editor upon commit
# git config --global core.pager ''                               # by default, the pager is less. Can change to more (or something else) or just leave blank to turn it off
# git config --global user.signingkey <gpg-key-id>                # useful when making signed annotated tags
# git config --global core.excludesfile ''                        # if .gitignore is outside the project directory
# git config --global core.autocrlf true                          # set to true if working with people on Windows (autoconverts CRLF line endings into LF on commit and vv)
                                                                  # set to false if windows programmer on windows-only project
# git config --global core.autocrlf input                         # converts on commit, but not the other way round (i.e. fix screwup)
# git config --global color.branch "blue bold"                    # various colour settings (with example values)
# git config --global color.diff "blue bold"
# git config --global color.diff.meta "blue black bold"           # blue foreground, black background, bold text
# git config --global color.interactive "..."
# git config --global color.status "..."

