class User < ActiveRecord::Base
  has_many :user_lists
  has_many :lists, through: :user_lists
  has_many :items, through: :lists

  def slug
    self.name.slugify
  end

  def self.find_by_slug(slug_name)
    @users = self.all
    @user = @users.find {|user| user.slug == slug_name}
  end

end
