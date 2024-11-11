#include<iostream>
#include<climits>
using namespace std;

const int MAX_CITIES=10;

void tsp_util(int graph[MAX_CITIES][MAX_CITIES],bool visited[],int n,int currentPos,int count,int cost,int& mincost,int path[],int tempPath[],int start)
{
 if(count==n && graph[currentPos][start]>0)
 {
  int totalcost=cost+graph[currentPos][start];
  if(totalcost<mincost)
  {
   mincost=totalcost;
   for(int i=0;i<n;i++)
   {
    path[i]=tempPath[i];
   }
   path[n]=start;
  }
  return;
 }
 for(int i=0;i<n;i++)
 {
  if(!visited[i] && graph[currentPos][i])
  {
   visited[i]=true;
   tempPath[count]=i;
   tsp_util(graph,visited,n,i,count+1,cost+graph[currentPos][i],mincost,path,tempPath,start);
   visited[i]=false;
  }
 }
}
int travellingSalesmanProblem(int graph[MAX_CITIES][MAX_CITIES],int n,int start)
{
 bool visited[MAX_CITIES]={false};
 int mincost=INT_MAX;
 int path[MAX_CITIES+1];
 int tempPath[MAX_CITIES];
 
 visited[start]=true;
 tempPath[0]=start;
 
 tsp_util(graph,visited,n,start,1,0,mincost,path,tempPath,start);
 cout<<"Minimum Cost:"<<mincost<<endl;
 cout<<"Optimal Path:";
 for(int i=0;i<n;i++)
 {
  cout<<path[i]<<"->";
 }
 cout<<path[n]<<endl;
 return mincost;
}
int main()
{
 int n;
 cout<<"Enter the number of cities:";
 cin>>n;
 
 int graph[MAX_CITIES][MAX_CITIES];
 cout<<"Enter the adjacency matrix:";
 for(int i=0;i<n;i++)
 {
  for(int j=0;j<n;j++)
  {
   cin>>graph[i][j];
  }
 }
 
 int start;
 cout<<"Enter the start point:\n";
 cin>>start;
 start--;
 
 travellingSalesmanProblem(graph,n,start);
 return 0;
}
