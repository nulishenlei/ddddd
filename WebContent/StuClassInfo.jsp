<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	$(function(){
		
	 $.ajax({
			type:"post",
			data:{method:"scFind"},
			url:"StuClassShow",
			dataType:"json",
			success:function(data){
				alert(JSON.stringify(data));
				var stuText="<option value=''>--请选择--</option>";
				$.each(data,function(i,da){
					stuText +="<option value='"+da.stuId+"'>-"+da.scName+"</option>";
				})
				$("#stuClassId").html(stuText);
			}
		});
		 $("#stuClassId").change(function(){				
			$.ajax({					
				type:"post",
				data:{method:"stuList",stuId:$(this).val()},
				url:"StuClassShow",
				dataType:"json",
				success:function(data){
					alert(JSON.stringify(data));
					if(data!=null && data!=""){
					var stuName="";
					var stuTable="";
					$.each(data,function(i,da){
						stuName +="<option>"+da.name+"</option>";
						 stuTable +=
						"<tr><td>"+da.username+"</td>"+
						"<td>"+da.password+"</td>"+
						"<td>"+da.sex+"</td>"+
						"<td>"+da.name+"</td>"+
						"<td>"+da.telephone+"</td>"+
						"<td>"+da.home+"</td>"+
						"<td>"+da.birthday+"</td></tr>" 
					});
						$("#stuInfo").html(stuTable);
 						$("#studentInfos").html(stuName);
				}else{
 						$("#studentInfos").html("");
  						$("#stuInfo").html("");
 					}
			}
			});
		});  
		});


</script>
<title>学生信息展示</title>
</head>
<base href="<%=basePath%>">
<body>
 班级：<select id="stuClassId"></select>
 该班级的学生：<select id="studentInfos">
 </select>
 <table border="2">
 	<thead>
 		<tr>
 			<th>用户名</th>
 			<th>密码</th>
 			<th>性别</th>
 			<th>姓名</th>
 			<th>电话</th>
 			<th>地址</th>
 			<th>生日</th>
 		
 		</tr>
 		</thead>
 		<tbody id="stuInfo">
 		</tbody>
 </table>
</body>
</html>