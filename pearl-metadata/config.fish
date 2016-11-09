if not contains $PEARL_PKGDIR/mans $KOBOL_MANPATH
    set -x KOBOL_MANPATH "$PEARL_PKGDIR/mans:$KOBOL_MANPATH"
end
# vim: ft=sh
