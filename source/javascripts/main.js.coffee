do ($ = this.Zepto) ->
  NUM_COLOURS = 13

  name = (i) -> "kitten-#{i}"
  valid_names = (name x for x in [1..NUM_COLOURS])
  console.log valid_names

  $ ->
    $( "a[rel=external]" ).attr( "target", "_blank" )
    $("section").each (i, el) ->
      $el = $( el )
      $el.removeClass(valid_names.join(" "));
      $el.addClass( name( i % NUM_COLOURS + 1 ) )
