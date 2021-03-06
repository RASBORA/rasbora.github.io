module Jekyll
  class MarkdownConverter
    alias :old_convert :convert
  
    def convert(content)
      content.gsub!(/(?:^|\n)```(\w*)\n(.*?\n)```\n/m) do |text|
        cls = $1.empty? ? "prettyprint" : "prettyprint lang-#{$1}"
        "\n<pre class=\"#{cls}\"><code>#{CGI.escapeHTML($2)}</code></pre>"
      end
      old_convert(content)
    end
  end
end
