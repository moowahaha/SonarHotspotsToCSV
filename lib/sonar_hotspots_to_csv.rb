require 'json'
require 'csv'

class SonarHotspotsToCSV
  def initialize(json_string)
    json = JSON.parse(json_string)
    throw "No hotspots found" unless json["hotspots"]
    hotspots = json["hotspots"]
    hotspots_to_csv(hotspots)
  end

  def to_csv
    @csv
  end

  private

  def hotspots_to_csv(hotspots)
    # use CSV class to convert hash to csv string
    relevant_keys = ["component", "message", "vulnerabilityProbability"]
    @csv = CSV.generate do |csv|
      csv << relevant_keys
      hotspots.each do |hash|
        # convert hash to array of values from array of keys
        csv << hash.values_at(*relevant_keys)
      end
    end
  end
end
