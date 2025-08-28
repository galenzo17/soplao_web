// City-specific pricing configuration
import type { PriceItem, CityPricing, PriceAdjustment } from '../types/pricing.js';
import { createCityPricing, applyPriceAdjustment } from '../types/pricing.js';

// Base prices for Santiago (used as reference)
export const basePrices = {
  conventional: [
    { label: "Hasta 50m² (2 dorm, 2 baños)", price: "$ 62.000" },
    { label: "Hasta 100m² (3 dorm, 2 baños)", price: "$ 85.000" },
    { label: "Desde 100m² en adelante", price: "$ 120.000" }
  ] as PriceItem[],
  
  deepCleaning: [
    { label: "Hasta 50m² (2 dorm, 2 baños)", price: "$ 80.000" },
    { label: "Hasta 100m² (3 dorm, 2 baños)", price: "$ 115.000" },
    { label: "Desde 100m² en adelante", price: "$ 156.000" }
  ] as PriceItem[],
  
  endOfRent: [
    { label: "Cotización Personalizada", price: "Solicitar Presupuesto" }
  ] as PriceItem[]
};

// Specialized services base prices
export const specializedBasePrices = {
  carpetCleaning: [
    { label: "Hasta 10 m²", price: "$ 35.000" },
    { label: "10-30 m²", price: "$ 65.000" },
    { label: "30-50 m²", price: "$ 95.000" },
    { label: "Más de 50 m²", price: "$ 1.800 x m²" }
  ] as PriceItem[],
  
  tapestryUpholstery: [
    { label: "Sillón individual", price: "$ 15.000" },
    { label: "Sofá 2-3 cuerpos", price: "$ 25.000" },
    { label: "Sofá esquinero", price: "$ 35.000" },
    { label: "Silla de comedor (c/u)", price: "$ 8.000" }
  ] as PriceItem[],
  
  mattressCleaning: [
    { label: "Individual (1 plaza)", price: "$ 20.000" },
    { label: "Matrimonial (2 plazas)", price: "$ 30.000" },
    { label: "Queen/King size", price: "$ 40.000" },
    { label: "Box spring completo", price: "$ 55.000" }
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
    { label: "Parquet/madera 10-30 m²", price: "$ 45.000" },
    { label: "Parquet/madera 30-60 m²", price: "$ 80.000" },
    { label: "Mármol/granito por m²", price: "$ 2.500" },
    { label: "Cerámico/porcelanato por m²", price: "$ 1.800" }
  ] as PriceItem[],
  
  bathroomCleaning: [
    { label: "1 baño residencial", price: "$ 25.000" },
    { label: "2-3 baños", price: "$ 45.000" },
    { label: "Baño principal con tina", price: "$ 35.000" },
    { label: "Baño comercial", price: "$ 40.000" }
  ] as PriceItem[],
  
  windowCleaning: [
    { label: "Hasta 10 ventanas", price: "$ 25.000" },
    { label: "10-20 ventanas", price: "$ 40.000" },
    { label: "20-40 ventanas", price: "$ 65.000" },
    { label: "Edificio comercial", price: "$ 2.000 x ventana" }
  ] as PriceItem[],
  
  wallCleaning: [
    { label: "Hasta 50 m² de muro", price: "$ 60.000" },
    { label: "50-100 m² de muro", price: "$ 110.000" },
    { label: "100-200 m² de muro", price: "$ 200.000" },
    { label: "Muro industrial por m²", price: "$ 1.200" }
  ] as PriceItem[]
};

// Price adjustments by city
export const cityAdjustments: Record<string, PriceAdjustment> = {
  santiago: {
    // Santiago uses base prices (no adjustment)
  },
  pucon: {
    // Pucón prices are generally 20% higher due to location and travel costs
    multiplier: 1.20,
    // Some custom adjustments for specific services
    customPrices: undefined // Will be overridden per service if needed
  }
};

// Generate city-specific pricing for main services
export const mainServicesPricing = {
  conventional: createCityPricing(
    basePrices.conventional,
    applyPriceAdjustment(basePrices.conventional, cityAdjustments.pucon)
  ),
  
  deepCleaning: createCityPricing(
    basePrices.deepCleaning,
    applyPriceAdjustment(basePrices.deepCleaning, cityAdjustments.pucon)
  ),
  
  endOfRent: createCityPricing(
    basePrices.endOfRent,
    [{ label: "Cotización Personalizada", price: "Solicitar Presupuesto + Traslado" }]
  )
};

// Generate city-specific pricing for specialized services
export const specializedServicesPricing = {
  carpetCleaning: createCityPricing(
    specializedBasePrices.carpetCleaning,
    applyPriceAdjustment(specializedBasePrices.carpetCleaning, cityAdjustments.pucon)
  ),
  
  tapestryUpholstery: createCityPricing(
    specializedBasePrices.tapestryUpholstery,
    applyPriceAdjustment(specializedBasePrices.tapestryUpholstery, cityAdjustments.pucon)
  ),
  
  mattressCleaning: createCityPricing(
    specializedBasePrices.mattressCleaning,
    applyPriceAdjustment(specializedBasePrices.mattressCleaning, cityAdjustments.pucon)
  ),
  
  kitchenCleaning: createCityPricing(
    specializedBasePrices.kitchenCleaning,
    applyPriceAdjustment(specializedBasePrices.kitchenCleaning, cityAdjustments.pucon)
  ),
  
  industrialKitchen: createCityPricing(
    specializedBasePrices.industrialKitchen,
    applyPriceAdjustment(specializedBasePrices.industrialKitchen, cityAdjustments.pucon)
  ),
  
  floorRestoration: createCityPricing(
    specializedBasePrices.floorRestoration,
    applyPriceAdjustment(specializedBasePrices.floorRestoration, cityAdjustments.pucon)
  ),
  
  bathroomCleaning: createCityPricing(
    specializedBasePrices.bathroomCleaning,
    applyPriceAdjustment(specializedBasePrices.bathroomCleaning, cityAdjustments.pucon)
  ),
  
  windowCleaning: createCityPricing(
    specializedBasePrices.windowCleaning,
    applyPriceAdjustment(specializedBasePrices.windowCleaning, cityAdjustments.pucon)
  ),
  
  wallCleaning: createCityPricing(
    specializedBasePrices.wallCleaning,
    applyPriceAdjustment(specializedBasePrices.wallCleaning, cityAdjustments.pucon)
  )
};

// City-specific information
export const cityInfo = {
  santiago: {
    name: 'Santiago',
    displayName: 'Santiago',
    coverage: 'Región Metropolitana',
    additionalInfo: 'Sin costo adicional de traslado'
  },
  pucon: {
    name: 'pucon',
    displayName: 'Pucón',
    coverage: 'Pucón y alrededores',
    additionalInfo: 'Incluye costo de traslado desde Santiago'
  }
} as const;