require 'pry'

require_relative './concerns/memorable.rb'
require_relative './concerns/findable.rb'
require_relative './concerns/paramable.rb'

class Artist
  extend Memorable::ClassMethods, Findable
  include Memorable::InstanceMethods, Paramable

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    super#self.class.all << self #@@artists << self
    @songs = []
  end

  # def self.find_by_name(name)
  #   @@artists.detect{|a| a.name == name}
  # end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
    #<Artist:0x00 @name="" @song="#<Song:0x00 @title="" @artist="self">"
    # not <Song:0x00 @name="", @artist="#<Artist:0x00 @name="" @song=[]>"
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-') #.gsub replace ' ' with '-'
  # end
end
