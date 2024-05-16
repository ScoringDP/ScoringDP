import pandas as pd
import csv
import bisect

baseDir = 'PROMISE/'
baseCol = 'loc'
bugCol = 'bug'
threshold = 0.2

def is_value_in_list(value, sorted_list):
    index_left = bisect.bisect_left(sorted_list, value)
    index_right = bisect.bisect_right(sorted_list, value)
    return index_left != index_right


def count(df, col, lower_bound, upper_bound):
    filtered_df = df[(df[col] >= lower_bound) & (df[col] <= upper_bound)]
    sum_bug = filtered_df[bugCol].sum()
    sum_line = filtered_df[baseCol].sum()
    return sum_bug, sum_line


def minMax(df, col, cur, list):
    all_bug = df[bugCol].sum()
    all_line = df[baseCol].sum()

    start_index = bisect.bisect_left(list, cur)
    if is_value_in_list(cur, list):
        end_index = start_index
    elif start_index == len(list):
        start_index = start_index - 1
        end_index = start_index
    elif start_index == 0:
        start_index = 0
        end_index = 0
    else:
        start_index = start_index - 1
        end_index = start_index + 1

    while True:
        sum_bug, sum_line = count(df, col, list[start_index], list[end_index])
        if start_index == 0 or end_index == len(list) - 1:
            if sum_line >= all_line * threshold * 0.5:
                return start_index, end_index, list[start_index], cur, list[
                    end_index], sum_bug / all_bug, sum_line / all_line, sum_bug / all_bug - sum_line / all_line
        else:
            if sum_line >= all_line * threshold:
                return start_index, end_index, list[start_index], cur, list[
                    end_index], sum_bug / all_bug, sum_line / all_line, sum_bug / all_bug - sum_line / all_line

        if (abs(list[start_index] - cur) - abs(list[end_index] - cur) <= 0 and start_index > 0) or end_index == len(list) - 1:
            start_index -= 1
        else:
            end_index += 1


def obtainBaseData(source_file, target_file):
    sourceDf = pd.read_csv(source_file)
    targetDf = pd.read_csv(target_file)
    columns = sourceDf.columns.to_list()
    columns.remove('name')
    columns.remove('bug')
    col_list = {}
    for col in columns:
        col_list[col] = sorted(list(set(sourceDf[col].to_list())))

    with open(target_file + '.my.' + str(int(threshold * 100)) + '.metric.loc.score', mode='w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        for index, row in targetDf.iterrows():
            score = []
            for col in columns:
                res = minMax(sourceDf, col, row[col], col_list[col])
                score += [res[-1]]
            print(score + [sum(score)])
            csv_writer.writerow(score + [sum(score)])


if __name__ == '__main__':
    pairs = [
    ["ant/ant-1.3.csv", "ant/ant-1.4.csv"],
    ["ant/ant-1.4.csv", "ant/ant-1.5.csv"],
    ["ant/ant-1.5.csv", "ant/ant-1.6.csv"],
    ["ant/ant-1.6.csv", "ant/ant-1.7.csv"],
    ["camel/camel-1.0.csv", "camel/camel-1.2.csv"],
    ["camel/camel-1.2.csv", "camel/camel-1.4.csv"],
    ["camel/camel-1.4.csv", "camel/camel-1.6.csv"],
    ["ivy/ivy-1.0.csv", "ivy/ivy-1.1.csv"],
    ["ivy/ivy-1.1.csv", "ivy/ivy-1.2.csv"],
    ["jedit/jedit-3.2.csv", "jedit/jedit-4.0.csv"],
    ["jedit/jedit-4.0.csv", "jedit/jedit-4.1.csv"],
    ["jedit/jedit-4.1.csv", "jedit/jedit-4.2.csv"],
    ["jedit/jedit-4.2.csv", "jedit/jedit-4.3.csv"],
    ["log4j/log4j-1.0.csv", "log4j/log4j-1.1.csv"],
    ["log4j/log4j-1.1.csv", "log4j/log4j-1.2.csv"],
    ["lucene/lucene-2.0.csv", "lucene/lucene-2.2.csv"],
    ["lucene/lucene-2.2.csv", "lucene/lucene-2.4.csv"],
    ["poi/poi-1.5.csv", "poi/poi-2.0.csv"],
    ["poi/poi-2.0.csv", "poi/poi-2.5.csv"],
    ["poi/poi-2.5.csv", "poi/poi-3.0.csv"],
    ["synapse/synapse-1.0.csv", "synapse/synapse-1.1.csv"],
    ["synapse/synapse-1.1.csv", "synapse/synapse-1.2.csv"],
    ["velocity/velocity-1.4.csv", "velocity/velocity-1.5.csv"],
    ["velocity/velocity-1.5.csv", "velocity/velocity-1.6.csv"],
    ["xalan/xalan-2.4.csv", "xalan/xalan-2.5.csv"],
    ["xalan/xalan-2.5.csv", "xalan/xalan-2.6.csv"],
    ["xalan/xalan-2.6.csv", "xalan/xalan-2.7.csv"],
    ["xerces/xerces-1.1.csv", "xerces/xerces-1.2.csv"],
    ["xerces/xerces-1.2.csv", "xerces/xerces-1.3.csv"],
    ["xerces/xerces-1.3.csv", "xerces/xerces-1.4.csv"]]
    for pair in pairs:
        obtainBaseData(baseDir + pair[0], baseDir + pair[1])







