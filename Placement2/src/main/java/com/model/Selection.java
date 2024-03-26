package com.model;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Named;

@ApplicationScoped
@Named
public class Selection {
	
	private String town;
	private String store;
	private String rank;
	private String product;
	private String facing;
	
	public Selection(String town, String store, String rank, String product, String facing) {
		
		this.town = town;
		this.store = store;
		this.rank = rank;
		this.product = product;
		this.facing = facing;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getFacing() {
		return facing;
	}

	public void setFacing(String facing) {
		this.facing = facing;
	}


}
