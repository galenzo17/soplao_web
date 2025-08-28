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
    { label: "Cotización Personalizada", price: "Según Metraje" }
  ] as PriceItem[],
  
  tapestryUpholstery: [
    { label: "Cotización Personalizada", price: "Según Cantidad" }
  ] as PriceItem[],
  
  mattressCleaning: [
    { label: "Cotización Personalizada", price: "Según Tamaño" }
  ] as PriceItem[],
  
  kitchenCleaning: [
    { label: "Cotización Personalizada", price: "Según Área" }
  ] as PriceItem[],
  
  industrialKitchen: [
    { label: "Cotización Personalizada", price: "Según Área" }
  ] as PriceItem[],
  
  floorRestoration: [
    { label: "Cotización Personalizada", price: "Según Metraje" }
  ] as PriceItem[],
  
  bathroomCleaning: [
    { label: "Cotización Personalizada", price: "Según Cantidad" }
  ] as PriceItem[],
  
  windowCleaning: [
    { label: "Cotización Personalizada", price: "Según Área" }
  ] as PriceItem[]
};

// Price adjustments by city
export const cityAdjustments: Record<string, PriceAdjustment> = {
  santiago: {
    // Santiago uses base prices (no adjustment)
  },
  pucon: {
    // Pucón prices are generally 15% higher due to location and travel costs
    multiplier: 1.15,
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
    [{ label: "Cotización Personalizada", price: "Según Metraje + Traslado" }]
  ),
  
  tapestryUpholstery: createCityPricing(
    specializedBasePrices.tapestryUpholstery,
    [{ label: "Cotización Personalizada", price: "Según Cantidad + Traslado" }]
  ),
  
  mattressCleaning: createCityPricing(
    specializedBasePrices.mattressCleaning,
    [{ label: "Cotización Personalizada", price: "Según Tamaño + Traslado" }]
  ),
  
  kitchenCleaning: createCityPricing(
    specializedBasePrices.kitchenCleaning,
    [{ label: "Cotización Personalizada", price: "Según Área + Traslado" }]
  ),
  
  industrialKitchen: createCityPricing(
    specializedBasePrices.industrialKitchen,
    [{ label: "Cotización Personalizada", price: "Según Área + Traslado" }]
  ),
  
  floorRestoration: createCityPricing(
    specializedBasePrices.floorRestoration,
    [{ label: "Cotización Personalizada", price: "Según Metraje + Traslado" }]
  ),
  
  bathroomCleaning: createCityPricing(
    specializedBasePrices.bathroomCleaning,
    [{ label: "Cotización Personalizada", price: "Según Cantidad + Traslado" }]
  ),
  
  windowCleaning: createCityPricing(
    specializedBasePrices.windowCleaning,
    [{ label: "Cotización Personalizada", price: "Según Área + Traslado" }]
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