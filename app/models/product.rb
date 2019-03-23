class Product < ApplicationRecord
    include Hashid::Rails
    mount_uploader :image, ImageUploader
    extend Enumerize
    enumerize :unit, in: [:yen, :usd]
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :unit, presence: true
end
