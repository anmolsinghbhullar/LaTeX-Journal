# LaTeX Journal 

A journal written entirely in LaTeX. Effectively a fork of SingularisArt's [LaTeX](https://github.com/SingularisArt/LaTeX) but I removed things as I saw fit since I really only care about the journal part. Over time I may add more things to fit in my notes for CS/Math. 

Not _officially_ a port since this project initially started looking very different until I came across their project.

### Installation

This comes with a `Makefile` so download the repo (or execute `git clone https://github.com/anmolsinghbhullar/LaTeX-Journal` in a shell with git CLI) and then execute `make view`.

You can also just compile `main.tex` in a LaTeX IDE of your choice.

### Built With

- [Emacs](https://www.gnu.org/software/emacs/) - Sorry for being _that_ person. 
- [AUCTeX](https://www.gnu.org/software/auctex/) - An extensible package for writing and formatting TeX files in Emacs.
- [MacTeX](https://tug.org/mactex/mainpage2023.html) - Port of TeX Live to Macintosh.

### Other remarks

I tried to add comments with the more complex parts. So if you have any questions, let me know.

In order to make start the journal at the date of your choice, edit `main.tex` and replace the date on line 12 with the one of your choice.

Not actually going to be updating this with my journal, this is just a template.

# My Journal

## How it works.

### Daily Logging
- Make a new note.tex file with how your day went
- Save it in a folder with the name being the number of the day it is
- Save that in a folder with the name being the number of the month (if it doesn't already exist)
- Save that in a folder with the name being the number of the year it is (if it doesn't already exist)

### Goals and results

Each month and year has its own `goals.tex` and `results.tex` files that let you fill out any specific goals you have for that year or month. `results` will not show in the table of contents until that specific period of time is over. So for example, `results for the month of november` won't show on table of contents until november of that year is over.

## Styling daily notes

### Most important
- `wrong` environment for things that we expect ourselves to do but didn't get done
- `right` environment for things we did get done
- `goals for today` self explanatory
- `results for goals for today` also self explanatory

### Less common but still useful
Furthermore, less commonly used but still useful:
- `rant`
- `remark`

### TODO Notes
- `improvement` - need to improve this
- `unsure` - unsure about this
- `change` - need to change
- `add` - need to add
- `info` - need to find more info about this

### Time of logging
- `morning`, `afternoon`, `evening`, `night` to indicate which day segment you logged
- `time` - indicate what time of the day you're logging. first `\time{x:xx pm}` indicates start time and the second `\time{x:xx pm}` indicates end time of logging.

### Overall Mood
- `contentment` - scale from 0 to 10 of how you felt throughout the day.

## Automatic Daily Diary Generation

**macos/linux only**

If you want the creation of the daily journal entry to be automatic, it is not _that_ hard of a process. The following steps create a root level daemon job which will
run every night at 1:00am to create the daily `note.tex` and the appropriate folder(s) that said `note.tex` should be contained in. This job will run as long as your
machine is not turned off or in deep sleep (normal sleep is fine) at the set time. If it is, it will run the job when it wakes from deep sleep (i.e. when you use the
machine).

The following steps are specifically made for _macOS_ users because that's what I use and the process is quite a bit trickier because Apple has generally locked down
writing to System Volumes. As far as I know this has been the case since `macOS 10.5 Catalina` but it might have even been earlier than that. If you're a linux user, 
the process should be somewhat similar but the `.plist` file should look a little different (different headers at very least) and where the files should be stored 
should be a bit different as well depending on your distro. 

1. Open `script.sh` in your text editor of choice, and change the `user` variable to the name of the account storing this project. For most people, this is probably just the account you're logged into). Feel free to run `echo $USER` in the terminal if you don't remember your user account name.
2. Move `script.sh` to `/usr/local/bin/` (this is an absolute path). Feel free to rename the file if you already have a file called that in this directory (you will
have to appropriately change the name in the following steps though, so don't forget!). If you're not in terminal already, open it and execute `cd /usr/local/bin`
then execute `chmod +x /usr/local/bin`. This turns your script into an executable that bash can now run. Test the script out to make sure it works by typing `script.sh` in the terminal (current directory does not matter when this command is executed). 
3. Open Automator, choose new application, then type `run shell script` in the search window. Drag this over to the window on the right. In the input field, write the path to the script we moved a step ago: `/usr/local/bin/script.sh`. Export as an application, save with the name `generate-note-app.app` (or whatever you want). Save this to `/Applications/`. If you don't see this app when you click on "Applications" in the favourites window on finder, then you've saved the app in your user's Application folder so make sure this is not the case. Do not worry if the app is "unsigned", this only matters if we're sharing it with other apple machines.
4. Open the System Settings app on your mac, navigate to "Privacy & Security" and scroll down to "Full Disk Access". Click the `+` button near the bottom then drag the application we just made into the window. And make sure it has full disk access. 
5. Rename the `.plist` file (this is the daemon) by replacing "user" with the name of your user account. Open the file in any IDE and do the same with the paths under `StandardErrorPath` and `StandardOutPath`. Here, you can also change the time the daemon runs if you so choose to.
6. Move the daemon to `/Library/LaunchDaemons/` (make sure this is not your user Library and is the system's `Library` folder). 
7. Back in the terminal app, run `sudo launchctl load <name-of-your-daemon>.plist`. Then, `sudo list | grep com.<your-user-name-in-the-daemon-file>` to make sure the daemon is loaded by the system. The correct output you should see by the terminal is `- 0 com.<your-user>.generate-note-app.script`. This is the label of your daemon.
8. Manually test the daemon runs correctly via the command `sudo launchctl start <label-of-your-daemon`. If it does not run correctly, your automator app should throw a popup showing what the error is, but you can also view the error in `/tmp/<your-daemon-label>.err`. Running `sudo launchctl list | grep com.<your-daemon-label>` also shows if it encountered an error if the `0` is now a non-zero number. If it did run, then verify the files and folders were created by going back to where your `LaTeX-journal` is stored.

This is a very annoying process specifically because Apple locks down System volumes pretty hard and generally does not really want anyone touching them or changing them at the root level. If you find you can't run some of the commands that I mentioned above in your terminal app, give Terminal.app full disk access as well. 

I should also mention, we had to create an app to run `script.sh` because Apple is very specific on what kind of things are allowed full disk access (specifically they are Applications and unix executables). We could also have done this `Script Editor.app` instead of `Automator.app` if we wanted to.

### Security concerns

If you followed the steps above, there should be minimal security concerns since the app we give full disk access to can only run the script we point it to and our root daemon cannot change this app, it can only run it. 

Giving Terminal.app full disk access is slightly more concerning if you blindly run any and all bash scripts you see on the internet in the command line, but if you don't, there is no app or file that can execute commands on your terminal's command line without you manually doing it. 

If you give the `bash` executable (in `/bin/`), this is a huge security concern since now any app/file/script can run any bash command it wants with full access to your machine. Specifically, it can do this without your knowledge. _However_, this does eliminate the entire need to create an app to run `script.sh`. So if your risk/reward meter is slightly bonked, this is a valid strategy.

### Linux

I don't use linux but I'm guessing most distros are a lot more lenient with access to System Volumes so you don't have to do this whole convoluted app process.
