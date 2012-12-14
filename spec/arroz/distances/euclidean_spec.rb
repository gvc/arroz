require 'spec_helper'

module Arroz::Distances

  describe Euclidean do

    it 'responds_to #distance' do
      expect(Euclidean.respond_to?(:distance)).to eq(true)
    end

    it 'calculates the distance between two points correctly' do
      expect(Euclidean.distance([0, 0], [1, 1])).to eq(Math.sqrt(2))
    end

    it 'the distance is symmetric' do
      expect(Euclidean.distance([0, 0], [1, 1])).
        to(eq(Euclidean.distance([1, 1], [0, 0])))
    end
  end
end