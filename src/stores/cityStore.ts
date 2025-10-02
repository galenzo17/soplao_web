// City store for managing city state (Santiago only)
export type City = 'santiago';

export interface CityData {
  name: string;
  displayName: string;
}

export const CITIES: Record<City, CityData> = {
  santiago: {
    name: 'santiago',
    displayName: 'Santiago'
  }
};

class CityStore {
  private static instance: CityStore;
  private currentCity: City = 'santiago';
  private readonly STORAGE_KEY = 'selected-city';
  private listeners: ((city: City) => void)[] = [];

  private constructor() {
    this.loadFromStorage();
    this.setupStorageListener();
  }

  public static getInstance(): CityStore {
    if (!CityStore.instance) {
      CityStore.instance = new CityStore();
    }
    return CityStore.instance;
  }

  private loadFromStorage(): void {
    if (typeof window !== 'undefined') {
      const stored = localStorage.getItem(this.STORAGE_KEY);
      if (stored && this.isValidCity(stored)) {
        this.currentCity = stored as City;
      }
    }
  }

  private saveToStorage(): void {
    if (typeof window !== 'undefined') {
      localStorage.setItem(this.STORAGE_KEY, this.currentCity);
    }
  }

  private setupStorageListener(): void {
    if (typeof window !== 'undefined') {
      window.addEventListener('storage', (e) => {
        if (e.key === this.STORAGE_KEY && e.newValue && this.isValidCity(e.newValue)) {
          this.currentCity = e.newValue as City;
          this.notifyListeners();
        }
      });
    }
  }

  private isValidCity(city: string): boolean {
    return city === 'santiago';
  }

  private notifyListeners(): void {
    this.listeners.forEach(listener => listener(this.currentCity));
  }

  public getCurrentCity(): City {
    return this.currentCity;
  }

  public setCity(city: City): void {
    if (this.currentCity !== city) {
      this.currentCity = city;
      this.saveToStorage();
      this.notifyListeners();
      
      // Dispatch custom event for components that don't use the store directly
      if (typeof window !== 'undefined') {
        const event = new CustomEvent('citychange', {
          detail: { city: city },
          bubbles: true
        });
        document.dispatchEvent(event);
      }
    }
  }

  public getCityData(city?: City): CityData {
    return CITIES[city || this.currentCity];
  }

  public subscribe(listener: (city: City) => void): () => void {
    this.listeners.push(listener);
    
    // Return unsubscribe function
    return () => {
      const index = this.listeners.indexOf(listener);
      if (index > -1) {
        this.listeners.splice(index, 1);
      }
    };
  }

  public initialize(): void {
    // Method to be called when the app initializes
    this.loadFromStorage();
    this.notifyListeners();
  }
}

// Export singleton instance
export const cityStore = CityStore.getInstance();

// Utility functions for easier usage
export const getCurrentCity = (): City => cityStore.getCurrentCity();
export const setCurrentCity = (city: City): void => cityStore.setCity(city);
export const getCityDisplayName = (city?: City): string => cityStore.getCityData(city).displayName;
export const subscribeToCityChanges = (listener: (city: City) => void): (() => void) => 
  cityStore.subscribe(listener);