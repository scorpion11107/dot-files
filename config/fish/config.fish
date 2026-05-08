if status is-interactive
    set -U fish_greeting
end

# Aliases
alias la "eza --oneline --long"
alias hx "helix ."

# Starship
starship init fish | source
