do ($ = this.Zepto) ->
  colors = ['red', 'yellow', 'teal', 'orange', 'purple', 'green', 'pink', 'blue']
  color = colors[Math.floor( Math.random() * colors.length )]

  $ ->
    $( 'html' ).addClass( color )
    $( '#favicon' ).attr( 'href', "favicon_#{color}.ico" )
