<div align=center>
<h1>Toru</h1>
<p>A simple API for generating customizable embeds of last.fm activity</p>
</div>

## Demo 🚧
[![Currently listening](https://toru.kio.dev/api/v1/kiosion/?theme=dark)](https://last.fm/user/kiosion)&nbsp;&nbsp; [![Currently listening](https://toru.kio.dev/api/v1/kiosion/?theme=light)](https://last.fm/user/kiosion)

## Usage 🔧
Simply add the following snippet to your Github profile readme (or anywhere else you'd like to embed your last.fm activity):
```
[![Last.fm Activity](https://toru.kio.dev/api/v1/<your_lfm_username>/)](https://last.fm/user/<your_lfm_username>)
```

## Options ⚙️
Toru has a few parameters you can customize through URL query strings:

#### Theme
The theme can be specified using `?theme=<theme:string>`. Available themes are:
- dark/light (both shown above)
- shoji
- dracula
- nord
- solarized

#### Border radius
The border radius of the embed can be specified using `?borderRadius=<radius:int>`

#### Cover radius
The border radius of the album art can be specified using `?coverRadius=<radius:int>`

#### Response type
There are three response types: 'cover' for the cover art resource, 'json' for the raw JSON response, or 'embed' / unspecified for the embed (default). These can be specified using `?res=<type:string>`

## Building 🔨

- `npm i` to install all dependancies and dev tools
- Create an .env file in the root directory, and provide a last.fm API key + secret
- Then:
	- `npm run dev` if building for development
	- `npm run build`, then `npm run serve` if building for production. JS files are stored in ./dist

## Contribute ✍️
If you're knowledgeable with Node.js, Express.js, Typescript, or working on similar projects, feel free to contribute!
