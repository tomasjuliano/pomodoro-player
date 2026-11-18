# Foco y Música

Pomodoro timer con bloques configurables (minutos de foco y de descanso por bloque), reproductor de YouTube / Spotify integrado que sigue al timer, y alarma al terminar cada fase.

## Cómo usarla

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

Dirección "Campo de color": toda la pantalla toma el color de la fase (rojo en foco, verde en descanso, apagado en pausa) para leer el estado de reojo. Tokens y reglas en [DESIGN.md](DESIGN.md).

El repo incluye dos skills de Claude Code en `.claude/skills/`: `frontend-design` (de [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official)) e `impeccable` (de [pbakaus/impeccable](https://github.com/pbakaus/impeccable), Apache 2.0).

## Limitaciones

- Spotify: desde la app solo se controla play/pausa; cambiar de tema se hace en el reproductor. Para temas completos (no previews de 30 s) hay que tener sesión iniciada en open.spotify.com en el mismo navegador.
- Algunos videos de YouTube no permiten reproducirse embebidos; la playlist salta al siguiente.
