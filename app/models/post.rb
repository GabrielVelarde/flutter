class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140} #porque tuiter solo permite 140 caracteres por twit

  default_scope -> { order( created_at: :desc ) } #los tuits nuevos arriba

end
