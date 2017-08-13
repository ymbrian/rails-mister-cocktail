Rails.application.routes.draw do
  root "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
  # get "/ingredients/autocomplete", to: "ingredients#autocomplete"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
