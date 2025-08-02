# cc-session-timer

A lightweight bash script that displays the remaining time in your current Claude Code 5-hour session. Perfect for tmux status bars, command-line usage, or scripts.

## How It Works

Claude Code uses 5-hour rolling sessions that:
- Start at the floored hour of first activity (e.g., activity at 11:23 AM → session starts at 11:00 AM)
- End exactly 5 hours later (e.g., 11:00 AM → 4:00 PM)
- A new session starts if >5 hours have passed since the session start OR >5 hours since the last activity

This tool reads the timestamp data from `~/.claude/projects/*/` JSONL files to calculate when your current session will end.

## Installation

### Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/daveremy/cc-session-timer/main/install.sh | bash
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/daveremy/cc-session-timer.git
cd cc-session-timer

# Make the script executable
chmod +x cc-session-timer

# Copy to your PATH
cp cc-session-timer ~/.local/bin/
# Or use sudo for system-wide installation
sudo cp cc-session-timer /usr/local/bin/
```

## Usage

```bash
# Default: tmux-friendly format
cc-session-timer
# Output: ⏲️ 2h30m

# Verbose: human-readable format
cc-session-timer verbose
# Output: Session: 11:00 AM - 4:00 PM
#         Session ends at 4:00 PM (2h30m left)

# Raw: seconds remaining (for scripting)
cc-session-timer raw
# Output: 9000

# Debug: verbose with debug information
cc-session-timer debug
```

## tmux Integration

Add to your tmux status bar for always-visible session monitoring:

```bash
# In your ~/.tmux.conf
set -g status-right '#[fg=yellow]#(cc-session-timer) #[default]| %H:%M %d-%b-%y'
```

The script uses different emoji indicators based on time remaining:
- ⏲️ More than 1 hour remaining
- ⏱️ Less than 1 hour remaining
- ⏰ Less than 15 minutes remaining (warning!)

## How It Compares to ccusage

This tool complements [ccusage](https://github.com/zckly/ccusage) by providing a lightweight, focused view of your current session time. While ccusage gives you comprehensive token usage analytics with `npx ccusage@latest blocks --live`, cc-session-timer is designed for:

- Quick command-line checks
- tmux status bar integration
- Scripting and automation
- Minimal dependencies (just bash)

## Requirements

- Bash 4.0+
- macOS or Linux
- Claude Code installed with activity in `~/.claude/projects/`

## License

MIT License - see [LICENSE](LICENSE) file for details.

## Author

Created by [Dave Remy](https://github.com/daveremy)

## See Also

- [cc-model-detector](https://github.com/daveremy/cc-model-detector) - Detect which Claude model is being used
- [ccusage](https://github.com/zckly/ccusage) - Comprehensive Claude Code usage analytics