module Paramable
  def to_param
    name.downcase.gsub(' ', '-') #.gsub replace ' ' with '-'
  end
end
