Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8232030DE
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 09:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731460AbgFVHyk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 03:54:40 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48483 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731412AbgFVHyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 03:54:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id nHHmjzengn3JWnHHpjYrCI; Mon, 22 Jun 2020 09:54:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592812478; bh=shAsB8F6zHYafkEbG0TZ59Xxczsu7tc246s2gkJ1Mgo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Vg88i6zzY69nhvqZL/nAzOgclHB0smq1xo0IurUvK8hngJha6FjCsPOl0YdLfVlh7
         Xq30+db6SCQK6XEi3OOAQKfAQQ81hhT8H04Acy+QpOg/bKPShttEdDkQa/Ecl3UP0D
         vtqlWuC4gkcdeIpr2A0qst7LWYVy7Xz5OAQT3DuaFXCobexXFLDBf/sjvQ7h0FmiTO
         gBwWzThKu1XdWkfWKThTHEAune6V2aWaOXlyChUXIKg63IXX0k13qiRGy9lT+eftUA
         8s0WCOc5eRhUZSEqIsM+4RyqGAT7zRUMVP/pWBhWWOqRt52Pku8KKTdk6nVBnv8qLS
         WNViFcr9GA+kA==
Subject: Re: [PATCH v2] v4l2-compliance: Convert testBlockingDQBuf to pthreads
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com
References: <20200619082519.26259-1-paul.elder@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7df510be-baee-0c49-abf7-fe752b6a401e@xs4all.nl>
Date:   Mon, 22 Jun 2020 09:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619082519.26259-1-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHUlHcyNQaouxomQ5JRzG51PWSPW9UzoxI52lu/bhPEI9CCd9TvA92sZplSGBP2f5fIaZVbIC+1rR+LEtSwdpdVR3Y/sGDwTUIhF96Wiph9euNh2Cp1k
 cbH8fkEfz06BpDY96j4ZzkT9OT3DPGlVWi+IDqnHD3DlOZDE3aFehjiRWciIvF77dylFNV55HZKUZ3HlC/BfeyMSmb/cGY1qC7mNxjTWCyUA9urP5SrNJUEQ
 2VPKTYdn6XDGVwR+OofPNAg2AH0dISOucnAj+iFLYhY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/06/2020 10:25, Paul Elder wrote:
> The test to test that a blocked VIDIOC_QBUF call will not block a
> VIDIOC_STREAMOFF call uses different processes to make the calls. As it
> isn't very realistic for multiple processes to be controlling a single
> V4L2 device, convert the test to pthreads.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> Changes in v2:
> - wrap thread lifetime management in a class to simplify terminating and
>   joining the threads in various success/failure combinations
> ---
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 174 +++++++++++++++-----
>  1 file changed, 135 insertions(+), 39 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index fc49fff6..787cec00 100644
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
> @@ -2229,65 +2232,158 @@ int testRequests(struct node *node, bool test_streaming)
>  	return 0;
>  }
>  
> -static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
> +
> +class BlockingThread

This patch looks good, but can you document this class? Some high-level comments
about what this class does should be sufficient.

Regards,

	Hans

