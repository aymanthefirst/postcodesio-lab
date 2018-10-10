require "httparty"
require "json"

class Postcodesio
  include HTTParty # all methods from httparty are now available
  attr_accessor :single_postcode_results, :multiple_postcode_results

  # base_uri "http://api.postcodes.io/"

  def get_single_postcode_results(postcode)
    @single_postcode_results = JSON.parse(self.class.get("http://api.postcodes.io/postcodes/#{postcode}").body) # aka we are now pointing at this
  end

  def get_multiple_postcodes_results(postcodes)
    @multiple_postcode_results = JSON.parse(self.class.post("http://api.postcodes.io/postcodes/", :body => {"postcodes": postcodes}).body)
  end

  def get_status_code
    @multiple_postcode_results.code
  end


end # class


# postcodesio = Postcodesio.new
# postcodesio.get_single_postcode_results("CR09LY")
# postcodesio.get_multiple_postcodes_results(["CR09LY", "LE21FJ", "RH104EY"])


# puts postcodesio.single_postcode_results
# puts postcodesio.multiple_postcode_results
