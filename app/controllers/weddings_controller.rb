class WeddingsController < ApplicationController
  def index
    @weddings = Wedding.all
  end

end
