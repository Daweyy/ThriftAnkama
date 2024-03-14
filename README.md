# ThriftAnkama

This project is a mock server implementation to avoid the use of the Ankama Launcher for running specifics games.

Built using [Bun](https://bun.sh) ([NodeJS](https://nodejs.org) can be used too).

Place the `credentials.json` file in a compatible game directory (same `port` should be used as in `ThriftServer.js`).
*Can also be set with PORT env variable*

Install dependencies :

```bash
bun install
```

Run :

```bash
bun ThriftServer.js
```

**Optionnal:** To regenerate definition files

- [Download latest Thrift release](https://thrift.apache.org/download)
- Run

```bash
thrift.exe -r --gen js:node ZaapService.thrift
```