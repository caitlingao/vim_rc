```
FROM rust:latest as cargo-build

WORKDIR /usr/src/myapp

COPY Cargo.toml Cargo.toml

RUN mkdir src/

RUN echo "fn main() {println!(\"if you see this, the build broke\")}" > src/main.rs

RUN cargo build --release

RUN rm -f target/release/deps/myapp*

COPY . .

RUN cargo build --release

RUN cargo install --path .

CMD ["myapp"]
```
