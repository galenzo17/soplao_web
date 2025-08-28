# City-Based Pricing System Migration Guide

Este documento explica cómo migrar del sistema de precios único al sistema de precios diferenciados por ciudad.

## Cambios en la estructura de datos

### Antes (Legacy)
```typescript
const service = {
  title: "Limpieza Convencional",
  description: "...",
  prices: [
    { label: "Hasta 50m²", price: "$ 62.000" },
    { label: "Hasta 100m²", price: "$ 85.000" }
  ]
};
```

### Después (City-based)
```typescript
const service = {
  title: "Limpieza Convencional",
  description: "...",
  prices: {
    santiago: [
      { label: "Hasta 50m²", price: "$ 62.000" },
      { label: "Hasta 100m²", price: "$ 85.000" }
    ],
    pucon: [
      { label: "Hasta 50m²", price: "$ 71.300" },
      { label: "Hasta 100m²", price: "$ 97.750" }
    ]
  }
};
```

## Nuevos tipos TypeScript

```typescript
// Estructura básica de precio
interface PriceItem {
  label: string;
  price: string;
}

// Precios por ciudad
interface CityPricing {
  santiago: PriceItem[];
  pucon: PriceItem[];
}

// Tipo unión para retrocompatibilidad
type ServicePrices = CityPricing | PriceItem[];
```

## Funciones utilitarias

### Verificación de tipo de precios
```typescript
import { isCityPricing, isLegacyPricing } from '../types/pricing.js';

if (isCityPricing(service.prices)) {
  // Es estructura nueva
  const santiagoprices = service.prices.santiago;
} else {
  // Es estructura legacy
  const prices = service.prices;
}
```

### Obtener precios para ciudad específica
```typescript
import { getPricesForCity } from '../types/pricing.js';

const currentPrices = getPricesForCity(service.prices, 'santiago');
```

### Crear estructura de precios por ciudad
```typescript
import { createCityPricing } from '../types/pricing.js';

const pricing = createCityPricing(
  [{ label: "Servicio", price: "$ 50.000" }], // Santiago
  [{ label: "Servicio", price: "$ 57.500" }]  // Pucón
);
```

## Configuración de precios por ciudad

### Datos centralizados
Los precios están centralizados en `src/data/cityPricing.ts`:

```typescript
export const mainServicesPricing = {
  conventional: createCityPricing(
    basePrices.conventional,
    applyPriceAdjustment(basePrices.conventional, cityAdjustments.pucon)
  )
};
```

### Ajustes por ciudad
```typescript
export const cityAdjustments = {
  santiago: {
    // Sin ajuste, precios base
  },
  pucon: {
    multiplier: 1.15, // 15% más caro
    // o precios personalizados:
    customPrices: [{ label: "Especial", price: "Cotizar + Traslado" }]
  }
};
```

## Componente ServiceCard actualizado

El componente ahora:
1. **Muestra indicador de ciudad** actual
2. **Cambia precios dinámicamente** según ciudad seleccionada
3. **Mantiene retrocompatibilidad** con precios legacy
4. **Se sincroniza automáticamente** con el cityStore

### Características del nuevo ServiceCard:
- Indicador visual de ciudad con ícono 📍
- Transiciones suaves entre precios
- Precios se actualizan instantáneamente al cambiar ciudad
- Compatible con estructura de datos antigua y nueva

## Migración paso a paso

### 1. Actualizar imports
```typescript
import type { ServicePrices } from '../types/pricing.js';
import { mainServicesPricing } from '../data/cityPricing.js';
```

### 2. Cambiar estructura de datos
```typescript
// Antes
const services = [
  {
    title: "Mi Servicio",
    prices: [{ label: "Base", price: "$ 50.000" }]
  }
];

// Después
const services: Service[] = [
  {
    title: "Mi Servicio", 
    prices: mainServicesPricing.myService
  }
];
```

### 3. Agregar configuración en cityPricing.ts
```typescript
export const mainServicesPricing = {
  myService: createCityPricing(
    [{ label: "Base", price: "$ 50.000" }], // Santiago
    [{ label: "Base", price: "$ 57.500" }]  // Pucón (+15%)
  )
};
```

## Estrategia de precios por ciudad

### Santiago (Precios base)
- Sin costos adicionales de traslado
- Precios estándar de mercado

### Pucón (Precios ajustados)
- **+15% por traslado y logística**
- Servicios personalizados incluyen "+ Traslado"
- Costos adicionales por distancia desde Santiago

### Ejemplo práctico:
```typescript
// Santiago: $ 62.000
// Pucón: $ 71.300 (62.000 * 1.15)

// O para servicios personalizados:
// Santiago: "Según Metraje"
// Pucón: "Según Metraje + Traslado"
```

## Beneficios del nuevo sistema

1. **Flexibilidad**: Precios diferentes por ubicación
2. **Escalabilidad**: Fácil agregar nuevas ciudades
3. **Retrocompatibilidad**: No rompe código existente
4. **Transparencia**: Usuario ve precios según su ubicación
5. **Mantenibilidad**: Configuración centralizada
6. **UX mejorada**: Cambios instantáneos de precios

## Testing

Para probar el sistema:
1. Cambiar ciudad en el selector
2. Verificar que precios se actualicen instantáneamente
3. Confirmar que indicador de ciudad cambie
4. Validar que precios sean correctos para cada ciudad

El sistema mantiene total retrocompatibilidad, por lo que servicios con precios legacy seguirán funcionando normalmente.