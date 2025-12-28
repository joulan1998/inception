all:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
	rm -dr /Users/ael-garr/data/wordpress_data/*
	rm -dr /Users/ael-garr/data/mariadb_data/*

re: clean all