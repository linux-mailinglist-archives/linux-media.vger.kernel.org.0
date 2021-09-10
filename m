Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AF6406853
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbhIJI2L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhIJI2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:11 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFE6C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:00 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id d6so1431550wrc.11
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L5dIDlEb7TduptKFQf5pK4qlvzDeGzLljRLEJA4EwpM=;
        b=QW6FYNP8uWQsUwkM+c2KEOZQm7ch4KK8iurjtNDTAvKtWmZE4r20QbTXnvVoInNXFh
         I7CN9X+8zzZoK1KL0eUraoxtzTDITqDsUpmOc1u4Nei2q5Yp45m9N+z9uk/1OCJrbtAG
         fYlKCa08xPnWgmcjF7LeMk1AQCSrKGsamk+vv0CopILztqQbLxweSJQCkoj7LsjnajTZ
         ToMceDb48xf7m3n+i5u+/TsFA9+61JOiwuuKOtN2DGvBkzpMSAyEhN+MwrLrGDQa1fFq
         YHqdamSaec5BWtoB9n3W483ecyZFV1rDM981m33J7vZXNmq2oX28oqUggo/RllieZul3
         tfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L5dIDlEb7TduptKFQf5pK4qlvzDeGzLljRLEJA4EwpM=;
        b=B5/4pw5Wq4rngDQb7rhtATmfnGIO2ZKGpRGS8918l6Oja6R0D8PDdxV81zWthfsSrW
         yBSWF1QVMmjZ3qcpzXyESKyOw7/hRv9M8ZvnY8MKX2suMfxIKAjXAfufH1gxY2X5QOwU
         L431KFvUrBksqgVL7OBUmtOFn+EErlZ1pFaBehrSKw4nMjpP4ic01Ksv//5PWHoNCqQu
         OQQsMb3H8kl2yK6HqOyLwvV5+XE4W6iB/R9x85ApsYzlvPgRcRD6Xdhe3U4/h3X5nIN/
         dfOPxtSBU+qCXRlJilB0qnRyICFgRNO584K2Ouvp8unr4qXLtHFL+W2zh+rsEZTJzPRE
         TNMA==
X-Gm-Message-State: AOAM531p8/4rk0uhcBj9xd7AHwc3xdS+DMC/bvA4sjJY4zYZM0x2p5gM
        iqDhYWFp2+/LNFilwmfBxNo=
X-Google-Smtp-Source: ABdhPJw0H96EVho6e+D7qCMJS8mWk4G39tWkKOX4/EPVrxRLEx5atvunrpg6COw8vyus+jXx7vZbKw==
X-Received: by 2002:adf:e645:: with SMTP id b5mr8469261wrn.34.1631262419343;
        Fri, 10 Sep 2021 01:26:59 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:26:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 03/14] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Fri, 10 Sep 2021 10:26:44 +0200
Message-Id: <20210910082655.82168-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 81 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 8cbccaae169d..9a9c0bba772b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -433,74 +433,57 @@ EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
  */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned int i;
+	struct dma_resv_cursor cursor;
+	struct dma_resv_list *list;
+	struct dma_fence *f, *excl;
 
 	dma_resv_assert_held(dst);
 
-	rcu_read_lock();
-	src_list = dma_resv_shared_list(src);
+	list = NULL;
+	excl = NULL;
 
-retry:
-	if (src_list) {
-		unsigned int shared_count = src_list->shared_count;
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(dst, &cursor, true, f) {
 
-		rcu_read_unlock();
+		if (cursor.is_first) {
+			dma_resv_list_free(list);
+			dma_fence_put(excl);
 
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
+			if (cursor.fences) {
+				unsigned int cnt = cursor.fences->shared_count;
 
-		rcu_read_lock();
-		src_list = dma_resv_shared_list(src);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
+				rcu_read_unlock();
+				list = dma_resv_list_alloc(cnt);
+				if (!list)
+					return -ENOMEM;
 
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence __rcu **dst;
-			struct dma_fence *fence;
+				list->shared_count = 0;
+				rcu_read_lock();
 
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = dma_resv_shared_list(src);
-				goto retry;
+			} else {
+				list = NULL;
 			}
+			excl = NULL;
+		}
 
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
+		if (cursor.is_exclusive)
+			excl = f;
+		else
+			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
 
-			dst = &dst_list->shared[dst_list->shared_count++];
-			rcu_assign_pointer(*dst, fence);
-		}
-	} else {
-		dst_list = NULL;
+		/* Don't drop the reference */
+		f = NULL;
 	}
 
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
 	rcu_read_unlock();
 
-	src_list = dma_resv_shared_list(dst);
-	old = dma_resv_excl_fence(dst);
-
 	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
+	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
 	write_seqcount_end(&dst->seq);
 
-	dma_resv_list_free(src_list);
-	dma_fence_put(old);
+	dma_resv_list_free(list);
+	dma_fence_put(excl);
 
 	return 0;
 }
-- 
2.25.1

