#!/bin/bash
# ionic-starter.sh
#
# Description: Desk for working on the Ionic project 'Ionic Starter'
#

cd ~/work/cordova/ionic-starter

# TODO Resume session by name?
tmux new-session -d 'sudo htop;bash --login'
tmux split-window -h -p 75 'vim;bash --login'
tmux split-window -v -p 50 -t 0 'git status;bash --login'
tmux split-window -v -p 50 -t 0 'ionic serve;bash --login'
tmux select-pane -t 1
tmux -2 attach-session -d
