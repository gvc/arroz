require 'spec_helper'

module Arroz
  
  describe Ensemble do

    it 'classifies based on plurality vote' do
      element = ['A', 1, 2]
      knn_1 = stub(KNN)
      knn_1.should_receive(:classify).with(element).and_return('A')
      
      knn_2 = stub(KNN)
      knn_2.should_receive(:classify).with(element).and_return('B')

      knn_3 = stub(KNN)
      knn_3.should_receive(:classify).with(element).and_return('B')

      ensemble = Ensemble.new([knn_1, knn_2, knn_3])
      
      expect(ensemble.classify(element)).to eq('B')
    end

    describe 'when classifying projections' do
      it 'raises an error when the projections size differ from the classifiers' do
        ensemble = Ensemble.new([stub(KNN)])
        expect {
          ensemble.classify_projections([[1, 2], [2, 3]])
        }.to raise_error(ArgumentError)
      end

      it 'passes each projection to a classifier in order' do
        element_1 = ['A', 1, 2]
        element_2 = ['B', 3, 2]
        element_3 = ['B', 3, 3]

        knn_1 = stub('KNN 1')
        knn_1.should_receive(:classify).with(element_1).and_return('A')
        
        knn_2 = stub('KNN 2')
        knn_2.should_receive(:classify).with(element_2).and_return('B')

        knn_3 = stub('KNN 3')
        knn_3.should_receive(:classify).with(element_3).and_return('B')

        ensemble = Ensemble.new([knn_1, knn_2, knn_3])
        
        expect(ensemble.classify_projections([element_1, element_2, element_3])).to eq('B')
      end
    end
  end
end
