# README
The design of this database is subject to update.

# sample_matter_site

## companies tables
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|overview|text||
|image|string||
### associations
- has_many :recruitments
- has_many :users

## users tables
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|icon|string||
|profile|text||
|company_id|references|null: false, foreign_key: true|
### associations
- has_many :applications
- has_many :recruitments, through: :applications
- belongs_to :company

## applications tables
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|recruitment_id|rederences|null: false, foreign_key: true|
### associations
- belongs_to :user
- belongs_to :recruitment

## rcruitments tables
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null:false|
|company_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
### associations
- belongs_to :company
- belongs_to :category
- has_many :images, dependent: destroy
- has_many :applications
- has_many :users, through: :applications
- has_many :recruitments_tags
- has_many :tags, through: :recruitments_tags

## recruitments_tags tables
|Column|Type|Options|
|------|----|-------|
|recruitment_id|references|null: false, foreign_key: true|
|tag_id|references|null: false, foreign_key: true|
### associations
- belongs_to :recruitment
- belongs_to :tag

## tags tables
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### associations
- has_many :recruitments_tags
- has_many :recruitments, through: :recruitments_tags


## images tables
|Column|Type|Options|
|------|----|-------|
|name|string||
|recruitment_id|references|null: false, foreign_key: true|
### associations
- belongs_to :recruitment

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||
### associations
- has_many :recruitments
- has_ancestry