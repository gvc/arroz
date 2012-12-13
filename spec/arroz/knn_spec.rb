require 'spec_helper'

module Arroz
  describe KNN do
    
    describe 'when trying to find the nearest neighbor' do
      let(:data) { [[1, 2], [3, 4], [1,5]] }

      it 'raises an error if the distance function is undefined' do
        knn = KNN.new(data)

        -> {
          knn.nearest_neighbor([1,2])
        }.should raise_error(NotImplementedError)
      end

      it 'returns the correct neighbor according to the distance' do
        knn = KNN.new(data)
        knn.extend(Distances::Euclidean)

        knn.nearest_neighbor([1, 3]).should == [1, 2]
      end
    end
  end
end
