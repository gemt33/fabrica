import React from 'react';

import Sidebar from './sidebar/Sidebar';

const Dashboard = () => {
	return(
		<div className="dashboard">
			<Sidebar />
			<div>
				<h1>Dashboard</h1>
			</div>
			
		</div>
		
	)
}

export default Dashboard;