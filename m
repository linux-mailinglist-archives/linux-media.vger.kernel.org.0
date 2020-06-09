Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D355A1F33EC
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 08:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgFIGEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 02:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726886AbgFIGEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 02:04:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0184CC03E969;
        Mon,  8 Jun 2020 23:04:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so9821338pgv.8;
        Mon, 08 Jun 2020 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lYRB6PYVBiyapz6A4TFF091mtZ2ITZTsavPC5C/0Rns=;
        b=ostVs+eVDVPNhSoNRalUVxqeALKfy5K9ysWzxpwLghJo7kTuGhZrujIKIf6IExO9uo
         x8uK5LW1cUtPR6OQLDjW1KCh//T+Hqexlvm4OfHNAp/H0u3QGtkBB/1aY7iwGQBF6qfA
         1/G7kckFA/GzY17xhaysM8ckNTiRwPmMxChmD5riHb3EV1uhlKKCRiSaAT0ilvXEp7yI
         lPhkZ4bAMd5UzPXpnfH9gp0aN8HWYClRhvlS+v2OtF9j9zRJeZR7nrJDHllA1rlFgMeG
         L5XCVnZ+jpZjJG5uRsdXsXvEiZ8SydNPzeMuvpRM7Zl3YIJn7HP79Tas3gmN6uXXwTQC
         2lOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lYRB6PYVBiyapz6A4TFF091mtZ2ITZTsavPC5C/0Rns=;
        b=di2PK50XoJRO0ODZgv2bPQYPeywPEPiQwVT+znWrVbZre0ecsRZkuRryJNNhT1N0ni
         ho42Bnr4Fwvnj5KnsD0+Wk3z3rBgPUdA9JUN5xrBPqnYRNTxO6rl41Fg8rYlPLWcQsdb
         4gzJdmUV9LPopr2fwmDuTyNeJFPwerqW1ELLEaKARzYAAO97aHDODpunzytrD83R12aw
         1WdxvPzt4ELRiDTdp5pJN152XByu8xWCXIXnRYXJP/MN5abXsCh3OB2jHMtfdgIwhQqB
         JVrrR3t7fnZGHh+gS3iyiq9CSoMT6D2heL731NJc9NnZfdsjuNIJEj9/avCkW5dBLGd/
         kY/Q==
X-Gm-Message-State: AOAM531wpo8P5NV5gZM0UtDjsQj41GHD3fGoHfNN6fWqGnsZbv9stubi
        1o5E5inLGGOKEKshGMRWuRs=
X-Google-Smtp-Source: ABdhPJySk8EwSWOeKNoqW2OQmmyGb4a/Nb5lkvkHGv9rYME55B44uny3+LDxrOTbf7VlUX+WW4Zk6Q==
X-Received: by 2002:a05:6a00:15ca:: with SMTP id o10mr11956214pfu.169.1591682663336;
        Mon, 08 Jun 2020 23:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id p12sm8934905pfq.69.2020.06.08.23.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 23:04:22 -0700 (PDT)
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] videobuf2: always re-init queue memory consistency attribute
Date:   Tue,  9 Jun 2020 15:04:17 +0900
Message-Id: <20200609060417.8066-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need a combination of two factors in order to permit modification
of queue's memory consistency attribute in set_queue_consistency():
  (1) queue should allow user-space cache hints
  (2) queue should be used for MMAP-ed I/O

Therefore the code in videobuf2 core looks as follows:

	q->memory = req->memory;
	set_queue_consistency(q, consistent);

This works when we do something like this (suppose that queue allows
cache hints)

	reqbufs.memory = V4L2_MEMORY_DMABUF;
	reqbufs.flags = 0;
	doioctl(node, VIDIOC_REQBUFS, &reqbufs);

	reqbufs.memory = V4L2_MEMORY_MMAP;
	reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
	doioctl(node, VIDIOC_REQBUFS, &reqbufs);

However, this doesn't work the other way around

	reqbufs.memory = V4L2_MEMORY_MMAP;
	reqbufs.flags = V4L2_FLAG_MEMORY_NON_CONSISTENT;
	doioctl(node, VIDIOC_REQBUFS, &reqbufs);

	reqbufs.memory = V4L2_MEMORY_DMABUF;
	reqbufs.flags = 0;
	doioctl(node, VIDIOC_REQBUFS, &reqbufs);

because __vb2_queue_free() doesn't clear queue's ->dma_attrs
once its don't freeing queue buffers, and by the time we call
set_queue_consistency() the queue is DMABUF so (2) is false
and we never clear the stale consistency attribute.

Re-implement set_queue_consistency() - it must always clear
queue's non-consistency attr and set it only if (1) and (2).

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 7e081716b8da..37d0186ba330 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -704,12 +704,11 @@ EXPORT_SYMBOL(vb2_verify_memory_type);
 
 static void set_queue_consistency(struct vb2_queue *q, bool consistent_mem)
 {
+	q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
+
 	if (!vb2_queue_allows_cache_hints(q))
 		return;
-
-	if (consistent_mem)
-		q->dma_attrs &= ~DMA_ATTR_NON_CONSISTENT;
-	else
+	if (!consistent_mem)
 		q->dma_attrs |= DMA_ATTR_NON_CONSISTENT;
 }
 
-- 
2.27.0

