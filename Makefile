
run: clean main
	./main

bench: clean main
	@for i in `seq 1 10`;do ./main; done

main: 
	gcc sha256.c main.c -o main

clean: 
	rm -f main *.o
