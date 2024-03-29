package kr.kh.account.model.vo;

import java.util.Objects;

import lombok.Data;

@Data
public class category {
	private int ca_num;
	private String ca_ty_name; 
	private String ca_name;
	@Override
	public String toString() {
		return ca_num + ". [" + ca_ty_name + "] " + ca_name;
	}
	public category(int it_ca_num) {
		this.ca_num = it_ca_num;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		category other = (category) obj;
		return ca_num == other.ca_num;
	}
	@Override
	public int hashCode() {
		return Objects.hash(ca_num);
	}
	
	
}
