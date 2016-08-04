Concurrency and synchronization is a topic every modern software developer can't avoid. In iOS and macOS development, Grand Central Dispatch(GCD), NSOperation and pthread are available for developer to use.

While doing iOS development, I'm still doing C programming during my work. Thread programing is a pain in most of the time. It's true it's helpful when you want to reduce the whole computing time, however the work to create, maintain and stop threads is huge and every time we found a bug, we can always blame it's because of the multi-thread structure.

So the concurrency design Apple provides make me feel much easier when I program in Objective C. I always use GCD because when I started to work on company's project my co-worker already used GCD. Until some days ago another programmer was asking me why I use GCD not NSOperationQueues. Then I realize I can't just say because I use it when I start to program in Objective C. I need to know the real reason.

According Apple's Doc and this Stack Overflow question, I know the NSOperationQueues is a Objective C wrapper of GCD, even though GCD is available later than NSOperationQueues. Both of them are to help developers to manage concurrency programming. And there some differences between.

1. GCD works as FIFO (First in first out), while the NSOperationQueues gives developer the way to configure the order of tasks in queue.

2. There is overhead when using NSOperationQueues compared to GCD

So I decide to write some sample code to try out NSOperationQueues' task dependency system and how large is the overhead
