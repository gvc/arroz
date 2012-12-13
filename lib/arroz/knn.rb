module Arroz
  class KNN
    
    attr_reader :data, :k

    # The label attribute in the data array must be in the first position
    def initialize(data, k=1)
      @data = data
      @k = k
    end

    ## Returns the predicted class of the element passed
    def classify(element)
      neighbors = nearest_neighbors(element)

      neighbor_classes = neighbors.map(&:last)
      classes = neighbor_classes.uniq

      classes.zip(classes.map { |c| neighbor_classes.count(c) }).
        sort_by(&:last).last.first
    end

  private 

    def nearest_neighbors(element)
      distances = []
      
      @data.each do |datum|
        distances << [distance(element, datum[1..-1]), datum.first]
      end

      distances.sort.take(k)
    end

    def distance(e1, e2)
      raise NotImplementedError
    end
  end
end
