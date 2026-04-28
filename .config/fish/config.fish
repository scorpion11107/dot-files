if status is-interactive
    set -U fish_greeting
end

# Aliases
alias ls "eza --oneline --long"

# Starship
starship init fish | source
