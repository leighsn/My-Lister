class List < ActiveRecord::Base
  has_many :items
  has_many :user_lists
  has_many :users, through: :user_lists

  def slug
    self.name ? self.name.slugify : ""
  end

  def self.find_by_slug(slug_name)
    @lists = self.all
    @list = @lists.find {|list| list.slug == slug_name}
  end

end
