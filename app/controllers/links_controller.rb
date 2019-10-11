class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def show
  end

  def save
    p "#"*80
    p @link
    p "#"*80
  end

end
