# furimaのER図

## users テーブル

| Column          | Type        | 0ptions                   |
| --------------- | ----------- | ------------------------- |
| email           | string      | null: false, unique: true |
| password        | string      | null: false               |
| nickname        | string      | null: false               |
| last_name       | string      | null: false               |
| first_name      | string      | null: false               |
| last_name_kana  | string      | null: false               |
| first_name_kana | string      | null: false               |
| birthday        | datetime    | null: false               |

### Association

-has_many :itemss
-has_many :records


## items テーブル

 Column               | Type        | 0ptions                       |
| ------------------- | ----------- | ----------------------------- |
| name                | string      | null: false                   |
| info                | text        | null: false                   |
| category            | text        | null: false                   |
| sales_status        | text        | null: false                   |
| shipping_fee_status | text        | null: false                   |
| prefecture          | text        | null: false                   |
| price               | integer     | null: false                   |
| user                | references  | null: false, foreign_key:true |


### Association

-has_one_attached :image
-has_one :records
-belongs_to :user


## addresses

 Column       | Type        | 0ptions          |
| --------    | ----------- | ---------------- |
| postal_code | integer     | null: false      |
| prefecture  | text        | null: false      |
| city        | text        | null: false      |
| addresses   | text        | null: false      |
| phone_number| integer     | null: false      |

### Association

-has_one :record

## records

 Column     | Type        b| 0ptions                      |
| --------- | ----------- | ----------------------------- |
| date      | date        | null: false                   |
| user      | references  | null: false, foreign_key:true |
| item      | references  | null: false, foreign_key:true |
| address   | references  | null: false, foreign_key:true |

### Association

-belongs_to :item
-belongs_to :user
-belongs_to :address