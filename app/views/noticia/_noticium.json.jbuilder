json.extract! noticium, :id, :usuario_id, :titulo, :texto, :categoria, :image, :data_public, :created_at, :updated_at
json.url noticium_url(noticium, format: :json)
