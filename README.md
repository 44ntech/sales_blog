# Sales Catalog

A fast Hugo static site for selling a large group of items without maintaining individual marketplace listings.

## Run Locally

```sh
docker compose up --build
```

Open <http://localhost:1313>.

The Compose service mounts this repository into `/site`, so edits on your machine are reflected in the running Hugo server.

## Add Or Update Items

Create one Markdown file per item in `content/items/`.

```toml
+++
title = "Item Name"
date = "2026-04-30"
price = 125
category = "Furniture"
condition = "Good"
status = "available"
image = "/uploads/item-photo.jpg"
dimensions = "48 x 20 x 30 in"
+++

Short, useful description for buyers.
```

Put photos in `static/uploads/` and reference them as `/uploads/photo-name.jpg`.

Use `status = "sold"` to keep an item visible but marked sold. Delete the file if you want it removed completely.

## Build Static Files

```sh
docker compose run --rm site hugo
```

The generated site will be in `public/`.
