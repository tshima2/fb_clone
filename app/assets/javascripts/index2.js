$(function () {
    const HEADER_HEIGHT=100;
    const HEADER_MARGIN=10;
    const TEXTAREA_HEIGHT=120;
    const TEXTAREA_MARGIN=10;    
    $('.fbc_index_box_menu').click(function(e) {
        let ul=$(this).next('ul');
        let top=e.originalEvent.pageY-(HEADER_HEIGHT-HEADER_MARGIN)-(TEXTAREA_HEIGHT-TEXTAREA_MARGIN);
        let right=48;
        ul.css('top', top);
        ul.css('right', right);        
        ul.slideToggle();        
    });
});
