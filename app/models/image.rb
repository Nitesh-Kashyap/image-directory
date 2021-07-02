class Image < ApplicationRecord
	enum category: [:people, :tech, :entertainment]
	mount_uploader :avatar, AvatarUploader
end
