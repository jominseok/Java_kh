package university;

public class UniversityMain {
	public static void main(String[] args) {
		/* 대학교 관리 프로그램을 작성하세요.
		 * (제한 사항 및 기능 설명)
		 * 1. 교번이나 학번은 숫자로만 구성된다고 가정한다
		 * 2. 수업 시간은 하나의 요일만 있다고 생각 즉, 월수금 수업 그런거 없음! 요일은 String, 수업 시간은 int 이고 1시간  단위로 하며 시작 시간과 끝나는 시간으로 구성
		 *    예를 들어, 시작 시작: 9 (오전 9시) 이고 끝나는 시간 : 10 (오전 10시)이다.  오후 2시는 14로 표현
		 * 3. 복수전공은 없다고 생각, 학년 따지지 않으며 졸업생은 생각 안한다
		 * 4. 한학기만을 다룬다고 생각
		 * 5. 교수 한명당 한 수업을 맡는다고 가정하며, 과목코드가 아닌 수업 이름으로 따지며 수업 이름 하나당 교수 역시 1명이다.
		 * 6. 학생들의 성적은 중간,기말,출석 등 그런것 없이 단순히 0~100점 사이로 평가한다
		 * 7. 학생은 수강 신청 시 수업 시간들이 겹치지 않게 해야한다. 이를 어길시 프로그램에 안내문구가 떠야한다.
		 * 8. 프로그램을 다루는 신분은 총 3가지로  학교 관리자, 교수, 학생이다. 이것은 프로그램 처음에 선택하며 교수와 학생은 교번이나 학번 그리고 이름을 입력해서 입장하는데,
		 *    학교에 해당 정보가 없을 경우 입장 제한하며 관리자는 이러한 제한이 없다고 생각하고 프로그램이 시작한다.
		 *    즉, 교수나 학생을 선택했을 경우, 교번 또는 학번을 입력하라 하고 없을 경우 다시 입력하라고 한다.
		 * 9. 학교 관리자 : 교수와 학생, 수업에 대한 전반적인 것을 다룬다
		 *  - 교수 관리
		 *   - 교수 등록 : 교수 번호, 교수이름, 소속과 입력(이미 있는 교번이면 안됨)
		 *   - 교수 수정 : 교수 번호 입력후 해당 교수의 이름, 소속과를 수정 (해당 교번이 있어야 하며 교번은 수정 안하고 이름이나, 소속과를 수정한다)
		 *   - 교수 삭제 : 교수 번호 입력 후 해당 교수를 완전히 삭제(이것 역시 당연히 교번이 있어야 해당 교수 삭제 가능)
		 *   - 교수 조회 : 전체 조회, 과별 조회, 이름조회(동명인 있으면 모두 조회)
		 *  - 학생 관리
		 *   - 학생 등록 : 학번, 학생 이름, 소속과(이미 있는 학번이면 안됨)
		 *   - 학생 수정 : 학번 입력 후 해당 학생의 이름이나 과를 수정(해당 학번이 있어야 하며, 학번은 수정안하고 이름이나 과를 수정한다)
		 *   - 학생 삭제 : 학번 입력후 해당 학생을 완전히 삭제(이것 역시 당연히 학번이 있어야 해당 학생 삭제 가능)
		 *   - 학생 조회 : 전체 조회, 과별 조회, 학번 조회(학생은 학교에서 이름이 겹치는 경우가 많아서 고유한 학번을 입력해서 1명의 정보만 조회한다)
		 *  - 수업 관리
		 *   - 수업 등록 : 학교에 등록된 교수 중에서 교번을 입력하며 이때 해당 교수는 이미 등록된 수업이 있으면 안된다. 
		 *     수업명, 담당 교수 교번,강의실, 수업시간(요일,시작 시간, 끝나는 시간), 최대 정원 입력해서 등록한다.
		 *    #수업 등록시 수업이름이 이미 있으면 안되며 강의실과 수업시간이 동시에 겹치면 안된다.
		 *   - 수업 수정 : 등록된 수업의 정보들을 바꾸는 기능(수업명 입력해서 있는 수업이면 수업명이나, 담당교수의 교번, 수업시간과 강의실, 최대 정원을 수정한다)		 
		 *   - 수업 삭제 : 수업 이름을 입력해서 있으면 삭제한다.
		 *   		 
		 * 10. 교수 :  해당학기에 수업하는 한 과목을 수강하는 학생들을 관리한다
		 *  - 학생 관리
		 *   - 학생 조회 : 수강하는 학생들의 정보를 조회	
		 *    아래 메뉴는 성적 관리 메뉴로 합침	 
		 *   - 성적 입력 : 학생들의 성적을 입력
		 *   - 성적 수정 : 학생의 성적을 수정
		 *   - 석차 조회 : 전체 모두 조회(성적이 높은 학생부터 조회)
		 *    
		 *   
		 * 11. 학생 : 수강신청을 하며 수강 수업을 조회 및 성적을 조회할 수 있다
		 *   - 수강신청 : 과목수는 제한이 없으며, 학교 관리자가 만든 수업 중에서 시간이 겹치지 않게 수강해야 한다
		 *   - 수강 최소 : 수강한 수업의 이름을 입력해서 삭제한다
		 *   - 수강 수업 조회 : 수강한 수업들을 조회
		 *      수업 이름, 교수명, 요일, 시간대, 강의실, 수강인원/최대정원 순으로 조회한다
		 *   - 성적 조회 : 수업 이름 , 성적, 석차
		 *   
		 *  =================================================================================
		 *   
		 *   <필요한 클래스들>
		 *   
		 *   1. 학생 클래스(Student)
		 *      멤버 변수 : 학번(int classOf), 이름(String name), 과(String selection)
		 *      
		 *   2. 교수 클래스(Professor)
		 *      멤버 변수 : 교번(int classOf), 이름(String name), 과(String selection)
		 *      
		 *   3. 수업 클래스(Lesson)
		 *      멤버 변수 : 수업 이름(String subject), 교수 교번(int professor), 요일(String dayOfWeek), 시작 시간(int startTime), 종료 시간(int endTime),
		 *               강의실(int classroom), 최대정원(int max), 수강인원
		 *               # 수강인원은 변수가 아니라 scoreList의 size 로 다룬다
		 *               
		 *   4. 성적 클래스(Score)
		 *      멤버 변수 : 학번(classOf), 점수 리스트(pointList) 
		 *      # 점수 리스트는 학번에 해당하는 학생의 수강 리스트인 lessonList 의 순서와 대응한다
		 *      
		 *   5. 학교 클래스(School): 학교를 구성하거나 관련된 클래스들을 모두 관리하는 클래스
		 *      멤버 변수 : 교수 리스트, 학생 리스트, 수업 리스트, 수강 현황 리스트, 학생들의 성적 리스트
		 *               순서대로 이름은 professorList, studentList, lessonList, courseList, scoreList 이다.
		 *   
		 *   
		 *  ===================================================================================
		 * - 제출일 : 1월 26일. 상황봐서 변경될 수 있음.
		 * */	
		UniversityProgram up = new UniversityProgram();
		up.run();
	}
}