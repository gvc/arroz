class KNN
  
  attr_reader :data

  # The label attribute in the data array must be in the first position
  def initialize(data)
    @data = data
  end

  def nearest_neighbor(element)
    min_distance = 10_000_000
    nearest = nil

    @data.each do |datum|
      distance = distance(element, datum[1..-1])
      if distance < min_distance
        min_distance = distance
        nearest = datum
      end
    end

    nearest
  end

protected 

  def distance(e1, e2)
    raise NotImplementedError
  end
end
