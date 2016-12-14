class SearchController < ApplicationController
  def index
    zipcode = params[:q]
     Faraday.get()
  end
end
