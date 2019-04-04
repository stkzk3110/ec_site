class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable,
         :validatable
  has_one :basket, dependent: :destroy
  
  def prepare_basket
    basket || create_basket
  end
end
