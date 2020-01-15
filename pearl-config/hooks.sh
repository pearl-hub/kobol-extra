
function post_install(){
    info "kobol package is required for kobol-extra:"
    info "> pearl install kobol"

    if command -v mandb > /dev/null
    then
        mandb $PEARL_PKGDIR/mans
    else
        warn "Warn: mandb command does not exist. Manual descriptions will not be searchable."
        warn "for more information: https://wiki.archlinux.org/index.php/Man_page#Searching_manuals"
    fi
}

function post_update(){
    post_install
}

function pre_remove(){
    :
}
