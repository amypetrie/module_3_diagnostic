class SearchController < ApplicationController

  def index
    @facade = SearchFacade.new
  end

end
