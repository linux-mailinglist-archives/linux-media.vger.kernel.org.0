Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE470461645
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241159AbhK2N3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239053AbhK2N1N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:13 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECC9C09B05A
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:10 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j3so36292756wrp.1
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h+Nrq+ViUx89xJG+oiaSsR0WPuKiTiGKmUxT+36uMJ0=;
        b=qfsOhLREL3AfKRN78Ur9DCPuKI5Ew9zlFul+/l5ig1Kq6ShweRIMROqk32VDAtOSNr
         Q5l2OSLZE/ZP/pWzpXcQ4T9H6QZkb2ic15sBboIhzHby6SyHpLHB/awSr5wJmcVG2LTg
         IEKfBWCA1oTFM8oLjUYi8VgWqMwlKl459aguY6B+X78TRLKZ0xnbcsndV5auI4aDWXNH
         QD9pVSLqgfsnSVZZqhVcBq4v8uJKl1eLeg/px4UUBegAFi3P3VgeVVFsZ3GsZI/j1gBg
         bL/J55UEBn1JwGHwi6tbVAdDOWr1mUzzqtQR75LbeovT4OTrea1GSHSZrntTc61/SKvc
         CaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h+Nrq+ViUx89xJG+oiaSsR0WPuKiTiGKmUxT+36uMJ0=;
        b=ZDsqd0O+IStXCTouc9VFpWfDa997kpdSKbsRsSkyYDdT94thkNQh9bxP+kDf1aQh/S
         CU/+rjfQ6m8LbNkk4w/fs/MX/zDLXPmDaMDqKONfJ6IW7X4SHklOLA1gR9RfUgmoqR5U
         GFGoVbEjf4VKEeeP7aB3yfZtPkoKb64sBnCmN66w9Gq3f6Mnmu1LR1JcNJhNJZ8B2/Me
         dp5DWRyo6m5N9lZQvDtQlkWKPcoJ3x1EH6arkIAOnErhd7ZS5ly4wO9imodon7t6446G
         hJBTh4M2sREWQvpyGSFaIhfKj1Wqsd6l1unazkbbBNENgB3z1hu52cJ1BLc70suq16QG
         zmDQ==
X-Gm-Message-State: AOAM5330M/ncjPgkEnkQoLhpUbwY0pku2MSasfe2RmPFiK+CFkI1+B8H
        StczLS++RBR/3l3CbiK54F5zm3xlTyA=
X-Google-Smtp-Source: ABdhPJw53unNdhXGAR/qaSywlxmGMFm38csq6qIDSHyasz7asRfNsPlX0WmXe8o57e7A7Pq7wZjMHQ==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr33838427wrs.136.1638187629325;
        Mon, 29 Nov 2021 04:07:09 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:09 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/28] dma-buf: drop excl_fence parameter from dma_resv_get_fences
Date:   Mon, 29 Nov 2021 13:06:38 +0100
Message-Id: <20211129120659.1815-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
index a12a3a39f280..480c305554a1 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -611,57 +611,45 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
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
index 3baf2a4a9a0d..fa2002939b19 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -436,8 +436,8 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 			     struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
-int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
-			unsigned *pshared_count, struct dma_fence ***pshared);
+int dma_resv_get_fences(struct dma_resv *obj, bool write,
+			unsigned int *num_fences, struct dma_fence ***fences);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
-- 
2.25.1

