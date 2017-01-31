Rails.application.routes.draw do
  devise_for :models
  get 'home/index'
  root 'home#index'

  #sign in
  match '/sign_in' => 'authentication#sign_in', via: [:get, :post]
  ##create player
  match '/create_player' => 'home#create_player', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
