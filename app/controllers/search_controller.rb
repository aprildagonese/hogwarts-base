class SearchController < ApplicationController
  def index
    render locals: {
      facade: HogwartsFacade.new.students(params[:house])
    }
  end
end
