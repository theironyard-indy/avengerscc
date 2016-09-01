class Avenger < ActiveRecord::Base
  has_many :monikers
  has_many :aliases, through: :monikers

  validates_presence_of :name
  validates_uniqueness_of :name

  paginates_per 24

  def alias_list
    aliases.map(&:name)
  end

  def alias_list=(comma_separated_aliases)
    these_aliases = comma_separated_aliases.split(",").map(&:strip).map do |a|
      Alias.find_or_initialize_by(name: a)
    end
    aliases.replace(these_aliases)
  end
end
