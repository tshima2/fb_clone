Rails.application.routes.draw do
  get '/', to: 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
