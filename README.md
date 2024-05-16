# ScoringDP
This repository contains the source code of the paper with the title **An Expectation-Based Scoring Approach for Explainable Software Defect Prediction**.

## Abstract
Explainability is a crucial aspect of practical defect prediction. Recently, model-agnostic explanation methods like LIME have been employed to explain individual predictions made by defect prediction models, providing the importance of each feature to a single prediction. However, the provided explanations are often inaccurate and even misleading. To this end, we propose an interpretable scoring approach for effort-aware defect prediction, named ScoringDP, to enhance the explainability of defect prediction. ScoringDP ranks software modules based on the scores assigned to them, which reflect their defect densities. The score of a module is calculated by adding up the scores assigned to its features, and each feature score represents the deviation between two values indicated by the corresponding feature value: the actual defect ratio and the expected defect ratio, which are statistically derived based on a defect dataset. For a given prediction, these feature scores directly serve as feature importances to the prediction, i.e., the explanations provided by ScoringDP are directly derived from its internal decision-making process. Such expectation-based direct explanations are more tangible for developers compared to post-hoc explanations resulting from model-agnostic explanation methods. Besides, ScoringDP outperforms or equals the state-of-the-art method for effort-aware defect prediction regarding most (4/7) performance metrics.

## File structure
This repository is structured as follows:

- ScoringDP
  > source code for ScoringDP 
- LTR-linear
  > source code for baseline approach LTR-linear
- RBFNet
  > source code for baseline approach RBFNet

## How to use ScoringDP for a new project?
1. Construct a dataset using the history data of the project under consideration
2. Compute defect scores for each source file within the project using ScoringDP based on the constructed dataset
3. Rank the source files within the project according to the computed scores, and prioritize inspecting the source files ranked at the top
4. For the source files ranked at the top, understand the reasons for their high defect-proneness based on their defect scores of features and then modify their code to reduce their defect-proneness
