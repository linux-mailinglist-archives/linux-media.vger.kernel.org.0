Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C208B6A0E
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 19:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfIRRz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 13:55:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33462 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfIRRz3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 13:55:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id b9so393344wrs.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnfgUXOSYJoNrbqhoykUBse7iwxXL6NxI0NEtGgJqVY=;
        b=W32YcAxZQgAkQmD3LY6uY1f4K2HB+VN5PTlosXvvtBlCZezf2yvojAcB1IAfKBihsI
         S6XaCb7k7Sz+TWbyexgNdFV/e4VNg3DLfbxWnQcREEkZ3Nak4z/h2HiO0k+RoEQzDHG6
         YetF8F2cpwTmK+skNIo4sDM5HwVKTw6Nmr5FokggEiI62q82wj3CoF9BZHD8P1rVK8cK
         cafny9u+Z8nPc5v0XE2hGVu2fRLT8JXqOLYBpdu5m0ip9CI4sFNwWoOEfdH0oUGblzNA
         bVx8TheM4BS04TVbZw+CUzUMbjTDgqHZkTW5pKyukXFt4pDOuYc69P9WHBO1n5TY3osS
         kcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnfgUXOSYJoNrbqhoykUBse7iwxXL6NxI0NEtGgJqVY=;
        b=GHLCG3aiKT0BpNC9OJZN/29HpY0nEjuarfKWACXlU73g4Kid5HtTh85fgQDSB7Ubat
         MnOt+eyk85lT+to6QCF4r3j+Z5/0f7+cdHhfeqV+E2NTev0T8bGvoU+xEBmsES/k91Wh
         hwGKF3My4mbIRAWJLwf/4Fb3pr7M+3uiT6xAQo6+wjDHiooCyE60hhaO+weJKLWYCAoG
         UxGVC7nlLyRb0wbYFLufWBb4xyrbWh3DqT3+0iXcaJ0/MIfLh8nYVgWKJwZAry1aseUN
         2Jk3qAy5b2IG1lJebmqcKc6tW8JtTmBz/qX4BlJncbuj0y3n8f7U4pfOUdbRI6byaXcO
         wSBg==
X-Gm-Message-State: APjAAAU63I1PmLWcpxmbNPJ5MZ4YbLVFhVJtDBCnt0PNdrKmaiY9rQmJ
        sTEfVH6dLF+H/dEyFaSee30=
X-Google-Smtp-Source: APXvYqx3MCUPldqva5/DncZ6EVIsWZTF7igxX5q/3C+6umWoXnSgY5zAxgN4TrbW8Fm8DMKZ/oZDKw==
X-Received: by 2002:adf:fa90:: with SMTP id h16mr3951810wrr.52.1568829326284;
        Wed, 18 Sep 2019 10:55:26 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f002:ffad:c852:eff6])
        by smtp.gmail.com with ESMTPSA id q3sm4074027wru.33.2019.09.18.10.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 10:55:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk, daniel@ffwll.ch, sumit.semwal@linaro.org
Subject: [PATCH 1/3] dma-buf: add dma_resv_ctx for deadlock handling
Date:   Wed, 18 Sep 2019 19:55:23 +0200
Message-Id: <20190918175525.49441-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ww_mutex framework allows for detecting deadlocks when multiple
threads try to acquire the same set of locks in different order.

The problem is that handling those deadlocks was the burden of the user of
the ww_mutex implementation and at least some users didn't got that right
on the first try.

So introduce a new dma_resv_ctx object which can be used to
simplify the deadlock handling. This is done by tracking all locked
dma_resv objects in the context as well as the last contended object.

When a deadlock occurse we now unlock all previously locked objects and
acquire the contended lock in the slow path. After this is done -EDEADLK
is still returned to signal that all other locks now need to be
re-acquired again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile       |   2 +-
 drivers/dma-buf/dma-resv-ctx.c | 108 +++++++++++++++++++++++++++++++++
 include/linux/dma-resv-ctx.h   |  68 +++++++++++++++++++++
 include/linux/dma-resv.h       |   1 +
 4 files changed, 178 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/dma-resv-ctx.c
 create mode 100644 include/linux/dma-resv-ctx.h

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 03479da06422..da7701c85de2 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-resv.o seqno-fence.o
+	 dma-resv.o dma-resv-ctx.o seqno-fence.o
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
 obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
 obj-$(CONFIG_UDMABUF)		+= udmabuf.o
