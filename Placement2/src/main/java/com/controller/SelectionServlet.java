package com.controller;

import com.dao.SelectionDAO;
import com.model.Selection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveSelection")
public class SelectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SelectionDAO selectionDao = new SelectionDAO();

    public SelectionServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String town = request.getParameter("town");
        String store = request.getParameter("store");
        String ranking = request.getParameter("rank");
        String product = request.getParameter("product");
        String facings = request.getParameter("additionalInfo");

        Selection selection = new Selection(town, store, ranking, product, facings);

        try {
            selectionDao.saveSelection(selection);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("selection.jsp"); // Redirect to the selection page after saving
    }
} 