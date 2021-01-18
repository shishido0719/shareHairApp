import React from "react";

class HeaderPopupMenu extends React.Component {
  
  constructor(props){
    super(props);
    this.state = {isLoggedIn: this.props.logged_in_state};
  }
  
  render () {
    let logIn;
    if (this.state.isLoggedIn) {
      logIn=(<p class="logout">ログアウト</p>);
      
    }else{
      logIn=(<p class="login">ログイン</p>);
    }
    return (
      <React.Fragment>
      	<div id="gbl_header_mycontent">
      		<div class="container">
      			<div class="user">
      				<ul>
      					<li><a href="/member/">マイページ</a></li>
      					<li><a href="/member/feed/">タイムライン</a></li>
      					<li><a href="/member/analytics/">アクティビティレポート</a></li>
      					<li><a href="/member/edit/">基本設定</a></li>
      				</ul>
      				{logIn}
      			</div>
      		</div>
      	</div>
    	</React.Fragment>
    );
  }
}

export default HeaderPopupMenu
