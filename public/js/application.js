$(document).ready(function() {


  $('#flashcard').on('submit', function(event){
    event.preventDefault();
    $('#flashcard_contents').fadeOut('slow', function() {
    });
  });


    $('#flashcard').on('submit', 'form', function(event){
      event.preventDefault();
      var url = $(this).attr('action');
      var data = $(this).serialize();
        $.post(url, data, function(response){
          var answer = $(response).find('#flashcard_contents');
          $('#flashcard').append(answer);
          $(answer).hide();
          $(answer).fadeIn('slow', function() {
          });
        });
     });

 
});
