# furimaのER図

## users テーブル

| Column             | Type        | 0ptions                   |
| ------------------ | ----------- | ------------------------- |
| email              | string      | null: false, unique: true |
| encrypted_password | string      | null: false               |
| nickname           | string      | null: false               |
| last_name          | string      | null: false               |
| first_name         | string      | null: false               |
| last_name_kana     | string      | null: false               |
| first_name_kana    | string      | null: false               |
| birthday           | date        | null: false               |

### Association

-has_many :items
-has_many :records


## items テーブル

| Column                 | Type        | 0ptions                       |
| ---------------------- | ----------- | ----------------------------- |
| name                   | string      | null: false                   |
| info                   | text        | null: false                   |
| category_id            | integer     | null: false                   |
| sales_status_id        | integer     | null: false                   |
| shipping_fee_status_id | integer     | null: false                   |
| prefecture_id          | integer     | null: false                   |
| scheduled_delivery_id  | integer     | null: false                   |
| price                  | integer     | null: false                   |
| user                   | references  | null: false, foreign_key:true |


### Association

-has_one :record
-belongs_to :user


## addresses

|Column         | Type        | 0ptions                       |
| ------------- | ----------- | ----------------------------- |
| postal_code   | string      | null: false                   |
| prefecture_id | integer     | null: false                   |
| city          | string      | null: false                   |
| addresses     | string      | null: false                   |
| building_name | string      |                               |
| phone_number  | string      | null: false                   |
| record        | references  | null: false, foreign_key:true |

### Association

-belongs_to :record

## records

|Column     | Type        | 0ptions                       |
| --------- | ----------- | ----------------------------- |
| user      | references  | null: false, foreign_key:true |
| item      | references  | null: false, foreign_key:true |

### Association

-belongs_to :item
-belongs_to :user
-has_one :address