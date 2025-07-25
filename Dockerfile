FROM golang:1.21-alpine as go
ENV GOOS=linux
ENV CGO_ENABLED=0
ADD server /usr/src/app
WORKDIR /usr/src/app
RUN go build -a -installsuffix cgo

FROM node:12.11-buster as node
ADD . /home/node/app
WORKDIR /home/node/app
RUN npm install && npm run lint && npm run build

FROM alpine:3.9

COPY --from=go /usr/src/app/ace_away /
COPY --from=node /home/node/app/dist /dist

CMD ["/ace_away", "-path", "/dist"]
