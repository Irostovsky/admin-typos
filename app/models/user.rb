class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def locale
    ::I18n.locale
  end

  def application(name)
    Typus.application(name)
  end

  def can?(*args)
    true
  end

  def cannot?(*args)
    !can?(*args)
  end

  def applications
    Typus.applications
  end
end
