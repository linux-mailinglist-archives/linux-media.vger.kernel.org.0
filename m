Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E091B70D9
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 11:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgDXJaf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 05:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgDXJaf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 05:30:35 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC42C09B045;
        Fri, 24 Apr 2020 02:30:35 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id ay1so3552297plb.0;
        Fri, 24 Apr 2020 02:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOe4eSFf8uaQPFRnz/HB78krP+RHMm+yFvd35oui5EE=;
        b=ejmiU1QYFN0TNxurB1zJMhR8EuFUTcFF7RduwDMofM3bvkWZj0mda+IXNsETZTme8o
         DCMkE8Q3sK5LYgWvaGspC481L12yjveuTE74oW1D1I4s9lkLsTh5Puj8NDTC1ugCSzoP
         xQN6LFcS2vBFkU3GhNyvMmFFV5CqJ5/80bDTq7lzPsDxHqcLyBv6udq4rFrGnsXhmTWL
         sxKNjUJcTQxY25LCAKgpro0vVKkopOsdlBhuPwn0QUldqDqugP7a308wHsIXIe/bQNQ9
         zdTMffVtyCnEMsQscc3lx0rlG7ifOmw5I7PyPqNQtPueBq8M0fNaUQ5qPug7doxfQbmM
         I+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nOe4eSFf8uaQPFRnz/HB78krP+RHMm+yFvd35oui5EE=;
        b=dzF3cdHJB6IP6NRqqaQ8VSFL0DY3lZNklefzhfQLhng9D1wGi/xzcmMvaaKgPAQgAR
         y0eOApJLOLRaeGomN7zg7moBtmz4RqFaL1/ACvP77OX2ctXIJBtDjtBlyOAkNDsALHH7
         qY6hK6y6GqBWON0UQxheHpi8hOQrnU8BGSPKUBTsQ3WjMxCCl57inPUPWE/frgu7yd0R
         30obsVsPz6JkDy4zOCXfT1UVq8mrocugDZCkgm7nvxqUOIzmnL8ZzBgpUwK+7VdiFMwj
         uV72eT/kUzIiIAeQno4iPpTeapCm+4hq3CEAWilj4Qi8yOLt6zElqhjVZMjDOpwcHSaR
         pPRQ==
X-Gm-Message-State: AGi0PuZ9tkFbiEbcEl1Hsm5pUWjWIcHzYO/X2+/zsoCucVhChJSwl+/8
        mkFf2mBOK5saWfytmv7K/4g=
X-Google-Smtp-Source: APiQypJhrHHsRU/uH3PJZnexuFIJsytzrUPi3t+Wn5Z4iRIF0i263atdJFB9hYLExhT1Ysy5RFpCfA==
X-Received: by 2002:a17:90a:a893:: with SMTP id h19mr5238698pjq.138.1587720634247;
        Fri, 24 Apr 2020 02:30:34 -0700 (PDT)
Received: from localhost.localdomain (146.85.30.125.dy.iij4u.or.jp. [125.30.85.146])
        by smtp.gmail.com with ESMTPSA id 185sm5541315pfv.9.2020.04.24.02.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 02:30:33 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCHv5 00/13] Implement V4L2_BUF_FLAG_NO_CACHE_* flags
Date:   Fri, 24 Apr 2020 18:29:07 +0900
Message-Id: <20200424092920.4801-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

	v5 with fixes and improvements.

I have a simple v4l-compliance patch now (will send it separately) which
tests cache and consistency hints. I ran compliance against the vivid
test driver, which was additionally extended with cache_hints module param:
Trimmed v4l-compliance output:

- vivid with disabled cache hints support

[..]
Buffer ioctls (Input 3):
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
[..]

- vivid with enabled cache hints (cache_hints=1,...)

[..]
Buffer ioctls (Input 3):
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS: OK
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
[..]


v4l-compliance revealed that we cannot reliably report
V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS, it's a bit special.
Let's look at fill_buf_caps()

	if (q->allow_cache_hints && q->io_modes & VB2_MMAP)
		*caps |= V4L2_BUF_CAP_SUPPORTS_CACHE_HINTS;

There are several things here. First, if the queue is not setup yet
(we didn't call driver's ->queue_setup()) then ->allow_cache_hints
is expected to be 0. It's only in the ->queue_setup() that the driver
sets ->allow_cache_hints for those queues that can benefit from cache
management. What this means, is that if one does

	q.init(node->g_type(), memory);
	q.reqbufs(node);
	q.g_capabilities();

the cache hints cap will not be reported. We need to setup the queue

	q.init(node->g_type(), memory);
	q.reqbufs(node, 1);
	q.g_capabilities();

Second. Even if the queue is setup, we still can report wrong cache
hint values. Let's look at the following code

	fill_buf_caps(q, &p->capabilities);
	if (!vb2_queue_allows_cache_hints(q))
		p->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT;
	ret = vb2_core_reqbufs(...);
	return ret;

