require 'spec_helper'

module Arroz::Distances

  describe Euclidean do

    it 'responds_to #distance' do
      Euclidean.respond_to?(:distance).should be_true
    end

    it 'calculates the distance between two points correctly' do
      Euclidean.distance([0, 0], [1, 1]).should == Math.sqrt(2)
    end

    it 'the distance is symmetric' do
      Euclidean.distance([0, 0], [1, 1]).should == 
        Euclidean.distance([1, 1], [0, 0])
    end
  end
end