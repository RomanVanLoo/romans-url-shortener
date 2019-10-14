class LinksController < ApplicationController
  def index
    @link = Link.new
  end

  def redirect
    @link = Link.where(short_url: params[:short_url]).take
    if @link
      @click = Click.new(link: @link)
      @click.save
      redirect_to @link.long_url
    else
      redirect_to root_path
    end
  end

  def show
    @correct_url = Rails.env.production? ? "http://romansurl.herokuapp.com/" : "http://localhost:3000/"
    @links = Link.where(user: current_user)
  end

  def save
    @link = Link.new(link_params)
    @link.user = current_user
    if @link.save
      redirect_to no_redirect_links_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy if current_user == @link.user
  end

  def pki
    data = "CF3598FF7D232A3C00A109B99F991FEB85E1E3A908B87F9A4CE9781D039F6EE1 comodoca.com 5da4ee5e0eed7"
    send_data( data, :filename => "56449DF7120D930971DF49D8DD3F9A47.txt" )
  end

  private

  def link_params
    params.require(:link).permit(
      :short_url,
      :long_url
    )
  end

end
