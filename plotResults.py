import csv
import matplotlib.pyplot as plt
from typing import NamedTuple
import os

class ModelStruct(NamedTuple):
    path: str
    color: str
    marker: str

hstate = 5
dictModel = {}
dictModel['DHMM+KMEANS({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - DHMM+KMEANS, state-5).csv', 'blue', 's' )
dictModel['HMM({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - HMM, state-5).csv', 'green', '+')
dictModel['NPMPGM_SOM({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - NPMPGM_SOM, state-5).csv', 'orange', 'h')
dictModel['NPMPGM_KMEANS-S0({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - NPMPGM_KMEANS-S0, state-5).csv', 'red', 'o')
dictModel['NPMPGM_KMEANS-S1({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - NPMPGM_KMEANS-S1, state-5).csv', 'black', 'v')
dictModel['NPMPGM_EM({st})'.format(st = hstate)] = ModelStruct('AccuracySeq(model - NPMPGM_EM, state-5).csv', 'yellow', '*')
dictModel['KNN'] = ModelStruct('AccuracySeq(model - KNN, state-5).csv', 'magenta', 'p')
dictModel['MLSTM-FCN'] = ModelStruct('AccuracySeq(model - MLSTM-FCN).csv', 'cyan', 'x')

dataSetName = set()
dictAccuracySeqByModel = {}
axisX  = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
                        17, 18, 19, 20, 21, 22, 23, 24, 25]



for modelName in dictModel:
    dictAccuracySeq = {}
    with open(dictModel[modelName].path) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            acc = []
            for i in axisX:
                acc.append(float(row[str(i)]))
            dictAccuracySeq[row['NameDataSet']] = acc
            dataSetName.add(row['NameDataSet'])
    dictAccuracySeqByModel[modelName] = dictAccuracySeq

for dsName in dataSetName:
    for modelName in dictModel:
        if dsName in dictAccuracySeqByModel[modelName]:
            plt.plot(axisX, dictAccuracySeqByModel[modelName][dsName], '-' + dictModel[modelName].marker + 'k',
                     color=dictModel[modelName].color, label = modelName)
    plt.title(dsName)
    plt.xticks(axisX, axisX)
    plt.xlabel("Количество экземпляров обучающей выборки")
    plt.ylabel("Точность")
    plt.legend()
    folder = './resultAccuracyImageState{st}/'.format(st = hstate)
    if not os.path.exists(folder):
        os.makedirs(folder)
    plt.savefig(folder + dsName + '.png')
    plt.clf()