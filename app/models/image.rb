class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  validate :correct_image_type

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'Must be a JPEG or PNG')
    elsif image.attached? == false
      errors.add(:image, 'Image required')
    end
  end
end