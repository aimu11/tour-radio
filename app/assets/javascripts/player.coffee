$ ->
  wrapper = $('#js-player-wrapper')
  player = wrapper.find('#js-player')
  player.append '<source src="http://localhost:35689/stream">'
  player.get(0).play()
  now_playing = wrapper.find('.now-playing')
  listeners = wrapper.find('.listeners')

  updateMetaData = ->
  url = 'http://localhost:35689/info.xsl'
  mount = '/stream'

  $.ajax
    type: 'GET'
    url: url
    async: true
    jsonpCallback: 'parseMusic'
    contentType: "application/json"
    dataType: 'jsonp'
    success: (data) ->
      mount_stat = data[mount]
      now_playing.text mount_stat.title
      listeners.text mount_stat.listeners
    error: (e) -> console.error(e)


  player.get(0).play()
  setInterval updateMetaData, 5000
