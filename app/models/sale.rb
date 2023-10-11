class Sale < ApplicationRecord

  def self.active
    where("sales.starts_on < ? AND sales.ends_on >=?",Date.current, Date.current)
  end
  def finished?
    self.ends_on < Date.current
  end
  def upcoming?
    self.starts_on > Date.current
  end
  def active?
    !finished? && !upcoming?
  end

end
