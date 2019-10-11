class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def show
    @link = Link.where(short_url: params[:short_url]).take
    @link ? (redirect_to @link.long_url) : (redirect_to root_path)
  end

  def save
    @link = Link.new(link_params)
    @link.save
    redirect_to root_path
  end

  def link_params
    params.require(:link).permit(
      :short_url,
      :long_url
    )
  end

end
