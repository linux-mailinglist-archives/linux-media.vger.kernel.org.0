Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE3750FD85
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 14:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244048AbiDZMtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 08:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244153AbiDZMtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 08:49:50 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331E3179EB2
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:46:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j15so12063015wrb.2
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h6287YDjDUK+eFsVfJsYvnD1WwPKUDWTtG8h5mAWiqU=;
        b=Q/wKqMy43pyd0rMHbAGGSJqLuQq10eefnGEe+RKVqDVVWcy/T7efVeg2vJfCTSw87h
         DezJdj8wOYlHI3dfrQyJAmnSVCUvvu+733kwRNmbhn4OSl4D3dZv7M5hNM45QE1h4PvA
         Or2Wzv6IysgRLDkJ/d4LL0ZqAQMkpSxk05v9YH7C39cfIvdbUuR0H8q8Vg4HoZ0RvPR5
         QTLMAyO/G8NWTIk505ScNAQr9iGrbcGs+971sAK/SKJPgKeZrrgb3uRtx3DPm63Jh3x9
         wVgE3A4NGd7Dzt++uWGIIK2fjGTyDfH6DUZy7FbUi4Ec+wPB5t6Bwv44I2MOoc/piy7y
         Cy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6287YDjDUK+eFsVfJsYvnD1WwPKUDWTtG8h5mAWiqU=;
        b=eQOMfsRkUH19hPHzfsHuat1nvOcolOX3Z75CRxp0IQUGUuC/jEzXD1uAfcEWIj35YG
         EfGP7yUJY2uJgSaFHXOIMR7X0KntXw0GMIs1V02EF9LqoAcaod9nmao9PkKmvbznZGER
         X8aX5Vy3BvpMNIrHrZEyrtxVBoJjDAbtCzPiKoqD05MKwnNOY2wvftp2AbYPpEJAwaW/
         5QbnqK0Sm2jnV0d1C1yFauy8iqc1oD0FBf7lLA2Q+hw60aOm16an7qKK0m7yiw0FvZJ/
         n560wv1h1v5KDnYW152JVP4qBmzq+dksWj9+623NOc8Ti5mnH67VtXf9ffXhvYQNEtyW
         t5dw==
X-Gm-Message-State: AOAM530nCY5yBSyECMfvTj5/+huPlEZjb6S8Z2BNDA84DSdi6C9m9Vci
        OlCDXba8L21HQiYpU0Hw4lg=
X-Google-Smtp-Source: ABdhPJwJAK2HiB3ZbgqcCeas8cfbdVCwNeWxWg8zyrszlLjPjzB265V1RDm/hfxYPjIZoAFgHvdCvg==
X-Received: by 2002:adf:d1ce:0:b0:20a:e668:8927 with SMTP id b14-20020adfd1ce000000b0020ae6688927mr2335749wrd.508.1650977200608;
        Tue, 26 Apr 2022 05:46:40 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id s10-20020adf978a000000b0020ae0154f1esm3641025wrb.5.2022.04.26.05.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:46:40 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/3] dma-buf: cleanup dma_fence_unwrap implementation and selftest
Date:   Tue, 26 Apr 2022 14:46:36 +0200
Message-Id: <20220426124637.329764-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426124637.329764-1-christian.koenig@amd.com>
References: <20220426124637.329764-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the code from the inline functions into exported functions.

While at it also cleanup the the selftests, fix the error handling,
remove unused functions and stop leaking memory in failed tests.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile              |  2 +-
 drivers/dma-buf/dma-fence-unwrap.c    | 59 +++++++++++++++++++++++++++
 drivers/dma-buf/st-dma-fence-unwrap.c | 40 ++++++++----------
 include/linux/dma-fence-unwrap.h      | 52 ++---------------------
 4 files changed, 80 insertions(+), 73 deletions(-)
 create mode 100644 drivers/dma-buf/dma-fence-unwrap.c

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 4c9eb53ba3f8..70ec901edf2c 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
-	 dma-resv.o
+	 dma-fence-unwrap.o dma-resv.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
 obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
 obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
