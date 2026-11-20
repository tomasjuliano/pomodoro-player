# Foco y Música

Pomodoro timer con bloques configurables (minutos de foco y de descanso por bloque), reproductor de YouTube / Spotify integrado que sigue al timer, y alarma al terminar cada fase.

## Descargar

**[Bajar Foco-y-Musica.exe](https://github.com/tomasjuliano/pomodoro-player/releases/latest/download/Foco-y-Musica.exe)** (Windows 10/11, ~2.6 MB, no se instala). Como no está firmado, Windows puede mostrar "Windows protegió su PC": **Más información → Ejecutar de todas formas**. Todas las versiones en [Releases](https://github.com/tomasjuliano/pomodoro-player/releases).

## App de escritorio (Windows)

Hecha con [Neutralinojs](https://neutralino.js.org/): un `.exe` de ~2.6 MB que usa WebView2 (el motor de Edge que ya trae Windows), sin empaquetar un Chromium propio como Electron. Sirve la interfaz desde `http://localhost:47615`, que es lo que necesita el reproductor de YouTube, y como el puerto es fijo la configuración y los favoritos se mantienen entre usos.

Requisitos para compilar: Node.js.

```powershell
npm install
npm run setup   # baja los binarios de Neutralino (v6.10.0) a bin/
npm run build   # genera dist/foco-y-musica/foco-y-musica-win_x64.exe
```

La ventana no usa el marco de Windows: tiene una barra de título propia del color de la fase (arrastrar, doble clic para maximizar, minimizar, maximizar y cerrar) y se redimensiona desde los bordes.

`npm run dev` abre la app sin compilar. El ejecutable queda en `dist/foco-y-musica/` y se puede copiar a cualquier carpeta: es un solo archivo con la app adentro.

## Cómo usarla en el navegador

Doble clic en `pomodoro/iniciar.bat`. Levanta un servidor local en `http://localhost:5173` y abre el navegador.

O desde una terminal:

```powershell
python -m http.server 5173 --bind 127.0.0.1 --directory pomodoro
```

> Hace falta servirla desde `localhost`: si abrís `index.html` como archivo, YouTube no deja reproducir.

## Funciones

- Plan de bloques editable, presets (4×25, 3×50, 2×90, 6×30) y generador rápido. Un descanso de 0 min se saltea.
- Timer con anillo de progreso, secuencia completa, tiempo restante y hora estimada de fin.
- Música de YouTube (playlist o video) o Spotify (playlist, álbum, tema). Arranca en foco y se pausa en descansos (configurable). Favoritos guardados.
- Alarma sintetizada (4 sonidos, volumen, repeticiones) y notificación del sistema opcional.
- Atajos: `Espacio` iniciar/pausar · `S` saltar fase · `M` música play/pausa.

La configuración se guarda en el `localStorage` del navegador.

## Diseño

Dirección "Tapa de disco": el timer es la tapa de un LP (azul y blanco en foco, mostaza y negro en descanso, apagada en pausa), con un vinilo que sale de la tapa y gira mientras corre el tiempo, y la sesión como lista de temas "Lado A". Tokens y reglas en [DESIGN.md](DESIGN.md).

El repo incluye dos skills de Claude Code en `.claude/skills/`: `frontend-design` (de [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official)) e `impeccable` (de [pbakaus/impeccable](https://github.com/pbakaus/impeccable), Apache 2.0).

## Limitaciones

- Spotify: desde la app solo se controla play/pausa; cambiar de tema se hace en el reproductor. Para temas completos (no previews de 30 s) hay que tener sesión iniciada en open.spotify.com en el mismo navegador.
- Algunos videos de YouTube no permiten reproducirse embebidos; la playlist salta al siguiente.
