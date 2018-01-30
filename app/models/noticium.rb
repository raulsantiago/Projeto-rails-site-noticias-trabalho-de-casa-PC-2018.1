class Noticium < ApplicationRecord

  belongs_to :usuario
  #belongs_to :comentario


  mount_uploader :image, ImageUploader
  validates_presence_of :image
  validates :titulo, presence: true, length: { in: 2..1024 }
  validates :texto, presence: true, length: { in: 2..10024 }
  validates :categoria, presence: true, length: { in: 1..254 }


  def tamanho_foto
    if image.size > 25.megabytes
      errors.add(:image, "Muito grande, não pode possuir mais de 25 MB")
    end
  end


end
