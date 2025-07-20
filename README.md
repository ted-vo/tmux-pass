# tmux-pass

tmux-pass is plugin for tmux integrate with [pass](https://www.passwordstore.org/)

## Requirements

You need to have:
[pass](https://www.passwordstore.org/)

Download: The latest version is 1.7.4.

Ubuntu / Debian

```bash
$ sudo apt-get install pass
```

Fedora / RHEL

```bash
$ sudo yum install pass
```

Arch

```bash
$ pacman -S pass
```

Macintosh
The password store is available through the Homebrew package manager:

```bash
$ brew install pass
```

FreeBSD

```bash
pkg install password-store
```

## Installation

1. In your `.tmux.conf` add the plugin to the list.

```tmux
set -g @plugin 'ted-vo/tmux-pass'
```

2. Type `prefix + I` to install the plugin.

## Usage

### Key bindings

- `prefix + p`: list login items in a bottom pane.

### Changing the default key-binding

```
set -g @pass-key '<new-key>'
```

### Copy the password to the clipboard

```tmux
set -g @pass-copy-to-clipboard 'on'
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
