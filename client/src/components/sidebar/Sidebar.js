import React from 'react';
import { Avatar } from '@material-ui/core';
import WbSunnyIcon from '@material-ui/icons/WbSunny';

import './Sidebar.css';

const Sidebar = () => {
	return(
		<div className="sidebar">
			<div className="sidebar__logo">
				<p>Logo</p>
			</div>
			<div className="sidebar__bottom">
				<center>
					<WbSunnyIcon className="sidebar__icon" fontSize="large" />
				</center>
				
				<hr />
				<Avatar
					style={{ width: '3rem',  height: '3rem' }}
					alt="Person"
					src="/static/images/avatar/1.jpg" />
			</div>
		</div>
	);
}

export default Sidebar;