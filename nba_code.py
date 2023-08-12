import os

import mysql.connector
from tkinter import *
import tkinter as tk

root = tk.Tk()

canvas1 = tk.Canvas(root, width=500, height=500, relief='raised')
canvas1.pack()

label1 = tk.Label(root, text='NBA Database - Query Wizard')
label1.config(font=('helvetica', 14))
canvas1.create_window(250, 25, window=label1)

mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="CS425SQL!2023",
    database="nbadb"
)
mycursor = mydb.cursor()


# query fns

def openNewWindow():
    # Toplevel object which will
    # be treated as a new window
    newWindow = Toplevel(root)

    # sets the title of the
    # Toplevel widget
    newWindow.title("New Window")

    # sets the geometry of toplevel
    newWindow.geometry("200x200")

    # A Label widget to show in toplevel
    Label(newWindow,
          text="This is a new window").pack()


# --1--
def query1():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT LastName, FirstName, Stat.GS as \"Games Started\" "
        "FROM Player, Stat WHERE Player.PlayerID = Stat.PlayerID "
        "ORDER BY Stat.GS DESC;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --2--
def query2():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Player.FirstName, Player.LastName, Stat.PTS/Stat.GP AS PPG "
        "FROM Player, Stat "
        "WHERE PLAYER.PlayerID = Stat.PlayerID ORDER BY PPG DESC;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --3--
def query3():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT p.TITLE AS Position, round(AVG(s.FG) * 100, 2) "
        "AS Avg_FG_Percentage "
        "FROM Stat s "
        "JOIN Plays pl ON s.PlayerID = pl.PlayerID JOIN Player_Position p "
        "ON pl.PositionID = p.PositionID GROUP BY p.TITLE "
        "ORDER BY Avg_FG_Percentage DESC;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --4--
def query4():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Person.Name, Stat.BLK "
        "FROM Person, Player, Stat "
        "WHERE Person.PlayerID = Player.PlayerID "
        "AND Player.PlayerID = Stat.PlayerID AND Stat.BLK >= 50;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --5--
def query5():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Person.Name, Stat.FG "
        "FROM Person, Player, Stat "
        "WHERE Person.PlayerID = Player.PlayerID "
        "AND Player.PlayerID = Stat.PlayerID "
        "AND Stat.FG >= 0.5 ORDER BY Stat.FG DESC;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --6--
def query6():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Person.Name, Stat.AST, Stat.Turnover, Round(Stat.AST/Stat.Turnover, 2) "
        "AS ASTRatio FROM Person, Player, Stat "
        "WHERE Person.PlayerID = Player.PlayerID "
        "AND Player.PlayerID = Stat.PlayerID AND Stat.Turnover > 0 ORDER BY ASTRatio DESC;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --7--
def query7():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT p1.FIRSTNAME "
        "AS Player1_FirstName, p1.LASTNAME AS Player1_LastName, p2.FIRSTNAME "
        "AS Player2_FirstName, p2.LASTNAME AS Player2_LastName, pc.College "
        "AS College_Attended FROM Player_College pc JOIN Player p1 "
        "ON pc.PlayerID = p1.PlayerID JOIN Player p2 "
        "ON pc.College = (SELECT College FROM Player_College WHERE PlayerID = p2.PlayerID) "
        "WHERE p1.PlayerID < p2.PlayerID;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")


# --8--
def query8():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Player.*, Stat.pts,RANK() OVER (ORDER BY Stat.pts DESC) "
        "AS 'Rank',DENSE_RANK() OVER (ORDER BY Stat.pts DESC) AS DenseRank "
        "FROM Stat, Player WHERE Stat.PlayerID = Player.PlayerID; "
        "FROM Player_College WHERE PlayerID = p2.PlayerID) "
        "WHERE p1.PlayerID < p2.PlayerID;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --9--
def query9():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Team.Arena_Name as \"Shared Arena\" FROM Team "
        "GROUP BY Team.Arena_Name HAVING COUNT(*) > 1;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --10--
