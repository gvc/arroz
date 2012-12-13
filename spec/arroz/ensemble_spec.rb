require 'spec_helper'

module Arroz
  
  describe Ensemble do

    it 'classifies based on plurality vote' do
      knn_1 = stub(KNN)
      knn_1.should_receive(:classify).with(['A', 1, 2]).and_return('A')
      
      knn_2 = stub(KNN)
      knn_2.should_receive(:classify).with(['A', 1, 2]).and_return('B')

      knn_3 = stub(KNN)
      knn_3.should_receive(:classify).with(['A', 1, 2]).and_return('B')

      Ensemble.new([knn_1, knn_2, knn_3]).classify(['A', 1, 2]).should == 'B'
    end
  end
end
