module BotDataTypes where

import Control.Monad.Reader  
import System.IO
import System.Time  
import Control.Concurrent.STM
import Database.HDBC
import Database.HDBC.Sqlite3 

type Net = ReaderT Bot IO

data Bot =  Bot {
                socket    :: Handle,
                startTime :: ClockTime,
                messages  :: TVar [String],
                db        :: Connection
            }
data User =
     User {
        userId   :: Integer,
        nick     :: String,
        lastSeen :: Integer
     }

data BotCommand = 
     BotCommand {
        cmdName  :: String,
        cmd      :: String -> String -> String -> Net ()
    }