>  {
> -	int pid_dqbuf;
> -	int pid_streamoff;
> -	int pid;
> +public:
> +	BlockingThread() : done(false), running(false) {}
>  
> -	fail_on_test(q.reqbufs(node, 2));
> -	fail_on_test(node->streamon(q.g_type()));
> +	virtual ~BlockingThread()
> +	{
> +		stop();
> +	}
>  
> -	/*
> -	 * This test checks if a blocking wait in VIDIOC_DQBUF doesn't block
> -	 * other ioctls.
> -	 */
> -	fflush(stdout);
> -	pid_dqbuf = fork();
> -	fail_on_test(pid_dqbuf == -1);
> +	int start()
> +	{
> +		int ret = pthread_create(&thread, NULL, startRoutine, this);
> +		if (ret < 0)
> +			return ret;
> +
> +		running = true;
> +		return 0;
> +	}
> +
> +	void stop()
> +	{
> +		if (!running)
> +			return;
> +
> +		/*
> +		 * If the thread is blocked on an ioctl, try to wake it up with
> +		 * a signal.
> +		 */
> +		if (!done) {
> +			pthread_kill(thread, SIGUSR1);
> +			usleep(100000);
> +		}
>  
> -	if (pid_dqbuf == 0) { // Child
>  		/*
> -		 * In the child process we call VIDIOC_DQBUF and wait
> -		 * indefinitely since no buffers are queued.
> +		 * If the signal failed to interrupt the ioctl, use the heavy
> +		 * artillery and cancel the thread.
>  		 */
> -		cv4l_buffer buf(q.g_type(), V4L2_MEMORY_MMAP);
> +		if (!done) {
> +			pthread_cancel(thread);
> +			usleep(100000);
> +		}
> +
> +		pthread_join(thread, NULL);
> +		running = false;
> +	}
> +
> +	void kill()
> +	{
> +		pthread_kill(thread, SIGUSR1);
> +	}
> +
> +	std::atomic<bool> done;
> +
> +private:
> +	static void *startRoutine(void *arg)
> +	{
> +		BlockingThread *self = static_cast<BlockingThread *>(arg);
> +
> +		pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
> +		pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
> +
> +		self->run();
> +
> +		self->done = true;
> +		return NULL;
> +	}
> +
> +	virtual void run() = 0;
> +
> +	pthread_t thread;
> +	std::atomic<bool> running;
> +};
>  
> +class DqbufThread : public BlockingThread
> +{
> +public:
> +	DqbufThread(cv4l_queue *q, struct node *n) : queue(q), node(n) {}
> +
> +private:
> +	void run() override
> +	{
> +		/*
> +		 * In this thread we call VIDIOC_DQBUF and wait indefinitely
> +		 * since no buffers are queued.
> +		 */
> +		cv4l_buffer buf(queue->g_type(), V4L2_MEMORY_MMAP);
>  		node->dqbuf(buf);
> -		std::exit(EXIT_SUCCESS);
>  	}
>  
> -	/* Wait for the child process to start and block */
> -	usleep(100000);
> -	pid = waitpid(pid_dqbuf, NULL, WNOHANG);
> -	/* Check that it is really blocking */
> -	fail_on_test(pid);
> +	cv4l_queue *queue;
> +	struct node *node;
> +};
>  
> -	fflush(stdout);
> -	pid_streamoff = fork();
> -	fail_on_test(pid_streamoff == -1);
> +class StreamoffThread : public BlockingThread
> +{
> +public:
> +	StreamoffThread(cv4l_queue *q, struct node *n) : queue(q), node(n) {}
>  
> -	if (pid_streamoff == 0) { // Child
> +private:
> +	void run() override
> +	{
>  		/*
> -		 * In the second child call STREAMOFF: this shouldn't
> +		 * In this thread call STREAMOFF; this shouldn't
>  		 * be blocked by the DQBUF!
>  		 */
> -		node->streamoff(q.g_type());
> -		std::exit(EXIT_SUCCESS);
> +		node->streamoff(queue->g_type());
>  	}
>  
> -	int wstatus_streamoff = 0;
> +	cv4l_queue *queue;
> +	struct node *node;
> +};
> +
> +static void pthread_sighandle(int sig)
> +{
> +	return;
> +}
> +
> +static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
> +{
> +	DqbufThread thread_dqbuf(&q, node);
> +	StreamoffThread thread_streamoff(&q, node);
> +
> +	/*
> +	 * SIGUSR1 is ignored by default, so install an empty signal handler
> +	 * so that we can use SIGUSR1 to wake up threads potentially blocked
> +	 * on ioctls.
> +	 */
> +	signal(SIGUSR1, pthread_sighandle);
> +
> +	fail_on_test(q.reqbufs(node, 2));
> +	fail_on_test(node->streamon(q.g_type()));
> +
> +	/*
> +	 * This test checks if a blocking wait in VIDIOC_DQBUF doesn't block
> +	 * other ioctls.
> +	 */
> +	fflush(stdout);
> +	thread_dqbuf.start();
> +
> +	/* Wait for the child thread to start and block */
> +	usleep(100000);
> +	/* Check that it is really blocking */
> +	fail_on_test(thread_dqbuf.done);
> +
> +	fflush(stdout);
> +	thread_streamoff.start();
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
> -	}
> +	fail_on_test(!thread_streamoff.done);
>  
>  	fail_on_test(node->streamoff(q.g_type()));
>  	fail_on_test(q.reqbufs(node, 0));
> 

