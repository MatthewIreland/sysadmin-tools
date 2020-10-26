IRC setup
=========

Setting up persistent IRC connection using irssi and screen.

This is **not** intended as a general introduction to IRC. A lot of the below probably won't make sense if you haven't connected to an IRC network at least once before. Reading material from the References section towards the bottom of this page is highly recommended if you've never played with IRC before. Not understanding what's going on can be potentially dangerous for you, as well as meaning that you may unintentionally appear rude to other users of IRC.

Step-by-step quickstart guide
-----------------------------

1) Install irssi.
```
$ sudo pacman -S irssi (Arch)
$ sudo yum install irssi (Redhat derivatives)
$ sudo apt-get install irssi (Debian derivatives)
```

2) Install screen.
```
$ sudo pacman -S screen (Arch)
$ sudo yum install screen (Redhat derivatives)
$ sudo apt-get install screen (Debian derivatives)
```

3)
```
mkdir ~/irclogs
```
ready for later.

4) If screen was already installed (reported in step 2), check
```
screen -list
```
If there's more than one screen session, you'll have to enter its name at the end of the next command in Step 5.

5)
```
screen -RD
```
From the GNU screen manual (http://www.gnu.org/software/screen/manual/screen.html):
```
‘-d [pid.sessionname]’
‘-D [pid.sessionname]’
    Do not start screen, but instead detach a screen session running elsewhere (see Detach). ‘-d’ has the same effect as typing C-a d from the controlling terminal for the session. ‘-D’ is the equivalent to the power detach key. If no session can be detached, this option is ignored. In combination with the -r/-R option more powerful effects can be achieved:
        -d -r
            Reattach a session and if necessary detach it first. 
        -d -R
            Reattach a session and if necessary detach or even create it first. 
        -d -RR
            Reattach a session and if necessary detach or create it. Use the first session if more than one session is available. 
        -D -r
            Reattach a session. If necessary detach and logout remotely first. 
        -D -R
            Attach here and now. In detail this means: If a session is running, then reattach. If necessary detach and logout remotely first. If it was not running create it and notify the user. This is the author's favourite. 
        -D -RR
            Attach here and now. Whatever that means, just do it.
Note: It is a good idea to check the status of your sessions with screen -list before using this option. 
```

6) Start irssi:
```
$ irssi
```

7) Tedious, yet essential settings (enter at irssi prompt):
```
/SET nick <nick>
/SET alternate_nick <alternate nick>
/SET user_name <username>   # not necessary if ident enabled
/SET real_name <real name>
/SET use_msgs_window OFF
```

8) Highlight lines containing your nick:
```
/HILIGHT <nick>
```

9) Set timestamp to something sensible (day is particularly useful):
```
/SET timestamp_format %d.%H:%M:%S
```

10) Set up logging. Logging is useful because the IRC connection is not persistent over system restarts (logging will allow you to see any messages you missed between the last time you checked IRC and the time the system restarted). It's also useful if you're receiving e.g. tech support, so you have a record of any instructions you were given!
```
/SET autolog ON
/SET autolog_level ALL -CRAP -CLIENTCRAP -CTCPS
/SET autolog_path ~/irclogs/%Y/$tag/$0.%m-%d.log
```

11) Set quit message:
```
/SET quit_message <message>
```
Default is "leaving," mine is "Scotty, beam me up!" (which is actually the closest Kirk ever came to saying the commonly misquoted "beam me up Scotty!" He never said anything remotely like this in the TV series but said the above in Star Trek IV).

12) Add network(s):
```
/NETWORK ADD [-nick <nick>] <Network name (your choice)>
```

13) Add one or more servers:
```
/SERVER ADD [-auto] -network <network name> <server FQDN>
```

14) Add one or more channels:
```
/CHANNEL ADD -auto #<channel name> <network name>
```
Move around windows until you get them in an order that you like (first go to the window that you wish to move):
```
/wm <position to move to>
<or>
/window move <position to move to>
```

