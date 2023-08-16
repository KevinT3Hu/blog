module Jekyll
    class CenterImageTag < Liquid::Tag
      def initialize(tag_name, input, tokens)
        super
        @input = input
      end
  
      def render(context)
        "<div class='center'><img src='#{@input}' class='pic'></div>"
      end
    end
  end
  
  Liquid::Template.register_tag('centerimage', Jekyll::CenterImageTag)
  