# SegmentControlExperimentation

I'm building this experimentation app using the HMSegmentedControl framework. On this app I'm trying to add a UICollection view into a view made on a xib file, but I'm having trouble with it. The app crashes and I get this:
```sh
$2016-02-01 10:23:40.693 SegmentControlExperimentation[1328:49671] *** Assertion failure in -[UICollectionView _dequeueReusableViewOfKind:withIdentifier:forIndexPath:viewCategory:], /BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3512.30.14/UICollectionView.m:3690
$2016-02-01 10:23:40.699 SegmentControlExperimentation[1328:49671] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'could not dequeue a view of kind: UICollectionElementKindCell with identifier MyCell - must register a nib or a class for the identifier or connect a prototype cell in a storyboard'
I've been looking it up everywhere, but I couldn't come with a solution. So I made a github repo and I cloned my code on this link: https://github.com/nascimentorafael/SegmentControlExperimentation It is a really small and simple code. If one runs it, will get this crash. So have a look on the ViewController class and the view.xib.
```

I hope someone can help me with this.

