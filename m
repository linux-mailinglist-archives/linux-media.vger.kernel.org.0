Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC3C1FC275
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 01:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgFPXxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 19:53:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38884 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgFPXxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 19:53:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEFBBF9;
        Wed, 17 Jun 2020 01:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592351600;
        bh=ZBSzj80azXgvrE80tB4Qtx2TCHEhOOtcsH0mZROlFrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ojEjU7sQ/nvXqcMW7DiRoMSvHHn50vx+ibcMFE4xErjxFxDjowZhmfFES8CpY44VS
         ZH9CzQd2odTUfOrPQmer0Mgx+MD6Be1h0c9gInpJG7AD+ZCD7BEKbLw3PcUisqZqvG
         9wuZpueW1vze6eBJ2XSKr1Y3HF9wkKpeW2kagWFw=
Date:   Wed, 17 Jun 2020 02:52:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] v4l2-compliance: Convert testBlockingDQBuf to pthreads
Message-ID: <20200616235258.GL913@pendragon.ideasonboard.com>
References: <20200616132026.71061-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200616132026.71061-1-paul.elder@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Tue, Jun 16, 2020 at 10:20:26PM +0900, Paul Elder wrote:
> The test to test that a blocked VIDIOC_QBUF call will not block a
> VIDIOC_STREAMOFF call uses different processes to make the calls. As it
> isn't very realistic for multiple processes to be controlling a single
> V4L2 device, convert the test to pthreads.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 139 ++++++++++++++------
>  1 file changed, 100 insertions(+), 39 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index fc49fff6..bf6ed141 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -32,8 +32,11 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <poll.h>
> +#include <pthread.h>
> +#include <signal.h>
>  #include <sys/ioctl.h>
>  #include <netinet/in.h>
> +#include <atomic>
>  #include <map>
>  #include <vector>
>  #include "v4l2-compliance.h"
> @@ -2229,11 +2232,71 @@ int testRequests(struct node *node, bool test_streaming)
>  	return 0;
>  }
>  
> +struct test_blocking_thread_arg {
> +	cv4l_queue *q;
> +	struct node *node;
> +};
> +
> +static void pthread_sighandle(int sig)
> +{
> +	return;
> +}
> +
> +static std::atomic<bool> thread_dqbuf_complete(false);
> +static std::atomic<bool> thread_streamoff_complete(false);
> +
> +static void *testBlockingDQBufThread(void *arg)
> +{
> +	struct test_blocking_thread_arg *a =
> +		static_cast<test_blocking_thread_arg *>(arg);
> +	cv4l_queue *q = a->q;
> +	struct node *node = a->node;
> +
> +	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> +
> +	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +
> +	/*
> +	 * In the child process we call VIDIOC_DQBUF and wait

Not a process anymore :-) Maybe "In this thread we call..." ?

> +	 * indefinitely since no buffers are queued.
> +	 */
> +	cv4l_buffer buf(q->g_type(), V4L2_MEMORY_MMAP);
> +
> +	node->dqbuf(buf);
> +	thread_dqbuf_complete = true;
> +
> +	return NULL;
> +}
> +
> +static void *testBlockingStreamoffThread(void *arg)
> +{
> +	struct test_blocking_thread_arg *a =
> +		static_cast<test_blocking_thread_arg *>(arg);
> +	cv4l_queue *q = a->q;
> +	struct node *node = a->node;
> +
> +	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> +
> +	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +
> +	/*
> +	 * In the second child call STREAMOFF: this shouldn't

Same here, "In this thread call...".

> +	 * be blocked by the DQBUF!
> +	 */
> +	node->streamoff(q->g_type());
> +	thread_streamoff_complete = true;
> +
> +	return NULL;
> +}
> +
>  static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
>  {
> -	int pid_dqbuf;
> -	int pid_streamoff;
> -	int pid;
> +	int ret;
> +	pthread_t thread_dqbuf;
> +	pthread_t thread_streamoff;
> +	struct test_blocking_thread_arg thread_arg = {&q, node};
> +	signal(SIGUSR1, pthread_sighandle);
> +	bool test_streamoff_success;

Let's not hide the signal() call in the middle there. Please add a
comment to explan why an empty signal handler is needed.

I also tend to order variables from longest to shortest (more or less),
but that's a personal preference.

>  
>  	fail_on_test(q.reqbufs(node, 2));
>  	fail_on_test(node->streamon(q.g_type()));
> @@ -2243,52 +2306,50 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
>  	 * other ioctls.
>  	 */
>  	fflush(stdout);
> -	pid_dqbuf = fork();
> -	fail_on_test(pid_dqbuf == -1);
> +	ret = pthread_create(&thread_dqbuf, NULL, testBlockingDQBufThread,
> +			     &thread_arg);
> +	fail_on_test(ret < 0);
>  
> -	if (pid_dqbuf == 0) { // Child
> -		/*
> -		 * In the child process we call VIDIOC_DQBUF and wait
> -		 * indefinitely since no buffers are queued.
> -		 */
> -		cv4l_buffer buf(q.g_type(), V4L2_MEMORY_MMAP);
> -
> -		node->dqbuf(buf);
> -		std::exit(EXIT_SUCCESS);
> -	}
> -
> -	/* Wait for the child process to start and block */
> +	/* Wait for the child thread to start and block */
>  	usleep(100000);
> -	pid = waitpid(pid_dqbuf, NULL, WNOHANG);
>  	/* Check that it is really blocking */
> -	fail_on_test(pid);
> +	fail_on_test(thread_dqbuf_complete);

I'm afraid you need to call pthread_join() in all the return paths. All
threads must be joined. If you want to avoid spaghetti code, you could
create a helper class for this.

class BlockingThread
{
public:
	BlockingThread()
		: running(false), done(false)
	{
	}

	virtual ~BlockingThread()
	{
		stop();
	}

	int start()
	{
		int ret = pthread_create(&thread, NULL, startRoutine, this);
		if (ret < 0)
			return ret;

		running = true;
		return 0;
	}

	void stop()
	{
		if (!running)
			return;

		/*
		 * If the thread is blocked on an ioctl, try to wake it up with
		 * a signal.
		 */
		if (!done) {
			pthread_kill(thread, SIGUSR1);
			usleep(100000);
		}

		/*
		 * If the signal failed to interrupt the ioctl, use the heavy
		 * artillery and cancel the thread.
		 */
		if (!done) {
			pthread_cancel(thread_streamoff);
			usleep(100000);
		}

		pthread_join(thread);
		running = false;
	}

	void kill()
	{
		pthread_kill(thread, SIGUSR1);
	}

private:
	static void *startRoutine(void *arg)
	{
		BlockingThread *self = static_cast<BlockingThread *>(arg);

		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);

		self->run();

		done = true;
		return NULL;
	}

	virtual void run() = 0;

	pthread_t thread;
	std::atomic<bool> running;
	std::atomic<bool> done;
};

