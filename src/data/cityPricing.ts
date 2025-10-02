// City-specific pricing configuration
import type { PriceItem, CityPricing, PriceAdjustment } from '../types/pricing.js';
import { createCityPricing, applyPriceAdjustment } from '../types/pricing.js';

// Base prices for Santiago (used as reference)
export const basePrices = {
  conventional: [
    { label: "Hasta 50m² (2 dorm, 2 baños)", price: "Desde $ 62.000" },
    { label: "Hasta 100m² (3 dorm, 2 baños)", price: "Desde $ 85.000" },
    { label: "Desde 100m² en adelante", price: "Desde $ 120.000" }
  ] as PriceItem[],

  deepCleaning: [
    { label: "Hasta 50m² (2 dorm, 2 baños)", price: "Desde $ 80.000" },
    { label: "Hasta 100m² (3 dorm, 2 baños)", price: "Desde $ 115.000" },
    { label: "Desde 100m² en adelante", price: "Desde $ 156.000" }
  ] as PriceItem[],
  
  endOfRent: [
    { label: "Cotización Personalizada", price: "Solicitar Presupuesto" }
  ] as PriceItem[]
};

// Specialized services base prices
export const specializedBasePrices = {
  carpetCleaning: [
    { label: "Cotización Personalizada", price: "Cotizar" }
  ] as PriceItem[],
  
  tapestryUpholstery: [
    { label: "Sillón individual", price: "$ 15.000" },
    { label: "Sofá 2-3 cuerpos", price: "$ 25.000" },
    { label: "Sofá esquinero", price: "$ 35.000" },
    { label: "Silla de comedor (c/u)", price: "$ 8.000" }
  ] as PriceItem[],
  
  mattressCleaning: [
    { label: "Cotización Personalizada", price: "Cotizar" }
  ] as PriceItem[],
  
  kitchenCleaning: [
    { label: "Cocina residencial básica", price: "$ 45.000" },
    { label: "Cocina con isla", price: "$ 65.000" },
    { label: "Cocina americana", price: "$ 35.000" },
    { label: "Limpieza de horno", price: "$ 15.000" }
  ] as PriceItem[],
  
  industrialKitchen: [
    { label: "Cocina comercial pequeña", price: "$ 150.000" },
    { label: "Cocina comercial mediana", price: "$ 250.000" },
    { label: "Cocina industrial grande", price: "$ 400.000" },
    { label: "Mantenimiento mensual", price: "$ 80.000" }
  ] as PriceItem[],
  
  floorRestoration: [
    { label: "Cotización Personalizada", price: "Cotizar" }
  ] as PriceItem[],
  
  bathroomCleaning: [
    { label: "1 baño residencial", price: "$ 25.000" },
    { label: "2-3 baños", price: "$ 45.000" },
    { label: "Baño principal con tina", price: "$ 35.000" },
    { label: "Baño comercial", price: "$ 40.000" }
  ] as PriceItem[],
  
  windowCleaning: [
    { label: "Cotización Personalizada", price: "Cotizar" }
  ] as PriceItem[],
  
  wallCleaning: [
    { label: "Hasta 50 m² de muro", price: "$ 60.000" },
    { label: "50-100 m² de muro", price: "$ 110.000" },
    { label: "100-200 m² de muro", price: "$ 200.000" },
    { label: "Muro industrial por m²", price: "$ 1.200" }
  ] as PriceItem[]
};

// Price adjustments by city (Santiago only)
export const cityAdjustments: Record<string, PriceAdjustment> = {
  santiago: {
    // Santiago uses base prices (no adjustment)
  }
};

// Generate city-specific pricing for main services (Santiago only)
export const mainServicesPricing = {
  conventional: createCityPricing(
    basePrices.conventional,
    basePrices.conventional
  ),

  deepCleaning: createCityPricing(
    basePrices.deepCleaning,
    basePrices.deepCleaning
  ),

  endOfRent: createCityPricing(
    basePrices.endOfRent,
    basePrices.endOfRent
  )
};

// Generate city-specific pricing for specialized services (Santiago only)
export const specializedServicesPricing = {
  carpetCleaning: createCityPricing(
    specializedBasePrices.carpetCleaning,
    specializedBasePrices.carpetCleaning
  ),

  tapestryUpholstery: createCityPricing(
    specializedBasePrices.tapestryUpholstery,
    specializedBasePrices.tapestryUpholstery
  ),

  mattressCleaning: createCityPricing(
    specializedBasePrices.mattressCleaning,
    specializedBasePrices.mattressCleaning
  ),

  kitchenCleaning: createCityPricing(
    specializedBasePrices.kitchenCleaning,
    specializedBasePrices.kitchenCleaning
  ),

  industrialKitchen: createCityPricing(
    specializedBasePrices.industrialKitchen,
    specializedBasePrices.industrialKitchen
  ),

  floorRestoration: createCityPricing(
    specializedBasePrices.floorRestoration,
    specializedBasePrices.floorRestoration
  ),

  bathroomCleaning: createCityPricing(
    specializedBasePrices.bathroomCleaning,
    specializedBasePrices.bathroomCleaning
  ),

  windowCleaning: createCityPricing(
    specializedBasePrices.windowCleaning,
    specializedBasePrices.windowCleaning
  ),

  wallCleaning: createCityPricing(
    specializedBasePrices.wallCleaning,
    specializedBasePrices.wallCleaning
  )
};

// City-specific information (Santiago only)
export const cityInfo = {
  santiago: {
    name: 'Santiago',
    displayName: 'Santiago',
    coverage: 'Región Metropolitana',
    additionalInfo: 'Sin costo adicional de traslado'
  }
} as const;