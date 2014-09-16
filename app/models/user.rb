class User < CampyticsDb

  attr_accessor :password, :password_confirmation
  #has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  property :email
  property :name
  property :password_digest
  property :remember_token

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  design do
    view :by_remember_token
  end

  gem 'bcrypt-ruby', '~> 3.0.0'
  require 'bcrypt'

  attr_reader :password

  validates_confirmation_of :password
  validates_presence_of     :password_digest


  def authenticate(unencrypted_password)
    if BCrypt::Password.new(password_digest) == unencrypted_password
      self
    else
      false
    end
  end

  # Encrypts the password into the password_digest attribute.
  def password=(unencrypted_password)
    @password = unencrypted_password
    unless unencrypted_password.blank?
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
