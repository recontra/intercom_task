require 'json'
require_relative 'geodistance'

class Inviter
  HQ_COORDINATES = {
    latitude: 53.339428,
    longitude: -6.257664
  }.freeze

  DATA_PATH = "data/gistfile1.txt".freeze

  def initialize(data_path = nil)
    @data_path = data_path || DATA_PATH
  end

  def invite(radius = 100)
    clients_for_invite = []
    clients = File.open(@data_path, "r").read.split("\n")

    clients.each do |client_json|
      client = JSON.parse(client_json, symbolize_names: true)
      coordinates = {
        latitude: client[:latitude].to_f,
        longitude: client[:longitude].to_f
      }

      distance_to_hq =  Geodistance
                        .new(HQ_COORDINATES, coordinates)
                        .distance_in_km
      clients_for_invite << client if distance_to_hq < radius
    end

    clients_for_invite
      .sort_by { |c| c[:user_id] }
      .map { |c| [c[:user_id], c[:name]]}
  end
end
