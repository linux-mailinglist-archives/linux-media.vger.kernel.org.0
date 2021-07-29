Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2E53D9DF5
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 09:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhG2HDh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 03:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbhG2HDg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 03:03:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EFEC061757
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 00:03:33 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h14so5504742wrx.10
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 00:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BV90pLSLNxFtvZJouBtN68y5+9uAQxSA5rwwB4X358o=;
        b=h/LlL2zMuFUlh+Rgiav5hdoO04kIML6q04ceniIFN1Q9pXcfwyivcKzsrNR6r5ofCs
         MBC9AJrXFoQ2JNU42VEOPp7wp78LjOoeV6MODi8YOzw6O8NF57O+ZqNYso0TJlxOJx6V
         GiDszK0lzHaZKASkVBJr63+WlTzWs2ar8qGcVTwugHDKvx650SqdbUGG4YrWIwcrIz4a
         OZV54i9E06HFzuPivMirdKAFlqwZ+QTX3iCiHyoAxjbKfktxknlYybAJTKC/tC2vGsnE
         UNBFs3WovcJ9XXL9SIbK9YJb5Frubdu7J2Sz5sVRUQVIBsXzOl7gXQJK/CvbAQJcXVVm
         d1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BV90pLSLNxFtvZJouBtN68y5+9uAQxSA5rwwB4X358o=;
        b=PnTt12x0JB540ByUQQo7+Rfoqp3fbX4WMqjgbvp1O5Y+s4N9TR0iaOEQPeNZA4X+kR
         SsPVbOBGGe/Np4Dg2OY1SiDCWCsEIOjvHAVP33J2JNcH6fHDwEaOOQElUEq1TBcGLQme
         orCjpRC9oMKQ8MIQWHUzgOrETr2iglZd86a0uD9BPpluK8nb3wQPJfzPsT7m5+vlHK2I
         C5CjTR5fmOvNQI7tcVV39gzB12/9qM6iMP1G8p2N8l7vX1lXyAcQIE/GNkRgosLK4HkL
         2pqZdo69tmjE31VwZpfLiOs4Ex0DhZioDbzoic4LVgWW5uV8kiQdkV0dyQxZjdi0vnbS
         6HSA==
X-Gm-Message-State: AOAM530MkwXBpMjOFdLpDnRWqOao1GQUFpAo/rVqOGgbi5XEuVuKKnKW
        BL63tfxmjmDlO8IkJjVlJvyoHM8zlSU=
X-Google-Smtp-Source: ABdhPJyAH8OiX4/owQzP7CSvLjf35pc08YNiW/5gvH+p+9aY8iGT7mugtNVfnlkwZSG8IucUwuTtUQ==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr3036368wrv.151.1627542211692;
        Thu, 29 Jul 2021 00:03:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4e80:335d:252f:540b])
        by smtp.gmail.com with ESMTPSA id h14sm2177527wrp.55.2021.07.29.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 00:03:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org, daniel@ffwll.ch,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] dma-buf: nuke seqno-fence
Date:   Thu, 29 Jul 2021 09:03:28 +0200
Message-Id: <20210729070330.41443-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Entirely unused.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile      |   2 +-
 drivers/dma-buf/seqno-fence.c |  71 ----------------------
 include/linux/seqno-fence.h   | 109 ----------------------------------
 3 files changed, 1 insertion(+), 181 deletions(-)
 delete mode 100644 drivers/dma-buf/seqno-fence.c
 delete mode 100644 include/linux/seqno-fence.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 40d81f23cacf..1ef021273a06 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-resv.o seqno-fence.o
