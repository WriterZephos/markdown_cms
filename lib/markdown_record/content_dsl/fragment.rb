module MarkdownRecord
  module ContentDsl
    module Fragment
      REGEX = /<!--\s*fragment\s+({[\s|"|'|\\|\w|:|,|.|\[|\]|\{|\}]*})\s*-->/
      ENCODED_REGEX = /&lt;!--\s*fragment\s+({[\s|"|'|\\|\w|:|,|.|\[|\]|\{|\}|;|&]*})\s*--&gt;/

      def fragment_dsl(text)
        match = text.match(REGEX)

        if match
          JSON.parse(match[1])
        else
          nil
        end
      end

      def self.remove_dsl(text)
        text.gsub(ENCODED_REGEX, "\n")
      end
    end
  end
end