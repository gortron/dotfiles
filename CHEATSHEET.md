# CLI Cheatsheet

## fzf (Fuzzy Finder)

| Shortcut | Action |
|----------|--------|
| `Ctrl+R` | Fuzzy search command history |
| `Ctrl+T` | Insert file path at cursor |
| `Alt+C`  | cd into directory |

Inside fzf:
- Type to filter
- `Tab` to select multiple (where supported)
- `Enter` to confirm

### Custom Functions

```bash
fv      # Find file, open in VS Code (with preview)
fkill   # Find and kill a process
gfb     # Git fuzzy branch checkout (with commit preview)
```

## zoxide (Smarter cd)

```bash
z foo        # Jump to most frecent dir matching "foo"
z foo bar    # Match both "foo" and "bar" in path
zi           # Interactive selection with fzf
```

Learns from your `cd` usage. Just use it and it gets smarter.

## ripgrep (rg, aliased to grep)

```bash
rg "pattern"             # Search current directory recursively
rg "pattern" -t py       # Only Python files
rg "pattern" -g "*.ts"   # Only .ts files
rg "TODO|FIXME"          # Multiple patterns (regex)
rg -l "pattern"          # List filenames only
rg -C 3 "pattern"        # Show 3 lines of context
rg -i "pattern"          # Case insensitive
```

## fd (aliased to find)

```bash
fd "pattern"             # Find files matching pattern
fd -e ts                 # Find all .ts files
fd -t d                  # Find directories only
fd -t f                  # Find files only
fd -H                    # Include hidden files
```

## bat (aliased to cat)

```bash
bat file.txt             # View with syntax highlighting
bat -l json data.txt     # Force specific language
bat -p file.txt          # Plain output (no line numbers)
```

## eza (aliased to ls)

```bash
ls       # Colored output
ll       # Long format with details
la       # Long format including hidden
```
