class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, :message => 'Ambos campos deben coincidir'
  has_many :posts
end
