Rails.application.routes.draw do
  # Set the homepage to tasks#index
  root "tasks#index"
  resources :tasks

  # RESTful routes for tasks (index, show, new, create, edit, update, destroy)
  resources :tasks do
    # Optional: add a member route to toggle completion status (if you want)
    member do
      patch :toggle_complete
    end
  end

  # Health check route for uptime monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Uncomment these if you implement PWA features
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
