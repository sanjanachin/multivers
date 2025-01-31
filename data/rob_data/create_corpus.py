import os
import json

# change this file path 
dir = "/Users/sanjanachintalapati/IdeaProjects/rob/annotated_sentences/AC_new" 

corpus = []

for filename in os.listdir(dir):
    if not filename.endswith(".json"):
        continue
    with open(os.path.join(dir, filename), 'r') as f:
        print("path: ", os.path.join(dir, filename))
        paper = json.load(f)
        doc_id = int(paper["doc_id"])
        title = "title"
        abstract = paper["sentences"]
        corpus.append({"doc_id": doc_id, "title": title, "abstract": abstract, "structured": False})

# change this file path 
with open("ac_domain_2/corpus.jsonl", 'w') as f:
    for item in corpus:
        f.write(json.dumps(item) + "\n")