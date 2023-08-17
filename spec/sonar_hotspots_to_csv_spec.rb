require 'rspec/autorun'
require_relative '../lib/sonar_hotspots_to_csv'
require 'csv'

describe SonarHotspotsToCSV do
  before(:all) do
    @csv = SonarHotspotsToCSV.new(File.read('spec/fixtures/test_data.json')).to_csv.split("\n")
  end

  it "should have 3 rows" do
    expect(@csv.length).to eq(4)
  end

  it "should have a header" do
    expect(@csv[0]).to eq("component,message,vulnerabilityProbability")
  end

  it "should have a valid first row" do
    expect(@csv[1]).to eq("moowahaha_despamilator:spec/filters/ip_address_url_spec.rb,Make sure using this hardcoded IP address is safe here.,LOW")
  end
end