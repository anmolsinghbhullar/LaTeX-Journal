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

