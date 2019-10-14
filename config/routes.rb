Rails.application.routes.draw do
  get '/.well-known/pki-validation/56449DF7120D930971DF49D8DD3F9A47.txt', to: 'links#pki'
  devise_for :users
  root to: 'links#index'
  post '/save_link', to: 'links#save'
  get '/no_redirect/links', to: 'links#show'
  get '/:short_url', to: 'links#redirect', as: "redirect_link"
  delete '/link/delete/:id', to: 'links#destroy', as: "delete_link"
  delete '/clicks/reset/:id', to: 'clicks#reset', as: "reset_clicks"
end
