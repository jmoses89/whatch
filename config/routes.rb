Rails.application.routes.draw do
  resources :ratings, only: [:create, :index, :update, :destroy]
  resources :movies, only: [:index]

  get '/login', to: 'sessions#new', as: :new_login
  get '/list', to: 'ratings#index'

  get '/watch/:id', to: 'movies#watch',  as: :watch
  get '/email',     to: 'users#email',   as: :email
  get '/lucky',     to: 'ratings#lucky', as: :lucky
  # get '/error',     to: 'movies#error',  as: :error
  # get '/about',     to: 'movies#about',  as: :about
  # get '/reset',     to: 'movies#reset',  as: :reset
  # get '/help',      to: 'movies#help',   as: :help 

  scope controller: :movies do 
    get '/error',     to: :error,  as: :error
    get '/about',     to: :about,  as: :about
    get '/reset',     to: :reset,  as: :reset
    get '/help',      to: :help,   as: :help 
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout'  => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'movies#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
