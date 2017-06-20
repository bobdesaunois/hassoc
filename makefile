hassoc:
	ghc -o hassoc Main -fforce-recomp
	rm -rf *.hi *.o

optimised:
	ghc -o hassoc Main -O2 -fforce-recomp
	rm -rf *.hi *.o
