hassoc:
	ghc -o hassoc Main
	rm -rf *.hi *.o

optimised:
	ghc -o hassoc Main -O2
	rm -rf *.hi *.o
