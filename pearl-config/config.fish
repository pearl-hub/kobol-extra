

switch "$KOBOL_MANPATH"
case "*$PEARL_PKGDIR/mans*"
    # The path already exists. No action required
    echo > /dev/null
case '*'
    set -x KOBOL_MANPATH "$PEARL_PKGDIR/mans:$KOBOL_MANPATH"
end

# vim: ft=sh
