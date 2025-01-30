import React from 'react';
import { motion } from 'framer-motion';
import { useInView } from 'framer-motion';

interface Service {
  id: number;
  title: string;
  description: string;
  icon: string;
}

const services: Service[] = [
  {
    id: 1,
    title: "Limpieza Residencial",
    description: "Servicio profesional de limpieza para hogares, incluyendo limpieza profunda y mantenimiento regular.",
    icon: "🏠"
  },
  {
    id: 2,
    title: "Limpieza Comercial",
    description: "Soluciones de limpieza personalizadas para oficinas, locales comerciales y espacios de trabajo.",
    icon: "🏢"
  },
  {
    id: 3,
    title: "Limpieza Industrial",
    description: "Servicios especializados para plantas industriales y áreas de manufactura.",
    icon: "🏭"
  }
];

const ServiceCard: React.FC<{ service: Service; index: number }> = ({ service, index }) => {
  const ref = React.useRef(null);
  const isInView = useInView(ref, { once: true });

  return (
    <motion.div
      ref={ref}
      initial={{ opacity: 0, y: 50 }}
      animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
      transition={{ duration: 0.5, delay: index * 0.2 }}
      className="bg-white rounded-lg shadow-xl p-6 mx-4 my-6 transform hover:scale-105 transition-transform duration-300"
    >
      <div className="text-4xl mb-4">{service.icon}</div>
      <h3 className="text-xl font-bold mb-2 text-gray-800">{service.title}</h3>
      <p className="text-gray-600">{service.description}</p>
    </motion.div>
  );
};

const ServicesSection: React.FC = () => {
  return (
    <section className="py-16 bg-gray-50">
      <div className="container mx-auto px-4">
        <motion.h2
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="text-4xl font-bold text-center mb-12 text-gray-900"
        >
          Nuestros Servicios
        </motion.h2>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {services.map((service, index) => (
            <ServiceCard key={service.id} service={service} index={index} />
          ))}
        </div>
      </div>
    </section>
  );
};

export default ServicesSection;
