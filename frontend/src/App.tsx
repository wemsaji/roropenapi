import { useState } from 'react'
import './App.css'
import { RailsApiClient, User } from './generated'

const railsApiClientOption = { HEADERS: { accept: 'text/plain' } };
export const railsApi = new RailsApiClient(railsApiClientOption);

function App() {
  const [user, setUser] = useState<User>();
  const getUser = async () => {
    setUser(await railsApi.user.getUserByName('dummy'));
  };
  return (
    <>
      <button onClick={getUser}>getUser</button>
      {user && <div>
        <div>{user.firstName}</div>
        <div>{user.lastName}</div>
      </div>}
    </>
  )
}

export default App
