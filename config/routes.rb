Rails.application.routes.draw do
  devise_for :users
  get '/:short_url', to: 'links#show'
  root to: 'links#index'
  post '/save_link', to: 'links#save'
end
