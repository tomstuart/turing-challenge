require "spec_helper"

RSpec.describe SomeonesAttempt do
  describe "#encode" do
    it "encodes a number as unary" do
      expect(subject.encode(4)).to eq [1, 1, 1, 1]
      expect(subject.encode(5)).to eq [1, 1, 1, 1, 1]
      expect(subject.encode(6)).to eq [1, 1, 1, 1, 1, 1]
    end
  end

  describe "#decode" do
    it "decodes a unary number" do
      expect(subject.decode([1, 1, 1, 1])).to eq(4)
      expect(subject.decode([1, 1, 1, 1, 1])).to eq(5)
      expect(subject.decode([1, 1, 1, 1, 1, 1])).to eq(6)
    end
  end
end
