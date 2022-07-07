class Post < ApplicationRecord
  validates :location, presence: true, length: {maximum: 20}
  validates :text, presence: true, length: {maximum: 200}
  validates :image, presence: true

  attachment :image

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum status: { published: 0, draft: 1 }
end
