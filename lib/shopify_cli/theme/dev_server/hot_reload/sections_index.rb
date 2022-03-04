# frozen_string_literal: true

module ShopifyCLI
  module Theme
    module DevServer
      class HotReload
        class SectionsIndex
          def initialize(theme)
            @theme = theme
          end

          def section_names_by_type
            index = {}

            files.each do |file|
              section_hash(file).each do |key, value|
                name = key
                type = value&.dig("type")

                next if !name || !type

                index[type] = [] unless index[type]
                index[type] << name
              end
            end

            index
          end

          private

          def section_hashes
          end

          def section_hash(file)
            content = JSON.parse(file.read)
            return [] if content.is_a?(Array)

            sections = content["sections"]
            return [] if sections.nil?

            sections
          rescue JSON::JSONError
            []
          end

          def files
            @theme.json_files
          end
        end
      end
    end
  end
end