+	 dma-resv.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/seqno-fence.c b/drivers/dma-buf/seqno-fence.c
deleted file mode 100644
index bfe14e94c488..000000000000
--- a/drivers/dma-buf/seqno-fence.c
+++ /dev/null
@@ -1,71 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * seqno-fence, using a dma-buf to synchronize fencing
- *
- * Copyright (C) 2012 Texas Instruments
- * Copyright (C) 2012-2014 Canonical Ltd
- * Authors:
- *   Rob Clark <robdclark@gmail.com>
- *   Maarten Lankhorst <maarten.lankhorst@canonical.com>
- */
-
-#include <linux/slab.h>
-#include <linux/export.h>
-#include <linux/seqno-fence.h>
-
-static const char *seqno_fence_get_driver_name(struct dma_fence *fence)
-{
-	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
-
-	return seqno_fence->ops->get_driver_name(fence);
-}
-
-static const char *seqno_fence_get_timeline_name(struct dma_fence *fence)
-{
-	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
-
-	return seqno_fence->ops->get_timeline_name(fence);
-}
-
-static bool seqno_enable_signaling(struct dma_fence *fence)
-{
-	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
-
-	return seqno_fence->ops->enable_signaling(fence);
-}
-
-static bool seqno_signaled(struct dma_fence *fence)
-{
-	struct seqno_fence *seqno_fence = to_seqno_fence(fence);
-
-	return seqno_fence->ops->signaled && seqno_fence->ops->signaled(fence);
-}
-
-static void seqno_release(struct dma_fence *fence)
-{
-	struct seqno_fence *f = to_seqno_fence(fence);
-
-	dma_buf_put(f->sync_buf);
-	if (f->ops->release)
-		f->ops->release(fence);
-	else
-		dma_fence_free(&f->base);
-}
-
-static signed long seqno_wait(struct dma_fence *fence, bool intr,
-			      signed long timeout)
-{
-	struct seqno_fence *f = to_seqno_fence(fence);
-
-	return f->ops->wait(fence, intr, timeout);
-}
-
-const struct dma_fence_ops seqno_fence_ops = {
-	.get_driver_name = seqno_fence_get_driver_name,
-	.get_timeline_name = seqno_fence_get_timeline_name,
-	.enable_signaling = seqno_enable_signaling,
-	.signaled = seqno_signaled,
-	.wait = seqno_wait,
-	.release = seqno_release,
-};
-EXPORT_SYMBOL(seqno_fence_ops);
diff --git a/include/linux/seqno-fence.h b/include/linux/seqno-fence.h
deleted file mode 100644
index 3cca2b8fac43..000000000000
--- a/include/linux/seqno-fence.h
+++ /dev/null
@@ -1,109 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * seqno-fence, using a dma-buf to synchronize fencing
- *
- * Copyright (C) 2012 Texas Instruments
- * Copyright (C) 2012 Canonical Ltd
- * Authors:
- *   Rob Clark <robdclark@gmail.com>
- *   Maarten Lankhorst <maarten.lankhorst@canonical.com>
- */
-
-#ifndef __LINUX_SEQNO_FENCE_H
-#define __LINUX_SEQNO_FENCE_H
-
-#include <linux/dma-fence.h>
-#include <linux/dma-buf.h>
-
-enum seqno_fence_condition {
-	SEQNO_FENCE_WAIT_GEQUAL,
-	SEQNO_FENCE_WAIT_NONZERO
-};
-
-struct seqno_fence {
-	struct dma_fence base;
-
-	const struct dma_fence_ops *ops;
-	struct dma_buf *sync_buf;
-	uint32_t seqno_ofs;
-	enum seqno_fence_condition condition;
-};
-
-extern const struct dma_fence_ops seqno_fence_ops;
-
-/**
- * to_seqno_fence - cast a fence to a seqno_fence
- * @fence: fence to cast to a seqno_fence
- *
- * Returns NULL if the fence is not a seqno_fence,
- * or the seqno_fence otherwise.
- */
-static inline struct seqno_fence *
-to_seqno_fence(struct dma_fence *fence)
-{
-	if (fence->ops != &seqno_fence_ops)
-		return NULL;
-	return container_of(fence, struct seqno_fence, base);
-}
-
-/**
- * seqno_fence_init - initialize a seqno fence
- * @fence: seqno_fence to initialize
- * @lock: pointer to spinlock to use for fence
- * @sync_buf: buffer containing the memory location to signal on
- * @context: the execution context this fence is a part of
- * @seqno_ofs: the offset within @sync_buf
- * @seqno: the sequence # to signal on
- * @cond: fence wait condition
- * @ops: the fence_ops for operations on this seqno fence
- *
- * This function initializes a struct seqno_fence with passed parameters,
- * and takes a reference on sync_buf which is released on fence destruction.
- *
- * A seqno_fence is a dma_fence which can complete in software when
- * enable_signaling is called, but it also completes when
- * (s32)((sync_buf)[seqno_ofs] - seqno) >= 0 is true
- *
- * The seqno_fence will take a refcount on the sync_buf until it's
- * destroyed, but actual lifetime of sync_buf may be longer if one of the
- * callers take a reference to it.
- *
- * Certain hardware have instructions to insert this type of wait condition
- * in the command stream, so no intervention from software would be needed.
- * This type of fence can be destroyed before completed, however a reference
- * on the sync_buf dma-buf can be taken. It is encouraged to re-use the same
- * dma-buf for sync_buf, since mapping or unmapping the sync_buf to the
- * device's vm can be expensive.
- *
- * It is recommended for creators of seqno_fence to call dma_fence_signal()
- * before destruction. This will prevent possible issues from wraparound at
- * time of issue vs time of check, since users can check dma_fence_is_signaled()
- * before submitting instructions for the hardware to wait on the fence.
- * However, when ops.enable_signaling is not called, it doesn't have to be
- * done as soon as possible, just before there's any real danger of seqno
- * wraparound.
- */
-static inline void
-seqno_fence_init(struct seqno_fence *fence, spinlock_t *lock,
-		 struct dma_buf *sync_buf,  uint32_t context,
-		 uint32_t seqno_ofs, uint32_t seqno,
-		 enum seqno_fence_condition cond,
-		 const struct dma_fence_ops *ops)
-{
-	BUG_ON(!fence || !sync_buf || !ops);
-	BUG_ON(!ops->wait || !ops->enable_signaling ||
-	       !ops->get_driver_name || !ops->get_timeline_name);
-
-	/*
-	 * ops is used in dma_fence_init for get_driver_name, so needs to be
-	 * initialized first
-	 */
-	fence->ops = ops;
-	dma_fence_init(&fence->base, &seqno_fence_ops, lock, context, seqno);
-	get_dma_buf(sync_buf);
-	fence->sync_buf = sync_buf;
-	fence->seqno_ofs = seqno_ofs;
-	fence->condition = cond;
-}
-
-#endif /* __LINUX_SEQNO_FENCE_H */
-- 
2.25.1

