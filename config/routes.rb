Rails.application.routes.draw do
  
  root 'contacts#home' 

  resources :contacts
  
  get "/print", to: "contacts#print"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
