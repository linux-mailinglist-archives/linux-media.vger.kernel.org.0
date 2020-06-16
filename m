Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BB91FB1E3
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 15:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgFPNUu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 09:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgFPNUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 09:20:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802D4C061573
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 06:20:49 -0700 (PDT)
Received: from jade.flets-east.jp (unknown [IPv6:2400:4051:61:600:2807:bdfa:f6a:8e53])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9623DF9;
        Tue, 16 Jun 2020 15:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592313647;
        bh=tEdvs8uWEde+LkYT/9GtpRq99jaXVINAf/8DS/4bfa8=;
        h=From:To:Cc:Subject:Date:From;
        b=loO+uiUGggG2BiWYG7akfTlDc/Dt4qUUQEs93kYKfNTWeQvIEwf6wDKBHLC7JdHrj
         P3A9lG45sfaZxdI+uJDCoC91k8URB7UEa5gFHRWtdxEtdjSV3jzsdrUA4/oW3NIHgF
         FPfxCKm5fi0C2WACMEmxuXlFPsb/0BLTheuATmEg=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH] v4l2-compliance: Convert testBlockingDQBuf to pthreads
Date:   Tue, 16 Jun 2020 22:20:26 +0900
Message-Id: <20200616132026.71061-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The test to test that a blocked VIDIOC_QBUF call will not block a
VIDIOC_STREAMOFF call uses different processes to make the calls. As it
isn't very realistic for multiple processes to be controlling a single
V4L2 device, convert the test to pthreads.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 139 ++++++++++++++------
 1 file changed, 100 insertions(+), 39 deletions(-)

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index fc49fff6..bf6ed141 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -32,8 +32,11 @@
 #include <ctype.h>
 #include <errno.h>
 #include <poll.h>
+#include <pthread.h>
+#include <signal.h>
 #include <sys/ioctl.h>
 #include <netinet/in.h>
+#include <atomic>
 #include <map>
 #include <vector>
 #include "v4l2-compliance.h"
@@ -2229,11 +2232,71 @@ int testRequests(struct node *node, bool test_streaming)
 	return 0;
 }
 
+struct test_blocking_thread_arg {
+	cv4l_queue *q;
+	struct node *node;
+};
+
+static void pthread_sighandle(int sig)
+{
+	return;
+}
+
+static std::atomic<bool> thread_dqbuf_complete(false);
+static std::atomic<bool> thread_streamoff_complete(false);
+
+static void *testBlockingDQBufThread(void *arg)
+{
+	struct test_blocking_thread_arg *a =
+		static_cast<test_blocking_thread_arg *>(arg);
+	cv4l_queue *q = a->q;
+	struct node *node = a->node;
+
+	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+
+	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+
+	/*
+	 * In the child process we call VIDIOC_DQBUF and wait
+	 * indefinitely since no buffers are queued.
+	 */
+	cv4l_buffer buf(q->g_type(), V4L2_MEMORY_MMAP);
+
+	node->dqbuf(buf);
+	thread_dqbuf_complete = true;
+
+	return NULL;
+}
+
+static void *testBlockingStreamoffThread(void *arg)
+{
+	struct test_blocking_thread_arg *a =
+		static_cast<test_blocking_thread_arg *>(arg);
+	cv4l_queue *q = a->q;
+	struct node *node = a->node;
+
+	pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, NULL);
+
+	pthread_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, NULL);
+
+	/*
+	 * In the second child call STREAMOFF: this shouldn't
+	 * be blocked by the DQBUF!
+	 */
+	node->streamoff(q->g_type());
+	thread_streamoff_complete = true;
+
+	return NULL;
+}
+
 static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 {
-	int pid_dqbuf;
-	int pid_streamoff;
-	int pid;
+	int ret;
+	pthread_t thread_dqbuf;
+	pthread_t thread_streamoff;
+	struct test_blocking_thread_arg thread_arg = {&q, node};
+	signal(SIGUSR1, pthread_sighandle);
+	bool test_streamoff_success;
 
 	fail_on_test(q.reqbufs(node, 2));
 	fail_on_test(node->streamon(q.g_type()));
@@ -2243,52 +2306,50 @@ static int testBlockingDQBuf(struct node *node, cv4l_queue &q)
 	 * other ioctls.
 	 */
 	fflush(stdout);
-	pid_dqbuf = fork();
-	fail_on_test(pid_dqbuf == -1);
+	ret = pthread_create(&thread_dqbuf, NULL, testBlockingDQBufThread,
+			     &thread_arg);
+	fail_on_test(ret < 0);
 
-	if (pid_dqbuf == 0) { // Child
-		/*
-		 * In the child process we call VIDIOC_DQBUF and wait
-		 * indefinitely since no buffers are queued.
-		 */
-		cv4l_buffer buf(q.g_type(), V4L2_MEMORY_MMAP);
-
-		node->dqbuf(buf);
-		std::exit(EXIT_SUCCESS);
-	}
-
-	/* Wait for the child process to start and block */
+	/* Wait for the child thread to start and block */
 	usleep(100000);
-	pid = waitpid(pid_dqbuf, NULL, WNOHANG);
 	/* Check that it is really blocking */
-	fail_on_test(pid);
+	fail_on_test(thread_dqbuf_complete);
 
 	fflush(stdout);
-	pid_streamoff = fork();
-	fail_on_test(pid_streamoff == -1);
-
-	if (pid_streamoff == 0) { // Child
-		/*
-		 * In the second child call STREAMOFF: this shouldn't
-		 * be blocked by the DQBUF!
-		 */
-		node->streamoff(q.g_type());
-		std::exit(EXIT_SUCCESS);
-	}
-
-	int wstatus_streamoff = 0;
+	ret = pthread_create(&thread_streamoff, NULL,
+			     testBlockingStreamoffThread, &thread_arg);
+	fail_on_test(ret < 0);
 
 	/* Wait for the second child to start and exit */
 	usleep(250000);
-	pid = waitpid(pid_streamoff, &wstatus_streamoff, WNOHANG);
-	kill(pid_dqbuf, SIGKILL);
-	fail_on_test(pid != pid_streamoff);
-	/* Test that the second child exited properly */
-	if (!pid || !WIFEXITED(wstatus_streamoff)) {
-		kill(pid_streamoff, SIGKILL);
-		fail_on_test(!pid || !WIFEXITED(wstatus_streamoff));
+	test_streamoff_success = thread_streamoff_complete;
+
+	/*
+	 * Both the dqbuf and streamoff threads are blocked; terminate them
+	 * before continuing. If they fail to terminate gracefully, then halt
+	 * the entire compliance test program (implicitly done when threads
+	 * are killed and not joined).
+	 */
+	if (!test_streamoff_success) {
+		pthread_kill(thread_dqbuf, SIGUSR1);
+		usleep(100000);
+		if (!thread_dqbuf_complete) {
+			pthread_cancel(thread_dqbuf);
+			usleep(100000);
+		}
+		pthread_join(thread_dqbuf, NULL);
+
+		pthread_kill(thread_streamoff, SIGUSR1);
+		usleep(100000);
+		if (!thread_streamoff_complete) {
+			pthread_cancel(thread_streamoff);
+			usleep(100000);
+		}
+		pthread_join(thread_streamoff, NULL);
 	}
 
+	fail_on_test(!test_streamoff_success);
+
 	fail_on_test(node->streamoff(q.g_type()));
 	fail_on_test(q.reqbufs(node, 0));
 	return 0;
-- 
2.27.0