15) Save settings and layout:
```
/SAVE
/LAYOUT SAVE
```

16) Restart irssi and confirm everything is set correctly.


Useful commands (irssi)
-----------------------

* List current networks:
```
/NETWORK
```
* Remove servers (especially useful for getting rid of irssi's default servers):
```
/NETWORK REMOVE <server>
```
* See all settings (to verify that there's nothing unexpected in there): switch to status window and type <pre>/set</pre>.
* Indent (useful with very long lines, so messages can be distinguished; experiment with exact value):
```
/SET indent 4
```
* Quit irssi:
```
/quit
```
* Leave channel (after having gone to the channel's window):
```
/part
<or>
/part <message>
```
An alternative, but less elegant way, is to just close the window. This method is needed if it is a split or hidden (e.g. for closing a query window):
```
/wc
```
or, in full,
```
/WINDOW CLOSE
```
* List all channels on IRC server that are public to join (**not** good for large networks):
```
/list
```
* Set topic:
```
/topic
```
* Switch between networks:
```
Ctrl+X
```
* List channels known to irssi:
```
/CHANNEL LIST
```
* Reload configuration:
```
/RELOAD
/RELOAD <filename>   # for loading a different config file
```
* List users in the current channel:
```
/names
/n
```
* Display user information for a given \<nick\>:
```
/whois
/wi
```

Channel Operator Commands
-------------------------
* Make another user, \<nick\>, a channel op:
```
/op <nick>
```
* Change channel topic:
```
/topic
/t
```
* Set or list bans for a channel (the following three commands are indeed all aliases):
```
/ban
/bans
/b
```
* Kick or kickban a user:
```
/kick (/k)
/kickban (/kb)
```

Joins/Parts
-----------

A number of useful things can be done here.

If you are in relatively few channels that have problems with people joining/leaving frequently, then just ignore for that channel:

```
/ignore #<channel> MODES JOINS PARTS QUITS
/ignore -except -pattern <yourNick> #<channel>
```

Replace #<channel> with the wildcard operator (*) to do this for all channels.

An alternative way for doing this for all channels is to add the following to ~/.irssi/conf:

```
#
ignores = ( { level = "JOINS PARTS QUITS"; } );
```

For a more in depth discussion of levels, and how to put all join/part/quit messages into their own "junk" window (freeing up other windows for disucssion), see https://pthree.org/2010/03/12/irssi-handling-joinspartsquits/



Useful commands (screen)
------------------------
Screen is an incredibly useful tool for keeping any process (not just IRC) running after you terminate an ssh section. There are lots of useful commands listed in the screen manual, and a few are listed below http://www.gnu.org/software/screen/manual/screen.html

* <pre>ctrl+a x</pre> locks screen.
* <pre>ctrl+a c</pre> creates a new window.
* <pre>ctrl+a n</pre> switches to the next window. 


References
----------
1) http://www.irchelp.org/irchelp/new2irc.html
2) http://www.irchelp.org/irchelp/changuide.html
3) http://www.srcf.net/faq/irc#persistent
4) http://www.irssi.org/documentation/manual
5) http://irssi.org/beginner/#c3
6) http://quadpoint.org/articles/irssi/
7) http://www.kuro5hin.org/story/2004/3/9/16838/14935
8) http://www.gnu.org/software/screen/manual/screen.html
9) http://team.macnn.com/drafts/crontab_defs.html
10) http://crunchbanglinux.org/wiki/irssi

Pointers
--------
* Note, on Macs the Alt key is not my default set up to send an escape. Either use the escape key instead or check the "Use option key as meta key" in "Preferences" (10.5/10.6) or "Window Settings" (10.4) in the Terminal Menu.
* Whilst nick, server names, networks names, etc are case sensitive, commands are not, so <pre>/NETWORK</pre> is precisely equivalent to <pre>/network</pre>.

Disclaimer
----------
This is written purely for the author's own benefit, correctness of information provided is not guaranteed or even implied. Guide is subject to change at any time.


