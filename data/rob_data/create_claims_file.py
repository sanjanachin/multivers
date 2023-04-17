# first, create a claims file with the relevant claims for the domain, each of their ids, and an empty list called "doc_ids", then run this script to populate the doc ids

import os 
import json 

# change this path to the claims file with unpopulated doc ids 
claims_file = "/Users/sanjanachintalapati/IdeaProjects/rob/spring/multivers/data/rob_data/incomplete_domain_3/claims_test_retrieved.jsonl"

# change this to the corpus file for the specific domain 
corpus_file = "/Users/sanjanachintalapati/IdeaProjects/rob/spring/multivers/data/rob_data/incomplete_domain_3/corpus.jsonl"

doc_ids = []
with open(corpus_file, 'r') as f:
    for paper in f:
        paper = json.loads(paper)
        print("paper id: ", paper["doc_id"])
        doc_id = int(paper["doc_id"])
        doc_ids.append(doc_id)

new_claims = []
with open (claims_file, 'r') as f:
    for claim in f:
        claim = json.loads(claim)
        new_claims.append({"claim": claim["claim"], "id": claim["id"], "doc_ids": doc_ids})

with open(claims_file, 'w') as f:
    for item in new_claims:
        f.write(json.dumps(item) + "\n")