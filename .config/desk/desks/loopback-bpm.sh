#!/bin/bash
# loopback-bpm.sh
#
# Description: Desk for working on the Loopback project 'BPM'
#

cd ~/work/app/loopback-bpm

# TODO Resume session by name?
tmux new-session -s loopback-bpm -d 'sudo htop;bash --login'
tmux split-window -h -p 75 'vim;bash --login'
tmux split-window -v -p 50 -t 0 'git status;bash --login'
tmux split-window -v -p 50 -t 0 'nodemon;bash --login'
tmux select-pane -t 1
tmux -2 attach-session -d

# Start and open connection to Vagrant
# launch() {
  # cd development/
  # vagrant up && vagrant ssh
# }