def query10():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT Player.*, Stat.pts,ROW_NUMBER() OVER (ORDER BY Stat.pts DESC) "
        "AS RowNumber FROM Stat, Player WHERE Stat.PlayerID = Player.PlayerID;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --11--
def query11():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT FirstName, LastName FROM Player "
        "WHERE TeamID IN (SELECT TeamID FROM Team "
        "WHERE TEAM_NAME = 'Los Angeles Lakers');")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --12--
def query12():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT t.Team_Name, d.Div_Name"
        " AS Div_Name, p.FirstName, p.LastName, s.PTS, s.AST "
        "FROM Team t JOIN (SELECT PlayerID, RANK() OVER "
        "(PARTITION BY PlayerID ORDER BY PTS DESC) AS RANKS, PTS, AST "
        "FROM Stat) s ON t.TeamID = s.PlayerID AND s.RANKS = 1 "
        "JOIN Player p ON s.PlayerID = p.PlayerID JOIN Conference_Division cd "
        "ON t.TeamID = cd.CDID JOIN Division d ON cd.DivID = d.DivID;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

# --13--
def query13():
    mydb.reconnect()
    mycursor = mydb.cursor()
    mycursor.execute(
        "SELECT FirstName, LastName, PTS, "
        "ROUND(CUME_DIST() OVER (ORDER BY PTS), 2) "
        "AS Cumulative_Dist, RANK() OVER (ORDER BY PTS) "
        "AS \"Rank\" FROM Stat, Player "
        "WHERE Stat.PlayerID = Player.PlayerID;")
    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)
    mycursor.close()
    print("--------------------------------")

def clear_it():
    os.system('cls' if os.name == 'nt' else 'clear')


# buttons
# button0 = tk.Button(text='[New Window]', command=openNewWindow, bg='brown', fg='white',
#                     font=('helvetica', 9, 'bold'))
# canvas1.create_window(250, 50, window=button0)


button1 = tk.Button(text='Players with Most Games Started', command=query1, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 80, window=button1)

button2 = tk.Button(text='Players with top PPG in descending order', command=query2, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 110, window=button2)

button3 = tk.Button(text='Top Avg FG% per Position', command=query3, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 140, window=button3)

button4 = tk.Button(text='Players with blocks that are greater than 50', command=query4, bg='brown',
                    fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 170, window=button4)

button5 = tk.Button(text='Most efficient shooters (FG% above 50)', command=query5, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 200, window=button5)

button6 = tk.Button(text='Players with high assist-to-turnover ratios', command=query6, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 230, window=button6)

button7 = tk.Button(text='Players that went to the same college or no college', command=query7, bg='brown',
                    fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 260, window=button7)

button8 = tk.Button(text='The rank and dense rank of each player', command=query8, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 290, window=button8)

button9 = tk.Button(text='Arenas used by multiple teams', command=query9, bg='brown', fg='white',
                    font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 320, window=button9)

button10 = tk.Button(text='The row number of each player based on the number of points they have scored',
                     command=query10, bg='brown', fg='white',
                     font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 350, window=button10)

button11 = tk.Button(text='The name of the players who belong to the Log Angeles Lakers',
                     command=query11, bg='brown', fg='white',
                     font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 380, window=button11)

button12 = tk.Button(text='The top players of each division',
                     command=query12, bg='brown', fg='white',
                     font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 410, window=button12)

button13 = tk.Button(text='Retrieve each players name, pts, and cume_dist based on rank',
                     command=query13, bg='brown', fg='white',
                     font=('helvetica', 9, 'bold'))
canvas1.create_window(250, 440, window=button13)

# button14 = tk.Button(text='clear',
#                      command=clear_it, bg='white', fg='brown',
#                      font=('helvetica', 9, 'bold'))
# canvas1.create_window(250, 470, window=button14)

root.mainloop()
my_w = tk.Tk()
my_w.geometry("400x250")
