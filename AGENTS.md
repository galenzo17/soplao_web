# Directrices para agentes de IA

Este repositorio contiene el código de **soplao.cl**, un sitio estático construido con [Astro](https://astro.build/) y **Tailwind CSS**. A continuación se describen las particularidades y buenas prácticas para realizar modificaciones de manera segura.

## Estructura de carpetas

- `src/pages/` – Páginas principales en formato `.astro`. Cada archivo corresponde a una ruta del sitio.
- `src/components/` – Componentes reutilizables escritos en Astro.
- `src/layouts/` – Plantillas base que utilizan las páginas.
- `src/styles/` – Hojas de estilo. `global.css` aplica estilos globales y utiliza Tailwind.
- `public/` – Recursos estáticos (imágenes, íconos, etc.).
- `backup/` – Copias de seguridad de algunos archivos originales.
- `update.sh` – Script opcional para generar contenido y modificar páginas. No se ejecuta durante el build normal.

## Uso de dependencias

Este proyecto utiliza Node.js y requiere instalar dependencias antes de compilar. Para preparar el entorno:

```bash
npm install
```

El comando principal para verificar que todo funcione es:

```bash
npm run build
```

El build genera la carpeta `dist/` con el sitio estático. Ejecuta este comando tras realizar cambios significativos.

## Guía de desarrollo

- Sigue la organización existente de páginas y componentes. Los nombres de los componentes usan **PascalCase**.
- Al crear nuevas páginas públicas recuerda actualizar el componente `Header.astro` para incluir el enlace correspondiente.
- Se recomienda usar clases utilitarias de Tailwind en lugar de estilos en línea. Si es necesario añadir estilos globales, colócalos en `src/styles/global.css`.
- Mantén el archivo `prompt.txt` sin cambios: contiene fragmentos de código de referencia.
- Los íconos y otros recursos se encuentran en `public/`. Si añades imágenes nuevas, colócalas allí.

## Comprobaciones

Antes de enviar cambios, ejecuta:

```bash
npm run build
```

Si no dispones de las dependencias (por ejemplo en un entorno sin acceso a Internet) el comando puede fallar debido a la ausencia de `astro`. En tal caso menciona la limitación en el mensaje de pruebas.

