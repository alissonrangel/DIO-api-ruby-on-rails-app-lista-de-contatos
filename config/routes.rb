Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/contacts", to: 'contacts#create'
  get "/contacts", to: "contacts#index"
  delete "/contacts/:id", to: "contacts#destroy"
  get "/contacts/:id", to: "contacts#show"

end
