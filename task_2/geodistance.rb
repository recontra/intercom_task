class Geodistance
  include Math
  attr_reader :from, :to, :lat1, :lng1, :lat2, :lng2
  RADIUS = 6371

  def initialize(from, to)
    @from = from
    @to = to
    set_coordinates
  end

  def distance_in_km
    distance = acos(sin(lat1) * sin(lat2) +
      cos(lat1) * cos(lat2) *
      cos(lng2 - lng1)) * RADIUS
    distance.round(2)
  end

  private

  def set_coordinates
    @lat1 = from[:latitude].to_rad
    @lat2 = to[:latitude].to_rad
    @lng1 = from[:longitude].to_rad
    @lng2 = to[:longitude].to_rad
  end
end

class Float
  def to_rad
    (self * Math::PI / 180.00).round(4)
  end
end
