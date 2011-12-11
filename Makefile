
go: performance-graph.pdf
	xpdf performance-graph.pdf

performance-graph.pdf: performance-numbers.db gen-performance-graph
	./gen-performance-graph

.PRECIOUS: performance-numbers.db

performance-numbers.db: test-bloom-filter
	./this-pylint bloom_filter_mod.py test-bloom-filter
	rm -f seek.txt array.txt hybrid.txt mmap.txt
	/usr/local/pypy-1.6/bin/pypy ./test-bloom-filter
	#/usr/local/cpython-3.2/bin/python ./test-bloom-filter
	#/usr/local/cpython-2.5/bin/python ./test-bloom-filter
	#/usr/local/cpython-2.7/bin/python ./test-bloom-filter
	#/usr/local/cpython-3.0/bin/python ./test-bloom-filter
	#/usr/local/jython-2.5.2-r7288/bin/jython ./test-bloom-filter

clean:
	rm -f *.pyc *.class
	rm -rf __pycache__
	rm -f bloom-filter-rm-me
	rm -f *.ps *.pdf
	rm -f seek.txt array.txt

veryclean: clean
	rm -f performance-numbers.db
	