class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Pragmatic Version Control', 
    :description => 
      %{ <p>
This book is a recipe-based approach to using Subversion that will
get you up and running quickly---and correctly. ALl projects need 
version control: it's a foundational piece of any project's
infrastructure. Yet half of all project teams in the U.S. don't use
any version control at all. Many others don't use it well, and end
up experiencing time-consuming problems.
    </p> },
    :image_url => '/depot/images/git.jpg',
    :price => 28.50)
  end

  def self.down
    Product.delete_all
  end
end
