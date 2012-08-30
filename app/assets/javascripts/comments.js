$(function() {
    $('.modal-load-comments').click(function(e) {
        e.preventDefault();
        $('.modal').modal('show');
    });

    $('.load-comments').click(function(e) {
        $('.modal').modal('hide');
    });
});