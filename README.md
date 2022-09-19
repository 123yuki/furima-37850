# テーブル設計

## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false               |
| encrypted_password | string              | null: false               |
| family_name        | string              | null: false               |
| first_name         | string              | null: false               |
| family_name_kana   | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_day          | date                | null: false               |

### Association
* has_many :item
* belongs_to :order

### items table
| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | string              | null: false                     |
| price              | integer             | null: false                     |
| description        | string              |                                 |
| category           | integer             | null; false                     |
| status             | text                | null: false                     |
| shipping_cost      | string              | null: false                     |
| prefecture         | string              | null: false                     |
| shipping_days      | string              | null: false                     |
| user               | integer             | null: false, foreign_key: true  |

## Association
- belongs_to :item
- has_one :purchase

### orders table
| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| user               | integer             | null: false, foreign_key: true  |
| family_name        | string              | null: false                     |
| first_name         | string              | null: false                     |
| family_name_kana   | string              | null: false                     |
| first_name_kane    | string              | null: false                     |
| post_code          | string              | null: false                     |
| prefecture         | string              | null: false                     |
| city               | string              | null: false                     |
| address            | string              | null: false                     |
| building_name      | string              |                                 |
| phone_number       | string              |                                 |

### Association
- belongs_to :user

## addresses table
| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| post_code          | string              | null: false                     |
| prefecture         | string              | null: false                     |
| city               | string              | null: false                     |
| address            | string              | null: false                     |
| building_name      | string              |                                 |
| phone_number       | string              |                                 |
| purchase           | references          | null: false, foreign_key: true  |

### Association
- belongs_to :user