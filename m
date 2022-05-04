Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031DC519F30
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349395AbiEDM0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 08:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349393AbiEDM0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 08:26:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A0C2FFCD
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 05:23:00 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id v12so1766336wrv.10
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z8MDc1wE0ZFoTAmggbGjxE1HpUSkMlpoIhK9jF1KAuw=;
        b=TYQfoOlch6TwaBxVr5FpZvgmJ9fSnN+RMAC2Gn3sa6zXUGqaaCF9yuJgEVM3iB3FtY
         LSwkhnALm9xXTRubLIURxS3likrHelpuh3yINtYhjQlTNAlXag9KHvrZtBYlp6qQ48cC
         Ka2E2DVZigp3+6oT9Qyny+hUze62ecc7vFdZwer+5OWqeNSThRQxE7HfOydyPidFiXKj
         V3sje6Z3Rhh370X+6OpEtaS/9e2IJnHujAScgprLLNoV4RFhxWcyC8lVvZ///4eCaezG
         ztFWjqJlg672i/56Qq9ToFC+w+cERCtA1gHRBZsk5yScQdzTfyf5RKpVG6SIsClWYWYn
         OE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z8MDc1wE0ZFoTAmggbGjxE1HpUSkMlpoIhK9jF1KAuw=;
        b=5a3PygBAHXGte1JN1e81edK2TWCff7onbGmE30HDMVFPagbcPxkVoKFky0As8d5wym
         Pg/j9Zsk6r2pLmpTnpEGhc0hr51UEuhCAdIQLCe4zOgiHw10FAzFmBHzvKatDgK2i1gI
         cLmtATz08tnUXNgI1zVfvQGXzcFwPIcX/dByLennlmwT0KoGduEhNnnLqqbv7yKnxCfT
         92OZ6joWtkr7DtqIl+0Comqja5A8Hcbzayz3fbDzz/ztyZvbUidONAhqChKRi6bAf6Ul
         iBf/diXRDaIdOKJADKWdTT5y4HBbr7oX+ADA6Mv5RJVkUhuZ/xn5AGIId62Ql7Y4Zmya
         2T8w==
X-Gm-Message-State: AOAM533qjimU0rOm33Oc3CVMJsQGSoosslDrKvNVEhegKykcnhAq1Waz
        BT1x15vmjg1b5RzvBMv2b+zAl+yiGh0=
X-Google-Smtp-Source: ABdhPJxCQT47rIZ9d1Qlb5ZuniKVjSBfAwSyd0tJcNHn/Nc5vB86VHtCKzy2j9+jxv5cXvQLUlMJRw==
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id t8-20020a5d42c8000000b0020ad91f87b5mr16540683wrr.301.1651666979050;
        Wed, 04 May 2022 05:22:59 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
        by smtp.gmail.com with ESMTPSA id l28-20020a05600c1d1c00b003942a244ed1sm1462119wms.22.2022.05.04.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:22:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 2/5] dma-buf: cleanup dma_fence_unwrap implementation
Date:   Wed,  4 May 2022 14:22:53 +0200
Message-Id: <20220504122256.1654-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504122256.1654-1-christian.koenig@amd.com>
References: <20220504122256.1654-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the code from the inline functions into exported functions.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile           |  2 +-
 drivers/dma-buf/dma-fence-unwrap.c | 59 ++++++++++++++++++++++++++++++
 include/linux/dma-fence-unwrap.h   | 52 ++------------------------
 3 files changed, 64 insertions(+), 49 deletions(-)
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

