# frozen_string_literal: true

guard(:erb_lint) do
  watch(/.+\.erb$/)
  watch(/.+\.html$/)
end

guard(:rubocop) do
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end
