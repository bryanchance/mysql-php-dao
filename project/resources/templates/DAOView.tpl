<?php
/**
 * Class that interfaces with database view '${table_name}'.
 * This class is generated by PHPDAO, and will be overwritten.
 *
 * @version 2.7
 * @date ${date}
 *
 * Original author
 * @author http://phpdao.com
 * 
 * Revision 2.7
 * @author Aaron Bean <aaron.bean@beardon.com>
 */
class ${class_name} implements ${interface_name} {

	/**
	 * Get Domain object by primry key
	 *
	 * @param string $id primary key
	 * @return ${dto_name} 
	 */
	public function load($id){
		$sql = 'SELECT * FROM ${table_name} WHERE ${pk} = ?';
		$sqlQuery = new SqlQuery($sql);
		$sqlQuery->set${pk_number}($id);
		return $this->getRow($sqlQuery);
	}

	/**
	 * Get all records from table
	 *
	 * @return ${dto_name}[]
	 */
	public function queryAll(){
		$sql = 'SELECT * FROM ${table_name}';
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
	/**
	 * Get all records from table ordered by field
	 *
	 * @param string $orderColumn column name
	 * @return ${dto_name}[]
	 */
	public function queryAllOrderBy($orderColumn){
		$sql = 'SELECT * FROM ${table_name} ORDER BY '.$orderColumn;
		$sqlQuery = new SqlQuery($sql);
		return $this->getList($sqlQuery);
	}
	
${queryByFieldFunctions}
	
	/**
	 * Read row
	 *
	 * @param array $row
	 * @return ${dto_name} 
	 */
	protected function readRow($row){
		$${var_name} = new ${dto_name}();
		${read_row}
		return $${var_name};
	}
	
	protected function getList($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		$ret = array();
		for($i=0;$i<count($tab);$i++){
			$ret[$i] = $this->readRow($tab[$i]);
		}
		return $ret;
	}
	
	/**
	 * Get row
	 *
	 * @param string $sqlQuery
	 * @return ${dto_name} 
	 */
	protected function getRow($sqlQuery){
		$tab = QueryExecutor::execute($sqlQuery);
		if(count($tab)==0){
			return null;
		}
		return $this->readRow($tab[0]);		
	}
	
	/**
	 * Execute sql query
	 */
	protected function execute($sqlQuery){
		return QueryExecutor::execute($sqlQuery);
	}
		
	/**
	 * Query for one row and one column
	 */
	protected function querySingleResult($sqlQuery){
		return QueryExecutor::queryForString($sqlQuery);
	}
}
?>