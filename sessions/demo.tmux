new -s demo -n Ava
split-window -h -p 50
send-keys -t 0 'cd ~/Work/Ava/logs' Enter
send-keys -t 1 'cd ~/Work/Ava/python' Enter
new-window -n clj
send-keys 'cd ~/Work/dev-tools/clojure' Enter
new-window -n testing
send-keys 'cd ~/Work/samples-internal/gocode' Enter
select-window -t 0
select-pane -t 0
