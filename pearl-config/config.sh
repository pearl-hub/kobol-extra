if [[ $KOBOL_MANPATH != *"${PEARL_PKGDIR}/mans"* ]]
then
    export KOBOL_MANPATH="$PEARL_PKGDIR/mans:$KOBOL_MANPATH"
fi

# vim: ft=sh
