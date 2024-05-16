import weka.classifiers.functions.RBFClassifier;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {
    public static Instances getInstancesFrom(String filePath) throws IOException {
        CSVLoader loader = new CSVLoader();
        loader.setSource(new File(filePath));
        Instances instances = loader.getDataSet();
        return instances;
    }

    public static void main(String[] args) throws Exception {
        String[] pairs = {"ant/ant-1.3.csv.rbf.csv", "ant/ant-1.4.csv.rbf.csv",
                "ant/ant-1.4.csv.rbf.csv", "ant/ant-1.5.csv.rbf.csv",
                "ant/ant-1.5.csv.rbf.csv", "ant/ant-1.6.csv.rbf.csv",
                "ant/ant-1.6.csv.rbf.csv", "ant/ant-1.7.csv.rbf.csv",
                "camel/camel-1.0.csv.rbf.csv", "camel/camel-1.2.csv.rbf.csv",
                "camel/camel-1.2.csv.rbf.csv", "camel/camel-1.4.csv.rbf.csv",
                "camel/camel-1.4.csv.rbf.csv", "camel/camel-1.6.csv.rbf.csv",
                "ivy/ivy-1.0.csv.rbf.csv", "ivy/ivy-1.1.csv.rbf.csv",
                "ivy/ivy-1.1.csv.rbf.csv", "ivy/ivy-1.2.csv.rbf.csv",
                "jedit/jedit-3.2.csv.rbf.csv", "jedit/jedit-4.0.csv.rbf.csv",
                "jedit/jedit-4.0.csv.rbf.csv", "jedit/jedit-4.1.csv.rbf.csv",
                "jedit/jedit-4.1.csv.rbf.csv", "jedit/jedit-4.2.csv.rbf.csv",
                "jedit/jedit-4.2.csv.rbf.csv", "jedit/jedit-4.3.csv.rbf.csv",
                "log4j/log4j-1.0.csv.rbf.csv", "log4j/log4j-1.1.csv.rbf.csv",
                "log4j/log4j-1.1.csv.rbf.csv", "log4j/log4j-1.2.csv.rbf.csv",
                "lucene/lucene-2.0.csv.rbf.csv", "lucene/lucene-2.2.csv.rbf.csv",
                "lucene/lucene-2.2.csv.rbf.csv", "lucene/lucene-2.4.csv.rbf.csv",
                "poi/poi-1.5.csv.rbf.csv", "poi/poi-2.0.csv.rbf.csv",
                "poi/poi-2.0.csv.rbf.csv", "poi/poi-2.5.csv.rbf.csv",
                "poi/poi-2.5.csv.rbf.csv", "poi/poi-3.0.csv.rbf.csv",
                "synapse/synapse-1.0.csv.rbf.csv", "synapse/synapse-1.1.csv.rbf.csv",
                "synapse/synapse-1.1.csv.rbf.csv", "synapse/synapse-1.2.csv.rbf.csv",
                "velocity/velocity-1.4.csv.rbf.csv", "velocity/velocity-1.5.csv.rbf.csv",
                "velocity/velocity-1.5.csv.rbf.csv", "velocity/velocity-1.6.csv.rbf.csv",
                "xalan/xalan-2.4.csv.rbf.csv", "xalan/xalan-2.5.csv.rbf.csv",
                "xalan/xalan-2.5.csv.rbf.csv", "xalan/xalan-2.6.csv.rbf.csv",
                "xalan/xalan-2.6.csv.rbf.csv", "xalan/xalan-2.7.csv.rbf.csv",
                "xerces/xerces-1.1.csv.rbf.csv", "xerces/xerces-1.2.csv.rbf.csv",
                "xerces/xerces-1.2.csv.rbf.csv", "xerces/xerces-1.3.csv.rbf.csv",
                "xerces/xerces-1.3.csv.rbf.csv", "xerces/xerces-1.4.csv.rbf.csv"};
        String baseDir = "PROMISE_RBF/";
        String resultBaseDir = "PROMISE/";
        for (int j = 0; j < pairs.length; j += 2) {
            Instances train = getInstancesFrom(baseDir + pairs[j]);
            train.setClassIndex(train.numAttributes() - 1);
            Instances test = getInstancesFrom(baseDir + pairs[j + 1]);
            test.setClassIndex(train.numAttributes() - 1);
            RBFClassifier rbf = new RBFClassifier();
            rbf.buildClassifier(train);
            FileWriter writer = new FileWriter(resultBaseDir + pairs[j + 1] + ".rbf.score");
            for (int i = 0; i < test.numInstances(); ++i) {
                double sllabel = rbf.classifyInstance(test.instance(i));
                writer.write(((int)sllabel) + "\n");
            }
            writer.close();
        }
    }
}
