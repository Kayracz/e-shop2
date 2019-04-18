class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items

  # mount_uploader :image, ImageUploader
  mount_uploader :photo, PhotoUploader
  # serialize :image, JSON #if you use SQlite, add this line

  validates :name, :price, :category, :color, :quantity, :size, :gender, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum alowed. "}
  validates :price, numericality: { only_integer:true }, length: { maximum: 7 }

  COLOR = %w{ Blanco Negro Rojo Azul Amarillo Verde Beige }
  SIZE = %w{ XS S M L XL }
  GENDER = %W{ Male Female }
  CATEGORY = %W{ Vestidos Bikini Malla Shorts Blusas Camisas}


 private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end

end
