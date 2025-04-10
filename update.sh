#!/bin/bash

# Función para manejar sed en diferentes sistemas operativos
sedCmd() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' "$@"
  else
    sed -i "$@"
  fi
}

# Crear directorios si no existen
mkdir -p backup
mkdir -p public/images

# Hacer backup de archivos originales
cp src/pages/index.astro backup/index.astro.bak
cp src/components/Header.astro backup/Header.astro.bak

# Mover index.astro actual a servicios.astro
cp src/pages/index.astro src/pages/servicios.astro
sedCmd 's/<Layout title="soplao.cl - Servicios de Limpieza Profesional">/<Layout title="soplao.cl - Nuestros Servicios">/' src/pages/servicios.astro

# Modificar el componente Header para incluir el nuevo link a servicios
sedCmd 's/const navLinks = \[/const navLinks = \[\n  { href: "\/servicios", text: "SERVICIOS" },/' src/components/Header.astro

# Crear el nuevo index.astro
cat > src/pages/index.astro << 'EOL'
---
import Layout from '../layouts/Layout.astro';
import "../styles/global.css";
---

<Layout title="soplao.cl - Servicios de Limpieza Profesional">
  <section class="relative min-h-screen flex items-center">
    <div class="absolute inset-0 overflow-hidden z-0">
      <div class="absolute inset-0 bg-gradient-to-b from-brand-dark to-black opacity-70 z-10"></div>
      <div class="absolute inset-0 z-0 bg-cover bg-center" style="background-image: url('/images/hero-bg.jpg');"></div>
    </div>
    
    <div class="container mx-auto px-4 z-20 text-center text-white">
      <h1 class="text-4xl md:text-6xl font-bold mb-6 opacity-0 hero-element" id="hero-title">
        LIMPIEZA PROFESIONAL
      </h1>
      <p class="text-xl md:text-2xl max-w-3xl mx-auto mb-8 opacity-0 hero-element" id="hero-subtitle">
        Transformamos espacios a través de la limpieza de calidad, con productos ecológicos y tecnología de punta.
      </p>
      <div class="flex flex-col sm:flex-row justify-center gap-4 opacity-0 hero-element" id="hero-buttons">
        <a href="/servicios" class="bg-brand text-white font-semibold px-8 py-3 rounded-md hover:bg-brand-light transition-colors duration-300">
          Ver Servicios
        </a>
        <a href="/contacto" class="bg-transparent text-white border-2 border-white font-semibold px-8 py-3 rounded-md hover:bg-white hover:text-brand transition-colors duration-300">
          Solicitar Cotización
        </a>
      </div>
    </div>
  </section>

  <section class="py-20 bg-white">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl font-bold text-center mb-16" data-aos="fade-up">
        ¿POR QUÉ ELEGIRNOS?
      </h2>
      
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
        <div class="bg-white p-6 rounded-lg shadow-md transition-transform duration-300 hover:-translate-y-2" data-aos="fade-up" data-aos-delay="100">
          <div class="text-brand mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold mb-3">Experiencia Profesional</h3>
          <p class="text-gray-600">
            Equipo capacitado con años de experiencia en servicios de limpieza especializados.
          </p>
        </div>
        
        <div class="bg-white p-6 rounded-lg shadow-md transition-transform duration-300 hover:-translate-y-2" data-aos="fade-up" data-aos-delay="200">
          <div class="text-brand mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold mb-3">Productos Ecológicos</h3>
          <p class="text-gray-600">
            Limpiamos con productos biodegradables que cuidan el medio ambiente y tu salud.
          </p>
        </div>
        
        <div class="bg-white p-6 rounded-lg shadow-md transition-transform duration-300 hover:-translate-y-2" data-aos="fade-up" data-aos-delay="300">
          <div class="text-brand mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold mb-3">Tecnología Avanzada</h3>
          <p class="text-gray-600">
            Utilizamos equipos de última generación para resultados excepcionales.
          </p>
        </div>
        
        <div class="bg-white p-6 rounded-lg shadow-md transition-transform duration-300 hover:-translate-y-2" data-aos="fade-up" data-aos-delay="400">
          <div class="text-brand mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h3 class="text-xl font-semibold mb-3">Resultados Garantizados</h3>
          <p class="text-gray-600">
            Satisfacción garantizada o devolvemos tu dinero. Nuestro compromiso con la calidad.
          </p>
        </div>
      </div>
    </div>
  </section>
  
  <section class="py-20 relative bg-parallax" id="parallax-section">
    <div class="absolute inset-0 bg-gradient-to-b from-brand to-brand-dark opacity-90 z-10"></div>
    <div class="container mx-auto px-4 relative z-20">
      <h2 class="text-3xl font-bold text-center text-white mb-16" data-aos="fade-up">
        SERVICIOS DESTACADOS
      </h2>
      
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="bg-white p-6 rounded-lg text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2" data-aos="flip-left" data-aos-delay="100">
          <h3 class="text-xl font-semibold mb-4">Limpieza de Hogar</h3>
          <p class="mb-6">
            Mantén tu espacio impecable con nuestro servicio profesional de limpieza residencial.
          </p>
          <a href="/servicios" class="text-brand font-medium inline-flex items-center service-link">
            Ver más <span class="ml-2 transition-transform duration-300">→</span>
          </a>
        </div>
        
        <div class="bg-white p-6 rounded-lg text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2" data-aos="flip-left" data-aos-delay="200">
          <h3 class="text-xl font-semibold mb-4">Limpieza Profunda</h3>
          <p class="mb-6">
            Servicio intensivo que elimina la suciedad acumulada en los rincones más difíciles.
          </p>
          <a href="/servicios" class="text-brand font-medium inline-flex items-center service-link">
            Ver más <span class="ml-2 transition-transform duration-300">→</span>
          </a>
        </div>
        
        <div class="bg-white p-6 rounded-lg text-center transition-all duration-300 hover:shadow-xl hover:-translate-y-2" data-aos="flip-left" data-aos-delay="300">
          <h3 class="text-xl font-semibold mb-4">Servicios Especializados</h3>
          <p class="mb-6">
            Soluciones específicas para alfombras, tapizados, colchones y más.
          </p>
          <a href="/servicios" class="text-brand font-medium inline-flex items-center service-link">
            Ver más <span class="ml-2 transition-transform duration-300">→</span>
          </a>
        </div>
      </div>
    </div>
  </section>
  
  <section class="py-20 bg-gray-100">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl font-bold text-center mb-16" data-aos="fade-up">
        LO QUE DICEN NUESTROS CLIENTES
      </h2>
      
      <div class="relative overflow-hidden" id="testimonials-slider">
        <div class="flex transition-transform duration-500" id="testimonials-track">
          <div class="testimonial-slide min-w-full px-4">
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center mb-4">
                <div class="text-yellow-500 flex">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                </div>
              </div>
              <p class="text-gray-600 mb-4">"El servicio de limpieza fue excelente. Mi departamento quedó impecable y el equipo fue muy profesional y eficiente. Sin duda los recomendaré a mis amigos."</p>
              <div class="font-medium">Carolina Méndez</div>
            </div>
          </div>
          <div class="testimonial-slide min-w-full px-4">
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center mb-4">
                <div class="text-yellow-500 flex">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                </div>
              </div>
              <p class="text-gray-600 mb-4">"La limpieza de fin de arriendo superó mis expectativas. Mi antiguo departamento quedó como nuevo y recuperé el 100% de mi garantía. Muy recomendable."</p>
              <div class="font-medium">Alejandro Torres</div>
            </div>
          </div>
          <div class="testimonial-slide min-w-full px-4">
            <div class="bg-white p-6 rounded-lg shadow-md">
              <div class="flex items-center mb-4">
                <div class="text-yellow-500 flex">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                </div>
              </div>
              <p class="text-gray-600 mb-4">"Contraté la limpieza de alfombras y quedaron como nuevas. El equipo fue puntual, profesional y dejó todo impecable. Definitivamente volveré a contratar sus servicios."</p>
              <div class="font-medium">Marcela Rojas</div>
            </div>
          </div>
        </div>
        
        <div class="flex justify-center mt-8 space-x-2">
          <button class="w-3 h-3 rounded-full bg-brand focus:outline-none slider-dot active" data-index="0"></button>
          <button class="w-3 h-3 rounded-full bg-gray-300 focus:outline-none slider-dot" data-index="1"></button>
          <button class="w-3 h-3 rounded-full bg-gray-300 focus:outline-none slider-dot" data-index="2"></button>
        </div>
      </div>
    </div>
  </section>
  
  <section class="py-20 bg-brand text-white text-center">
    <div class="container mx-auto px-4">
      <h2 class="text-3xl font-bold mb-6" data-aos="fade-up">
        ¿LISTO PARA TRANSFORMAR TU ESPACIO?
      </h2>
      <p class="text-xl max-w-3xl mx-auto mb-8" data-aos="fade-up" data-aos-delay="100">
        Contáctanos hoy mismo y descubre la diferencia de un servicio de limpieza profesional.
      </p>
      <a 
        href="/contacto" 
        class="inline-block bg-white text-brand font-semibold px-8 py-3 rounded-md hover:bg-gray-100 transition-colors"
        data-aos="zoom-in"
        data-aos-delay="200"
      >
        Solicitar Cotización
      </a>
    </div>
  </section>
