// Welcome Mode
// ============

// Callbacks
function finished_welcome() {
  // Wait 2s before ending fullscreen
  setTimeout(stopFullScreen, 2000);
}

function draw_welcome_title(text, callback) {
  var colored_text = $(drawColoredWord(text));
  var last_letter = colored_text.filter('span:last');

  last_letter.css('position', 'relative');
  last_letter.css('left', '3000px');
  last_letter.css('top', '2000px');
  last_letter.css('z-index', '1');
  $('#title').html(colored_text);

  last_letter.animate({
                        top: '0px',
                        left: '0px'
                      },
                      250,
                      function(){
                        if(typeof(callback) != "undefined"){
                          callback();
                        }
                      });
}

// Loads the guessing game on the root page.
// It starts with the alphabet.
function setWelcomeMode() {
  var alphabet = 'abcdefghijklmnopqrstuvwxyz';

  // Show welcome mode in fullscreen
  startFullScreen();

  // Show alphabeet, slowly fading in characters, stopping fullscreen mode afterwards
  startShowWord(alphabet, finished_welcome, draw_welcome_title);
}

$(document).ready(initializeBehaviours);