The thing here is that vb2_core_reqbufs() and vb2_core_create_bufs()
can re-initialize the queue and invoke ->queue_setup(), possibly
changing its memory model, etc. so cache hints cap which we set or
clear before vb2_core_reqbufs() and vb2_core_create_bufs() can become
invalid after we call those functions. It's the same with
``req->flags &= ~V4L2_FLAG_MEMORY_NON_CONSISTENT``, we cannot clear
it before reqbufs()/create_bufs(). Therefore I added two simple
functions which fixup cache hint cap and non_consistent flag after
reqbufs()/create_bufs(). So the code looks like this now:

	fill_buf_caps(q, &p->capabilities);
	ret = vb2_core_reqbufs(...);
	fixup_consistency_attr(q, &p->flags);
	fixup_cache_hints_cap(q, &p->capabilities);
	return ret;


The rest is the pretty much the same.

Previous series:
v4 link: https://lore.kernel.org/lkml/20200302041213.27662-1-senozhatsky@chromium.org/
v3 link: https://lore.kernel.org/lkml/20200226111529.180197-1-senozhatsky@chromium.org
v2 link: https://lore.kernel.org/lkml/20200204025641.218376-1-senozhatsky@chromium.org/
v1 link: https://lore.kernel.org/lkml/20191217032034.54897-1-senozhatsky@chromium.org/

Series Intro
========================================================================

	This is a reworked version of the vb2 cache hints
(V4L2_BUF_FLAG_NO_CACHE_INVALIDATE / V4L2_BUF_FLAG_NO_CACHE_CLEAN)
support patch series which previsouly was developed by Sakari and
Laurent [0].

The patch set attempts to preserve the existing behvaiour - cache
sync is performed in ->prepare() and ->finish() (unless the buffer
is DMA exported). User space can request “default behavior” override
with cache management hints, which are handled on a per-buffer basis
and should be supplied with v4l2_buffer ->flags during buffer
preparation. There are two possible hints:

- V4L2_BUF_FLAG_NO_CACHE_INVALIDATE
	No cache sync on ->finish()

- V4L2_BUF_FLAG_NO_CACHE_CLEAN
	No cache sync on ->prepare()

In order to keep things on the safe side, we also require driver
to explicitly state which of its queues (if any) support user space
cache management hints (such queues should have ->allow_cache_hints
bit set).

The patch set also (to some extent) simplifies allocators' ->prepare()
and ->finish() callbacks. Namely, we move cache management decision
making to the upper - core - layer. For example, if, previously, we
would have something like this

	vb2_buffer_done()
	  vb2_dc_finish()
	    if (buf->db_attach)
	      return;

where each allocators' ->finish() callback would either bail
out (DMA exported buffer, for instance) or sync, now that "bail
out or sync" decision is made before we call into the allocator.

Along with cache management hints, user space is also able to
adjust queue's memory consistency attributes. Memory consistency
attribute (dma_attrs) is per-queue, yet it plays its role on the
allocator level, when we allocate buffers’ private memory (planes).
For the time being, only one consistency attribute is supported:
DMA_ATTR_NON_CONSISTENT.

[0] https://www.mail-archive.com/linux-media@vger.kernel.org/msg112459.html

Sergey Senozhatsky (13):
  videobuf2: use explicit unsigned int in vb2_queue
  videobuf2: add cache management members
  videobuf2: handle V4L2 buffer cache flags
  videobuf2: add V4L2_FLAG_MEMORY_NON_CONSISTENT flag
  videobuf2: add queue memory consistency parameter
  videobuf2: handle V4L2_FLAG_MEMORY_NON_CONSISTENT flag
  videobuf2: factor out planes prepare/finish functions
  videobuf2: do not sync caches when we are allowed not to
  videobuf2: check ->synced flag in prepare() and finish()
  videobuf2: add begin/end cpu_access callbacks to dma-contig
  videobuf2: add begin/end cpu_access callbacks to dma-sg
  videobuf2: don't test db_attach in dma-contig prepare and finish
  media: vivid: add cache_hints module param

 Documentation/admin-guide/media/vivid.rst     |   9 ++
 .../userspace-api/media/v4l/buffer.rst        |  41 +++++-
 .../media/v4l/vidioc-create-bufs.rst          |   7 +-
 .../media/v4l/vidioc-reqbufs.rst              |  20 ++-
 .../media/common/videobuf2/videobuf2-core.c   | 121 +++++++++++++-----
 .../common/videobuf2/videobuf2-dma-contig.c   |  41 +++++-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  38 ++++--
 .../media/common/videobuf2/videobuf2-v4l2.c   |  93 +++++++++++++-
 drivers/media/dvb-core/dvb_vb2.c              |   2 +-
 drivers/media/test-drivers/vivid/vivid-core.c |   9 ++
 drivers/media/test-drivers/vivid/vivid-core.h |   1 +
 .../media/test-drivers/vivid/vivid-meta-cap.c |   5 +
 .../media/test-drivers/vivid/vivid-meta-out.c |   5 +
 .../media/test-drivers/vivid/vivid-sdr-cap.c  |   7 +
 .../test-drivers/vivid/vivid-touch-cap.c      |   5 +
 .../media/test-drivers/vivid/vivid-vbi-cap.c  |   5 +
 .../media/test-drivers/vivid/vivid-vbi-out.c  |   5 +
 .../media/test-drivers/vivid/vivid-vid-cap.c  |   5 +
 .../media/test-drivers/vivid/vivid-vid-out.c  |   5 +
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |   9 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   5 +-
 include/media/videobuf2-core.h                |  47 +++++--
 include/uapi/linux/videodev2.h                |  13 +-
 23 files changed, 426 insertions(+), 72 deletions(-)

-- 
2.26.2

