# frozen_string_literal: true

module Guard
  class ErbLint < Plugin
    module Options
      DEFAULTS = { all_on_start: true, all_on_change: false }

      def self.with_defaults(options)
        DEFAULTS.each do |k, v|
          options[k] ||= v
        end

        options
      end
    end
  end
end
