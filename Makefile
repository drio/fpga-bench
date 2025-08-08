
run: clean main
	./main

bench: clean main
	@for i in `seq 1 10`;do ./main; done

main: 
	#gcc sha256.c main.c -o main
	# -03: enable tons of optimizations including vectorization ... TODO
	# -march=native: 
	gcc -O3 -march=native sha256.c main.c -o main

clean: 
	rm -f main *.o
