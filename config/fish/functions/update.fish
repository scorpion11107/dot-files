function update
    echo "Updating system..."
    paru -Syu --noconfirm
    echo "Clearing caches..."
    paru -Sc --noconfirm
    echo "Removing orphans..."
    set orphans (paru -Qdtq)
    if test -n "$orphans"
        paru -Rns --noconfirm $orphans
    else
        echo "No orphans found."
    end
    echo "Done!"
end
