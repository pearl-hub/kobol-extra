
function post_install(){
    info "kobol package is required for kobol-extra:"
    info "> pearl install kobol"
}

function post_update(){
    post_install
}

function pre_remove(){
    :
}
