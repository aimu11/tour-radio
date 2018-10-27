# app/workers/radio_worker.rb

require 'shout'
require 'open-uri'
class RadioWorker
  include Sidekiq::Worker
  def perform(*_args)
    s = Shout.new
    s.mount = "/stream"
    s.charset = "UTF-8"
    s.port = 35689
    s.host = 'localhost'
    s.user = ENV['ICECAST_USER']
    s.pass = ENV['ICECAST_PASSWORD']
    s.format = Shout::MP3
    s.description = 'Tour Radio'
    s.connect
  end
end
