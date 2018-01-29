class Usuario < ApplicationRecord

  has_secure_password

  validates :nome, presence: true, length: { in: 2..20 }
  validates :email, presence: true, length: { in: 5..50 }, uniqueness: true
  validates :password, length: { in: 6..12 }, allow_nil:true

  has_many :noticia, dependent: :destroy


end
