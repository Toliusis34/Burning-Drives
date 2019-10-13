require 'faraday'

class GamesController < ApplicationController
  def search
    search = params["search_query"]
    faraday = Faraday.new("https://api.rawg.io/api/games?page_size=100&search=#{search}", headers: { 'User-Agent' => 'test' }).get.body
    json = JSON.parse!(faraday)
    @results = json["results"]
  end
end
