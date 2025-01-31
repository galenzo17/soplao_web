#!/bin/bash

# Crear estructura de directorios
mkdir -p src/{components,layouts,pages}
mkdir -p public/images

# Crear archivos de componentes
cat > src/components/ServiceCard.astro << 'EOF'
---
interface Props {
  title: string;
  description: string;
  prices: {
    label: string;
    price: string;
  }[];
  image: string;
  direction: 'left' | 'right';
}

const { title, description, prices, image, direction } = Astro.props;
---

<div
  class="w-full md:w-1/2 p-6"
  data-aos={direction === 'left' ? 'fade-right' : 'fade-left'}
  data-aos-duration="1000"
  data-aos-once="true"
>
  <div class="bg-white rounded-lg shadow-lg overflow-hidden">
    <img
      src={image}
      alt={title}
      class="w-full h-64 object-cover"
    />
    <div class="p-6">
      <h3 class="text-2xl font-bold mb-4">{title}</h3>
      <p class="text-gray-600 mb-6">{description}</p>
      
      <div class="space-y-2">
        {prices.map(item => (
          <div class="flex justify-between items-center">
            <span class="font-medium">{item.label}</span>
            <span class="text-yellow-500 font-bold">{item.price}</span>
          </div>
        ))}
      </div>
    </div>
  </div>
</div>
EOF

# Crear Layout principal
cat > src/layouts/Layout.astro << 'EOF'
---
import Header from '../components/Header.astro';

interface Props {
  title: string;
}

const { title } = Astro.props;
---

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <link rel="icon" type="image/svg+xml" href="/favicon.svg" />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <meta name="generator" content={Astro.generator} />
    <title>{title}</title>
  </head>
  <body>
    <Header />
    <main>
      <slot />
    </main>

    <script is:inline src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script is:inline>
      AOS.init({
        duration: 1000,
        once: true
      });
    </script>
  </body>
</html>
EOF

# Crear página principal
cat > src/pages/index.astro << 'EOF'
---
import Layout from '../layouts/Layout.astro';
import ServiceCard from '../components/ServiceCard.astro';

const services = [
  {
    title: "Limpieza Profesional de Colchón",
    description: "Limpieza, Desinfección y Sanitización Ultravioleta al 99,9%",
    image: "/images/colchon.jpg",
    prices: [
      { label: "1 Plaza", price: "$ 29.990" },
      { label: "1.5 Plaza", price: "$ 29.990" },
      { label: "2 Plazas", price: "$ 35.000" },
      { label: "King", price: "$ 39.990" },
      { label: "Super King", price: "$ 49.990" }
    ],
    direction: 'left'
  },
  {
    title: "Limpieza Alfombras Muro a Muro",
    description: "Limpieza, Desmanchado, Sanitización y Desinfección (Hasta 15m2 por Habitación)",
    image: "/images/alfombra.jpg",
    prices: [
      { label: "1 Habitación", price: "$ 35.000" },
      { label: "2 Habitaciones", price: "$ 55.000" },
      { label: "3 Habitaciones", price: "$ 75.000" },
      { label: "4 Habitaciones", price: "$ 95.000" }
    ],
    direction: 'right'
  }
] as const;
---

<Layout title="Cleanout.cl - Servicios de Limpieza Profesional">
  <section class="bg-gray-100 py-20">
    <div class="container mx-auto px-4">
      <h1 
        class="text-4xl font-bold text-center mb-16"
        data-aos="fade-down"
        data-aos-duration="1000"
      >
        SERVICIOS
      </h1>
      
      <div class="flex flex-wrap -mx-4">
        {services.map((service) => (
          <ServiceCard {...service} />
        ))}
      </div>

      <div 
        class="mt-8 text-center text-gray-600"
        data-aos="fade-up"
        data-aos-delay="500"
      >
        <p>
          Aceptamos todo medio de pago, transferencia, efectivo, tarjetas de crédito y
          débito. Puedes pagar en cuotas si tu banco tiene convenio, además te podemos
          entregar una factura en caso de que tengas alguna empresa que te podamos
          facturar. (Valores + IVA)
        </p>
      </div>
    </div>
  </section>
</Layout>
EOF

# Crear Header component
cat > src/components/Header.astro << 'EOF'
---
---
<header class="bg-white shadow-sm">
  <div class="container mx-auto px-4 py-6">
    <nav class="flex justify-between items-center">
      <div class="text-2xl font-bold">CLEAN<span class="text-yellow-500">OUT</span>.CL</div>
      <div class="flex space-x-6">
        <a href="#" class="hover:text-yellow-500">INICIO</a>
        <a href="#" class="text-yellow-500">SERVICIOS</a>
        <a href="#" class="hover:text-yellow-500">EQUIPAMIENTO</a>
        <a href="#" class="hover:text-yellow-500">LO QUE HACEMOS</a>
        <a href="#" class="hover:text-yellow-500">CONTACTO</a>
      </div>
    </nav>
  </div>
</header>
EOF

# Crear archivo de configuración de Tailwind
cat > tailwind.config.mjs << 'EOF'
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# Hacer el script ejecutable
chmod +x setup-project.sh

# Instalar dependencias
npm install -D tailwindcss @astrojs/tailwind
npm install aos

echo "Estructura del proyecto creada exitosamente!"
echo "Siguiente paso: Ejecuta 'npm run dev' para iniciar el servidor de desarrollo"
EOF