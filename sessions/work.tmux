new -s work -n Ava
split-window -h -p 50
send-keys -t 0 'cd ~/Work/Ava' Enter
send-keys -t 1 'cd ~/Work/Ava' Enter
new-window -n Dev
send-keys 'cd ~/Work/Ava' Enter
new-window -n dev-tools
send-keys 'cd ~/Work/dev-tools/clojure' Enter
new-window -n Support
send-keys 'cd ~/Work/issues' Enter
new-window -n "Test Dev"
send-keys 'cd ~/Work/testing-framework' Enter
new-window -n "Test Run"
split-window -v -p 50
send-keys -t 0 'cd ~/Work/testing-framework' Enter
send-keys -t 1 'cd ~/Work/testing-framework' Enter
select-window -t 0
select-pane -t 0
