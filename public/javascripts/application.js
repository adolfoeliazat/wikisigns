// Initialize behaviours
function initializeBehaviours() {
  addFocusTextFieldBehaviour();
  showCanvasAndHideTableBehaviour();
  addSessionWordsBehaviour();
}

function showCanvasAndHideTableBehaviour() {
  $('#left-container table.carpet').hide();
  $('#word').show();
  drawWord('word');
  addSessionWordsBehaviour();
}

function addSessionWordsBehaviour(){
  $('#center-container').attr('style', 'display:block;');
  $('#word_submit').click(function(e){
    e.preventDefault();
    $('#title').html($('#word_word').val());
    var old_drawing = $('#word').children();
    old_drawing.appendTo('#center-container');
    drawWord('word');
//    $.ajax({
//      type: 'POST',
//      url: $('#new_word').attr('href'),
//      success: alert('updated')
//    })
  });
}

function addFocusTextFieldBehaviour() {
  $('#word_word').focus().select();
}

// Loads functions after DOM is ready
$(document).ready(initializeBehaviours);
