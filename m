Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661753AB226
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhFQLSN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFQLSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:13 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6E5C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w21so3473387edv.3
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=thDZm3ZMnxOybSBKCCgjDJLbNH7DHkurPeY4zB9jEVg=;
        b=cyDqD1gQpG82BNxwVh+3FajMfT5FObhHoNTdmMC0AqI8hETHw5EzZJzFAvJZ2tFuEb
         RK+ojeFZ4PgYaq7tr+j83tjrxs7wf2gkTo7BGg4TX5yAr3cl+cf2nA96igE/SpvurK6M
         PmTIyWbF5uIGtJ+y6otkw2nwnQcnf9FMwR6rMDCCn+Lhkjeoutvv3npbhdNGSa0NP6Ws
         d7urZss7tHqTWkifYYKKz1w6DCqmAQYrQXJVPLXxdiSIzroTN7SJ0ytqw9/7nAUmQzo7
         9sgJK7J8nMizqx43x8o5u3DK7/7qYhFlVDM8dnIu7oEcVpRJ2tfn9TgVUjpWc2KOxOZO
         elEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=thDZm3ZMnxOybSBKCCgjDJLbNH7DHkurPeY4zB9jEVg=;
        b=bUVFo6U/fFF5MHeaxLKkCxo/kdFUkL14huS+vAKUBZXbylLskqIgM9c0ykWUrAwLWd
         pZ+r72uW3fq0jLiIaNuxt1nfqG0aEFQzqzIKmvWVuFESsCzeKNXgGw1sPB4tG1CuObP9
         7u/3sii8v01aEguJ00AM5STbR5ldGNNAg+jwwm1dEd7QyCw7NdsLqfiZ5CUPt2vP+PvO
         MnvvSBOALg52AfWgfkhunqdHNjFGDXGRtzcoUzUTuPeCRmrJPdY1Y/LDNz2XFuB+pYiu
         nuAjPRCSbQLl9RqO8l7f8g6pTttYHhM+nIRaySiMDpU2+m7z8HblLTf8wGhht4+fdCV6
         3pMg==
X-Gm-Message-State: AOAM531tQApCIWhH0a3MkYgo1+aawEGK3DpLOsg+SP+uMwdd4jldaSl7
        FDjMbZLQynye91FcdVEiPGbLb1nJKnQ=
X-Google-Smtp-Source: ABdhPJxI2Dk3zAw97Ki69S2yppKm6wBN1DhrBhwSDQiUtkfGkjyNfAMOMv0fZTc6YyphFlmJO56WNQ==
X-Received: by 2002:a05:6402:419:: with SMTP id q25mr5732702edv.331.1623928563438;
        Thu, 17 Jun 2021 04:16:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 03/16] dma-buf: use new iterator in dma_resv_copy_fences
Date:   Thu, 17 Jun 2021 13:15:45 +0200
Message-Id: <20210617111558.28486-4-christian.koenig@amd.com>
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
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 81 +++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 49 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a0386cf5824c..a5d78bf401b5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -426,74 +426,57 @@ EXPORT_SYMBOL_GPL(dma_resv_walk_unlocked);
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

