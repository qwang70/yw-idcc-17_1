#!/usr/bin/env bash

# set variables
source ../settings.sh

# create output directories
mkdir -p $FACTS_DIR
mkdir -p $VIEWS_DIR
mkdir -p $RESULTS_DIR

# export YW model facts
$YW_CMD model $SCRIPT_DIR/SentimentAnalysis.R \
        -c extract.language=python \
        -c extract.factsfile=$FACTS_DIR/yw_extract_facts.P \
        -c model.factsfile=$FACTS_DIR/yw_model_facts.P \
        -c query.engine=xsb

# materialize views of YW facts
$QUERIES_DIR/materialize_yw_views.sh > $VIEWS_DIR/yw_views.P


# copy reconfacts.P  into facts folder
cp -f recon/reconfacts.P facts

# draw complete workflow graph
$QUERIES_DIR/render_complete_wf_graph.sh > $RESULTS_DIR/complete_wf_graph.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph.gv > $RESULTS_DIR/complete_wf_graph.pdf
dot -Tsvg $RESULTS_DIR/complete_wf_graph.gv > $RESULTS_DIR/complete_wf_graph.svg


# draw complete workflow graph with URI template
$YW_CMD graph $SCRIPT_DIR/SentimentAnalysis.R \
        -c graph.view=combined \
        -c graph.layout=tb \
        > $RESULTS_DIR/complete_wf_graph_uri.gv
dot -Tpdf $RESULTS_DIR/complete_wf_graph_uri.gv > $RESULTS_DIR/complete_wf_graph_uri.pdf
dot -Tsvg $RESULTS_DIR/complete_wf_graph_uri.gv > $RESULTS_DIR/complete_wf_graph_uri.svg


# list workflow outputs
$QUERIES_DIR/list_workflow_outputs.sh > $RESULTS_DIR/workflow_outputs.txt


##############
#   Q1_pro   #
##############

# draw worfklow graph upstream of Sentiment_Result
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'Sentiment_Result\' > $RESULTS_DIR/wf_upstream_of_Sentiment_Result.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_Sentiment_Result.gv > $RESULTS_DIR/wf_upstream_of_Sentiment_Result.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_Sentiment_Result.gv > $RESULTS_DIR/wf_upstream_of_Sentiment_Result.svg

# draw worfklow graph upstream of TweetRead
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'TweetRead\' > $RESULTS_DIR/wf_upstream_of_TweetRead.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_TweetRead.gv > $RESULTS_DIR/wf_upstream_of_TweetRead.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_TweetRead.gv > $RESULTS_DIR/wf_upstream_of_TweetRead.svg

# draw worfklow graph upstream of PositiveCount
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'PositiveCount\' > $RESULTS_DIR/wf_upstream_of_PositiveCount.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_PositiveCount.gv > $RESULTS_DIR/wf_upstream_of_PositiveCount.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_PositiveCount.gv > $RESULTS_DIR/wf_upstream_of_PositiveCount.svg

# draw worfklow graph upstream of NegativeCount
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'NegativeCount\' > $RESULTS_DIR/wf_upstream_of_NegativeCount.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_NegativeCount.gv > $RESULTS_DIR/wf_upstream_of_NegativeCount.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_NegativeCount.gv > $RESULTS_DIR/wf_upstream_of_NegativeCount.svg

# draw worfklow graph upstream of NeutralCount
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'NeutralCount\' > $RESULTS_DIR/wf_upstream_of_NeutralCount.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_NeutralCount.gv > $RESULTS_DIR/wf_upstream_of_NeutralCount.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_NeutralCount.gv > $RESULTS_DIR/wf_upstream_of_NeutralCount.svg

# draw worfklow graph upstream of Sizes
$QUERIES_DIR/render_wf_graph_upstream_of_data_q1.sh \'Sizes\' > $RESULTS_DIR/wf_upstream_of_Sizes.gv
dot -Tpdf $RESULTS_DIR/wf_upstream_of_Sizes.gv > $RESULTS_DIR/wf_upstream_of_Sizes.pdf
dot -Tsvg $RESULTS_DIR/wf_upstream_of_Sizes.gv > $RESULTS_DIR/wf_upstream_of_Sizes.svg


##############
#   Q2_pro   #
##############

