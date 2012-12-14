require 'spec_helper'

module Arroz
  describe KNN do
    
    describe 'when trying to find the nearest neighbor' do
      let(:data) { [['A', 1, 2], ['B', 3, 4], ['B', 1,5]] }

      it 'raises an error if the distance function is undefined' do
        knn = KNN.new(data)

        expect {
          knn.classify([1,2])
        }.to raise_error(NotImplementedError)
      end

      it 'returns the correct neighbor class according to the distance' do
        knn = KNN.new(data, 3)
        knn.extend(Distances::Euclidean)

        expect(knn.classify([1, 3])).to eq('B')
      end
    end
  end
end
