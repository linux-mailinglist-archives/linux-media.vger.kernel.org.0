Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A00C45A53B
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237861AbhKWOYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:37 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293F1C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:29 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l16so1311770wrp.11
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y/HKiuvsLvtggr8wqFG79/kykHy5z0YuU04uWMf5ENc=;
        b=YwrlxJJSIcNyF4Ry5YW0SnT6p6dpgvKvskfDIOCH8d4EqSG7z3kMnI84B2KTj25PI5
         VNnfBT8nGAGfIxFQQ4B8NN9Bf449kUnOmMVEpHnfCmcqo64QvW5sdhTMNoAsOObvIsKM
         Enq1QTHnSFhtd2k3MSN9tGhC7XXMdKlle9kLcMXO2GS2JM1x83HUiNeV6TuwH/j07x7a
         TpvoF7lqfsHOVNa8v1/AWG6lg37RuPcXm8FASXSt1E5KH0zsBS7IZ6iYzq5TBYa7KDa3
         RFua3xqBQIZdeaAs4ryhsQuxtdp64/l1iBZ8yml+oAOcyVcRywF6jEQOQoXnW55xFyBY
         hXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y/HKiuvsLvtggr8wqFG79/kykHy5z0YuU04uWMf5ENc=;
        b=EdHbWIVSc7XwRqvITGF+9fZGUELQ/uVkR5qquGHGpoccIEtFCVGemvrf2tifKyGha8
         Ultv3WCkb6wcAWoelWABLcaeW30xr6qneQBhRRuNUE2QHmKsfm1ALb8d2uDS+ANStipO
         e5Y0HV7eFdQ0/alZP9du1g7B5+ykF0+kguzMKMgd1FUNgpOzooi8yaa4dXjK/I/PLG4G
         PnSgYnD3+h+Fyo9s8N9FfzWaqNduvW+6kkfY8M7f2Dshok2cPS6t5rs7UDt6xQCedRoJ
         IQrvUJMSI6rgfrk3vDopeCoB03+/mgtfrmBw0Ojz5Mb7C7EhB1lS7+u1lh5/DBM+5PHB
         9gjw==
X-Gm-Message-State: AOAM530LVUcTur0ANAACH7woDTvFo5ZCdiJcTTNsyeB/Z+rNVBhI+bMq
        oQodRcWgCsIhvi4AaXBTjGQ=
X-Google-Smtp-Source: ABdhPJy/Oxm3/2cPVW0DILaOGjbR1vdCwE8aul25iOb3IDZgJ7HF7jb4JTtR6Qs2OxK9XpWcMe3uPQ==
X-Received: by 2002:adf:a389:: with SMTP id l9mr7717381wrb.121.1637677287705;
        Tue, 23 Nov 2021 06:21:27 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:27 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/26] dma-buf: drop excl_fence parameter from dma_resv_get_fences
Date:   Tue, 23 Nov 2021 15:20:52 +0100
Message-Id: <20211123142111.3885-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Returning the exclusive fence separately is no longer used.

Instead add a write parameter to indicate the use case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                   | 48 ++++++++------------
 drivers/dma-buf/st-dma-resv.c                | 26 ++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c  |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c      |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +-
 include/linux/dma-resv.h                     |  4 +-
 6 files changed, 31 insertions(+), 58 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 611bba5528ad..0a69f4b7e6b5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -675,57 +675,45 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @fence_excl: the returned exclusive fence (or NULL)
- * @shared_count: the number of shared fences returned
- * @shared: the array of shared fence ptrs returned (array is krealloc'd to
- * the required size, and must be freed by caller)
- *
- * Retrieve all fences from the reservation object. If the pointer for the
- * exclusive fence is not specified the fence is put into the array of the
- * shared fences as well. Returns either zero or -ENOMEM.
+ * @write: true if we should return all fences
+ * @num_fences: the number of fences returned
+ * @fences: the array of fence ptrs returned (array is krealloc'd to the
+ * required size, and must be freed by caller)
+ *
+ * Retrieve all fences from the reservation object.
+ * Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **fence_excl,
-			unsigned int *shared_count, struct dma_fence ***shared)
+int dma_resv_get_fences(struct dma_resv *obj, bool write,
+			unsigned int *num_fences, struct dma_fence ***fences)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	*shared_count = 0;
-	*shared = NULL;
-
-	if (fence_excl)
-		*fence_excl = NULL;
+	*num_fences = 0;
+	*fences = NULL;
 
