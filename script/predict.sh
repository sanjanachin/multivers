# Make model predictions.

function predict_rob_scifact() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/rob_data/sg/claims_test_retrieved.jsonl \
        --corpus_file=data/rob_data/sg/corpus.jsonl \
        --output_file=prediction/rob_data.jsonl
}

function predict_rob_scifact_exact_sentences() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/rob_data/sg/claims_test_retrieved_with_exact_sentences.jsonl \
        --corpus_file=data/rob_data/sg/corpus.jsonl \
        --output_file=prediction/rob_data_exact_sentences.jsonl
}
function predict_rob_d1_scifact_new_claims() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/rob_data/sg/claims_test_retrieved_new_claims.jsonl \
        --corpus_file=data/rob_data/sg/corpus.jsonl \
        --output_file=prediction/rob_data_new_claims.jsonl
}
function predict_rob_d2_scifact() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/rob_data/ac_domain_2/claims_test_retrieved.jsonl \
        --corpus_file=data/rob_data/ac_domain_2/corpus.jsonl \
        --output_file=prediction/ac_domain_2.jsonl
}
function predict_rob_d3_scifact() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/rob_data/incomplete_domain_3/claims_test_retrieved.jsonl \
        --corpus_file=data/rob_data/incomplete_domain_3/corpus.jsonl \
        --output_file=prediction/incomplete_domain_3.jsonl
}
function predict_scifact() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/scifact.ckpt \
        --input_file=data/scifact/claims_test_retrieved.jsonl \
        --corpus_file=data/scifact/corpus.jsonl \
        --output_file=prediction/scifact.jsonl
}

function predict_healthver() {
    python multivers/predict.py \
        --checkpoint_path=checkpoints/healthver.ckpt \
        --input_file=data/healthver/claims_test.jsonl \
        --corpus_file=data/healthver/corpus.jsonl \
        --output_file=prediction/healthver.jsonl
}

function predict_covidfact() {
    # NOTE: For covidfact, many of the claims are paper titles (or closely
    # related). To avoid data leakage for this dataset, we evaluate using a
    # version of the corpus with titles removed.
    python multivers/predict.py \
        --checkpoint_path=checkpoints/covidfact.ckpt \
        --input_file=data/covidfact/claims_test.jsonl \
        --corpus_file=data/covidfact/corpus_without_titles.jsonl \
        --output_file=prediction/covidfact.jsonl
}

########################################

model=$1

mkdir -p prediction

if [[ $model == "rob_scifact" ]]
then
    predict_rob_scifact
elif [[ $model == "rob_scifact_exact_sentences" ]]
then
    predict_rob_scifact_exact_sentences
elif [[ $model == "rob_d1_scifact_new_claims" ]]
then
    predict_rob_d1_scifact_new_claims
elif [[ $model == "rob_d2_scifact" ]]
then
    predict_rob_d2_scifact
elif [[ $model == "rob_d3_scifact" ]]
then
    predict_rob_d3_scifact
elif [[ $model == "scifact" ]]
then
    predict_scifact
elif [[ $model == "covidfact" ]]
then
    predict_covidfact
elif [[ $model == "healthver" ]]
then
    predict_healthver
else
    echo "Allowed options are: {scifact,covidfact,healthver}."
fi
