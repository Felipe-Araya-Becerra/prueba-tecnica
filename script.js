$(document).ready(function() {
    $('.limited-checkbox').on('change', function() {
        if ($('.limited-checkbox:checked').length > 2) {
            this.checked = false;
            alert('Solo puedes seleccionar dos opciones.');
        }
    });

    $('#submitVote').on('click', function(){
        var formData = $('#votingForm').serialize();
        console.log(formData)

        $.ajax({
            url: 'vote.php',
            type: 'POST',
            data: formData,
            success: function(response) {
                $('#voteResult').html(response);
            },
            error: function() {
                $('#voteResult').html('Hubo un error al enviar el formulario.');
            }
        });
    });
});