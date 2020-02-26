<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link  href="<%=request.getContextPath() %>/css/index3.css"     rel="stylesheet"   type="text/css">
<script type="text/javascript"  src="<%=request.getContextPath() %>/resource/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
   function morder(orderName) {
	var orderMethod='${vo.orderMethod}';
	orderMethod= orderMethod=='desc'?'asc':'desc';
	location.href="/list?orderName="+orderName+"&orderMethod="+orderMethod;
}
   
   function fenye(pageNum) {
	$("[name=pageNum]").val(pageNum);
	$("form").submit();
}
   function choose(own) {
	$("[name=check]").attr("checked",own.checked);
}
   
   function deleteAll() {
	var num=$("[name=check]:checked").size();
	if(num==0){
		alert("请选择要删除的数据")
	}else{
		var ids="";
		$("[name=check]:checked").each(function(){
			ids+=","+this.value;
		})
		ids=ids.substring(1);
		$.post("delete",{ids:ids},function(flag){
			if(flag){
				alert("批量删除成功");
				location="list";
			}else{
				alert("批量删除失败")
			}
		})
		
	}
}
   
   function del(id) {
	   alert(id)
	$.post("delete",{ids:id},function(flag){
		if(flag){
			alert("删除成功");
			location="list.do";
		}else{
			alert("删除失败")
		}
	},"json")
}
</script>
</head>
<body>
<form action="list" method="post">
      <input type="hidden" name="pageNum">
影片名称<input type="text" name="name" value="${vo.name }">&nbsp;&nbsp;上映时间<input type="text" name="t1" value="${vo.t1 }">至<input type="text" name="t2" value="${vo.t2 }"><br>
导演&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="actor" value="${vo.actor }">&nbsp;&nbsp;价格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="p1" value="${vo.p1 }">-<input type="text" name="p2" value="${vo.p2 }"><br>
电影年代<input type="text" name="years" value="${vo.years }">&nbsp;&nbsp;电影时长<input type="text" name="l1" value="${vo.l1 }">-<input type="text" name="l2" value="${vo.l2 }"><br>
      <button>查询影片</button>
</form>
<table class="table">
   <tr>
     <td>
       <input type="checkbox" onclick="choose(this)">
     </td>
     <td>序号</td>
     <td>影片名</td>
     <td>导演</td>
     <td><a href="javascript:morder('price')">票价</a></td>
     <td>上映时间</td>
     <td><a href="javascript:morder('longtime')">时长</a></td>
     <td>类型</td>
     <td><a href="javascript:morder('years')">年代</a></td>
     <td>区域</td>
     <td>状态</td>
     <td>操作
     <button onclick="deleteAll()">批量删除</button>
     </td>
   </tr>
   <c:forEach items="${page.list}" var="s" varStatus="count">
      <tr>
         <td>
           <input type="checkbox" name="check" value="${s.id }">
         </td>
         <td>${count.count+page.startRow-1}</td>
         <td>${s.name }</td>
         <td>${s.actor }</td>
         <td>${s.price }</td>
         <td>${s.uptime }</td>
         <td>${s.longtime }</td>
         <td>${s.type }</td>
         <td>${s.years }</td>
         <td>${s.area }</td>
         <td>${s.status==1?"未上映":s.status==2?"热映中":"已下映" }</td>
         <td>
           <button onclick="del(${s.id})">删除</button>
           <button>修改</button>
         </td>
      </tr>
   </c:forEach>
   <tr>
      <td colspan="20">
         <button onclick="fenye(1)">首页</button>
         <button onclick="fenye(${page.prePage==0?1:page.prePage })">上一页</button>
         <button onclick="fenye(${page.nextPage==0?page.pages:page.nextPage })">下一页</button>
         <button onclick="fenye(${page.pages})">尾页</button>
                        当前${page.pageNum }/${page.pages }页,共${page.total }条
      </td>
   </tr>
</table>
</body>
</html>