</Layout>

<style>
  .hero-element {
    transform: translateY(20px);
    transition: opacity 0.5s ease, transform 0.5s ease;
  }
  
  .hero-element.animate-hero {
    opacity: 1;
    transform: translateY(0);
  }
  
  .service-link:hover span {
    transform: translateX(5px);
  }
  
  .bg-parallax {
    background-image: url('/images/parallax-bg.jpg');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
  }
  
  .slider-dot.active {
    background-color: #0facaf;
    width: 12px;
    transition: all 0.3s ease;
  }
  
  @media (max-width: 768px) {
    .bg-parallax {
      background-attachment: scroll;
    }
  }
</style>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const heroElements = document.querySelectorAll('.hero-element');
    setTimeout(() => {
      for (const [index, el] of heroElements.entries()) {
        setTimeout(() => {
          el.classList.add('animate-hero');
        }, index * 300);
      }
    }, 500);
    
    const parallaxSection = document.getElementById('parallax-section');
    if (parallaxSection && window.innerWidth > 768) {
      window.addEventListener('scroll', function() {
        const scrollY = window.scrollY;
        const sectionTop = parallaxSection.offsetTop;
        const speed = 0.3;
        
        if (scrollY > sectionTop - window.innerHeight && scrollY < sectionTop + parallaxSection.offsetHeight) {
          const yPos = -(scrollY - sectionTop) * speed;
          parallaxSection.style.backgroundPosition = `center ${yPos}px`;
        }
      });
    }
    
    const testimonialTrack = document.getElementById('testimonials-track');
    const dots = document.querySelectorAll('.slider-dot');
    if (testimonialTrack && dots) {
      dots.forEach(dot => {
        dot.addEventListener('click', () => {
          const index = parseInt(dot.getAttribute('data-index'));
          testimonialTrack.style.transform = `translateX(-${index * 100}%)`;
          
          dots.forEach(d => d.classList.remove('active'));
          dot.classList.add('active');
        });
      });
      
      let currentSlide = 0;
      const totalSlides = dots.length;
      
      setInterval(() => {
        currentSlide = (currentSlide + 1) % totalSlides;
        testimonialTrack.style.transform = `translateX(-${currentSlide * 100}%)`;
        
        dots.forEach(d => d.classList.remove('active'));
        dots[currentSlide].classList.add('active');
      }, 5000);
    }
    
    const serviceLinks = document.querySelectorAll('.service-link');
    serviceLinks.forEach(link => {
      link.addEventListener('mouseenter', () => {
        const arrow = link.querySelector('span');
        arrow.style.transform = 'translateX(5px)';
      });
      
      link.addEventListener('mouseleave', () => {
        const arrow = link.querySelector('span');
        arrow.style.transform = 'translateX(0)';
      });
    });
  });
</script>
EOL

# Crear imágenes de muestra (debes reemplazar estas con tus propias imágenes)
echo "Para completar la instalación, necesitas agregar las siguientes imágenes en la carpeta public/images/:"
echo "- hero-bg.jpg: Una imagen para el fondo del hero (recomendado: imagen de limpieza de alta calidad)"
echo "- parallax-bg.jpg: Una imagen para el efecto parallax (recomendado: imagen relacionada con limpieza)"
echo ""
echo "Puedes instalar el script con estos comandos:"
echo "1. chmod +x modify-site.sh"
echo "2. ./modify-site.sh"