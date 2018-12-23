## 1. How would you define Machine Learning?
> * A: Machine Learning 是关于构建可以从数据中学习的系统。学习意味着针对某个任务，和给定衡量性能的方法，通过不断的更新，机器或程序能够在这个任务上做的越来越好。
## 2. Can you name four types of problems where it shines?
> * A: 图像识别，语音识别，自然语言处理，启发人类学习。
## 3. What is a labeled training set?
> * A: 专门用于监督学习，也就是带有标记的数据。
## 4. What are the two most common supervised tasks?
> * A: 分类(classification)和回归(regression)。
## 5. Can you name four common unsupervised tasks?
> * A: 聚类(clustering)，可视化(visualization)，降维(dimensionality reduction)，关联规则学习(association rule learning)。
## 6. What type of Machine Learning algorithm would you use to allow a robot to walk in various unknown terrains?
> * A: 强化学习(reinforcement learning)。
## 7. What type of algorithm would you use to segment your customers into multiple groups?
> * A: 如果你不知道分类的组，可以使用聚类(clustering)，如果你知道组可以用分类(classification)。
## 8. Would you frame the problem of spam detection as a supervised learning problem or an unsupervised learning algorithm?
> * A: 监督学习。
## 9. What is an online learning system?
> * A: 能够增量学习，适用于不停变化并产生数据的系统，以及海量数据的。
## 10. What is out-of-core learning?
> * A: 由于数据量过大导致不能一下子加载入内存中，所以需要把数据分组每次读入一部分来训练。
## 11. What type of learning algorithm relies on a similarity measure to make predictions?
> * A: instance-based learning system。
## 12. What is the difference between a model parameter and a learning algorithm's hyper-parameter?
> * A: model parameter 是针对这个模型的参数，而 hyper-parameter 是是针对这个学习算法本身的参数，比如要进行多少次正则化。
## 13. What do model-based learning algorithms search for? What is the most common strategy they use to succeed? How do they make predictions?
> * A: model-based learning algorithms 寻找最佳的模型参数；一般我们都是使用 cost 函数来衡量系统有多坏，于是只要把 cost 最小化就能得到我们想要的结果；根据找到的模型参数和模型本身，只要传入新的数据我们就能得到 predictions。
## 14. Can you name four of the main challenges in Machine Learning?
> * A: 数据量不够，数据的质量不够高，算法过于复杂导致 overfitting，以及算法过于简单导致 underfitting。
## 15. If your model performs great on the training data but generalizes poorly to new instances, what is happening? Can you name three possible solutions?
> * A: 你正在遭遇 overfitting，简化模型，收集更多数据，减少数据噪音。
## 16. What is a test set and why would you want to use it?
> * A: 用来估算你的模型在新的数据到来时的预测能力。
## 17. What is the purpose of a validation set?
> * A: 用来比较不同的模型，便于选择最佳模型和校准 hyper-parameter。
## 18. What can go wrong if you tune hyper-parameter using the test set?
> * A: 你很有可能在 overfitting 测试数据集，新数据到来时你的模型可能表现的比想象的还要差。
## 19. What is cross-validation and why would you prefer it to a validation set?
> * A: 便于选择模型和校准 hyper-parameter，不用再构建一个分开的 validation set，可以节省珍贵的训练数据。

## Popular open data repositories:
> * UC Irvine Machine Learning Repositories
> * Kaggle datasets
> * Amazon's AWS datasets

## Meta portals(they list open data repositories):
> * http://dataportals.org/
> * http://opendatamonitor.eu/
> * http://quandl.com/

## Other pages listing many popular open data repositories:
> * Wikipedia's list of Machine Learning datasets
> * Quora.com question
> * Datasets subreddit
