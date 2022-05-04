Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 484ED519F28
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 14:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349387AbiEDM0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 08:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbiEDM0f (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 08:26:35 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B3C2F3A5
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 05:22:59 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id u3so1792640wrg.3
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 05:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2dYbzpbHvQMo1jShWOwpkjE5/wTuIDOzNVfw59wRas=;
        b=V8shUO/xhYYbGZxdaNXzcK+WSqnYEbC6vYpIe/DgsNDk/dO+GmoNGwGyQyQLbVU9OE
         iElPz6pcmk3jEpAVYaMdpkyYKF54+3jG92k2DdgkCFNUq6HTNk9H5mKoqSSmaikNXOJv
         qJXof+/srLWZWFkSKX13xgjjPwf4WCm92SuHFyV8AvOoUjiLhEJGtlm96SA1PGaMp8c/
         RedoRDc74gzxjOXdgSZjJLpxr9ucuUwTYtrXdzd746W8b39SoUsn1KNlL7uvAKMgJMt/
         w+H+pbpyGqDKy3FLVOoHIL2muANFh3Kf/bfEEPJn9PKUNG4qlt3JDujI5j39BaHDLu/v
         mhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2dYbzpbHvQMo1jShWOwpkjE5/wTuIDOzNVfw59wRas=;
        b=Va4UWxMZlqks0j46Mp5cqMZ++4nf2IeHKIadE1vOxAGOMvtV8nubcl7hqMDjmMMWFL
         1s3kmgJpj6JF2lasdpJNurPBpIkd3CKxLFcXQPZS7kv9mIG2jAGtyErrfkdauCr+0kr4
         IkZhjacvTxN/2rj51qvuUYUqotOFCuHQu0oOWuq4aKI5yD6yQMfdONGYjLUVoS30UVtz
         6l4wBZn5F9gUlpKVHzENgB5e1njnFNu0m9/MM1X3KOHdFjskZHVyYsItNRuNblS/PzkW
         FLiuaVcjVjJ8kWogvpw0QeorRGJo3H1R1Vqdkc0l2Mzq55MUIUEzd5eSkz/vi7rAQiKG
         273Q==
X-Gm-Message-State: AOAM5314OySqDstAtl5woGqYNFAQygVY52gD6KGLr3QrwZxvHCOd16LN
        fpzkXCLaEIg+p5cnMGibM5Y=
X-Google-Smtp-Source: ABdhPJz3kydFY+B/6iKFZcfRMy8REtjbOq66KG75DTt9bv0nOKZk2oLXx1bF/92Na3BGZlRTJLMNtQ==
X-Received: by 2002:a5d:498d:0:b0:20a:dc6b:35c9 with SMTP id r13-20020a5d498d000000b0020adc6b35c9mr16348694wrq.176.1651666978028;
        Wed, 04 May 2022 05:22:58 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
        by smtp.gmail.com with ESMTPSA id l28-20020a05600c1d1c00b003942a244ed1sm1462119wms.22.2022.05.04.05.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:22:57 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 1/5] dma-buf: cleanup dma_fence_unwrap selftest
Date:   Wed,  4 May 2022 14:22:52 +0200
Message-Id: <20220504122256.1654-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 40 +++++++++++----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

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
-- 
2.25.1

