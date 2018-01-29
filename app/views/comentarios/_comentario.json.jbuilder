json.extract! comentario, :id, :usuario_id, :noticium_id, :conteudo, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
