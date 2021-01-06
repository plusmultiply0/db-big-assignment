# DB大作业 web部分
### 如何使用本项目
1. 下载项目文件
    ```
        下载zip文件或者
        git clone https://github.com/plusmultiply0/db-big-assignment.git
    ```
2. 安装虚拟环境(web目录下的命令行)
    ```bash
    python -m venv dbVenv     # 创建虚拟环境
    testVenv\scripts\activate #激活虚拟环境 in cmd
    ```
3. 初始化项目(激活虚拟环境后)
    ```bash
    pip install -r requirements.txt #根据依赖表安装
    ```
4. 新建隐私环境变量文件
    web文件夹下，新建一个名为.env的文件夹
    然后，填入如下的内容
    ```
    DATABASE_URL=mysql+pymysql://root:123456@localhost:3306/webdb
    ```
    - root对应mysql用户名
    - 123456对应于mysql密码
    - 3306对应登录端口
    - webdb是database的名字，需提前建好空的
5. 运行项目
    ```bash
    # 初始化数据库
    flask initdb
    # 往数据库填充数据
    flask build
    # 运行项目于 http://127.0.0.1:5000/
    flask run
    ```
