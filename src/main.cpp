// ----------------------------------------------------------------------------
//
//
// ----------------------------------------------------------------------------
#include <stdio.h>
#include <opencv2/opencv.hpp>

// ...
int main()
{
  cv::Mat output = cv::Mat::zeros(8, 8, CV_8UC3 );
  std::cout << output << "\r\n";

  // ...
  printf("Example exit\r\n");
  return 0;
}
