$(window).bind "load", ->

  $("nav.social .more").on 'click', (ev)->
    ev.preventDefault()
    $('.main-phone').toggleClass 'on'

  $("nav.main ul").lavaLamp
    fx: "easeOutBack"
    speed: 700
    indicator: "nav.main .indicator"
    activeClass: "active"

  $("nav.menu ul").lavaLamp
    fx: "easeOutBack"
    speed: 700
    indicator: "nav.menu .indicator"
    activeClass: "active"
    widthSetter: "b"

$ ->

  $("#delivery, #delivery-phone").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').height($('body').outerHeight(true)).show()

  $("#lightbox").on 'click', (ev)->
    ev.preventDefault()
    $('#lightbox').hide()


  $(window).bind( "resize", home_slides).trigger 'resize'

  if (window.PIE)
    $('.franquicias-box, .contact-box').each () -> PIE.attach(@)
    #force ie to redraw due to pie bug
    setTimeout (-> $('.franquicias-box, .contact-box').css  {position : 'relative'} ), 100
    

home_slides =  ->
  
  $el = $("#home-slides")
  return if $el.size() is 0
  $el.css 'height', 'auto'
  $el.cycle
    fx: "fade"
    aspect: true
    speed: 300
    timeout: 2000
    fit: 1
    width: '100%'
    pause: true
    pager:  '#home-slides-nav'
    pauseOnPagerHover: true
    activePagerClass: 'active'
    pagerAnchorBuilder: (idx, slide) ->
      "#{@pager} .slide-item:nth-child(#{idx+1})"