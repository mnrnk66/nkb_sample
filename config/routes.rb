NkbSample::Application.routes.draw do

  resources :items

  # get "tests/show"
  # get "tests/index"

  # resources :tests, :only => [ :index, :show, :new ]
  resources :tests
  resources :foo
end
