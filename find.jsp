<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jQuery2.1.1.js"></script>

  </head>
  
  <body>
    <a href="add.jsp">新增</a>
    <form action="SInvestigateServlet?opr=2" method="post">
    	勘查意见：<input type="text" name="bbb" id="chk_option">
    	<input type="submit" value="查询" id="btnFind">
    	<table>
    		<tr>
    			<td>编号</td>
    			<td>勘查意见</td>
    			<td>勘查员</td>
    			<td>勘查日期</td>
    			<td>有无违约用电行为</td>
    			<td>违约用电行为描述</td>
    			<td>勘查备注</td>
    			<td>申请编号</td>
    			<td>重要性等级</td>
    			<td>重要用户档案描述</td>
    			<td>操作</td>
    		</tr>
    		<c:forEach items="${list }" var="bb">
    		<tr>	
    			<td>${bb.chk_id}</td>
    			<td>${bb.chk_option}</td>
    			<td>${bb.chk_name}</td>
    			<td>${bb.chk_date}</td>
    			<td>${bb.violat_flag}</td>
    			<td>${bb.violate_cesc}</td>
    			<td>${bb.chk_remark}</td>
    			<td>${bb.app_no}</td>
    			<td>${bb.prio_code}</td>
    			<td>${bb.keycons_file}</td>
    			<td>
    			<a href="javascript:upd(${bb.chk_id})">修改</a> 
    			<a href="javascript:del(${bb.chk_id})">删除</a>
    			</td>
    		</tr>
    		</c:forEach>
    	</table>
    </form>
  </body>
  <script type="text/javascript">
  	function del(id){
	  	var a = window.confirm("是否删除数据？");
	  	if(a){
	  		$.ajax({
  			type:"post",
  			url:"SInvestigateServlet",
  			data:{
  				opr:3,
  				id:id
  			},
  			dataType:"json",
  			success:function(res){
  				if(res>0){
  					alert("删除成功");
  					window.location.reload();
  				}else{
  					alert("删除失败");
  				}
  			},
  			error:function(){
  				alert("ajax执行错误！");
  			}
  			
  		});
	  	}
  	}
  	
  	
  	function upd(id){
  		window.location.href="upd.jsp?id="+id;
  	}
  </script>
</html>
