module Esperanto
  module Morfemiko
    class Radiko < Bazo
      key :radiko, String, :index => true, :unique => true
      key :afikso, Boolean
      key :prefikso, Boolean
      key :sufikso, Boolean
    end
  end
end
