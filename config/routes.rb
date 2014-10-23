Rails.application.routes.draw do
  # get 'projects/index'

  # get 'project/:id', to: 'projects#show', as: "<project></project>"
  resources :projects, except: [:new, :edit] do
  resources :cards, except: [:new, :edit, :show, :index]
	end
  devise_for :users
  root 'home#index'

  
end
