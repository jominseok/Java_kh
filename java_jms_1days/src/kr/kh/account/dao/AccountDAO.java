package kr.kh.account.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.account.model.vo.Item;
import kr.kh.account.model.vo.Type;
import kr.kh.account.model.vo.category;
import kr.kh.account.pagination.Criteria;
import lombok.Data;

@Data
public interface AccountDAO {

	List<Type> selectTypeList();

	List<category> selectCategoryList(@Param("ty_name")String type);

	boolean insertItem(@Param("item") Item item);

	List<Item> selectItemListByDate(@Param("it_date")String date);

	boolean updateItem(@Param("item") Item item);

	boolean deleteItem(@Param("it_num") int it_num);

	List<Item> selectItemListByDate(@Param("cri")Criteria cri);

}
