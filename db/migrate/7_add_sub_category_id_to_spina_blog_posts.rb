class AddSubCategoryIdToSpinaBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :spina_blog_posts, :sub_category, to_table: :spina_blog_categories
  end
end