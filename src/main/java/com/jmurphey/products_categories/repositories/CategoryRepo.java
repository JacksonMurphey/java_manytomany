package com.jmurphey.products_categories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import com.jmurphey.products_categories.models.Category;
import com.jmurphey.products_categories.models.Product;


@Repository
public interface CategoryRepo extends CrudRepository<Category, Long> {

	List<Category> findAll();
	
	List<Category> findAllByProducts(Product product);
	
	List<Category> findByProductsNotContains(Product product);
	
	List<Category> findByNameContaining(String search);
}
