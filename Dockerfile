FROM golang:1.21-alpine AS go
ARG TARGETOS TARGETARCH
ENV CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH

WORKDIR /usr/src/app
COPY server/ .
RUN go build -trimpath -ldflags="-s -w" -o /out/ace_away ./...

FROM node:12-buster as node
WORKDIR /home/node/app
COPY . .
RUN npm install && npm run lint && npm run build

FROM alpine:latest

COPY --from=go /out/ace_away /
COPY --from=node /home/node/app/dist /dist

CMD ["/ace_away", "-path", "/dist"]
