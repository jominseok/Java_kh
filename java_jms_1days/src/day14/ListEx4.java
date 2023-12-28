package day14;

import java.util.ArrayList;
import java.util.Comparator;

public class ListEx4 {

	public static void main(String[] args) {

		
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(10);
		list.add(4);
		list.add(1);
		
		System.out.println(list);
		/* indexOf(A) : A와 일치하는 요소가 몇번지에 있는지 알려주는 메서드. 없으면 -1 */
		System.out.println(list.indexOf(3));
		
		/*conrains(A) : A와 일치하는 요소가 있는지 없는지 알려주는 메서드*/
		System.out.println(list.contains(2));
		
		/*remove(A) : A요소를 삭제 후 삭제 여부를 알려줌*/
		/*remove(index) : index번지에 있는 요소를 삭제 후 index번지에 있던 요소를 반환*/
		Integer tmp = 1;
		list.remove(tmp);
		list.remove(10);
		System.out.println(list);
		
		/* sort(Comparator<? super Integer> c): 비교 기준이 있는 메서드를 가진 Comparator
		 * 인터페이스를 구현한 구현 클래스의 인스턴스가 와야함
		 * */
		list.add(-19);
		list.add(100);
		list.add(30);
		list.sort((Comparator<? super Integer>) new Comparator<Integer>() {
			
			@Override
			public int compare(Integer o1, Integer o2) {
				return o1-o2;
			}
		});
		System.out.println(list);	
				
	}

}
