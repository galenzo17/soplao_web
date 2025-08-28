// Types for city-based pricing structure
import type { City } from '../stores/cityStore.js';

// Basic price item structure
export interface PriceItem {
  label: string;
  price: string;
}

// City-specific pricing structure
export interface CityPricing {
  santiago: PriceItem[];
  pucon: PriceItem[];
}

// Legacy price structure for backward compatibility
export type LegacyPrices = PriceItem[];

// Union type to support both old and new price structures
export type ServicePrices = CityPricing | LegacyPrices;

// Service interface with flexible pricing
export interface Service {
  title: string;
  description: string;
  image: string;
  prices: ServicePrices;
  direction?: 'left' | 'right';
}

// Type guard to check if prices use city-based structure
export function isCityPricing(prices: ServicePrices): prices is CityPricing {
  return typeof prices === 'object' && 
         !Array.isArray(prices) && 
         'santiago' in prices && 
         'pucon' in prices;
}

// Type guard to check if prices use legacy structure
export function isLegacyPricing(prices: ServicePrices): prices is LegacyPrices {
  return Array.isArray(prices);
}

// Utility function to get prices for a specific city
export function getPricesForCity(prices: ServicePrices, city: City): PriceItem[] {
  if (isCityPricing(prices)) {
    return prices[city];
  }
  
  // If legacy pricing, return as-is for both cities
  return prices;
}

// Utility function to create city-specific pricing
export function createCityPricing(
  santiagoprices: PriceItem[],
  puconPrices: PriceItem[]
): CityPricing {
  return {
    santiago: santiagoprices,
    pucon: puconPrices
  };
}

// Price adjustment utilities
export interface PriceAdjustment {
  multiplier?: number;
  fixedAmount?: number;
  customPrices?: PriceItem[];
}

export function applyPriceAdjustment(
  basePrices: PriceItem[],
  adjustment: PriceAdjustment
): PriceItem[] {
  if (adjustment.customPrices) {
    return adjustment.customPrices;
  }

  return basePrices.map(item => {
    // Skip non-numeric prices
    if (!item.price.includes('$') || item.price.includes('Solicitar') || item.price.includes('Según')) {
      return item;
    }

    // Extract numeric value
    const numericPrice = parseFloat(item.price.replace(/[^\d]/g, ''));
    if (isNaN(numericPrice)) {
      return item;
    }

    let newPrice = numericPrice;
    
    if (adjustment.multiplier) {
      newPrice *= adjustment.multiplier;
    }
    
    if (adjustment.fixedAmount) {
      newPrice += adjustment.fixedAmount;
    }

    return {
      ...item,
      price: `$ ${newPrice.toLocaleString('es-CL')}`
    };
  });
}