class DqbufThread : public BlockingThread
{
public:
	DqbufThread(cv4l_queue *q, struct node *n)
		: queue(q), node(n)
	{
	}

private:
	void run() override
	{
		/*
		 * In this thread we call VIDIOC_DQBUF and wait indefinitely
		 * since no buffers are queued.
		 */
		cv4l_buffer buf(queue->g_type(), V4L2_MEMORY_MMAP);
		node->dqbuf(buf);
	}

	cv4l_queue *queue;
	struct node *node;
};

Same for StreamoffThread. You then create one instance of each class on
the stack, and the code below will become considerably simpler as the
destructor will take care of all the cleanup.
>  
>  	fflush(stdout);
> -	pid_streamoff = fork();
> -	fail_on_test(pid_streamoff == -1);
> -
> -	if (pid_streamoff == 0) { // Child
> -		/*
> -		 * In the second child call STREAMOFF: this shouldn't
> -		 * be blocked by the DQBUF!
> -		 */
> -		node->streamoff(q.g_type());
> -		std::exit(EXIT_SUCCESS);
> -	}
> -
> -	int wstatus_streamoff = 0;
> +	ret = pthread_create(&thread_streamoff, NULL,
> +			     testBlockingStreamoffThread, &thread_arg);
> +	fail_on_test(ret < 0);
>  
>  	/* Wait for the second child to start and exit */
>  	usleep(250000);
> -	pid = waitpid(pid_streamoff, &wstatus_streamoff, WNOHANG);
> -	kill(pid_dqbuf, SIGKILL);
> -	fail_on_test(pid != pid_streamoff);
> -	/* Test that the second child exited properly */
> -	if (!pid || !WIFEXITED(wstatus_streamoff)) {
> -		kill(pid_streamoff, SIGKILL);
> -		fail_on_test(!pid || !WIFEXITED(wstatus_streamoff));
> +	test_streamoff_success = thread_streamoff_complete;
> +
> +	/*
> +	 * Both the dqbuf and streamoff threads are blocked; terminate them
> +	 * before continuing. If they fail to terminate gracefully, then halt
> +	 * the entire compliance test program (implicitly done when threads
> +	 * are killed and not joined).
> +	 */
> +	if (!test_streamoff_success) {
> +		pthread_kill(thread_dqbuf, SIGUSR1);
> +		usleep(100000);
> +		if (!thread_dqbuf_complete) {
> +			pthread_cancel(thread_dqbuf);
> +			usleep(100000);
> +		}
> +		pthread_join(thread_dqbuf, NULL);
> +
> +		pthread_kill(thread_streamoff, SIGUSR1);
> +		usleep(100000);
> +		if (!thread_streamoff_complete) {
> +			pthread_cancel(thread_streamoff);
> +			usleep(100000);
> +		}
> +		pthread_join(thread_streamoff, NULL);
>  	}
>  
> +	fail_on_test(!test_streamoff_success);
> +
>  	fail_on_test(node->streamoff(q.g_type()));
>  	fail_on_test(q.reqbufs(node, 0));
>  	return 0;

-- 
Regards,

Laurent Pinchart
