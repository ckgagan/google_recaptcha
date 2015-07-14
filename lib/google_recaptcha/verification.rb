require 'rest-client'

module GoogleRecaptcha
  class Verification

    VERIFICATION_URL = "https://www.google.com/recaptcha/api/siteverify"

    def self.verify_human(response, ipaddress)
      response = RestClient.post VERIFICATION_URL,
                      :secret => GoogleRecaptcha.configuration.secret_key,
                      :response => response,
                      :remoteip => ipaddress
      response = JSON.parse(response)
      puts response.inspect
      response['success']
    end
  end
end