diff --git a/drivers/dma-buf/dma-resv-ctx.c b/drivers/dma-buf/dma-resv-ctx.c
new file mode 100644
index 000000000000..cad10fa6f80b
--- /dev/null
+++ b/drivers/dma-buf/dma-resv-ctx.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Christian König <christian.koenig@amd.com>
+ */
+
+#include <linux/dma-resv-ctx.h>
+
+/**
+ * dma_resv_ctx_init - initialize a reservation context
+ * @ctx: the context to initialize
+ *
+ * Start using this reservation context to lock reservation objects for update.
+ */
+void dma_resv_ctx_init(struct dma_resv_ctx *ctx)
+{
+	ww_acquire_init(&ctx->base, &reservation_ww_class);
+	init_llist_head(&ctx->locked);
+	ctx->contended = NULL;
+}
+EXPORT_SYMBOL(dma_resv_ctx_init);
+
+/**
+ * dma_resv_ctx_unlock_all - unlock all reservation objects
+ * @ctx: the context which holds the reservation objects
+ *
+ * Unlocks all reservation objects locked with this context.
+ */
+void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx)
+{
+	struct dma_resv *obj, *next;
+
+	if (ctx->contended)
+		dma_resv_unlock(ctx->contended);
+	ctx->contended = NULL;
+
+	llist_for_each_entry_safe(obj, next, ctx->locked.first, locked)
+		ww_mutex_unlock(&obj->lock);
+	init_llist_head(&ctx->locked);
+}
+EXPORT_SYMBOL(dma_resv_ctx_unlock_all);
+
+/**
+ * dma_resv_ctx_lock - lock a reservation object with deadlock handling
+ * @ctx: the context which should be used to lock the object
+ * @obj: the object which needs to be locked
+ * @interruptible: if we should wait interruptible
+ *
+ * Use @ctx to lock the reservation object. If a deadlock is detected we backoff
+ * by releasing all locked objects and use the slow path to lock the reservation
+ * object. After successfully locking in the slow path -EDEADLK is returned to
+ * signal that all other locks must be re-taken as well.
+ */
+int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
+		      bool interruptible)
+{
+	int ret = 0;
+
+	if (unlikely(ctx->contended == obj))
+		ctx->contended = NULL;
+	else if (interruptible)
+		ret = dma_resv_lock_interruptible(obj, &ctx->base);
+	else
+		ret = dma_resv_lock(obj, &ctx->base);
+
+	if (likely(!ret)) {
+		/* don't use llist_add here, we have separate locking */
+		obj->locked.next = ctx->locked.first;
+		ctx->locked.first = &obj->locked;
+		return 0;
+	}
+	if (unlikely(ret != -EDEADLK))
+		return ret;
+
+	dma_resv_ctx_unlock_all(ctx);
+
+	if (interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj, &ctx->base);
+		if (unlikely(ret))
+			return ret;
+	} else {
+		dma_resv_lock_slow(obj, &ctx->base);
+	}
+
+	ctx->contended = obj;
+	return -EDEADLK;
+}
+EXPORT_SYMBOL(dma_resv_ctx_lock);
diff --git a/include/linux/dma-resv-ctx.h b/include/linux/dma-resv-ctx.h
new file mode 100644
index 000000000000..86473de65167
--- /dev/null
+++ b/include/linux/dma-resv-ctx.h
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors:
+ *	Christian König <christian.koenig@amd.com>
+ */
+
+#ifndef _LINUX_DMA_RESV_CTX_H
+#define _LINUX_DMA_RESV_CTX_H
+
+#include <linux/llist.h>
+#include <linux/dma-resv.h>
+
+/**
+ * struct dma_resv_ctx - context to lock reservation objects
+ * @base: ww_acquire_ctx used for deadlock detection
+ * @locked: list of dma_resv objects locked in this context
+ * @contended: contended dma_resv object
+ */
+struct dma_resv_ctx {
+	struct ww_acquire_ctx base;
+	struct llist_head locked;
+	struct dma_resv *contended;
+};
+
+/**
+ * dma_resv_ctx_done - wrapper for ww_acquire_done
+ * @ctx: the reservation context which is done with locking
+ */
+static inline void dma_resv_ctx_done(struct dma_resv_ctx *ctx)
+{
+	ww_acquire_done(&ctx->base);
+}
+
+/**
+ * dma_resv_ctx_fini - wrapper for ww_acquire_fini
+ * @ctx: the reservation context which is finished
+ */
+static inline void dma_resv_ctx_fini(struct dma_resv_ctx *ctx)
+{
+	ww_acquire_fini(&ctx->base);
+}
+
+void dma_resv_ctx_init(struct dma_resv_ctx *ctx);
+void dma_resv_ctx_unlock_all(struct dma_resv_ctx *ctx);
+int dma_resv_ctx_lock(struct dma_resv_ctx *ctx, struct dma_resv *obj,
+		      bool interruptible);
+
+#endif /* _LINUX_DMA_RESV_CTX_H */
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index ee50d10f052b..1267822c2669 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -71,6 +71,7 @@ struct dma_resv_list {
  */
 struct dma_resv {
 	struct ww_mutex lock;
+	struct llist_node locked;
 	seqcount_t seq;
 
 	struct dma_fence __rcu *fence_excl;
-- 
2.17.1

