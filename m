Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55452CA32A
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389374AbgLAMuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:50:22 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:35469 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389263AbgLAMuW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:50:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k568ksuDyDuFjk56Bk2SXV; Tue, 01 Dec 2020 13:49:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826979; bh=CcQ3qYvlvZEoQAhbWpX7eSpo7PYxn5doVRhr3oxflYo=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MFi9aix7ZqUNAWXv/Z7jd3NOIcyvXTirLGtwn9xPIWqRJdRhZgazJbROPmGp3Qsg4
         cvwF1SJEdmkrFx03OLThoVvyoTujYLWlwTnw/35phNyWjaKHos7MrymiZMpfe4OAzh
         XMgsCeXO/DsJTf7tBWXToBYQSnYA+HyhBHHzoLxrFsbfev9BzoCVX2VEITkIGZSvyR
         /5mdI0TJiFE0dsj4gWBEojc7CyJ0WOeixZgGm4oAo+E7fqv7X9d+YE0k8ECsfem35y
         F4cULgxFZiegn/L8Iq81VTmBA9qnlKZDoacKrjjpwxqVq5p5A/NlD7DD6rT/hNHHfl
         0muCiaGlHgvug==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] v4l2-compliance: test for poll bugs when disconnecting
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>
Message-ID: <1ed22a80-9ec5-8a48-35cd-ac69950e54bd@xs4all.nl>
Date:   Tue, 1 Dec 2020 13:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBbKX0bWxe2xIRJ3jofpyT2J7ChnIoSiXOnJl+OAZS3u6zI0YuYD+tsVDL8F2Aa5lG1fyUjUVs7qJvqzcrOVFOBr6/UvDrkCNXF6ZWvaxBbGVbHgVfUs
 sF+UyIJlW7FLcLuBYqKhFhUF/uYO3GJN8Ky5HEHsvUqd/A30VdAessvMygdNqf2IAk3CeLjLjY/xM36mMYlihUf3OM8UFnteqdNmZ1KxlJ9Bz3++o4/pjzXb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a process polls for an event (using select() or epoll), and the device is
unregistered, then it should wake up. This is normally difficult to test, but
the vivid driver has a Disconnect control that can emulate this.

This patch adds a testVividDisconnect() function to verify that select and
epoll behave correctly.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index 2d4d10db..9e7b14c7 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -1438,6 +1438,14 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
 	 * 	 S_SELECTION flags tests
 	 */

+	if (is_vivid &&
+	    node.controls.find(VIVID_CID_DISCONNECT) != node.controls.end()) {
+		if (node.node2)
+			node.node2->close();
+		node.node2 = NULL;
+		printf("\ttest Disconnect: %s\n\n", ok(testVividDisconnect(&node)));
+	}
+
 	restoreState();

 show_total:
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index 5cfe870b..c0cc57db 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -70,6 +70,10 @@ enum poll_mode {
 #define IS_ENCODER(node) ((node)->codec_mask & (JPEG_ENCODER | STATEFUL_ENCODER | STATELESS_ENCODER))
 #define IS_DECODER(node) ((node)->codec_mask & (JPEG_DECODER | STATEFUL_DECODER | STATELESS_DECODER))

+#define V4L2_CTRL_CLASS_VIVID 0x00f00000
+#define VIVID_CID_VIVID_BASE		(V4L2_CTRL_CLASS_VIVID | 0xf000)
+#define VIVID_CID_DISCONNECT            (VIVID_CID_VIVID_BASE + 65)
+
 struct test_query_ext_ctrl: v4l2_query_ext_ctrl {
 	__u64 menu_mask;
 };
@@ -296,6 +300,7 @@ int testQueryControls(struct node *node);
 int testSimpleControls(struct node *node);
 int testExtendedControls(struct node *node);
 int testEvents(struct node *node);
+int testVividDisconnect(struct node *node);
 int testJpegComp(struct node *node);

 // I/O configuration ioctl tests
diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-compliance/v4l2-test-controls.cpp
index d9c13b4e..018a404e 100644
--- a/utils/v4l2-compliance/v4l2-test-controls.cpp
+++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
@@ -23,12 +23,12 @@
 #include <vector>

 #include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/epoll.h>

 #include "compiler.h"
 #include "v4l2-compliance.h"

-#define V4L2_CTRL_CLASS_VIVID 0x00f00000
-
 static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctrl)
 {
 	struct v4l2_querymenu qmenu;
@@ -906,6 +906,89 @@ int testEvents(struct node *node)
 	return 0;
 }

