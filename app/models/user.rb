class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :post, dependent: :destroy	#destruye todo lo asociado con el usuario cuando este es eliminado

         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

         has_many :following, through: :active_relationships, source: :followed
		 has_many :followers, through: :passive_relationships, source: :follower

		 #helper methods

		 #follow another user
		 def follow(other)
		 	active_relationships.create(followed_id: other.id)
		 end

		 #unfollow another user
		 def unfollow(other)
		 	active_relationships.find_by(followed_id: other.id).destroy
		 end

		 # is following another user
		 def following?(other)
		 	following.include?(other)
		 end

end
