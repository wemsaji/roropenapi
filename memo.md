# OpenAPI から RoR の API を scaffolding

## 元ネタ

-   [https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35](https://qiita.com/yj_sakoda/items/922cda4c11967a0d3a35)

## 手順

-   `./openapi/compose.yml` を `docker compose up -d --build`
-   `./npm` で `generate`
-   (Initial commit.)

## めも

-   docker キャッシュクリアは`docker builder prune -f`
