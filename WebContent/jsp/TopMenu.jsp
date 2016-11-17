<%@page language="java" contentType="text/html"%>
<%@page import="eshop.beans.Book"%>
<%@page import="java.util.Hashtable"%>
<%@page import="eshop.beans.CartItem"%>
<jsp:useBean id="dataManager" scope="application"
  class="eshop.model.DataManager"/>
<%
  String base = (String)application.getAttribute("base");
  String imageURL = (String)application.getAttribute("imageURL");
  %>
<div class="header">
  <div class="logo">
    <p>Examen Java </p>
    </div>
      
  <div class="cart">
  
	<%
		try {
		Hashtable<String, CartItem> shoppingCart = (Hashtable<String, CartItem>)session.getAttribute("carrito");
			if (shoppingCart != null && !shoppingCart.isEmpty()) {
	%>
    	<a class="link2" href="<%=base%>?action=showCart">Show Cart
      	<img src="<%=imageURL%>cart.gif" border="0"/></a>
      
    <%
      		}
    	}
  	catch (Exception e) {
	%>
		<p class="error">Invalid book identifier!</p><%
    	}
  	%>
    </div>
    
  </div>