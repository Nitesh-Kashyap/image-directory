require 'two_factor'
class UserRegistration < ApplicationRecord
  validates :phone, presence: true
  validates :phone, uniqueness: true
  enum otp_status: [:sent, :verified]
	def send_passcode
    response = TwoFactor.send_passcode(phone)
    if response['Status'].downcase == 'success'
      update_columns(secret_key: response['Details'], otp_status: 0 )
      true
    end
  end

  def verify_passcode(passcode)
  	response = TwoFactor.verify_passcode(secret_key, passcode)
    if response['Status'].downcase == 'success'
      update_column(:otp_status, 1)
      true
    end
  end
end
