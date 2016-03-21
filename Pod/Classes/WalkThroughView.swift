
import UIKit

public class WalkThroughView: UIView, UIScrollViewDelegate{
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    var pageView: [UIView] = []
    var fixView: [UIView] = []
    var rotationView: [UIView] = []
    
    public init(frame: CGRect,fixView: [UIView],rotationView: [UIView]) {
        //initializer
        super.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().applicationFrame.width, UIScreen.mainScreen().applicationFrame.height))
        self.fixView = fixView
        self.rotationView = rotationView
        
        let width = self.frame.width, height = self.frame.height
        let pageSize = fixView.count
        
        if fixView.count != rotationView.count {
            print("error: Count of fixView and rotationView must be same")
        }
        
        scrollView = UIScrollView(frame: CGRectMake(0,0,width,height))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(CGFloat(pageSize) * width, 0)//ペーズ数に応じてscrollViewの横幅を長くする。
        self.addSubview(scrollView)
        
        //bind to pageView
        for (var i = 0; i < fixView.count; i++) {
            let v = UIView(frame: self.frame)
            v.addSubview(fixView[i])
            v.addSubview(rotationView[i])
            pageView.append(v)
        }
        
        for (var i = 0; i < pageView.count; i++){
            pageView[i].frame = CGRectMake(CGFloat(i) * width, 0, width, height)
            scrollView.addSubview(pageView[i])
        }
        
        //UIPageControll
        pageControl = UIPageControl(frame: CGRectMake(0, 0, width, 50))
        pageControl.numberOfPages = pageSize
        pageControl.currentPage = 0
        pageControl.userInteractionEnabled = false
        self.addSubview(pageControl)
        
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        let page = pageControl.currentPage

        let offset = ((scrollView.contentOffset.x + self.bounds.size.width) - (self.bounds.size.width * CGFloat(page))) / self.bounds.size.width
        print(scrollView.contentOffset.x)
        
        var tr = CATransform3DIdentity
        tr.m34 = -1/500.0
        
        var tmpOffset = offset
        if(tmpOffset > 1.0){
            tmpOffset = 1.0 + (1.0 - tmpOffset)
        }

        
        for (var i = 0; i < fixView.count; i++) {
            self.rotationView[i].layer.transform = CATransform3DRotate(tr, CGFloat(M_PI) * (scrollView.contentOffset.x / (self.frame.width * 2) - CGFloat(i) / 2), 0, 1, 1)
        }
        
    }
    
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        // add Page
        if fmod(scrollView.contentOffset.x, scrollView.frame.maxX) == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
        }
    }
    
    
}