new file mode 100644
index 000000000000..711be125428c
--- /dev/null
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dma-fence-util: misc functions for dma_fence objects
+ *
+ * Copyright (C) 2022 Advanced Micro Devices, Inc.
+ * Authors:
+ *	Christian König <christian.koenig@amd.com>
+ */
+
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-unwrap.h>
+
+/* Internal helper to start new array iteration, don't use directly */
+static struct dma_fence *
+__dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
+{
+	cursor->array = dma_fence_chain_contained(cursor->chain);
+	cursor->index = 0;
+	return dma_fence_array_first(cursor->array);
+}
+
+/**
+ * dma_fence_unwrap_first - return the first fence from fence containers
+ * @head: the entrypoint into the containers
+ * @cursor: current position inside the containers
+ *
+ * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
+ * first fence.
+ */
+struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
+					 struct dma_fence_unwrap *cursor)
+{
+	cursor->chain = dma_fence_get(head);
+	return __dma_fence_unwrap_array(cursor);
+}
+EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
+
+/**
+ * dma_fence_unwrap_next - return the next fence from a fence containers
+ * @cursor: current position inside the containers
+ *
+ * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
+ * the next fence from them.
+ */
+struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
+{
+	struct dma_fence *tmp;
+
+	++cursor->index;
+	tmp = dma_fence_array_next(cursor->array, cursor->index);
+	if (tmp)
+		return tmp;
+
+	cursor->chain = dma_fence_chain_walk(cursor->chain);
+	return __dma_fence_unwrap_array(cursor);
+}
+EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 039f016b57be..59628add93f5 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -4,27 +4,19 @@
  * Copyright (C) 2022 Advanced Micro Devices, Inc.
  */
 
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/dma-fence-unwrap.h>
-#if 0
-#include <linux/kernel.h>
-#include <linux/kthread.h>
-#include <linux/mm.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/random.h>
-#endif
 
 #include "selftest.h"
 
 #define CHAIN_SZ (4 << 10)
 
-static inline struct mock_fence {
+struct mock_fence {
 	struct dma_fence base;
 	spinlock_t lock;
-} *to_mock_fence(struct dma_fence *f) {
-	return container_of(f, struct mock_fence, base);
-}
+};
 
 static const char *mock_name(struct dma_fence *f)
 {
@@ -45,7 +37,8 @@ static struct dma_fence *mock_fence(void)
 		return NULL;
 
 	spin_lock_init(&f->lock);
-	dma_fence_init(&f->base, &mock_ops, &f->lock, 0, 0);
+	dma_fence_init(&f->base, &mock_ops, &f->lock,
+		       dma_fence_context_alloc(1), 1);
 
 	return &f->base;
 }
@@ -113,7 +106,6 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		return -ENOMEM;
 
-	dma_fence_signal(f);
 	dma_fence_put(chain);
 	return err;
 }
@@ -154,10 +146,10 @@ static int unwrap_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(array);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain(void *arg)
@@ -196,10 +188,10 @@ static int unwrap_chain(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain_array(void *arg)
@@ -242,10 +234,10 @@ static int unwrap_chain_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
+	dma_fence_put(f1);
+	dma_fence_put(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 int dma_fence_unwrap(void)
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index 77e335a1bcac..e7c219da4ed7 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * fence-chain: chain fences together in a timeline
- *
  * Copyright (C) 2022 Advanced Micro Devices, Inc.
  * Authors:
  *	Christian König <christian.koenig@amd.com>
@@ -10,8 +8,7 @@
 #ifndef __LINUX_DMA_FENCE_UNWRAP_H
 #define __LINUX_DMA_FENCE_UNWRAP_H
 
-#include <linux/dma-fence-chain.h>
-#include <linux/dma-fence-array.h>
+struct dma_fence;
 
 /**
  * struct dma_fence_unwrap - cursor into the container structure
@@ -33,50 +30,9 @@ struct dma_fence_unwrap {
 	unsigned int index;
 };
 
-/* Internal helper to start new array iteration, don't use directly */
-static inline struct dma_fence *
-__dma_fence_unwrap_array(struct dma_fence_unwrap * cursor)
-{
-	cursor->array = dma_fence_chain_contained(cursor->chain);
-	cursor->index = 0;
-	return dma_fence_array_first(cursor->array);
-}
-
-/**
- * dma_fence_unwrap_first - return the first fence from fence containers
- * @head: the entrypoint into the containers
- * @cursor: current position inside the containers
- *
- * Unwraps potential dma_fence_chain/dma_fence_array containers and return the
- * first fence.
- */
-static inline struct dma_fence *
-dma_fence_unwrap_first(struct dma_fence *head, struct dma_fence_unwrap *cursor)
-{
-	cursor->chain = dma_fence_get(head);
-	return __dma_fence_unwrap_array(cursor);
-}
-
-/**
- * dma_fence_unwrap_next - return the next fence from a fence containers
- * @cursor: current position inside the containers
- *
- * Continue unwrapping the dma_fence_chain/dma_fence_array containers and return
- * the next fence from them.
- */
-static inline struct dma_fence *
-dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
-{
-	struct dma_fence *tmp;
-
-	++cursor->index;
-	tmp = dma_fence_array_next(cursor->array, cursor->index);
-	if (tmp)
-		return tmp;
-
-	cursor->chain = dma_fence_chain_walk(cursor->chain);
-	return __dma_fence_unwrap_array(cursor);
-}
+struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
+					 struct dma_fence_unwrap *cursor);
+struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
 
 /**
  * dma_fence_unwrap_for_each - iterate over all fences in containers
-- 
2.25.1

