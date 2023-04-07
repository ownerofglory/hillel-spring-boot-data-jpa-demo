package ua.hillel.springdata.model.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import ua.hillel.springdata.model.dto.CategoryDTO;
import ua.hillel.springdata.model.dto.ProductDTO;
import ua.hillel.springdata.model.entity.Category;
import ua.hillel.springdata.model.entity.Product;

@Mapper(componentModel = "spring")
public interface ProductMapper {
    @Mapping(source = "category", target = "category", qualifiedByName = "categoryToCategoryDTO")
    ProductDTO productToProductDTO(Product product);
    Product productToProductDTO(ProductDTO productDto);

    @Named("categoryToCategoryDTO")
    public static CategoryDTO categoryToCategoryDTO(Category category) {
        return new CategoryDTO() {{
           setName(category.getName());
        }};
    }
}
