package com.hb.vo;

public class NaviVO {
      //1,3,4,7,10,11
      private int totalRecode = 0 ; //총 레코드 건수*
      private int totalPage = 0 ; //전체 페이지 수-
      
      private int nowPage = 0 ; //현재 보이는 페이지 넘버*
      private int recodesPerPage = 0 ; //한 페이지에 보여줄 건수*
      private int beginRecode = 0 ; //현재 페이지의 시작 행-
      private int endRecode = 0 ; //현재 페이지의 끝 행-
      
      private int pagesPerNavi = 0 ; //보여줄 페이지 링크*
      private int beginPage = 0 ; //시작 페이지 링크-
      private int endPage = 0 ; //끝 페이지 링크-
      
      private String url = "" ; //네비게이션이 사용되는 리스트 페이지 주소*
      private String pagingHtml = ""; // 페이징시 들어가는 인자 값*
      private String pagingStatus = "";    // 페이지 스테이터스-

      public int gettotalRecode() {
         return totalRecode;
      }
      public void settotalRecode(int totalRecode) {
         this.totalRecode = totalRecode;
      }
      public int getTotalPage() {
         return totalPage;
      }
      public void setTotalPage() {
         //전체 페이지의 값 = 전체 데이터 수 / 페이지 사이즈
         this.totalPage=this.totalRecode/this.recodesPerPage;
         int num = this.totalRecode%this.recodesPerPage;
         if(num != 0){
            this.totalPage += 1;
         }
      }
      public int getnowPage() {
         return nowPage;
      }
      public void setnowPage(int nowPage) {
         this.nowPage = nowPage;
      }
      public int getrecodesPerPage() {
         return recodesPerPage;
      }
      public void setrecodesPerPage(int recodesPerPage) {
         this.recodesPerPage = recodesPerPage;
      }
      public int getbeginRecode() {
         return beginRecode;
      }
      public void setbeginRecode() {
         //(이전 페이지의 넘버 * 한 페이지당 보여주는 건수) +1
         this.beginRecode = ((this.nowPage-1)*this.recodesPerPage)+1;
      }
      public int getendRecode() {
         return endRecode;
      }
      public void setendRecode() {
         //현재 페이지 넘버 * 한 페이지당 보여주는 건수
         this.endRecode = this.nowPage*this.recodesPerPage;
      }
      public int getpagesPerNavi() {
         return pagesPerNavi;
      }
      public void setpagesPerNavi(int pagesPerNavi) {
         this.pagesPerNavi = pagesPerNavi;
      }
      public int getBeginPage() {
         return beginPage;
      }
      public NaviVO() {
         super();
         // TODO Auto-generated constructor stub
      }
      public void setBeginPage() {
         if((this.nowPage%this.pagesPerNavi)==0){
         this.beginPage = 
               ((this.nowPage / this.pagesPerNavi)-1)*this.pagesPerNavi+1;
      
         }else{
            this.beginPage = 
                  (this.nowPage / this.pagesPerNavi)*this.pagesPerNavi+1;
         }
      }
      public int getEndPage() {
         return endPage;
      }
      public void setEndPage() {
         if((this.nowPage%this.pagesPerNavi)==0){
         this.endPage = 
               ((this.nowPage / this.pagesPerNavi))*this.pagesPerNavi;
         }else{
            this.endPage = 
            ((this.nowPage / this.pagesPerNavi)+1)*this.pagesPerNavi;
         }
            
      }
      public String getUrl() {
         return url;
      }
      public void setUrl(String url) {
         this.url = url;
      }
      public String getPagingHtml() {
         return pagingHtml;
      }
      public void setPagingHtml(String pagingHtml) {
         this.pagingHtml = pagingHtml;
      }
      public String getPagingStatus() {
         return pagingStatus;
      }
      public void setPagingStatus(String pagingStatus) {
         this.pagingStatus = pagingStatus;
      }
      public NaviVO(int totalRecode, int nowPage, int recodesPerPage,
            int pagesPerNavi, String url, String pagingHtml) {
         this.totalRecode = totalRecode;
         this.nowPage = nowPage;
         this.recodesPerPage = recodesPerPage;
         this.pagesPerNavi = pagesPerNavi;
         this.url = url;
         this.pagingHtml = pagingHtml;
      
         setTotalPage();
         setbeginRecode();
         setendRecode();
         setBeginPage();
         setEndPage();
      }
      
      
      

}

