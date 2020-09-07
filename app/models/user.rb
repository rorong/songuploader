class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   # ROLE = %w(Admin Individual)
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,:confirmable
  # ,:omniauthable, :omniauth_providers => [:facebook, :linkedin]
  validates :email, uniqueness: true
  validates :first_name,:last_name,:email, presence: true
  enum role: [:individual,:admin ]


 def self.authenticate_social_login(auth)
     @user = User.where(email: auth.info
      .email).first
    if auth.provider == "facebook"
      connect_to_facebook(auth)
    elsif auth.provider == "spotify"
      connect_to_spotify(auth)
    else
      unless @user
        @user = User.new(
          uid:auth.uid,
          provider: auth.provider,
          first_name: auth.info.first_name,
          last_name:auth.info.last_name,
          username: auth.info.name,
          email: auth.info.email,
          phone_number: auth.info.keyword_id,
          # date_of_birth:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
        )
        @user.skip_confirmation!
        @user.save
      end
    end
    return @user
  end

  def self.connect_to_facebook(auth)
    @user = User.where(uid: auth.uid).first
     unless @user
      @user = User.new(
          uid:auth.uid,
          provider: auth.provider,
          first_name: auth.info.first_name,
          last_name:auth.info.last_name,
          email: 'example_facebook@gmail.com',
          phone_number: "54475757",
          password: Devise.friendly_token[0, 20]
        )
      @user.skip_confirmation!
      @user.save
      @user
    end
    return @user
  end
  def self.connect_to_spotify(auth)
    @user = User.where(uid: auth.uid).first
     unless @user
      @user = User.new(
          uid:auth.uid,
          provider: auth.provider,
          first_name: auth.info.name,
          last_name:auth.info.name,
          email: auth.info.email,
          username: auth.info.name,
          phone_number: "324323423423",
          password: Devise.friendly_token[0, 20]
        )
      @user.skip_confirmation!
      @user.save
      @user
    end
    return @user
  end
end
