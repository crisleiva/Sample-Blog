class Blogger < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Cameleon Login
  include CamaleonCms::UserMethods
  alias_attribute :last_login_at, :last_sign_in_at
  self.table_name = PluginRoutes.static_system_info["cama_users_db_table"] || "#{PluginRoutes.static_system_info["db_prefix"]}users"
  default_scope {order(role: :asc)}
  validates :username, :presence => true
  alias_attribute :last_login_at, :last_sign_in_at
end
