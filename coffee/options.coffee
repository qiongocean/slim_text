$ ->
    _.each _.range(8, 33), (i) ->
        $('#font_size').append $("""<option value="#{i}">#{i}px</option>""")

    chrome.storage.sync.get ['theme', 'font_size'], (items) ->
        if not items.theme
            items.theme = 'monokai'
        if not items.font_size
            items.font_size = '12'

        $('select#theme').val items.theme
        $('select#font_size').val items.font_size

        $('button#btn').click ->
            chrome.storage.sync.set {'theme': $('select#theme').val(), 'font_size': $('select#font_size').val()}, ->
                window.notice chrome.i18n.getMessage('saved'), ''
