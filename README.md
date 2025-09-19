# Ace Away!

"Ace" is a card game that I play with my friends every now and then. It's somewhat popular in India, but there are [very few references](https://boardgames.stackexchange.com/q/7902/) addressing this game. This is a hobby project which implements that game as a web app using Go and Vue.

[Live demo](https://ace.waffles.space).

### Usage

> **NOTE:** This requires `npm == 12.11` (haven't migrated Vue yet) and `go ^1.21`.

```
make prepare
make serve
```

- Visit `localhost:3000` in your browser.
- Create a room with some set number of players.
- Your friends can now join that room (as long as they're part of the same network).
- The game will begin once the room has enough players.
