<%@page language="java" contentType="text/html"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="eshop.beans.Book"%>
<%@page import="eshop.beans.CartItem"%>
<jsp:useBean id="dataManager" scope="application"  class="eshop.model.DataManager"/>
<%
String base =(String) application.getAttribute("base");
@SuppressWarnings("unchecked")
Hashtable<String, CartItem>  shoppingCart =  (Hashtable<String, CartItem>)session.getAttribute("carrito");
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Shopping Cart</title>
  <link rel="stylesheet" href="/TiendaTati/css/eshop.css" type="text/css"/>
  </head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<jsp:include page="LeftMenu.jsp" flush="true"/>
<%
  if (!shoppingCart.isEmpty()) {
  %>
    <div class="content">
      <h2>Shopping Cart</h2>
      <table>
        <tr>
          <th>Title</th>
          <th>Author</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Subtotal</th>
          <th>Delete</th>
          </tr>
<%
        Enumeration<CartItem> enumList = shoppingCart.elements();
        double itemPrice = 0;
        double totalPrice = 0;
        while (enumList.hasMoreElements()) {
          CartItem item = enumList.nextElement();
          itemPrice = Math.round(
        		    Integer.parseInt(item.getQuantity())
        		    * item.getPrice() * 100.) / 100.
                    ;
          totalPrice += itemPrice;
  %>
          <tr>
            <td><%=item.getTitle()%></td>
            <td><%=item.getAuthor()%></td>
            <td><%=item.getPrice()%></td>
            <td><form>
              		<input type="hidden" name="action" value="updateItem"/>
              		<input type="hidden" name="bookId"
               		 value="<%=item.getBookID()%>"/>
               		 
              			<input type="text" size="2" name="quantity" 
                		value="<%=item.getQuantity()%>"/>
              			<input type="submit" value="Update"/>
              </form></td>
            <td>
              <%=itemPrice%>
                </td>
            <td><form>
              <input type="hidden" name="action" value="deleteItem"/>
              <input type="hidden" name="bookId" 
                value="<%=item.getBookID()%>"/>
              <input type="submit" value="Delete"/>
              </form></td>
            </tr>
<%
          }
  %>
        <tr>
          <td colspan="5" id="total">Total: <%=totalPrice%></td>
          <td class="total">&nbsp;</td>
          </tr>
        <tr>
          <td colspan="6" class="center"><a class="link1"
            href="<%=base%>?action=checkOut">Check Out</a></td>
          </tr>
        </table>
      </div>
<%
    }
  else {
    %><p class="info">The Shopping cart is empty.</p><%
    }
  %>
</body>
</html>
