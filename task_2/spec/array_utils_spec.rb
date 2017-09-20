require_relative "../array_utils"

describe ArrayUtils do
  describe "#flatten" do
    it "returns nil if nil was given" do
      expect(ArrayUtils.flatten(nil)).to eq(nil)
    end

    it "returns same object is object is not array" do
      expect(ArrayUtils.flatten(12)).to eq(12)
      expect(ArrayUtils.flatten({a: 1, b: 2})).to eq({a: 1, b: 2})
      expect(ArrayUtils.flatten(true)).to eq(true)
      expect(ArrayUtils.flatten("example")).to eq("example")
    end

    it "returns same array if array without nesting is given" do
      expect(ArrayUtils.flatten([1,2,3,4,5])).to eq([1,2,3,4,5])
    end

    it "returns same empty array if empty array is given" do
      expect(ArrayUtils.flatten([])).to eq([])
    end

    it "returns flatten array if nested given ex1" do
      expect(ArrayUtils.flatten([1, 2, [3, 4, [5, 6], 7], 8])).to eq([1,2,3,4,5,6,7,8])
    end

    it "returns flatten array if nested given ex2" do
      expect(ArrayUtils.flatten([[[[1]]]])).to eq([1])
    end

    it "returns flatten empty array if nested empty given ex3" do
      expect(ArrayUtils.flatten([[[[[[]]]]]])).to eq([])
    end

    it "returns flatten empty array if nested empty given ex4" do
      expect(ArrayUtils.flatten([1,[2,3,[4],[5,6],[7,8],[9,10]],[11,12]])).to eq([1,2,3,4,5,6,7,8,9,10,11,12])
    end
  end
end
