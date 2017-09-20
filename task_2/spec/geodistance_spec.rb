require_relative "../geodistance"

describe Geodistance do
  let(:from) { { latitude: 45.724409, longitude: 16.069066 } }
  let(:to) { { latitude: 45.686651, longitude: 16.141641 } }
  subject(:geodistance) { Geodistance.new(from, to) }

  describe "radian conversions" do
    it "transforms from_latitude into radians" do
      expect(subject.lat1).to be(0.7980)
    end
    it "transforms from_longitude into radians" do
      expect(subject.lng1).to be(0.2805)
    end
    it "transforms to_latitude into radians" do
      expect(subject.lat2).to be(0.7974)
    end
    it "transforms to_longitude into radians" do
      expect(subject.lng2).to be(0.2817)
    end
  end

  describe "#distance" do
    it "calculates a good cosines distance" do
      expect(subject.distance_in_km).to eq(6.57)
    end
  end
end