# list workflow outputs
#$QUERIES_DIR/list_dependent_inputs_q2.sh > $RESULTS_DIR/#q2_pro_outputs.txt


# list script inputs upstream of output data Sentiment_Result
$QUERIES_DIR/list_inputs_upstream_of_data_q2.sh Sentiment_Result Sentiment_Result > $RESULTS_DIR/inputs_upstream_of_Sentiment_Result.txt


##############
#   Q3_pro   #
##############

# draw worfklow graph downstream of Static_Tweets
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'Static_Tweets\' > $RESULTS_DIR/wf_downstream_of_Static_Tweets.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_Static_Tweets.gv > $RESULTS_DIR/wf_downstream_of_Static_Tweets.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_Static_Tweets.gv > $RESULTS_DIR/wf_downstream_of_Static_Tweets.svg

# draw worfklow graph downstream of TweetRead
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'TweetRead\' > $RESULTS_DIR/wf_downstream_of_TweetRead.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_TweetRead.gv > $RESULTS_DIR/wf_downstream_of_TweetRead.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_TweetRead.gv > $RESULTS_DIR/wf_downstream_of_TweetRead.svg

# draw worfklow graph downstream of PositiveCount
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'PositiveCount\' > $RESULTS_DIR/wf_downstream_of_PositiveCount.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_PositiveCount.gv > $RESULTS_DIR/wf_downstream_of_PositiveCount.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_PositiveCount.gv > $RESULTS_DIR/wf_downstream_of_PositiveCount.svg

# draw worfklow graph downstream of NegativeCount
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'NegativeCount\' > $RESULTS_DIR/wf_downstream_of_NegativeCount.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_NegativeCount.gv > $RESULTS_DIR/wf_downstream_of_NegativeCount.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_NegativeCount.gv > $RESULTS_DIR/wf_downstream_of_NegativeCount.svg

# draw worfklow graph downstream of NeutralCount
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'NeutralCount\' > $RESULTS_DIR/wf_downstream_of_NeutralCount.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_NeutralCount.gv > $RESULTS_DIR/wf_downstream_of_NeutralCount.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_NeutralCount.gv > $RESULTS_DIR/wf_downstream_of_NeutralCount.svg

# draw worfklow graph downstream of Sizes
$QUERIES_DIR/render_wf_graph_downstream_of_data_q3.sh \'Sizes\' > $RESULTS_DIR/wf_downstream_of_Sizes.gv
dot -Tpdf $RESULTS_DIR/wf_downstream_of_Sizes.gv > $RESULTS_DIR/wf_downstream_of_Sizes.pdf
dot -Tsvg $RESULTS_DIR/wf_downstream_of_Sizes.gv > $RESULTS_DIR/wf_downstream_of_Sizes.svg


##############
#   Q4_pro   #
##############

# list workflow outputs
#$QUERIES_DIR/list_dependent_outputs_q4.sh > $RESULTS_DIR/q4_pro_outputs.txt

# list script outputs downstream of input data Static_Tweets
$QUERIES_DIR/list_outputs_downstream_of_data_q4.sh Static_Tweets Static_Tweets > $RESULTS_DIR/outputs_downstream_of_Static_Tweets.txt

##############
#   Q5_pro   #
##############

# draw recon worfklow graph upstream of Sentiment_Result
$QUERIES_DIR/render_wf_recon_graph_upstream_of_data_q5.sh \'Sentiment_Result\' > $RESULTS_DIR/wf_recon_upstream_of_Sentiment_Result.gv
dot -Tpdf $RESULTS_DIR/wf_recon_upstream_of_Sentiment_Result.gv > $RESULTS_DIR/wf_recon_upstream_of_Sentiment_Result.pdf
dot -Tsvg $RESULTS_DIR/wf_recon_upstream_of_Sentiment_Result.gv > $RESULTS_DIR/wf_recon_upstream_of_Sentiment_Result.svg

##############
#   Q6_pro   #
##############


# draw recon workflow graph with all observables

$QUERIES_DIR/render_recon_complete_wf_graph_q6.sh > $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv
dot -Tpdf $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv > $RESULTS_DIR/wf_recon_complete_graph_all_observables.pdf
dot -Tsvg $RESULTS_DIR/wf_recon_complete_graph_all_observables.gv > $RESULTS_DIR/wf_recon_complete_graph_all_observables.svg
