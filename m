Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979CD17BFDC
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 15:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgCFOHa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 09:07:30 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48515 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgCFOHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 09:07:30 -0500
Received: from [IPv6:2001:983:e9a7:1:558f:c736:2117:17d1]
 ([IPv6:2001:983:e9a7:1:558f:c736:2117:17d1])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ADdPj3E9eEE3qADdQjCdME; Fri, 06 Mar 2020 15:07:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583503648; bh=HQUl46Gn7Kk9pmZkXLDqQ0CFb5bDxu21LSGIQIjslYk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Durqs0D5JAUBo91mFeYnFyl2nxRXeffQYty0lw19YL4zLLAvNGXq5tGFu/Le8OlsQ
         onKaWClEoC4dmlyCow5mOkGiKMl8PC8NZEXGWphCanHBXI/UBHeEcHS/Rlm9p9l/0D
         44niQXZ/ZIecfFSfnD9eBmq6TNCP7mxRvz9zEyXBRWzaPapvhPok+oNNjSYHT2kmlI
         zkUDnFamLhMHOW/gmxQT/dTJ6HN13IQYw5Xn2UT7FP66j+JZIAMknYLI1+eu0t1OLr
         a1cm3M2aMmQSi2jC39S/YMT7wYLJQRWiKvu6zwhIsFTI7SxjutXuvxOXINndlDQ/l8
         e9J6j3XO7qE6A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC PATCH] v4l-utils: updates for cache hints
Message-ID: <7c208f8e-e516-3cff-2ab5-f62b45e5ab99@xs4all.nl>
Date:   Fri, 6 Mar 2020 15:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBKzuUHKdQ36jlw/ZIg8/3gRDyPZ/YE+lL48S7djka2LgqFCgs2k57q0uHKXYeZk2BvXvYBeWgLwbUtx6AS9ddvunZUihBm+oAXFPqDOhigEeHpuNj/+
 vaHGv1oPnCea5VQ1XRyF5pys/uLW4OIv1R5KAxqTNbe9eBTHZzt/UANPAniHepswP6nv16ml6t2SlafdqH/Pf//cco1yYvjukJQC9dMiE/5FU4gJTTnCn2CB
 2mhPc+aoYpNIVazIKw6DR6CSrxDU3bro6SpEhCfmTXZt7CGvizsRVltDcCAAuba1lpsrF/gmJiGoKM+Z9fdpNA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initial update of v4l2-ctl and v4l2-compliance to handle the new
memory flags.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Very basic, just enough to the test-media script to pass again.
---
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index b794ff88..6d6d818e 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1521,7 +1521,7 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 	reqbufs.type = q->type;
 	reqbufs.memory = q->memory;
 	reqbufs.count = count;
-	memset(reqbufs.reserved, 0, sizeof(reqbufs.reserved));
+	reqbufs.flags = 0;
 	/*
 	 * Problem: if REQBUFS returns an error, did it free any old
 	 * buffers or not?
@@ -1553,6 +1553,7 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	createbufs.format.type = q->type;
 	createbufs.memory = q->memory;
 	createbufs.count = count;
+	createbufs.flags = 0;
 	if (fmt) {
 		createbufs.format = *fmt;
 	} else {
diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
index 0aac8504..bca42bb4 100644
--- a/utils/common/v4l2-info.cpp
+++ b/utils/common/v4l2-info.cpp
@@ -206,6 +206,7 @@ static const flag_def bufcap_def[] = {
 	{ V4L2_BUF_CAP_SUPPORTS_REQUESTS, "requests" },
 	{ V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS, "orphaned-bufs" },
 	{ V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF, "m2m-hold-capture-buf" },
+	{ V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS, "cache-hints" },
 	{ 0, NULL }
 };

diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 13d8f272..ecd7bddb 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -676,8 +676,9 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 0;
 			reqbufs.type = i;
 			reqbufs.memory = m;
+			reqbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
+			fail_on_test(reqbufs.flags & ~V4L2_FLAG_MEMORY_NON_CONSISTENT);
 			q.reqbufs(node);

 			ret = q.create_bufs(node, 1);
@@ -698,7 +699,9 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 0;
 			crbufs.memory = m;
+			crbufs.flags = 0;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
+			fail_on_test(crbufs.flags & ~V4L2_FLAG_MEMORY_NON_CONSISTENT);
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());

