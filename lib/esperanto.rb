require 'active_support'

module Esperanto
  autoload :Morfemiko, 'esperanto/morfemiko'
  autoload :Morfologio, 'esperanto/morfologio'
  autoload :Gramatiko, 'esperanto/gramatiko'

  autoload :Adaptilo, 'esperanto/adaptilo'

  def self.adaptilo=(adaptilo)
    require "esperanto/adaptilo/#{adaptilo}"
  end
end

require 'esperanto/core_ext/string'
require 'esperanto/core_ext/symbol'

begin
  require 'esperanto_mongo_mapper'
  Esperanto.adaptilo = :mongo_mapper
rescue LoadError
  Esperanto.adaptilo = :abstrakta
end
