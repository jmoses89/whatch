class User < ActiveRecord::Base
  has_many :ratings
  has_many :movies, through: :ratings
  has_many :genres, through: :movies

  def self.login_from_omniauth(auth_hash)
    find_from_omniauth(auth_hash) || create_with_omniauth(auth_hash)    
  end

  def self.find_from_omniauth(auth_hash)
    find_by(:uid => auth_hash[:uid])
  end

  def self.create_with_omniauth(auth_hash)   
    create(:uid => auth_hash[:uid].to_i, :name => auth_hash[:info][:name], :email => auth_hash[:info][:email])
  end

end
