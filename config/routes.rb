Rails.application.routes.draw do
  resources :users, only: [:index, :show, :update, :destroy, :create]

  get '/users/:user_id/contacts', to: 'contacts#index'

  resources :contacts, only: [:show, :update, :destroy, :create]

  resources :contact_shares, only: [:destroy, :create]

end
