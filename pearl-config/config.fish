
switch $KOBOL_MANPATH
case "*$PEARL_PKGDIR/mans*"
    echo > /dev/null
case '*'
    set -x KOBOL_MANPATH "$PEARL_PKGDIR/mans:$KOBOL_MANPATH"
end

# vim: ft=sh
