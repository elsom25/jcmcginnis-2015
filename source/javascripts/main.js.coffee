do ($ = this.Zepto) ->
  NUM_COLOURS = 16

  name = (i) -> "kitten-#{i}"
  valid_names = (name x for x in [1..NUM_COLOURS])
  add_name = (i, $el) ->
    $el.removeClass(valid_names.join(" "));
    $el.addClass( name( i % NUM_COLOURS + 1 ) )

  count = 0
  section_count = 0
  scroll = (sections) ->
    section_height = sections.eq(0).height()
    scroll_top = $(this).scrollTop()
    doc_height = $(document).height()
    if scroll_top > doc_height - section_height * 3
      count += 1
      # TODO: if I want it to eventually stop...
      # return false if count >= 10

      new_sections = sections.clone()
      new_sections.each ->
        if section_count < NUM_COLOURS - 1
          section_count += 1
        else
          section_count = 0

        add_name section_count, $( ".magic", this )

      $( "main" ).append( new_sections )

  $ ->
    sections = $( "section" )
    section_count = sections.length - 1
    $(window).scroll -> scroll( sections )

    $( "a[rel=external]" ).attr( "target", "_blank" )
    $(".magic").each (i, el) -> add_name( i, $(el) )
