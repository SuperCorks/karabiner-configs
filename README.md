# karabiner-configs
Karabiner-Elements configs for Simon, mainly moving thumb actions from the `command` button to little finger actions (`control`) button.

## Installation

Copy the content of this repo in `~/.config/karabiner`

```shell
brew install fswatch
```

Ensure all paths are fine in `com.simon.autocommit-karabiner.plist` and `autocommit.sh`.
Copy `com.simon.autocommit-karabiner.plist` to /Users/simon/Library/LaunchAgents/
```shell
cp com.simon.autocommit-karabiner.plist /Users/simon/Library/LaunchAgents/
```


```shell
chmod +x /Users/simon/Library/LaunchAgents/com.simon.autocommit-karabiner.plist
chmod +x ./autocommit-karabiner.sh
```

```shell
launchctl load /Users/simon/Library/LaunchAgents/com.simon.autocommit-karabiner.plist
launchctl start com.simon.autocommit-karabiner
```
