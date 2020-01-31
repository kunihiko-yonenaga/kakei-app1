Rails.application.routes.draw do
  root "top#index"
  post "spending_values/new(/:name)" => "spending_values#new"

  resources :spendings
  resources :spending_values
end
