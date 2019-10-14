Rails.application.routes.draw do
  devise_for :users
  root to: 'links#index'
  post '/save_link', to: 'links#save'
  get '/no_redirect/links', to: 'links#show'
  get '/:short_url', to: 'links#redirect', as: "redirect_link"
  delete '/link/delete/:id', to: 'links#destroy', as: "delete_link"
end
