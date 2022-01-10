package com.jmurphey.products_categories.repositories;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jmurphey.products_categories.models.Category;
import com.jmurphey.products_categories.models.Product;


@Repository
public interface ProductRepo extends CrudRepository<Product, Long> {
	
	List<Product> findAll();
	
	List<Product> findAllByCategories(Category category);
	
	List<Product> findByCategoriesNotContains(Category category);
	
	List<Product> findByNameContaining(String search); 
	
}
