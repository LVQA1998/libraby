class User < ApplicationRecord
  REGEX_PATTERN = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/i
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable

  validates :tel, presence: true, length: {maximum: 11, minimum: 10}
  validates :address, length: {maximum: 200}
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, format: {with: REGEX_PATTERN}, length: {minimum: 4, maximum: 50}
  validate :password_regex

  private

  def password_regex
    return if password.present? && !!(password =~ PASSWORD_REGEX)
    errors.add :password, "includes number, capital,noncapital and non characters"
  end
end
