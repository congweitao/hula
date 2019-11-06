#include <iostream>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/videoio/videoio.hpp>
#include <opencv2/imgcodecs/imgcodecs.hpp>
#include <opencv2/core/core.hpp>

using namespace std;
using namespace cv;

int main()
{
    VideoCapture cap(0);
    namedWindow("frame", cv::WINDOW_AUTOSIZE);
    while(true)
    {
        Mat frame;
        cap.read(frame);
        if(frame.empty())
        {
            cout << "No frame" << endl;
        }
        imshow("frame", frame);
    }
    return 0;
}
