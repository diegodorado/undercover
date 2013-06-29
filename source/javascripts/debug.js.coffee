$ ->
  $('<a href="#" id="debug">').text('Mostrar Grid').appendTo($('body'))
  $("#debug").on 'click', (ev)->
    ev.preventDefault()
    $('body').toggleClass 'debug'