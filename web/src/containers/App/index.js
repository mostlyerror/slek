// @flow
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Home from '../Home';
import NotFound from '../../components/NotFound';

const App = () => {
  return (
    <Switch>
        <Route exact path='/' component={Home} />
        <Route path="*" component={NotFound}/>
    </Switch>
  );
}

export default App;
