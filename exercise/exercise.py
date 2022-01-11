import networkx as nx

data = [
    [131, 673, 234, 103, 18],
    [201, 96, 342, 965, 150],
    [630, 803, 746, 422, 111],
    [537, 699, 497, 121, 956],
    [805, 732, 524, 37, 331]
]

lines = []
with open('matrix.txt') as f:
    lines = f.read().splitlines()
f.close()

data = list(map(lambda line: list(map(lambda x: int(x), line.split(','))), lines))

g = nx.DiGraph()

for row_id, row in enumerate(data, start=0):
    for el_id, el in enumerate(row, start=0):
        g.add_node((row_id, el_id))
        if el_id > 0:
            g.add_edge((row_id, el_id-1), (row_id, el_id), weight=data[row_id][el_id])

        if row_id > 0:
            g.add_edge((row_id-1, el_id), (row_id, el_id), weight=data[row_id][el_id])


p = nx.dijkstra_path_length(g, source=(0, 0), target=(4, 4))

print(p + data[0][0])