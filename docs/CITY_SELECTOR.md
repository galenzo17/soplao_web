# City Selector System

Este documento explica cómo funciona el sistema de selector de ciudades para alternar entre Santiago y Pucón.

## Componentes

### CitySelector.astro
Componente principal que renderiza el selector de ciudades en el header. Incluye:
- Botones de alternar entre Santiago y Pucón
- Persistencia en localStorage
- Integración con el store centralizado
- Diseño responsive

### cityStore.ts
Store centralizado que maneja:
- Estado actual de la ciudad seleccionada
- Persistencia en localStorage
- Notificaciones a componentes suscritos
- Eventos personalizados para componentes legacy

### CityAwareContent.astro
Componente de ejemplo que muestra cómo crear contenido que cambia según la ciudad seleccionada.

## Uso

### En componentes Astro con store:
```typescript
import { cityStore, type City, getCityDisplayName } from '../stores/cityStore.js';

// Obtener ciudad actual
const currentCity = cityStore.getCurrentCity();

// Suscribirse a cambios
const unsubscribe = cityStore.subscribe((city: City) => {
  console.log('Ciudad cambiada a:', city);
});

// Cambiar ciudad programáticamente
cityStore.setCity('pucon');
```

### En componentes que no usan el store:
```javascript
// Escuchar evento personalizado
document.addEventListener('citychange', (e) => {
  const city = e.detail.city;
  console.log('Nueva ciudad:', city);
});
```

### En páginas Astro:
```astro
---
import { getCurrentCity, getCityDisplayName } from '../stores/cityStore.js';

// Nota: Esto solo funciona en el servidor, para contenido dinámico usar componentes con script
const serverCity = 'santiago'; // Valor por defecto en servidor
---

<div class="city-content" data-city="santiago">
  Contenido para Santiago
</div>
<div class="city-content hidden" data-city="pucon">
  Contenido para Pucón
</div>

<script>
  import { cityStore } from '../stores/cityStore.js';
  
  cityStore.subscribe((city) => {
    // Actualizar contenido dinámicamente
    document.querySelectorAll('.city-content').forEach(content => {
      content.classList.toggle('hidden', content.dataset.city !== city);
    });
  });
</script>
```

## Estructura de datos

```typescript
type City = 'santiago' | 'pucon';

interface CityData {
  name: string;
  displayName: string;
}

const CITIES = {
  santiago: {
    name: 'santiago',
    displayName: 'Santiago'
  },
  pucon: {
    name: 'pucon',
    displayName: 'Pucón'
  }
};
```

## Funcionalidades

1. **Persistencia**: La selección se guarda en localStorage
2. **Sincronización**: Cambios se sincronizan entre pestañas del navegador
3. **Eventos**: Se disparan eventos personalizados para componentes legacy
4. **TypeScript**: Full type safety con tipos exportados
5. **SSR Compatible**: Funciona con renderizado del servidor de Astro

## Implementación en el Header

El selector aparece:
- En desktop: Al lado del logo
- En mobile: Dentro del menú desplegable

## Próximos pasos

1. Implementar precios diferenciados por ciudad
2. Crear páginas específicas por ciudad
3. Agregar contenido geolocalizado
4. Implementar servicios específicos por ciudad