+int testVividDisconnect(struct node *node)
+{
+	// Test that disconnecting a device will wake up any processes
+	// that are using select or poll.
+	//
+	// This can only be tested with the vivid driver that enabled
+	// the DISCONNECT control.
+
+	pid_t pid = fork();
+	if (pid == 0) {
+		struct timeval tv = { 5, 0 };
+		fd_set fds;
+
+		FD_ZERO(&fds);
+		FD_SET(node->g_fd(), &fds);
+		int res = select(node->g_fd() + 1, nullptr, nullptr, &fds, &tv);
+		// No POLLPRI seen
+		if (res != 1)
+			exit(1);
+		// POLLPRI seen, but didn't wake up
+		if (!tv.tv_sec)
+			exit(2);
+		v4l2_event ev = {};
+		// Woke up on POLLPRI, but VIDIOC_DQEVENT didn't return
+		// the ENODEV error.
+		if (doioctl(node, VIDIOC_DQEVENT, &ev) != ENODEV)
+			exit(3);
+		exit(0);
+	}
+	v4l2_control ctrl = { VIVID_CID_DISCONNECT, 0 };
+	sleep(1);
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	int wstatus;
+	fail_on_test(waitpid(pid, &wstatus, 0) != pid);
+	fail_on_test(!WIFEXITED(wstatus));
+	if (WEXITSTATUS(wstatus))
+		return fail("select child exited with status %d\n", WEXITSTATUS(wstatus));
+
+	node->reopen();
+
+	pid = fork();
+	if (pid == 0) {
+		struct epoll_event ep_ev;
+		int epollfd = epoll_create1(0);
+
+		if (epollfd < 0)
+			exit(1);
+
+		ep_ev.events = 0;
+		if (epoll_ctl(epollfd, EPOLL_CTL_ADD, node->g_fd(), &ep_ev))
+			exit(2);
+
+		ep_ev.events = EPOLLPRI;
+		ep_ev.data.fd = node->g_fd();
+		if (epoll_ctl(epollfd, EPOLL_CTL_MOD, node->g_fd(), &ep_ev))
+			exit(3);
+		int ret = epoll_wait(epollfd, &ep_ev, 1, 5000);
+		if (ret == 0)
+			exit(4);
+		if (ret < 0)
+			exit(5);
+		if (ret != 1)
+			exit(6);
+		if (!(ep_ev.events & EPOLLPRI))
+			exit(7);
+		if (!(ep_ev.events & EPOLLERR))
+			exit(8);
+		v4l2_event ev = {};
+		// Woke up on POLLPRI, but VIDIOC_DQEVENT didn't return
+		// the ENODEV error.
+		if (doioctl(node, VIDIOC_DQEVENT, &ev) != ENODEV)
+			exit(9);
+		exit(0);
+	}
+	sleep(1);
+	fail_on_test(doioctl(node, VIDIOC_S_CTRL, &ctrl));
+	fail_on_test(waitpid(pid, &wstatus, 0) != pid);
+	fail_on_test(!WIFEXITED(wstatus));
+	if (WEXITSTATUS(wstatus))
+		return fail("epoll child exited with status %d\n", WEXITSTATUS(wstatus));
+	return 0;
+}
+
 int testJpegComp(struct node *node)
 {
 	struct v4l2_jpegcompression jc;
