# karabiner-configs
With auto commit

## Installation

```shell
brew install fswatch
```

Ensure all paths are fine in `com.simon.autocommit-karabiner.plist` and `autocommit.sh`.
Copy `com.simon.autocommit-karabiner.plist` to /Users/simon/Library/LaunchAgents/

```shell
chmod +x ./autocommit.sh
```

```shell
launchctl load /Users/simon/Library/LaunchAgents/com.simon.autocommit-karabiner.plist
launchctl start com.simon.autocommit-karabiner
```