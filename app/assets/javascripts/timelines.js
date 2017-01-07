$(function(){
    $('form.input_message_form input.post').click(function(e){
        var form = $('form.input_message_form');
        form.removeAttr('data-remote');
        from.removeData("remote");
        form.attr('action', form.attr('action').replace('.json', ''));
    });
    
    $('form.input_message_form').on('ajax:complete', function(event, data, status){
        if ( status == 'success') {
            var json = JSON.parse(data.responseText);
            $('div.timeline').prepend(json.timeline);
        }
    });
});

