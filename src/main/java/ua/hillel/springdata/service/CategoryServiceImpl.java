package ua.hillel.springdata.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import ua.hillel.springdata.model.entity.Category;
import ua.hillel.springdata.repo.CategoryRepo;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    private final CategoryRepo categoryRepo;

    @Override
    public List<Category> getAllCategories() {
        Iterable<Category> all = categoryRepo.findAll();
        List<Category> categories = new ArrayList<>();
        all.forEach(categories::add);
        return categories;
    }

    @Override
    public Category findCategoryByName(String name) {
        return categoryRepo.findByName(name);
    }
}
