Rails.application.routes.draw do
  resources :companies do
    resources :cars
  end
end
