# NestJS Multientorno con Jenkins y Docker 🐳

Este proyecto demuestra cómo desplegar una aplicación NestJS utilizando Jenkins y Docker en un escenario multirama = multientorno.

## 🌐 Entornos por rama

| Rama       | Puerto | Entorno      |
|------------|--------|--------------|
| `develop`  | 5001   | Desarrollo   |
| `staging`  | 5002   | Pre-Producción |
| `master`   | 5000   | Producción   |

---

## 🚀 ¿Qué hace este proyecto?

✅ Construye automáticamente una imagen Docker según la rama  
✅ Despliega un contenedor en el puerto correspondiente  
✅ Devuelve el entorno actual desde el endpoint `/`

---

## 🧰 Tecnologías

- NestJS 10
- Docker
- Jenkins (con Webhook y Pipeline)
- Node.js 18

---

## ⚙️ Scripts

```bash
npm install         # Instala dependencias
npm run build       # Compila la app
npm run start       # Ejecuta en producción (dist)

##Prueba de cambio en develop