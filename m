Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47FE2648F3
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 17:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731340AbgIJPj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731263AbgIJPiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 11:38:05 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E1FC06138F;
        Thu, 10 Sep 2020 08:38:05 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b17so208095pji.1;
        Thu, 10 Sep 2020 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cFyWXgbywbwz1PiwJugWtOqJE4zQ9mCjNWSB29nBFUM=;
        b=lb9f77sbEdLcFJT2rwFvtLifr3huM6rwARyB/LHBsB6Dv/nXIjuZXx/7Ctsc0BBCUf
         9GIMasSF9bVKTsiho6WxysxluN3O0onBGYjNsGB/sga71I6g9cI3oPe68rk+kBVDeiBi
         lt+/1w0arNTcfa6/uYr9nGl7DOlchL76b/GQKMUitnmoZ+kcaR/pfN+T6ZEBKessFxx+
         8xvMGCdAsCq9d77lBfEOPHfjFTq/BsX0Jlb2/0ihMjA+IvXSgguyA9+A2JKRK4e6R+2c
         EaVwRW87iJkFvA8J+oel31ylZlaI584X75LhsCB20U3Fg5PhsaSYazrmECRbY8NruD9B
         fheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cFyWXgbywbwz1PiwJugWtOqJE4zQ9mCjNWSB29nBFUM=;
        b=TFeoekgosid6Fl0j047MZ6JuvS08qgc0bNbTEc7B9brZsj8KpOh4unQPN7gF1spLzb
         4h+0nakvdJE7iC7Srbdkfh4CGbg4pndB0h1QLpqtVcW/JClpOZdfKsmyP1ReXyzsfTPF
         oZ9MiAS3t6MNvOJril/88D0GAtbRIx5xK17I6Xx3br0a/sq6Vnyid3fF+8Vq3301b0N5
         SVdNxb4EbV3M/5r7kh+eRGF2/QcneJppF1GBcfyQG0jHPXV1T2gatZ08QXKuBZVwQ4Ce
         djMTJcLkVk3jwvz+Rf/ApoGErLaRfRoaSC31MSeYznJzAyPuKQ0IrrXkw5h2lPn/Gz/T
         JzIA==
X-Gm-Message-State: AOAM531v49HFMnjjz6zaoo7ayXnNGVGTfATpZgk+xbAoihO5TPUvYa6G
        71rbGCMfeQgO+ch7/uHXLDU=
X-Google-Smtp-Source: ABdhPJwLBiVjj68VS/FyBsMTj6freLwdpENUktHHi9QlvyoXoTK59KrVRDBt6Jw8I9EBdU7vaLatXg==
X-Received: by 2002:a17:90a:6343:: with SMTP id v3mr465206pjs.163.1599752284948;
        Thu, 10 Sep 2020 08:38:04 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id n21sm5497415pgl.7.2020.09.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 08:38:04 -0700 (PDT)
Date:   Fri, 11 Sep 2020 00:38:02 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
Message-ID: <20200910153802.GE97481@google.com>
References: <20200820165407.GD12693@lst.de>
 <CAAFQd5D=NzgjosB51-O_cH27a8V6CPgCfaPSfHHz7nKJPbazgg@mail.gmail.com>
 <20200901110617.GA13232@lst.de>
 <CAAFQd5CmPVSxmZJVn7HnNUn8srZbAbnfzpNMYw3KcDzn7xD2cg@mail.gmail.com>
 <CAAFQd5BDh05DNPShr54opY2GyY-FcH7g8=V2t4xBwz0OwRu9xQ@mail.gmail.com>
 <20200910094921.GB97481@google.com>
 <f92991e1-e0d7-69ca-9541-1546bb139dd3@xs4all.nl>
 <20200910101431.GC97481@google.com>
 <257cbc46-84a0-e7bc-10c8-d08d3e395d1a@xs4all.nl>
 <20200910144830.GD97481@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910144830.GD97481@google.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/09/10 23:48), Sergey Senozhatsky wrote:
> 
> I've a kernel patch (I think I got all the pieces). This is not a
> format submission yet, because I don't have v4l2-compliance patch
> yet, so didn't really test it.
> 

I guess,,, the v4l-utils patch should look something like this:
====

From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] v4l-compliance: remove NON_CONSISTENT hint test

Kernel support for V4L2_FLAG_MEMORY_NON_CONSISTENT has been
reverted, so we need to to remove the memory consistency
(coherency) tests from the test-buffers code.

Note, the buffer cache management hints support is still there
and should be tested.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 utils/common/cv4l-helpers.h                 |  8 ++---
 utils/common/v4l-helpers.h                  |  8 ++---
 utils/v4l2-compliance/v4l2-test-buffers.cpp | 40 ++-------------------
 3 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 3cee372b..712efde6 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -754,17 +754,17 @@ public:
 	int g_fd(unsigned index, unsigned plane) const { return v4l_queue_g_fd(this, index, plane); }
 	void s_fd(unsigned index, unsigned plane, int fd) { v4l_queue_s_fd(this, index, plane, fd); }
 
-	int reqbufs(cv4l_fd *fd, unsigned count = 0, unsigned int flags = 0)
+	int reqbufs(cv4l_fd *fd, unsigned count = 0)
 	{
-		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count, flags);
+		return v4l_queue_reqbufs(fd->g_v4l_fd(), this, count);
 	}
 	bool has_create_bufs(cv4l_fd *fd) const
 	{
 		return v4l_queue_has_create_bufs(fd->g_v4l_fd(), this);
 	}
