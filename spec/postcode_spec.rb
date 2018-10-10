require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_single_postcode_results('OX142BH') #input a postcode
    end

    it "should respond with a status message of 200" do
      expect(@response["status"]).to eq(200)
    end

    it "should have a results hash" do
      expect(@response).to be_a_kind_of(Hash)
    end

    it "should return a postcode between 5-8 in length"  do
      expect(@response['result']['postcode'].size).to be_between(5, 8)
      # puts "you are here: #{@response['result']['postcode'].size}"
    end

    it "should return an quality key integer between 1-9" do
        expect(@response['result']['quality']).to be_between(1, 9)
      # puts "you are here: #{@response['result']['quality']}"
    end

    it "should return an ordnance survey eastings value as integer" do
       expect(@response['result']['eastings']).to be_a_kind_of(Integer)
    end


    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response['result']['country'].downcase).to include("england").or("scotland").or("ireland")
    end

    it "should return a string value for NHS authority " do
      expect(@response['result']['nhs_ha']).to be_a_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@response['result']['longitude']).to be_a_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@response['result']['latitude']).to be_a_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@response['result']['parliamentary_constituency']).to be_a_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@response['result']['european_electoral_region']).to be_a_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@response['result']['primary_care_trust']).to be_a_kind_of(String)
    end

    it "should return a region string" do
      expect(@response['result']['region']).to be_a_kind_of(String)
    end

    it "should return a parish string" do
      expect(@response['result']['parish']).to be_a_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@response['result']['lsoa']).to be_a_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@response['result']['msoa']).to be_a_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response['result']['admin_district']).to be_a_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@response['result']['incode'].size).to eq(3)
    end

    it "should return a msoa string" do
        expect(@response['result']['msoa']).to be_a_kind_of(String)
    end

    it "should return a incode string of 3-4 characters" do
      expect(@response['result']['incode'].size).to be_between(3, 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @response = @postcodesio.get_multiple_postcodes_results(["CR09LY", "LE21FJ", "RH104EY"]) #Add in array of postcodes
    end

    it "should return the first query as the first postcode in the response" do
      expect(@postcodesio.multiple_postcode_results['result'][0]['query']).to eq("CR09LY")

    end

    it "should return the second query as the first postcode in the response" do
      expect(@postcodesio.multiple_postcode_results['result'][1]['query']).to eq("LE21FJ")
    end

    it "should have a results hash" do
      expect(@response).to be_a_kind_of(Hash)
    end

    it "should return a postcode between 5-8 in length"  do

      @response['result'].each do |each|
        expect(each['result']['postcode'].size).to be_between(5, 8)
      end
    end

    it "should return an quality key integer between 1-9" do
      @response['result'].each do |each|
          expect(each['result']['quality']).to be_between(1, 9)
      end

    end

    it "should return an ordnance survey eastings value as integer" do
      @response['result'].each do |each|
        expect(each['result']['eastings']).to be_a_kind_of(Integer)
      end
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      @response['result'].each do |each|
        expect(each['result']['country'].downcase).to include("england").or("scotland").or("ireland")
      end
    end

    it "should return a string value for NHS authority " do
      @response['result'].each do |each|
        expect(each['result']['nhs_ha']).to be_a_kind_of(String)
      end
    end

    it "should return a longitude float value" do
      @response['result'].each do |each|
        expect(each['result']['longitude']).to be_a_kind_of(Float)
      end
    end



    it "should return a parliamentary constituency string" do
      @response['result'].each do |each|
        expect(each['result']['parliamentary_constituency']).to be_a_kind_of(String)
      end
    end

    it "should return a european_electoral_region string" do
      @response['result'].each do |each|
        expect(each['result']['european_electoral_region']).to be_a_kind_of(String)
      end
    end

    it "should return a primary_care_trust string" do
      @response['result'].each do |each|
          expect(each['result']['primary_care_trust']).to be_a_kind_of(String)
      end
    end

    it "should return a region string" do
      @response['result'].each do |each|
        expect(each['result']['region']).to be_a_kind_of(String)
      end
    end

    it "should return a parish string" do
      @response['result'].each do |each|
        expect(each['result']['parish']).to be_a_kind_of(String)
      end
    end

    it "should return a lsoa string" do
      @response['result'].each do |each|
        expect(each['result']['lsoa']).to be_a_kind_of(String)
      end
    end

    it "should return a msoa string" do
      @response['result'].each do |each|
        expect(each['result']['msoa']).to be_a_kind_of(String)
      end
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      @response['result'].each do |each|
          expect(each['result']['admin_district']).to be_a_kind_of(String)
      end
    end

    it "should return a incode string of three characters" do
      @response['result'].each do |each|
        expect(each['result']['incode'].size).to eq(3)
      end
    end

    it "should return a msoa string" do
      @response['result'].each do |each|
        expect(each['result']['msoa']).to be_a_kind_of(String)
      end
    end

    it "should return a incode string of 3-4 characters" do
      @response['result'].each do |each|
        expect(each['result']['incode'].size).to be_between(3, 4)
      end
    end

    it "should have a results hash" do
      @response['result'].each do |each|
        expect(@response).to be_a_kind_of(Hash)
      end
    end
  end
end
