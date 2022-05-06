Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095BE51DA1C
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 16:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442113AbiEFOOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 May 2022 10:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442111AbiEFOOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 May 2022 10:14:09 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA02568FBA
        for <linux-media@vger.kernel.org>; Fri,  6 May 2022 07:10:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id i27so14687991ejd.9
        for <linux-media@vger.kernel.org>; Fri, 06 May 2022 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
        b=lU6nT6ElU5a9Th7b6Bn2x9KOLSBH7B7mSLKE7pKyrmRgMIaHNgq2zz0aFTEAlGOttX
         kpY8D84zbO19AF7lXnZvSFOFmK+IBUuwQ924WTEVf6umK10BLyka+fW2mcGp9xN63Zi9
         bBiZtjErKEuXQs/3tb6WNN5o8dISboR0iuqGTRafUoya0clsmL1VboqnnlTe3yz6cK1i
         4EjOXVrlSpa7Sc7+cMkNsmL8OU34Qrmz+ne+GbNsrUph67HucHwAkMsSB6/Z1xCf2xXL
         dYTJ6OlmMIhWPzXa7wqOWgnzAoMS9gUgVGWc4Cg9LIXNL5wu2bjr8oqeFPF2X9WYrKJ9
         eAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUhOQoaS8SryVGFS1WVsHEEI67ebg1mSAumxdSxJz/U=;
        b=5prRW8ylSXU/QgRmemgaJVN6ITLgb4AJnsKlmzjKqm+lc6zv433nH9DfEYFs0m5teU
         AgRy+A9Hd3sjt3DR8wYDML95oNOZgBf53eG3xTB4NKzi7FpLgM9zUHe6NNVWmkf4sBF8
         pRDPxYTmXsxpPnxDPfrtLbDLX3xy25aWh4WGx0flwE8S8y9eE3vxX0ujUymUQ3ybwiSt
         Q3MlxYRVsvpo8zEMThMFSUuUumBoBvkfH9dw870NXAcjUjVgkFnEqy6tEbd3YzgjTEnp
         XivXLTyw5tbZr25M2KoTuApgIBVpxCE8AI+7w3QA1vwaaj/pfIzzjFkjnroy8DquzbyS
         zATw==
X-Gm-Message-State: AOAM531J0MryD8lP4VjCBBT9CwP+bP4qDj2ffzjN3ZNEdx/6p7NwHCP5
        BEpYv9QlxETclidZirYME2btzfLXSpE=
X-Google-Smtp-Source: ABdhPJwfiYF4mHA4H/ZVUKgDdWYM9v4yXITGNIkKMRFFj2u6HGVFd3YbG9zdc7rsAPj4vSK+80OBjQ==
X-Received: by 2002:a17:907:72ce:b0:6f4:d139:c2b1 with SMTP id du14-20020a17090772ce00b006f4d139c2b1mr3117722ejc.563.1651846211215;
        Fri, 06 May 2022 07:10:11 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
        by smtp.gmail.com with ESMTPSA id jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:10:10 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest v2
Date:   Fri,  6 May 2022 16:10:05 +0200
Message-Id: <20220506141009.18047-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

The selftests, fix the error handling, remove unused functions and stop
leaking memory in failed tests.

v2: fix the memory leak correctly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 48 +++++++++++----------------
 1 file changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 039f016b57be..e20c5a7dcfe4 100644
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
@@ -59,7 +52,7 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 
 	fences = kcalloc(num_fences, sizeof(*fences), GFP_KERNEL);
 	if (!fences)
-		return NULL;
+		goto error_put;
 
 	va_start(valist, num_fences);
 	for (i = 0; i < num_fences; ++i)
@@ -70,13 +63,17 @@ static struct dma_fence *mock_array(unsigned int num_fences, ...)
 				       dma_fence_context_alloc(1),
 				       1, false);
 	if (!array)
-		goto cleanup;
+		goto error_free;
 	return &array->base;
 
-cleanup:
-	for (i = 0; i < num_fences; ++i)
-		dma_fence_put(fences[i]);
+error_free:
 	kfree(fences);
+
+error_put:
+	va_start(valist, num_fences);
+	for (i = 0; i < num_fences; ++i)
+		dma_fence_put(va_arg(valist, typeof(*fences)));
+	va_end(valist);
 	return NULL;
 }
 
@@ -113,7 +110,6 @@ static int sanitycheck(void *arg)
 	if (!chain)
 		return -ENOMEM;
 
-	dma_fence_signal(f);
 	dma_fence_put(chain);
 	return err;
 }
@@ -154,10 +150,8 @@ static int unwrap_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(array);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain(void *arg)
@@ -196,10 +190,8 @@ static int unwrap_chain(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 static int unwrap_chain_array(void *arg)
@@ -242,10 +234,8 @@ static int unwrap_chain_array(void *arg)
 		err = -EINVAL;
 	}
 
-	dma_fence_signal(f1);
-	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }
 
 int dma_fence_unwrap(void)
-- 
2.25.1