-	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL, unsigned int flags = 0)
+	int create_bufs(cv4l_fd *fd, unsigned count, const v4l2_format *fmt = NULL)
 	{
-		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt, flags);
+		return v4l_queue_create_bufs(fd->g_v4l_fd(), this, count, fmt);
 	}
 	int mmap_bufs(cv4l_fd *fd, unsigned from = 0)
 	{
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index c09cd987..f96b3c38 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -1515,7 +1515,7 @@ static inline int v4l_queue_querybufs(struct v4l_fd *f, struct v4l_queue *q, uns
 }
 
 static inline int v4l_queue_reqbufs(struct v4l_fd *f,
-		struct v4l_queue *q, unsigned count, unsigned int flags = 0)
+		struct v4l_queue *q, unsigned count)
 {
 	struct v4l2_requestbuffers reqbufs;
 	int ret;
@@ -1523,7 +1523,6 @@ static inline int v4l_queue_reqbufs(struct v4l_fd *f,
 	reqbufs.type = q->type;
 	reqbufs.memory = q->memory;
 	reqbufs.count = count;
-	reqbufs.flags = flags;
 	/*
 	 * Problem: if REQBUFS returns an error, did it free any old
 	 * buffers or not?
@@ -1548,7 +1547,7 @@ static inline bool v4l_queue_has_create_bufs(struct v4l_fd *f, const struct v4l_
 
 static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 		struct v4l_queue *q, unsigned count,
-		const struct v4l2_format *fmt, unsigned int flags = 0)
+		const struct v4l2_format *fmt)
 {
 	struct v4l2_create_buffers createbufs;
 	int ret;
@@ -1556,7 +1555,6 @@ static inline int v4l_queue_create_bufs(struct v4l_fd *f,
 	createbufs.format.type = q->type;
 	createbufs.memory = q->memory;
 	createbufs.count = count;
-	createbufs.flags = flags;
 	if (fmt) {
 		createbufs.format = *fmt;
 	} else {
@@ -1735,7 +1733,7 @@ static inline void v4l_queue_free(struct v4l_fd *f, struct v4l_queue *q)
 	v4l_ioctl(f, VIDIOC_STREAMOFF, &q->type);
 	v4l_queue_release_bufs(f, q, 0);
 	v4l_queue_close_exported_fds(q);
-	v4l_queue_reqbufs(f, q, 0, 0);
+	v4l_queue_reqbufs(f, q, 0);
 }
 
 static inline void v4l_queue_buffer_update(const struct v4l_queue *q,
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index aca0eb68..1651e95c 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -653,10 +653,6 @@ int testReqBufs(struct node *node)
 		fail_on_test(q.reqbufs(node, 0));
 
 		for (m = V4L2_MEMORY_MMAP; m <= V4L2_MEMORY_DMABUF; m++) {
-			bool cache_hints_cap = false;
-			bool consistent;
-
-			cache_hints_cap = q.g_capabilities() & V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
 			if (!(node->valid_memorytype & (1 << m)))
 				continue;
 			cv4l_queue q2(i, m);
@@ -672,17 +668,8 @@ int testReqBufs(struct node *node)
 			reqbufs.count = 1;
 			reqbufs.type = i;
 			reqbufs.memory = m;
-			reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
 			fail_on_test(doioctl(node, VIDIOC_REQBUFS, &reqbufs));
-			consistent = reqbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
-			if (!cache_hints_cap) {
-				fail_on_test(consistent);
-			} else {
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(!consistent);
-				else
-					fail_on_test(consistent);
-			}
+			fail_on_test(check_0(reqbufs.reserved, sizeof(reqbufs.reserved)));
 			q.reqbufs(node);
 
 			ret = q.create_bufs(node, 0);
@@ -695,32 +682,9 @@ int testReqBufs(struct node *node)
 			node->g_fmt(crbufs.format, i);
 			crbufs.count = 1;
 			crbufs.memory = m;
-			crbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
 			fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
 			fail_on_test(check_0(crbufs.reserved, sizeof(crbufs.reserved)));
 			fail_on_test(crbufs.index != q.g_buffers());
-
-			consistent = crbufs.flags & V4L2_FLAG_MEMORY_NON_CONSISTENT;
-			if (!cache_hints_cap) {
-				fail_on_test(consistent);
-			} else {
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(!consistent);
-				else
-					fail_on_test(consistent);
-			}
-
-			if (cache_hints_cap) {
-				/*
-				 * Different memory consistency model. Should fail for MMAP
-				 * queues which support cache hints.
-				 */
-				crbufs.flags = 0;
-				if (m == V4L2_MEMORY_MMAP)
-					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs) != EINVAL);
-				else
-					fail_on_test(doioctl(node, VIDIOC_CREATE_BUFS, &crbufs));
-			}
 			q.reqbufs(node);
 
 			fail_on_test(q.create_bufs(node, 1));
@@ -1352,7 +1316,7 @@ int testMmap(struct node *node, struct node *node_m2m_cap, unsigned frame_count,
 			have_createbufs = false;
 		if (have_createbufs) {
 			q.reqbufs(node);
-			q.create_bufs(node, 2, &cur_fmt, V4L2_FLAG_MEMORY_NON_CONSISTENT);
+			q.create_bufs(node, 2, &cur_fmt);
 			fail_on_test(setupMmap(node, q));
 			q.munmap_bufs(node);
 			q.reqbufs(node, 2);
-- 
2.28.0

