module Jekyll
  module RatingStars
    class RatingStarsTag < Liquid::Tag
      def initialize(tag_name, rating, tokens)
        super
        @rating = rating.strip.to_f
      end

      def render(context)
        full_stars = @rating.floor
        half_stars = (@rating - full_stars).round(1) == 0.5 ? 1 : 0
        empty_stars = 5 - full_stars - half_stars

        stars_html = ""

        full_stars.times { |i| stars_html += "<span class='rating-star rating-star-full star-#{i+1}' style='color:#ffac2d'>&#9733;</span>" }
        half_stars.times { |i| stars_html += "<span class='rating-star rating-star-half star-#{full_stars+i+1}' style='color:#ffac2d'>&#9734;&#xFE0E;</span>" }
        empty_stars.times { |i| stars_html += "<span class='rating-star rating-star-empty star-#{full_stars+half_stars+i+1}'>&#9734;</span>" }

        "<span class='rating-stars' style='font-size:large'>#{stars_html}</span>"
      end
    end
  end
end

Liquid::Template.register_tag('rating', Jekyll::RatingStars::RatingStarsTag)
