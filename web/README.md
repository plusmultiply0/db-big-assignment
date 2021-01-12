# DB大作业 web部分
> 简单实现一下数据库大作业的web部分，使用 flask 框架实现。
>
>实现了部分功能，代码仅供参考。
>
> 实现功能：
>   - 歌迷可以输入用户名和密码登录（只检测用户名是否存在）
>   - 歌迷可以删除喜欢的乐队、歌手、专辑、歌曲等
>   - 歌迷/不登录都可以查看所有的乐队、歌手、专辑、歌曲详细信息
>   - 显示某歌迷页面，他所喜欢的乐队、歌手、专辑、歌曲，可以点开每一行查看详细信息
>
>主要是提供一个在线地址用于浏览代码和项目:P
## 项目结构
```
web/                               #项目文件夹名
    dbvenv/                         #虚拟环境，用于管理依赖
    fanpage/                        #项目包文件|包名
        templates/                      #模板文件夹
            allthings.html                  #显示汇总/全部信息页的模板
            base.html                       #所有页面的基础模板
            detailthings.html               #显示详细信息的模板
            index.html                      #主页模板
            login.html                      #登录页模板
            macros.html                     #宏，模板函数，可以重复利用模板
        __init__.py                     #fanpage的入口文件
        commands.py                     #定义flask命令
        forms.py                        #定义表单
        models.py                       #定义数据库模型
        requirements.txt                #依赖文件
        settings.py                     #项目设置文件
        views.py                        #视图函数
    截图/                            #项目运行截图
    .env                            #私有环境变量
    .flaskenv                       #flask环境变量
    .gitignore                      #不提交到git的文件
    README.md                       #项目自述/介绍文件
```
## 如何使用本项目
1. 下载项目文件
    ```
    点击中间偏右侧的 绿色code按钮 下载zip文件或者使用命令下载
    git clone https://github.com/plusmultiply0/db-big-assignment.git （需要先安装好Git）
    ```
2. 安装虚拟环境(web目录下的命令行)
    ```bash
    python -m venv dbVenv     #创建虚拟环境，需要提前在系统上安装配置好 Python
    dbVenv\scripts\activate   #激活虚拟环境 in cmd
    ```
3. 初始化项目(激活虚拟环境后，在fanpage目录下)
    ```bash
    pip install -r requirements.txt #根据依赖表安装，建议安装前切换国内镜像源
    ```
4. 新建隐私环境变量文件
    web文件夹下，新建一个名为 .env 的文件。然后，填入如下的内容
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
    # 运行项目于 http://127.0.0.1:5000/（打开浏览器输入此地址，就可以看到）
    flask run
    ```
## 最后
按照此 README 的操作指示，应该是能成功跑起来的;)

有问题欢迎提 [issue](https://github.com/plusmultiply0/db-big-assignment/issues) 或者 [email](kimzhou36@foxmail.com)

觉得做的还可以的话，麻烦右上角点一下star:star:
