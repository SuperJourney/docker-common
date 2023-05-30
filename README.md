# Docker环境

项目说明： 记录常用docker配置

- [ ] chrome
- [ ] elk
- [ ] etcd
- [X] frp
- [ ] grafana
- [X] home-assistant
- [ ] jaeger
- [ ] kafka
- [X] mariadb
- [ ] niginx
- [ ] phddns
- [X] redis-single
- [X] redis
- [ ] strongwan
- [X] ts
- [X] v2ray

## mariadb

## elk

![](https://img.shields.io/badge/docker-kibana-green?style=plastic&logo=docker)
![](https://img.shields.io/badge/docker-elasticsearch-green?style=plastic&logo=docker)
![](https://img.shields.io/badge/docker-apmserver-green?style=plastic&logo=docker)

> kabana地址： https://localhost:5601

### 访问kibana  'Kibana server is not ready yet'

```
一般是elasticsearch没有启动，比如说：*max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]*

由于我的环境是 wsl,所以启动wsl 在  /etc/sysctl.conf 文件最后一行加上
vm.max_map_count=262144
```

## grafana

![](https://img.shields.io/badge/docker-grafana-green?style=plastic&logo=docker)

> grafana地址： http://localhost:3000

> 导入mysql监控模板

> 导入redis监控模板
> https://grafana.com/api/dashboards/763/revisions/1/

## redis

Read [grafana redis](redis/README.md)

### 监控

- [X] etcd指标监控 https://etcd.io/docs/v3.4/metrics/
- [X] mysql指标监控 https://github.com/prometheus/mysqld_exporter
- [X] redis指标监控 https://github.com/oliver006/redis_exporter

## prometheus

### prometheus指标查询

[https://prometheus.io/](https://prometheus.io/)

| 类型   | query                                                | 意义               |
| :----- | :--------------------------------------------------- | :----------------- |
| mysqld | mysql_global_status_commands_total{command="insert"} | insert 总数        |
| mysqld | rate(mysql_global_status_threads_connected[2m])      | 当前总连接数       |
| mysqld | mysql_global_status_threads_running                  | 正在运行的查询连接 |
| mysqld | mysql_global_status_aborted_connects                 | 拒绝连接数         |
| mysqld | mysql_global_status_connection_errors_total          | 服务器错误         |
| redis  | redis_uptime_in_seconds                              | 服务器运行总时长   |
| redis  |                                                      | redis运行内存      |

kafka docker部署参考 wurstmeister/kafka-docker [^1][1]


## jaeger

```
	"github.com/uber/jaeger-client-go"
	"github.com/uber/jaeger-client-go/config"
	"github.com/uber/jaeger-lib/metrics"
```

## frp

https://github.com/fatedier/frp

### ~phddns 花生壳~

 ~不支持web方式i访问。 放弃了~

---

[1]: https://github.com/wurstmeister/kafka-docker
