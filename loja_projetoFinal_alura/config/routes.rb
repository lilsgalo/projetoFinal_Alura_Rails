Rails.application.routes.draw do
  resources :departamentos
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]
  
  get "produtos/search", to: "produtos#search", as: :search_produto

  root to: "produtos#index"
end