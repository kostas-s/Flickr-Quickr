class StaticPagesController < ApplicationController

  require 'flickraw'
  FlickRaw.api_key = Figaro.env.flickraw_api_key
  FlickRaw.shared_secret = Figaro.env.flickraw_shared_secret

  def index
    if params[:user] && params[:user] != '' && params[:tag] && params[:tag] != ''
      @images = flickr.photos.search(username: params[:user], tags: params[:tag], safe_search: 1)
    elsif params[:user] && params[:user] != ''
      @images = flickr.photos.search(username: params[:user], safe_search: 1)
    elsif params[:tag] && params[:tag] != ''
      @images = flickr.photos.search(tags: params[:tag], safe_search: 1)
    end
  end

end
