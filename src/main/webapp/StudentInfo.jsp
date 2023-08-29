<jsp:include page="StudentDetail.jsp"></jsp:include>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! String userName,name,email,address,query; 
    long contact;
    int result;
    Connection connection;
    PreparedStatement preparedStatement;
    Properties properties=new Properties();
    String filePath="F://WEJA2//registration_form//resource//db_info.properties";
    FileInputStream fileInputStream;
    %>

<% 
userName=request.getParameter("userName");
name=request.getParameter("name");
    email=request.getParameter("email");
    address=request.getParameter("address");
    contact=Long.parseLong(request.getParameter("contact"));
    
    try{
    	fileInputStream=new FileInputStream(filePath);
    	properties.load(fileInputStream);
    	
    	Class.forName(properties.getProperty("driverPath"));
    	connection=DriverManager.getConnection(properties.getProperty("dburl"),properties);
    	query="insert into studentdetails values(?,?,?,?,?)";
    	preparedStatement=connection.prepareStatement(query);
    	preparedStatement.setString(1, userName);
    	preparedStatement.setString(2, name);
    	preparedStatement.setString(3, email);
    	preparedStatement.setLong(4,contact);
    	preparedStatement.setString(5, address);
    	result=preparedStatement.executeUpdate();
    	 
    	if(result>0){
    		response.setContentType("text/html");
    		  out.print("<h2 align='center' style='color:green'>User registered successfully</h2>");
    	}else{
    		response.setContentType("text/html");
      	  out.print("<h2 style='color:red; margin:0 auto; border:1px solid'>User is not registered <br> try again</h2>");
    	}
    	
    }catch(Exception e){
    	response.setContentType("text/html");
    	 
    	 out.print("<h2 style='color:red'>user not register <br> technical problem</h2>");
    }finally{
    	if(connection != null){
    		connection.close();
    	}
    	if(preparedStatement != null){
    		preparedStatement.close();
    	}
    	if(result != 0) {
			result=0;
		}
    }
 %>
</body>
</html>
