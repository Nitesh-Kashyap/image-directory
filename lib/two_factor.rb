require 'httparty'

class TwoFactor
  include HTTParty

  TWO_FACTOR_API_KEY = '378659e5-da97-11eb-8089-0200cd936042'

  def self.send_passcode(phone)
    response = get("https://2factor.in/API/V1/#{TWO_FACTOR_API_KEY}/SMS/#{phone}/AUTOGEN")
    response.parsed_response
  end

  def self.verify_passcode(session_key, code)
    response = post("https://2factor.in/API/V1/#{TWO_FACTOR_API_KEY}/SMS/VERIFY/#{session_key}/#{code}")
    response.parsed_response
  end
end
