import pyodbc
from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI()

# Cấu hình kết nối
server = 'COGAINAMAY\SQLEXPRESS01'  # Tên hoặc địa chỉ IP của server SQL
database = 'DEMO_IOT'  # Tên cơ sở dữ liệu

# Chuỗi kết nối sử dụng xác thực Windows
connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes;'


class InputData(BaseModel):
    id: int
    name: str
    sl: int


@app.get("/data", response_model=List[InputData])
async def get_data():
    try:
        connection = pyodbc.connect(connection_string)
        cursor = connection.cursor()

        cursor.execute("SELECT SID, Name, Unit FROM Sensor;")
        rows = cursor.fetchall()

        # Chuyển đổi kết quả truy vấn thành danh sách các đối tượng InputData
        data = []
        for row in rows:
            item = InputData(id=row[0], name=row[1], sl=row[2])
            data.append(item)

        return data

    except pyodbc.Error as e:
        print("Lỗi pyodbc:", e)
        return []

    except Exception as e:
        print("Lỗi khác:", e)
        return []

    finally:
        if connection:
            connection.close()


if __name__ == "__main__":
    import uvicorn

    uvicorn.run(app, host="127.0.0.1", port=8000)