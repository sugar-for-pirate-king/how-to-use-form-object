## Readme

Sebuah projek eksperiment untuk implementasi form object.

### Rencana
Form object digunakan ketika form anda tidak berelasi dengan sebuah table/model apapun. Begitu juga ketika form anda memiliki lebih dari satu table.

Maka, untuk mengimplementasikan form object ini saya akan membuat sebuah program input form sederhana dengan contoh form:

```
Menambahkan Organisasi baru
-----------------------------------
Nama Organisasi: <String>
Nama Anda: <String>
Email Anda: <String>
```

Dan tablenya adalah:
```
table_name: organizations
id: integer
name: string
user_id: integer
created_at: datetime
updated_at: datetime

table_name: users
id: integer
name: string
email: string
created_at: string
updated_at: string
```


### Usage

```bash
$> rails db:create
$> rails db:migrate
$> rails s # open url in /organizations/new
```

