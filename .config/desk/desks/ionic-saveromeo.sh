#!/bin/bash
# ionic-save-romeo.sh
#
# Description: Desk for working on the Ionic project 'Save Romeo'
#

cd ~/work/cordova/ionic-save-romeo

# TODO Resume session by name?
tmux new-session -d 'sudo htop;bash --login'
tmux split-window -h -p 75 'vim;bash --login'
tmux split-window -v -p 50 -t 0 'git status;bash --login'
tmux split-window -v -p 50 -t 0 'ionic serve;bash --login'
tmux select-pane -t 1
tmux -2 attach-session -d

# Start and open connection to Vagrant
# launch() {
  # cd development/
  # vagrant up && vagrant ssh
# }
