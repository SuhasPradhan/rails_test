Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index', as: :home_index

  get 'user/signup' => 'users#new', as: :user_signup
  post 'user/signup' => 'users#create', as: :user_create
  get 'user/edit' => 'users#edit', as: :user_edit

  get 'login' => 'sessions#new', as: :user_login
  post 'login' => 'sessions#create', as: :user_session
  get 'user/logout' => 'sessions#destroy', as: :user_logout

  get 'user' => 'events#index', as: :user_event

  get 'event' => 'events#new', as: :event_new
  post 'event' => 'events#create', as: :event_create

  get 'event/:id/edit' => 'events#edit',as: :event_edit
  put 'event/:id/edit' => 'events#update',as: :event_update
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
