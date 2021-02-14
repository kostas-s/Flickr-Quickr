class StaticPagesController < ApplicationController
  before_action :check_safe_tags

  # Some whitelisted words for safe searching
  @@whitelisted_words = ['dogs', 'cats', 'landscape', 'trains', 'travel',
                         'guitars']

  # Initialize API connection settings
  require 'flickraw'
  FlickRaw.api_key = Figaro.env.flickraw_api_key
  FlickRaw.shared_secret = Figaro.env.flickraw_shared_secret

  def index
    @whitelisted_words = @@whitelisted_words
    if params[:user] && params[:user] != '' && params[:tag] && params[:tag] != ''
      @images = flickr.photos.search(username: params[:user], tags: params[:tag], extras: :url_n, safe_search: 1)
    elsif params[:user] && params[:user] != ''
      @images = flickr.photos.search(username: params[:user], extras: :url_n, safe_search: 1)
    elsif params[:tag] && params[:tag] != ''
      @images = flickr.photos.search(tags: params[:tag], safe_search: 1, extras: :url_n)
    end
  end

  private

  def check_safe_tags
    if params[:tag]
      params[:tag].downcase.split(' ') do |tag|
        unless tag.chomp.in? @@whitelisted_words
          params[:tag] = nil
          redirect_to '/'
        end
      end
    end
  end

end
