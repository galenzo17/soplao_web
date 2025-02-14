/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
    theme: {
      extend: {
        colors: {
          'brand': '#0facaf',
          'brand-light': '#15d8dc',
          'brand-dark': '#0b8082',
        },
      },
    },
    plugins: [],
  }