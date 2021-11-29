Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B022461641
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhK2N3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:29:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377839AbhK2N1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:27:08 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DC0C09B058
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:08 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d9so15383458wrw.4
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
        b=dnKpofsBRMsUDAUb2JIJjkS6vC9U6IDxnTssoitwG0AP5JGHvrZOmiPlbIV/q3wn0O
         9/9Lg4MzmlAwOorvqfup6d8ZzkgyIuSpX3e+KbviQT/qQ20XlVz6eG062A5IrzvikXah
         QX+nJ14AKb9msY0GW6Rt8q+oxTpIdoltC2d9UxbJsiU0Sav7KgfPf6wZiADLi3nI6Fgr
         Q5aLh9dltY3UJe3wbUzU9f1bML8PxGB5qCbhLutT25uYx5QsgTFEzr8ImAp6t8vP/JML
         MaWd8OOm8OLR+nLuP5O2leR+jxg1p1wf+QZGvW/9uEU5F6qB3JSLKkDs8f5XJojdfoOe
         Zmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4QADmDIJ6uafvkbWTgBnifMSyLYGo2GFMs8el97OfdE=;
        b=lKxoqK+K++ndLFQ0DCeCuIUZn5v10l1VSLk1ZnuR5fpHg21JBxR6wFIv1u8L6lQcvd
         wUpB3WjQ/HHu3w+EXKy6ktJ9YymJhWtaYkJtKEmcLJiN2+zK8VYaSBCvPhs7jawNKvYw
         t0StFFpYgkoLbDqtkOuExqezUwsBm0w1AI/XYn6+QO3BWPlGJc85joHrKn5ygWB9eCc9
         VcB0LU94RoN7iqQ/x6aFnG1NIuvLdGVsevrWW7AYPOcynxXShF7mRG1wwgF92NeKXC7j
         R62RqUQDNHY5cIFmMekJWPk4gZs8sNSs3wl7QxsEHCjE56XTbWZ4+oTf2t0l8LLCAwly
         c/uA==
X-Gm-Message-State: AOAM531/TTFCE4ZP+iv+GJRSMZV+u9Ag7WRGtE7hkfYQ2A8wwJInqVmM
        bZ6t+y2fpA98sREpGVT0VfNzrsdLV7E=
X-Google-Smtp-Source: ABdhPJxjiZnvdza2N79CcoURnlCo5mu2gBFnj2KSL1PgfKAxyannBdhaGEomOA/bnawDW5jVQdh0Ug==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr33972446wrt.413.1638187627485;
        Mon, 29 Nov 2021 04:07:07 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:07 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/28] dma-buf: add dma_resv_replace_fences
Date:   Mon, 29 Nov 2021 13:06:36 +0100
Message-Id: <20211129120659.1815-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function allows to replace fences from the shared fence list when
we can gurantee that the operation represented by the original fence has
finished or no accesses to the resources protected by the dma_resv
object any more when the new fence finishes.

Then use this function in the amdkfd code when BOs are unmapped from the
process.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c                    | 43 ++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 49 +++----------------
 include/linux/dma-resv.h                      |  2 +
 3 files changed, 52 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4deea75c0b9c..a688dbded3d3 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -284,6 +284,49 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
 
+/**
+ * dma_resv_replace_fences - replace fences in the dma_resv obj
+ * @obj: the reservation object
+ * @context: the context of the fences to replace
+ * @replacement: the new fence to use instead
+ *
+ * Replace fences with a specified context with a new fence. Only valid if the
+ * operation represented by the original fences is completed or has no longer
+ * access to the resources protected by the dma_resv object when the new fence
+ * completes.
+ */
+void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *replacement)
+{
+	struct dma_resv_list *list;
+	struct dma_fence *old;
+	unsigned int i;
+
+	dma_resv_assert_held(obj);
+
+	write_seqcount_begin(&obj->seq);
+
+	old = dma_resv_excl_fence(obj);
+	if (old->context == context) {
+		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
+		dma_fence_put(old);
+	}
+
+	list = dma_resv_shared_list(obj);
+	for (i = 0; list && i < list->shared_count; ++i) {
+		old = rcu_dereference_protected(list->shared[i],
+						dma_resv_held(obj));
+		if (old->context != context)
+			continue;
+
+		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
+		dma_fence_put(old);
+	}
+
+	write_seqcount_end(&obj->seq);
+}
+EXPORT_SYMBOL(dma_resv_replace_fences);
+
 /**
  * dma_resv_add_excl_fence - Add an exclusive fence.
  * @obj: the reservation object
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 71acd577803e..b558ef0f8c4a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -236,53 +236,18 @@ void amdgpu_amdkfd_release_notify(struct amdgpu_bo *bo)
 static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 					struct amdgpu_amdkfd_fence *ef)
 {
-	struct dma_resv *resv = bo->tbo.base.resv;
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k;
+	struct dma_fence *replacement;
 
 	if (!ef)
 		return -EINVAL;
 
-	old = dma_resv_shared_list(resv);
-	if (!old)
-		return 0;
-
-	new = kmalloc(struct_size(new, shared, old->shared_max), GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
-
-	/* Go through all the shared fences in the resevation object and sort
-	 * the interesting ones to the end of the list.
+	/* TODO: Instead of block before we should use the fence of the page
+	 * table update and TLB flush here directly.
 	 */
-	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(old->shared[i],
-					      dma_resv_held(resv));
-
-		if (f->context == ef->base.context)
-			RCU_INIT_POINTER(new->shared[--j], f);
-		else
-			RCU_INIT_POINTER(new->shared[k++], f);
-	}
-	new->shared_max = old->shared_max;
-	new->shared_count = k;
-
-	/* Install the new fence list, seqcount provides the barriers */
-	write_seqcount_begin(&resv->seq);
-	RCU_INIT_POINTER(resv->fence, new);
-	write_seqcount_end(&resv->seq);
-
-	/* Drop the references to the removed fences or move them to ef_list */
-	for (i = j; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(new->shared[i],
-					      dma_resv_held(resv));
-		dma_fence_put(f);
-	}
-	kfree_rcu(old, rcu);
-
+	replacement = dma_fence_get_stub();
+	dma_resv_replace_fences(bo->tbo.base.resv, ef->base.context,
+				replacement);
+	dma_fence_put(replacement);
 	return 0;
 }
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index eebf04325b34..e0be34265eae 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -457,6 +457,8 @@ void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
+void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
+			     struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
-- 
2.25.1

