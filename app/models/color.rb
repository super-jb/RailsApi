class Color < ApplicationRecord
  validates: name, :status, presence: true
end
