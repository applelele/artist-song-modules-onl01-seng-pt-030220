module Findable
  def self.find_by_name(name)
    self.all.detect {|each| each.name == name}
  end
end
