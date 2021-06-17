Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9BA3AB22C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbhFQLSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbhFQLSP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:15 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F95C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s6so3427149edu.10
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xa2i71Ri2eK/e91UCCTXEAoquyui6jF43BKEv04gN4g=;
        b=J4G7oyFYVe/U+4ZAFn6M8m4z7Y24tHmXJPLZkUlymA1ekUAOM4VnvwV19yW7Txo/C/
         QyY271dLeV6GK7cz/0wNgveeMKZFxeAZQrV06VU2lAkmNimfAEpwfO+VlsNHaQDGi12X
         AgXYTEEOUY/JngrYoedtySNu2ZdWifo4EEkT9FLZmdDORsDbYui0QKIwJ6P5ACcRJj4i
         TVddfMXrm+Y9dBDb0TWnfAmB1LcWfUhYkKsUlUekwaEZpNVH5v6z7vUxMq4+S9P9kx2i
         rP/SD+UDsKrOr6Xgr3Y2g/U+4w735YyPIZOho+WV5a9e0TphJPeR2PrLciTY1cGZ060a
         etwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xa2i71Ri2eK/e91UCCTXEAoquyui6jF43BKEv04gN4g=;
        b=Q/SNGbEYXH24F7eyokwhIaegb0Udilmq93pjV4BgpCp3Gx1N3mThmeBLP/QtQS7f1s
         T3b+GtXV4WXblfUuA9L188LgsWB2eycVUvhZbLdNCpWTSbxPVF4cr+SEGFJGWwUWrdPc
         FDGXrCWyDpW4go7g3x/oFdLpoc2R8siy9fnqVj12kuvgAoMDCmkNQ89uv8t1w7ClfTHZ
         LqqsJKIsCXdV9NOo0X5Nh6wmkLQBK25B/s5i6Zz+GmZiL6LNowjA39JOq75+Yp0GIOnc
         Jp1Wy5CpXOyacJKVXOFFQtyp1ONTxO3Ow8pyEuPFHcfthDKjdvIvm5hE5egFBo4ZtLLV
         lRYg==
X-Gm-Message-State: AOAM530b5Q3uMEtYjSmVRXdIJf6LxRh/zPylTP4hcey5jDBC5xE+jUy2
        RjK8cYziagFlH6Ikh4JUqBI=
X-Google-Smtp-Source: ABdhPJwtK+PmMG0EvZiApB5Ui9GYadZi0QPgMNTTpHdQN5LAPkkC9DhaLZn5j6xJ1lZxbulacF4yYQ==
X-Received: by 2002:aa7:ce03:: with SMTP id d3mr5732594edv.360.1623928565462;
        Thu, 17 Jun 2021 04:16:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:05 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 06/16] dma-buf: use new iterator in dma_resv_test_signaled
Date:   Thu, 17 Jun 2021 13:15:48 +0200
Message-Id: <20210617111558.28486-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 54 +++++---------------------------------
 1 file changed, 7 insertions(+), 47 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5192cf4271ac..85e07becdb93 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -586,22 +586,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -616,43 +600,19 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
 
 	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, test_all, fence) {
+		if (!dma_fence_is_signaled(fence)) {
+			rcu_read_unlock();
+			dma_fence_put(fence);
+			return false;
 		}
 	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
-
-	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
 	rcu_read_unlock();
-	return ret;
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

