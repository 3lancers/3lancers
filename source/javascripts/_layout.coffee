initShrinkableNavigation = ->
  timeout = null

  $(window).scroll ->
    $nav = $(".navigation nav")
    if window.innerWidth >= 768
      if $(document).scrollTop() > 110 && !$nav.hasClass("to-stuck")
        $nav.addClass("shrinked navbar-fixed-top to-stuck")
        clearTimeout(timeout)
        timeout = setTimeout(->
          $nav.addClass("stucked")
        , 100)
      else if $(document).scrollTop() < 110 && $nav.hasClass("to-stuck")
        $nav.removeClass("shrinked to-stuck navbar-fixed-top stucked")
    else if $nav.hasClass("to-stuck")
      $nav.removeClass("shrinked to-stuck navbar-fixed-top stucked")

initSmoothScroll = ->
  smoothScroll.init
    offset: 65

initMap = ->
  location = new google.maps.LatLng(49.825389, 18.246490)
  map = new google.maps.Map $("#map").get(0),
    center: location
    disableDefaultUI: true
    scrollwheel: false
    styles: mapTheme()
    zoom: 12

  marker = new google.maps.Marker(
    map: map
    position: location
    title: "3lancers"
  )
  
  google.maps.event.addListener marker, "click", ->
    window.open("https://goo.gl/maps/dTCTizGCi1D2", "_blank")

initNumbers = ->
  $(".numbers .counter").each ->
    $counter = $(this).find("span")
    $(this).waypoint ->
      this.destroy()
      $counter.countTo()
    ,
      offset: "100%"

initWork = ->
  $("#work .show-more-button").click (event) ->
    $("#work .show-more").addClass("shown")
    $(this).hide()
    event.preventDefault()

initShrinkableNavigation()
initSmoothScroll()
initMap()
initNumbers()
initWork()