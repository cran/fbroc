double get_perf_auc(NumericVector &tpr, NumericVector &fpr, NumericVector &param);
double get_tpr_at_fixed_fpr(NumericVector &tpr, NumericVector &fpr, NumericVector &param); 
double get_fpr_at_fixed_tpr(NumericVector &tpr, NumericVector &fpr, NumericVector &param); 

typedef double (* PerfFun)(NumericVector &, NumericVector &, NumericVector &);
enum Measure {AUC, TPR_AT_FPR, FPR_AT_TPR};