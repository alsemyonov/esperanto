module Esperanto
  module Morfologio
    class Vorto
      key :radiko_ids, Array
      many :radikos, :in => :radiko_ids

      def to_s
        radikos.sort do |some, another|
          radiko_ids.rindex(some) <=> radiko_ids.rindex(another)
        end.map do |radiko|
          radiko.to_s
        end
      end
    end
  end
end
