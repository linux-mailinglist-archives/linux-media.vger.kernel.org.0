Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3599728159D
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 16:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgJBOsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 10:48:09 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:56225 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbgJBOsJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 10:48:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OMLrkdrOCTHgxOMLvk0mDD; Fri, 02 Oct 2020 16:48:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601650087; bh=g8P/r4kFEZtWyqcYvdxDbhMDsTJwrMcC2VmT+pZeLiY=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KYgWKB9nVEPfRwbylIPn1OEHm476Af/oBVOYEP7ThK45o0pbBedvOXbOmqvJeDCif
         JYQ1UasnRKDykrPhg5Ytg9Xqsxb4WkhDH0BFIa+2HEiXmM9cIuQ7MCfrgU7D/G1tdJ
         f0EX8DJpDFzoV53AriNARggv0uBy7P2lT5zMmpsKHj9ruTq9Rm61IF+8t8/3O2ntOc
         WCKLC29hV1XcH+o1qK0TE01ZzdLC8iL59P1QAQ3mX2qE2BkSUYX8MJEwNAX9/80Yrp
         y/Ar8wmblS/Mc0TenTIzpb3oOF8VvNwxFpu+i4jJSzDpvrZ7USTuXt97bxN0N1zwaB
         76AQXeTSDo5bQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] vivid: fix (partially) timing issues
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <2aa5b7ff-0ae6-8810-159f-29fb6122d288@xs4all.nl>
Date:   Fri, 2 Oct 2020 16:48:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBui9J3iO6sEVk+a4B/Mj/hGHTLWiX9qBz0aZZ2yUJHy6Rpyu2HSeCOepeZyUyBCkDiVOta0HMRWtRvtT7u7pl/YM1iPp8tQu4+dVUTuuiN8PFhsIGHO
 Vn9GhASJbnrPS9fWPrL/rHLAP7L29/VjVRp0Cr15NdlGSJsfUeZdeiuTn12bk4ja08i5T1jOznaynQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vivid driver is a bit flaky w.r.t. the kthread timing, esp. when running
inside a virtual machine.

This is caused by calling schedule_timeout_uninterruptible(1) which can actually
take more than one jiffie. A while loop with schedule() turns out to be a lot
more precise. Also, if mutex_trylock() fails, then just call schedule() instead
of schedule_timeout_uninterruptible(1). There is no need to wait until the next
jiffer, just schedule(), then try to get the lock again.

This is still not precise enough, it is still relatively easy to get missed
frames. This really should be converted to use a proper timer, but for now
this solves the worst problems.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
index 01a9d671b947..67fb3c00f9ad 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
@@ -819,7 +819,7 @@ static int vivid_thread_vid_cap(void *data)
 			break;

 		if (!mutex_trylock(&dev->mutex)) {
-			schedule_timeout_uninterruptible(1);
+			schedule();
 			continue;
 		}

@@ -888,7 +888,9 @@ static int vivid_thread_vid_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;

 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
+		while (jiffies - cur_jiffies < wait_jiffies &&
+		       !kthread_should_stop())
+			schedule();
 	}
 	dprintk(dev, 1, "Video Capture Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-out.c b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
index 6780687978f9..79c57d14ac4e 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-out.c
@@ -167,7 +167,7 @@ static int vivid_thread_vid_out(void *data)
 			break;

 		if (!mutex_trylock(&dev->mutex)) {
-			schedule_timeout_uninterruptible(1);
+			schedule();
 			continue;
 		}

@@ -233,7 +233,9 @@ static int vivid_thread_vid_out(void *data)
 			next_jiffies_since_start = jiffies_since_start;

 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
+		while (jiffies - cur_jiffies < wait_jiffies &&
+		       !kthread_should_stop())
+			schedule();
 	}
 	dprintk(dev, 1, "Video Output Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
index 674507b5ccb5..38fdfee79498 100644
--- a/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
+++ b/drivers/media/test-drivers/vivid/vivid-kthread-touch.c
@@ -69,7 +69,7 @@ static int vivid_thread_touch_cap(void *data)
 			break;

 		if (!mutex_trylock(&dev->mutex)) {
-			schedule_timeout_uninterruptible(1);
+			schedule();
 			continue;
 		}
 		cur_jiffies = jiffies;
@@ -128,7 +128,9 @@ static int vivid_thread_touch_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;

 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
+		while (jiffies - cur_jiffies < wait_jiffies &&
+		       !kthread_should_stop())
+			schedule();
 	}
 	dprintk(dev, 1, "Touch Capture Thread End\n");
 	return 0;
diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index 2b7522e16efc..a1e52708b7ca 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -142,7 +142,7 @@ static int vivid_thread_sdr_cap(void *data)
 			break;

 		if (!mutex_trylock(&dev->mutex)) {
-			schedule_timeout_uninterruptible(1);
+			schedule();
 			continue;
 		}

@@ -201,7 +201,9 @@ static int vivid_thread_sdr_cap(void *data)
 			next_jiffies_since_start = jiffies_since_start;

 		wait_jiffies = next_jiffies_since_start - jiffies_since_start;
-		schedule_timeout_interruptible(wait_jiffies ? wait_jiffies : 1);
+		while (jiffies - cur_jiffies < wait_jiffies &&
+		       !kthread_should_stop())
+			schedule();
 	}
 	dprintk(dev, 1, "SDR Capture Thread End\n");
 	return 0;
