require 'rspec'

require_relative '../lib/arroz'

RSpec.configure do |config|

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
