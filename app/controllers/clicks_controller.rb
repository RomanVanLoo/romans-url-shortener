class ClicksController < ApplicationController

  def reset
    @link = Link.find(params[:id])
    @link.clicks.destroy_all
  end
end