-	dma_resv_iter_begin(&cursor, obj, true);
+	dma_resv_iter_begin(&cursor, obj, write);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
 			unsigned int count;
 
-			while (*shared_count)
-				dma_fence_put((*shared)[--(*shared_count)]);
+			while (*num_fences)
+				dma_fence_put((*fences)[--(*num_fences)]);
 
-			if (fence_excl)
-				dma_fence_put(*fence_excl);
-
-			count = cursor.shared_count;
-			count += fence_excl ? 0 : 1;
+			count = cursor.shared_count + 1;
 
 			/* Eventually re-allocate the array */
-			*shared = krealloc_array(*shared, count,
+			*fences = krealloc_array(*fences, count,
 						 sizeof(void *),
 						 GFP_KERNEL);
-			if (count && !*shared) {
+			if (count && !*fences) {
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
 		}
 
-		dma_fence_get(fence);
-		if (dma_resv_iter_is_exclusive(&cursor) && fence_excl)
-			*fence_excl = fence;
-		else
-			(*shared)[(*shared_count)++] = fence;
+		(*fences)[(*num_fences)++] = dma_fence_get(fence);
 	}
 	dma_resv_iter_end(&cursor);
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index bc32b3eedcb6..cbe999c6e7a6 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -275,7 +275,7 @@ static int test_shared_for_each_unlocked(void *arg)
 
 static int test_get_fences(void *arg, bool shared)
 {
-	struct dma_fence *f, *excl = NULL, **fences = NULL;
+	struct dma_fence *f, **fences = NULL;
 	struct dma_resv resv;
 	int r, i;
 
@@ -304,35 +304,19 @@ static int test_get_fences(void *arg, bool shared)
 	}
 	dma_resv_unlock(&resv);
 
-	r = dma_resv_get_fences(&resv, &excl, &i, &fences);
+	r = dma_resv_get_fences(&resv, shared, &i, &fences);
 	if (r) {
 		pr_err("get_fences failed\n");
 		goto err_free;
 	}
 
-	if (shared) {
-		if (excl != NULL) {
-			pr_err("get_fences returned unexpected excl fence\n");
-			goto err_free;
-		}
-		if (i != 1 || fences[0] != f) {
-			pr_err("get_fences returned unexpected shared fence\n");
-			goto err_free;
-		}
-	} else {
-		if (excl != f) {
-			pr_err("get_fences returned unexpected excl fence\n");
-			goto err_free;
-		}
-		if (i != 0) {
-			pr_err("get_fences returned unexpected shared fence\n");
-			goto err_free;
-		}
+	if (i != 1 || fences[0] != f) {
+		pr_err("get_fences returned unexpected fence\n");
+		goto err_free;
 	}
 
 	dma_fence_signal(f);
 err_free:
-	dma_fence_put(excl);
 	while (i--)
 		dma_fence_put(fences[i]);
 	kfree(fences);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 68108f151dad..d17e1c911689 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -200,8 +200,10 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
-				&work->shared_count, &work->shared);
+	/* TODO: Unify this with other drivers */
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, true,
+				&work->shared_count,
+				&work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
 		goto unpin;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b7fb72bff2c1..be48487e2ca7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -112,7 +112,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	unsigned count;
 	int r;
 
-	r = dma_resv_get_fences(resv, NULL, &count, &fences);
+	r = dma_resv_get_fences(resv, true, &count, &fences);
 	if (r)
 		goto fallback;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index b5e8ce86dbe7..64c90ff348f2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -189,8 +189,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			continue;
 
 		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, NULL,
-						  &bo->nr_shared,
+			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
 						  &bo->shared);
 			if (ret)
 				return ret;
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index e0cec3a57c08..09b676b87c35 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -438,8 +438,8 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_prune(struct dma_resv *obj);
 void dma_resv_prune_unlocked(struct dma_resv *obj);
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned *pshared_count, struct dma_fence ***pshared);
+int dma_resv_get_fences(struct dma_resv *obj, bool write,
+			unsigned int *num_fences, struct dma_fence ***fences);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

