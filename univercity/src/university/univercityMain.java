package university;

public class univercityMain {
	/* 대학생 관리 프로그램을 작성하세요.
	 * - 기본 기능
	 *   - 교수 관리
	 *     - 교수 등록/수정/삭제
	 *   - 학생 관리
	 *     - 학생 등록/수정/삭제
	 *   - 과 관리 : 학생 전공은 과, 학부는 없다고 가정
	 *     - 과 등록/수정/삭제
	 *   - 강의 관리 
	 *     - 강의 등록/수정/삭제
	 *   - 수강 관리
	 *     - 수강 신청/성적관리
	 *   - 조회
	 *     - 성적 조회/학과 조회 등
	 * - 추가 기능 구현 해도 됨
	 * - 과에 학부 추가해도 됨
	 * - 제출일 : 1월 26일. 상황봐서 변경될 수 있음.
	 * 
	 * 과 관리 : 어떤 과든 추가 될 수 있음
	 * 필요 변수 : 전공과목, 교양과목, 학생, 교수, 교양교수
	 * - 교양과목은 다른 과랑 겹칠 수 있음
	 * - 전공 과목은 다른 과랑 겹치면 안됨
	 * - 학생들이 추가 됨 다른 과랑 겹치면 안됨
	 * 
	 * 교수 관리 : 전공, 교양 교수가 있음
	 * 필요 변수(생성자? 변수?) : 학과, 전공과목, 교양과목, 
	 * - 전공 교수는 교양 수업도 할 수 있음 (과에(전공)에 상관 없이)
	 * - 전공 교수는 다른 전공 수업을 할 수 없음
	 * - 교양 교수는 전공 수업을 할 수 없음
	 * 
	 * 학생 관리 : 하나의 과에만 추가 될 수 있음
	 * 
	 * - 동명이인 가능하지만 학번이 겹지면 안됨
	 * - 학생은 각 과에 전공 과목과 교양 과목으로 분류된 과목만 들을 수 있음
	 * - 각 과목에 성적이 추가 됨
	 * */
	public static void main(String[] args) {

		univercityProgram up = new univercityProgram();
		up.run();

	}

}