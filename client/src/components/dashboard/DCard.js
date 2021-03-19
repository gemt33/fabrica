import React from 'react';
import { Grid, Paper } from '@material-ui/core';
import NavigateNextIcon from '@material-ui/icons/NavigateNext';

import './Dashboard.css';

const DCard = () => {
	return(
		<Paper style={{ marginBottom: '1rem'}}>
            <Grid container spacing={1}>
                <Grid item xs={2}>
                    <p className="dashboard__textBold">#T39si</p>
                </Grid>
                <Grid item xs={3}>
                    <p className="dashboard__text">Due 19 Aug 2021</p>
                </Grid>
                <Grid item xs={2}>
                    <p className="dashboard__text">Bob Doe</p>
                </Grid>
                <Grid item xs={2}>
                    <p className="dashboard__textBold">$1,200</p>
                </Grid>
                <Grid item xs={2}>
                    <p className="dashboard__textborder">* Paid</p>
                </Grid>
                <Grid item xs={1}>
                    <NavigateNextIcon style={{ marginTop: '5px', color: '#1d66db', float: 'right'}}  />
                </Grid>
            </Grid>
        </Paper>
	)
}

export default DCard;