

class User < ActiveRecord::Base
    has_secure_password
    validates :password, presence: true, on: :create, unless: 'password.nil? || password.empty?'
  end