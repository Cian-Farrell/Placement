package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SelectionDAO;
import com.model.Selection;

@WebServlet("/selection")
public class SelectionServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    
    private SelectionDAO selectionDao = new SelectionDAO();
    
    public SelectionServlet() {
    	super();
    }
    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the selection.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("selection.jsp");
		dispatcher.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle any post requests if necessary
        // For example, processing form submissions
    	
		String town = request.getParameter("town");
		String store =  request.getParameter("store");
		String rank =  request.getParameter("ranking");	
		String product =  request.getParameter("product");	
		String facing =  request.getParameter("facings");	

        Selection selection = new Selection(town, store, rank, product, facing);
        
        try {
           selectionDao.registerSelection(selection);
           System.out.println("Selection Connected 1");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.out.println("Selection Connected 2");

        }

    }
}