Rails.application.routes.draw do

  resources :comentarios
  resources :noticia

  root to: "usuarios#index"

  # Sessoes noticia
  get 'feed', to: "noticia#feed", as: :feed

  # Sessoes controller
  get 'login', to: "sessoes#new", as: :login
  post 'login', to: "sessoes#create"
  delete 'login', to: "sessoes#destroy", as: :logout

  # Usuarios controller
  get 'usuarios/novo', to: "usuarios#new", as: :new_usuario #novo é nome não é agumento
  post 'usuarios/novo', to: "usuarios#create" #criando no DB
  get 'usuarios/editar/:id', to: "usuarios#edit", as: :edit_usuario
  patch 'usuarios/editar/:id', to: "usuarios#update" #acesaar db para alteração pelo form
  get 'usuarios/:id', to: "usuarios#show", as: :show_usuario #id argumento
  delete 'usuarios/:id', to: "usuarios#destroy", as: :destroy_usuario
  get 'usuarios', to: "usuarios#index", as: :index_usuarios


end
