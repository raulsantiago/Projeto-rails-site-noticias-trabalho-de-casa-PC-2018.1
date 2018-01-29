class CreateNoticia < ActiveRecord::Migration[5.1]
  def change
    create_table :noticia do |t|
      t.references :usuario, foreign_key: true
      t.string :titulo
      t.string :texto
      t.string :categoria
      t.string :image
      t.datetime :data_public

      t.timestamps
    end
  end
end
