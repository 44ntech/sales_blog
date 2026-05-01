# Sales Catalog

A fast Hugo static site for selling a large group of items without maintaining individual marketplace listings.

## Run Locally

```sh
docker compose up --build
```

Open <http://localhost:1313>.

The Compose service mounts this repository into `/site`, so edits on your machine are reflected in the running Hugo server.

## Run As Nginx Containers

Build the static Hugo site into two independent Nginx containers behind a small Nginx edge container:

```sh
docker compose -f docker-compose.nginx.yml up --build
```

Open <http://localhost:8080>.

In this mode, `web1` and `web2` each contain their own copy of the generated `public/` files. Rebuild the image after content changes:

```sh
docker compose -f docker-compose.nginx.yml up --build
```

For a single Nginx container image:

```sh
docker build -f Dockerfile.nginx -t sales-catalog-nginx .
docker run --rm -p 8080:80 sales-catalog-nginx
```

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
