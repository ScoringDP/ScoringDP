pairs = ["ant/ant-1.3.csv", "ant/ant-1.4.csv";
        "ant/ant-1.4.csv", "ant/ant-1.5.csv";
        "ant/ant-1.5.csv", "ant/ant-1.6.csv";
        "ant/ant-1.6.csv", "ant/ant-1.7.csv";
        "camel/camel-1.0.csv", "camel/camel-1.2.csv";
        "camel/camel-1.2.csv", "camel/camel-1.4.csv";
        "camel/camel-1.4.csv", "camel/camel-1.6.csv";
        "ivy/ivy-1.0.csv", "ivy/ivy-1.1.csv";
        "ivy/ivy-1.1.csv", "ivy/ivy-1.2.csv";
        "jedit/jedit-3.2.csv", "jedit/jedit-4.0.csv";
        "jedit/jedit-4.0.csv", "jedit/jedit-4.1.csv";
        "jedit/jedit-4.1.csv", "jedit/jedit-4.2.csv";
        "jedit/jedit-4.2.csv", "jedit/jedit-4.3.csv";
        "log4j/log4j-1.0.csv", "log4j/log4j-1.1.csv";
        "log4j/log4j-1.1.csv", "log4j/log4j-1.2.csv";
        "lucene/lucene-2.0.csv", "lucene/lucene-2.2.csv";
        "lucene/lucene-2.2.csv", "lucene/lucene-2.4.csv";
        "poi/poi-1.5.csv", "poi/poi-2.0.csv";
        "poi/poi-2.0.csv", "poi/poi-2.5.csv";
        "poi/poi-2.5.csv", "poi/poi-3.0.csv";
        "synapse/synapse-1.0.csv", "synapse/synapse-1.1.csv";
        "synapse/synapse-1.1.csv", "synapse/synapse-1.2.csv";
        "velocity/velocity-1.4.csv", "velocity/velocity-1.5.csv";
        "velocity/velocity-1.5.csv", "velocity/velocity-1.6.csv";
        "xalan/xalan-2.4.csv", "xalan/xalan-2.5.csv";
        "xalan/xalan-2.5.csv", "xalan/xalan-2.6.csv";
        "xalan/xalan-2.6.csv", "xalan/xalan-2.7.csv";
        "xerces/xerces-1.1.csv", "xerces/xerces-1.2.csv";
        "xerces/xerces-1.2.csv", "xerces/xerces-1.3.csv";
        "xerces/xerces-1.3.csv", "xerces/xerces-1.4.csv"];

for i = 1:30
    fprintf('%s\t',pairs(i,2));
    train_file = "PROMISE/" + pairs(i,1);
    test_file = "PROMISE/" + pairs(i,2);
    run('./run_glm.m')
end