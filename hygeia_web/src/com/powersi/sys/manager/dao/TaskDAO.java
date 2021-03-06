/*
 * Copyright 2015 Powersi. All rights reserved.
 */
package com.powersi.sys.manager.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.powersi.hygeia.framework.BaseDAO;


/**
 * The Interface TaskDAO.
 */
public interface TaskDAO extends BaseDAO {

	/**
	 * 查询.
	 *
	 * @param param the param
	 * @return the list
	 */
	List query(Map param);

	/**
	 * 更新.
	 * 
	 * @param param
	 *            the param
	 * @return the int
	 */
	int update(Map param);

	/**
	 * 新增.
	 * 
	 * @param param
	 *            the param
	 * @return the int
	 */
	int insert(Map param);

	/**
	 * 删除.
	 * 
	 * @param param
	 *            the param
	 * @return the int
	 */
	int delete(Map param);
	
	
	/**
	 * 更新.
	 * 
	 * @param param
	 *            the param
	 * @return the int
	 */
	int update(List param);

	/**
	 * 新增.
	 * 
	 * @param param
	 *            the param
	 * @return the int
	 */
	int insert(List param);
	/**
	 * 查询日志.
	 *
	 * @param param the param
	 * @return the list
	 */
	List queryLog(String beginDate, String endDate, Map param);
	
	/**
	 * 主键.
	 *
	 * @return the sets the
	 */
	Set<String> keys();
}
