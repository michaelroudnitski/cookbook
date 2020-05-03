module RecipesHelper
  def minutes_with_clock(minutes)
    minutes = minutes.to_s
    "#{fa_icon "clock-o"}#{minutes}m".html_safe
  end
end
