module Esperanto
  module Morfemiko
    class Finajxo
      cattr_accessor :defauxlto_finajxo

      def to_s
        self.class.defauxlto_finajxo
      end
    end
  end
end
