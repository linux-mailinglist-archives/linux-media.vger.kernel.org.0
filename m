Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018A246BB39
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236448AbhLGMiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236437AbhLGMiI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77D0C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so1596106wmj.5
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wNhLci37I7SZNkv5T1IARVe1dbZc8fckqPlG1i9EZ+0=;
        b=Jui4VrHwyPdk4hh1FmDejJcTvO5ZRsL3vlmYkhHgpNRH2ifT2AwMVrS4jaQiQZ8CP0
         DmIDi6EOKYksm5itWzQK4OSMjbgs9zGYXJc4mCCUTI+wH5pOttqRRudiv0ZZh0ZyF7s0
         JblukwYGKC2U0ou/tqGJKqabz5kIxi3k9VKyhkoFOdt0KS/izjPYhfLM89kFSo6ffZyA
         SKIgk7Ibpw4EpIMqX12k6h5aYVhbiiarrIAZv0NDklFwEGr13jF/eIbZxOKWmLJwBU8m
         oEL4TbiV9BhUs6SnSOa7fL4amvNnDQ8iolyFeTKc8ogWSWYsj95lMrizrzSsU7hm0zRQ
         8ZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNhLci37I7SZNkv5T1IARVe1dbZc8fckqPlG1i9EZ+0=;
        b=6fBG7cX0Z5+CDf64ZWX3qu+l1RWgFUWVxaagS8G3ukX7MEQbaif+iDNDN5u+Mb5Iyj
         Z2Aom45DvYlgQVSVNU3e5ICUsTlDjvs9oYLISmzaldNa4TD+imDU73sLd/gzdEx5C16s
         K+5b19gpYG2v6sasvDk6vxaCqls/+cKgEE+Jg+y4V7eORKjTOBFHgbXKeNNsLIh4rUed
         4wmidmNYUY0WkQBs+JDSSHs9Pzny6Nv9KD0qfRbbdGibIJIBTMjz0GmkVf75nXCumMy1
         yqMa5eRj2ljSt9sy/XI0B4zZFObebBJm1w4aXkqVGnjtSJQ6jmji8KZfcwjBTp47Aq8h
         UPWw==
X-Gm-Message-State: AOAM533uY+5NaEwOjGy3NUKJfdS8Be3HPqVPCfEsX8MGVMEITiONy4b3
        kQcy6GOx9XmCmw6wOucc1OI=
X-Google-Smtp-Source: ABdhPJwkv+Gmv+Dw5rTNEgjVB7c48wycz0YnTi/+WDGfohSMma58BanJ5wFjLEtwmAZRDZ81KtjJnA==
X-Received: by 2002:a05:600c:2156:: with SMTP id v22mr6779404wml.159.1638880476150;
        Tue, 07 Dec 2021 04:34:36 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:35 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 18/24] dma-buf: add enum dma_resv_usage v3
Date:   Tue,  7 Dec 2021 13:34:05 +0100
Message-Id: <20211207123411.167006-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This change adds the dma_resv_usage enum and allows us to specify why a
dma_resv object is queried for its containing fences.

Additional to that a dma_resv_usage_rw() helper function is added to aid
retrieving the fences for a read or write userspace submission.

This is then deployed to the different query functions of the dma_resv
object and all of their users. When the write paratermer was previously
true we now use DMA_RESV_USAGE_WRITE and DMA_RESV_USAGE_READ otherwise.

v2: add KERNEL/OTHER in separate patch
v3: some kerneldoc suggestions by Daniel

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                     |  3 +-
 drivers/dma-buf/dma-resv.c                    | 33 +++++----
 drivers/dma-buf/st-dma-resv.c                 | 48 ++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c        |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  7 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +-
 drivers/gpu/drm/drm_gem.c                     |  6 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |  7 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  3 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  4 +-
 drivers/gpu/drm/i915/gem/i915_gem_lmem.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c   |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  6 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  3 +-
 drivers/gpu/drm/i915/i915_request.c           |  3 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  3 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 +--
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  3 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  3 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |  3 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  9 ++-
 drivers/gpu/drm/radeon/radeon_mn.c            |  4 +-
 drivers/gpu/drm/radeon/radeon_sync.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_uvd.c           |  4 +-
 drivers/gpu/drm/scheduler/sched_main.c        |  3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 18 ++---
 drivers/gpu/drm/vgem/vgem_fence.c             |  4 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  4 +-
 drivers/infiniband/core/umem_dmabuf.c         |  3 +-
 include/linux/dma-resv.h                      | 69 +++++++++++++++----
 46 files changed, 205 insertions(+), 125 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 602b12d7470d..528983d3ba64 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1124,7 +1124,8 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	long ret;
 
 	/* Wait on any implicit rendering fences */
-	ret = dma_resv_wait_timeout(resv, write, true, MAX_SCHEDULE_TIMEOUT);
+	ret = dma_resv_wait_timeout(resv, dma_resv_usage_rw(write),
+				    true, MAX_SCHEDULE_TIMEOUT);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ecb2ff606bac..33a17db89fb4 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -408,7 +408,7 @@ static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
 	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
 	cursor->index = -1;
 	cursor->shared_count = 0;
-	if (cursor->all_fences) {
+	if (cursor->usage >= DMA_RESV_USAGE_READ) {
 		cursor->fences = dma_resv_shared_list(cursor->obj);
 		if (cursor->fences)
 			cursor->shared_count = cursor->fences->shared_count;
@@ -515,7 +515,7 @@ struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
 	dma_resv_assert_held(cursor->obj);
 
 	cursor->index = 0;
-	if (cursor->all_fences)
+	if (cursor->usage >= DMA_RESV_USAGE_READ)
 		cursor->fences = dma_resv_shared_list(cursor->obj);
 	else
 		cursor->fences = NULL;
@@ -570,7 +570,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 	list = NULL;
 	excl = NULL;
 
-	dma_resv_iter_begin(&cursor, src, true);
+	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
@@ -616,7 +616,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * dma_resv_get_fences - Get an object's shared and exclusive
  * fences without update side lock held
  * @obj: the reservation object
- * @write: true if we should return all fences
+ * @usage: controls which fences to include, see enum dma_resv_usage.
  * @num_fences: the number of fences returned
  * @fences: the array of fence ptrs returned (array is krealloc'd to the
  * required size, and must be freed by caller)
@@ -624,7 +624,7 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * Retrieve all fences from the reservation object.
  * Returns either zero or -ENOMEM.
  */
-int dma_resv_get_fences(struct dma_resv *obj, bool write,
+int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 			unsigned int *num_fences, struct dma_fence ***fences)
 {
 	struct dma_resv_iter cursor;
@@ -633,7 +633,7 @@ int dma_resv_get_fences(struct dma_resv *obj, bool write,
 	*num_fences = 0;
 	*fences = NULL;
 
-	dma_resv_iter_begin(&cursor, obj, write);
+	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
@@ -665,7 +665,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 /**
  * dma_resv_get_singleton - Get a single fence for all the fences
  * @obj: the reservation object
- * @write: true if we should return all fences
+ * @usage: controls which fences to include, see enum dma_resv_usage.
  * @fence: the resulting fence
  *
  * Get a single fence representing all the fences inside the resv object.
@@ -675,7 +675,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
  * object since that can lead to stack corruption when finalizing the
  * dma_fence_array.
  */
-int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 			   struct dma_fence **fence)
 {
 	struct dma_fence_array *array;
@@ -683,7 +683,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, bool write,
 	unsigned count;
 	int r;
 
-	r = dma_resv_get_fences(obj, write, &count, &fences);
+	r = dma_resv_get_fences(obj, usage, &count, &fences);
         if (r)
 		return r;
 
@@ -717,7 +717,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
  * dma_resv_wait_timeout - Wait on reservation's objects
  * shared and/or exclusive fences.
  * @obj: the reservation object
- * @wait_all: if true, wait on all fences, else wait on just exclusive fence
+ * @usage: controls which fences to include, see enum dma_resv_usage.
  * @intr: if true, do interruptible wait
  * @timeout: timeout value in jiffies or zero to return immediately
  *
@@ -727,14 +727,14 @@ EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
  * Returns -ERESTARTSYS if interrupted, 0 if the wait timed out, or
  * greater than zer on success.
  */
-long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
-			   unsigned long timeout)
+long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
+			   bool intr, unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		ret = dma_fence_wait_timeout(fence, intr, ret);
@@ -754,8 +754,7 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
  * @obj: the reservation object
- * @test_all: if true, test all fences, otherwise only test the exclusive
- * fence
+ * @usage: controls which fences to include, see enum dma_resv_usage.
  *
  * Callers are not required to hold specific locks, but maybe hold
  * dma_resv_lock() already.
@@ -764,12 +763,12 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
  *
  * True if all fences signaled, else false.
  */
-bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
+bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_iter_begin(&cursor, obj, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		dma_resv_iter_end(&cursor);
 		return false;
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index f33bafc78693..a52c5fbea87a 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -58,7 +58,7 @@ static int sanitycheck(void *arg)
 	return r;
 }
 
-static int test_signaling(void *arg, bool shared)
+static int test_signaling(void *arg, enum dma_resv_usage usage)
 {
 	struct dma_resv resv;
 	struct dma_fence *f;
@@ -81,18 +81,18 @@ static int test_signaling(void *arg, bool shared)
 		goto err_unlock;
 	}
 
-	if (shared)
+	if (usage >= DMA_RESV_USAGE_READ)
 		dma_resv_add_shared_fence(&resv, f);
 	else
 		dma_resv_add_excl_fence(&resv, f);
 
-	if (dma_resv_test_signaled(&resv, shared)) {
+	if (dma_resv_test_signaled(&resv, usage)) {
 		pr_err("Resv unexpectedly signaled\n");
 		r = -EINVAL;
 		goto err_unlock;
 	}
 	dma_fence_signal(f);
-	if (!dma_resv_test_signaled(&resv, shared)) {
+	if (!dma_resv_test_signaled(&resv, usage)) {
 		pr_err("Resv not reporting signaled\n");
 		r = -EINVAL;
 		goto err_unlock;
@@ -107,15 +107,15 @@ static int test_signaling(void *arg, bool shared)
 
 static int test_excl_signaling(void *arg)
 {
-	return test_signaling(arg, false);
+	return test_signaling(arg, DMA_RESV_USAGE_WRITE);
 }
 
 static int test_shared_signaling(void *arg)
 {
-	return test_signaling(arg, true);
+	return test_signaling(arg, DMA_RESV_USAGE_READ);
 }
 
-static int test_for_each(void *arg, bool shared)
+static int test_for_each(void *arg, enum dma_resv_usage usage)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
@@ -139,13 +139,13 @@ static int test_for_each(void *arg, bool shared)
 		goto err_unlock;
 	}
 
-	if (shared)
+	if (usage >= DMA_RESV_USAGE_READ)
 		dma_resv_add_shared_fence(&resv, f);
 	else
 		dma_resv_add_excl_fence(&resv, f);
 
 	r = -ENOENT;
-	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
+	dma_resv_for_each_fence(&cursor, &resv, usage, fence) {
 		if (!r) {
 			pr_err("More than one fence found\n");
 			r = -EINVAL;
@@ -156,7 +156,8 @@ static int test_for_each(void *arg, bool shared)
 			r = -EINVAL;
 			goto err_unlock;
 		}
-		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+		if (dma_resv_iter_is_exclusive(&cursor) !=
+		    (usage >= DMA_RESV_USAGE_READ)) {
 			pr_err("Unexpected fence usage\n");
 			r = -EINVAL;
 			goto err_unlock;
@@ -178,15 +179,15 @@ static int test_for_each(void *arg, bool shared)
 
 static int test_excl_for_each(void *arg)
 {
-	return test_for_each(arg, false);
+	return test_for_each(arg, DMA_RESV_USAGE_WRITE);
 }
 
 static int test_shared_for_each(void *arg)
 {
-	return test_for_each(arg, true);
+	return test_for_each(arg, DMA_RESV_USAGE_READ);
 }
 
-static int test_for_each_unlocked(void *arg, bool shared)
+static int test_for_each_unlocked(void *arg, enum dma_resv_usage usage)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *f, *fence;
@@ -211,14 +212,14 @@ static int test_for_each_unlocked(void *arg, bool shared)
 		goto err_free;
 	}
 
-	if (shared)
+	if (usage >= DMA_RESV_USAGE_READ)
 		dma_resv_add_shared_fence(&resv, f);
 	else
 		dma_resv_add_excl_fence(&resv, f);
 	dma_resv_unlock(&resv);
 
 	r = -ENOENT;
-	dma_resv_iter_begin(&cursor, &resv, shared);
+	dma_resv_iter_begin(&cursor, &resv, usage);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!r) {
 			pr_err("More than one fence found\n");
@@ -234,7 +235,8 @@ static int test_for_each_unlocked(void *arg, bool shared)
 			r = -EINVAL;
 			goto err_iter_end;
 		}
-		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+		if (dma_resv_iter_is_exclusive(&cursor) !=
+		    (usage >= DMA_RESV_USAGE_READ)) {
 			pr_err("Unexpected fence usage\n");
 			r = -EINVAL;
 			goto err_iter_end;
@@ -262,15 +264,15 @@ static int test_for_each_unlocked(void *arg, bool shared)
 
 static int test_excl_for_each_unlocked(void *arg)
 {
-	return test_for_each_unlocked(arg, false);
+	return test_for_each_unlocked(arg, DMA_RESV_USAGE_WRITE);
 }
 
 static int test_shared_for_each_unlocked(void *arg)
 {
-	return test_for_each_unlocked(arg, true);
+	return test_for_each_unlocked(arg, DMA_RESV_USAGE_READ);
 }
 
-static int test_get_fences(void *arg, bool shared)
+static int test_get_fences(void *arg, enum dma_resv_usage usage)
 {
 	struct dma_fence *f, **fences = NULL;
 	struct dma_resv resv;
@@ -294,13 +296,13 @@ static int test_get_fences(void *arg, bool shared)
 		goto err_resv;
 	}
 
-	if (shared)
+	if (usage >= DMA_RESV_USAGE_READ)
 		dma_resv_add_shared_fence(&resv, f);
 	else
 		dma_resv_add_excl_fence(&resv, f);
 	dma_resv_unlock(&resv);
 
-	r = dma_resv_get_fences(&resv, shared, &i, &fences);
+	r = dma_resv_get_fences(&resv, usage, &i, &fences);
 	if (r) {
 		pr_err("get_fences failed\n");
 		goto err_free;
@@ -324,12 +326,12 @@ static int test_get_fences(void *arg, bool shared)
 
 static int test_excl_get_fences(void *arg)
 {
-	return test_get_fences(arg, false);
+	return test_get_fences(arg, DMA_RESV_USAGE_WRITE);
 }
 
 static int test_shared_get_fences(void *arg)
 {
-	return test_get_fences(arg, true);
+	return test_get_fences(arg, DMA_RESV_USAGE_READ);
 }
 
 int dma_resv(void)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 7facd614e50a..af0a61ce2ec7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1279,7 +1279,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+		dma_resv_for_each_fence(&cursor, resv,
+					DMA_RESV_USAGE_WRITE,
+					fence) {
 			break;
 		}
 		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index d17e1c911689..c2b1208a8c7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -200,8 +200,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	/* TODO: Unify this with other drivers */
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, true,
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
 				&work->shared_count,
 				&work->shared);
 	if (unlikely(r != 0)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 85d31d85c384..e97b3a522b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -526,7 +526,8 @@ int amdgpu_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 	}
 	robj = gem_to_amdgpu_bo(gobj);
-	ret = dma_resv_wait_timeout(robj->tbo.base.resv, true, true, timeout);
+	ret = dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_READ,
+				    true, timeout);
 
 	/* ret == 0 means not signaled,
 	 * ret > 0 means signaled
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 888d97143177..490d2a7a3e2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -111,7 +111,7 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	struct dma_fence *fence;
 	int r;
 
-	r = dma_resv_get_singleton(resv, true, &fence);
+	r = dma_resv_get_singleton(resv, DMA_RESV_USAGE_READ, &fence);
 	if (r)
 		goto fallback;
 
@@ -139,7 +139,8 @@ void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 	/* Not enough memory for the delayed delete, as last resort
 	 * block for all the fences to complete.
 	 */
-	dma_resv_wait_timeout(resv, true, false, MAX_SCHEDULE_TIMEOUT);
+	dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+			      false, MAX_SCHEDULE_TIMEOUT);
 	amdgpu_pasid_free(pasid);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
index 4b153daf283d..86f5248676b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
@@ -75,8 +75,8 @@ static bool amdgpu_mn_invalidate_gfx(struct mmu_interval_notifier *mni,
 
 	mmu_interval_set_seq(mni, cur_seq);
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
-				  MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+				  false, MAX_SCHEDULE_TIMEOUT);
 	mutex_unlock(&adev->notifier_lock);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 24a6b88afcca..7715390aff7a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -764,8 +764,8 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
-				  MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
+				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r < 0)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index f7d8487799b2..183623806056 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -259,7 +259,8 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	if (resv == NULL)
 		return -EINVAL;
 
-	dma_resv_for_each_fence(&cursor, resv, true, f) {
+	/* TODO: Use DMA_RESV_USAGE_READ here */
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, f) {
 		dma_fence_chain_for_each(f, f) {
 			struct dma_fence_chain *chain = to_dma_fence_chain(f);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c15687ce67c4..fd339762f534 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1360,7 +1360,8 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
+	dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
+				DMA_RESV_USAGE_READ, f) {
 		if (amdkfd_fence_check_mm(f, current->mm))
 			return false;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6f8de11a17f1..33deb0df62fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1162,7 +1162,8 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 	ib->length_dw = 16;
 
 	if (direct) {
-		r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
+		r = dma_resv_wait_timeout(bo->tbo.base.resv,
+					  DMA_RESV_USAGE_WRITE, false,
 					  msecs_to_jiffies(10));
 		if (r == 0)
 			r = -ETIMEDOUT;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index a96ae4c0e040..e82997dbc0a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2105,7 +2105,7 @@ static void amdgpu_vm_prt_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_for_each_fence(&cursor, resv, true, fence) {
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_READ, fence) {
 		/* Add a callback for each fence in the reservation object */
 		amdgpu_vm_prt_get(adev);
 		amdgpu_vm_add_prt_cb(adev, fence);
@@ -2707,7 +2707,7 @@ bool amdgpu_vm_evictable(struct amdgpu_bo *bo)
 		return true;
 
 	/* Don't evict VM page tables while they are busy */
-	if (!dma_resv_test_signaled(bo->tbo.base.resv, true))
+	if (!dma_resv_test_signaled(bo->tbo.base.resv, DMA_RESV_USAGE_READ))
 		return false;
 
 	/* Try to block ongoing updates */
@@ -2887,7 +2887,8 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
  */
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
 {
-	timeout = dma_resv_wait_timeout(vm->root.bo->tbo.base.resv, true,
+	timeout = dma_resv_wait_timeout(vm->root.bo->tbo.base.resv,
+					DMA_RESV_USAGE_READ,
 					true, timeout);
 	if (timeout <= 0)
 		return timeout;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4130082c5873..932edfab9cb0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9048,7 +9048,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 * deadlock during GPU reset when this fence will not signal
 		 * but we hold reservation lock for the BO.
 		 */
-		r = dma_resv_wait_timeout(abo->tbo.base.resv, true, false,
+		r = dma_resv_wait_timeout(abo->tbo.base.resv,
+					  DMA_RESV_USAGE_WRITE, false,
 					  msecs_to_jiffies(5000));
 		if (unlikely(r <= 0))
 			DRM_ERROR("Waiting for fences timed out!");
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4dcdec6487bb..d96355f98e75 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -770,7 +770,8 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 		return -EINVAL;
 	}
 
-	ret = dma_resv_wait_timeout(obj->resv, wait_all, true, timeout);
+	ret = dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(wait_all),
+				    true, timeout);
 	if (ret == 0)
 		ret = -ETIME;
 	else if (ret > 0)
@@ -1344,7 +1345,8 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 	struct dma_fence *fence;
 	int ret = 0;
 
-	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(write),
+				fence) {
 		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 9338ddb7edff..a6d89aed0bda 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -151,7 +151,7 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	ret = dma_resv_get_singleton(obj->resv, DMA_RESV_USAGE_WRITE, &fence);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index d5314aa28ff7..507172e2780b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -380,12 +380,14 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 	}
 
 	if (op & ETNA_PREP_NOSYNC) {
-		if (!dma_resv_test_signaled(obj->resv, write))
+		if (!dma_resv_test_signaled(obj->resv,
+					    dma_resv_usage_rw(write)))
 			return -EBUSY;
 	} else {
 		unsigned long remain = etnaviv_timeout_to_jiffies(timeout);
 
-		ret = dma_resv_wait_timeout(obj->resv, write, true, remain);
+		ret = dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(write),
+					    true, remain);
 		if (ret <= 0)
 			return ret == 0 ? -ETIMEDOUT : ret;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index d4a7073190ec..3b8d49319d8c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -178,6 +178,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		struct dma_resv *robj = bo->obj->base.resv;
+		enum dma_resv_usage usage;
 
 		ret = dma_resv_reserve_shared(robj, 1);
 		if (ret)
@@ -186,9 +187,9 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
 
-		ret = dma_resv_get_fences(robj,
-					  !!(bo->flags & ETNA_SUBMIT_BO_WRITE),
-					  &bo->nr_shared, &bo->shared);
+		usage = dma_resv_usage_rw(bo->flags & ETNA_SUBMIT_BO_WRITE);
+		ret = dma_resv_get_fences(robj, usage, &bo->nr_shared,
+					  &bo->shared);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index cdc68fb51ba6..e10f2536837b 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -749,7 +749,8 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		dma_resv_iter_begin(&cursor, obj->base.resv, false);
+		dma_resv_iter_begin(&cursor, obj->base.resv,
+				    DMA_RESV_USAGE_WRITE);
 		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 470fdfd61a0f..14a1c0ad8c3c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -138,12 +138,12 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * Alternatively, we can trade that extra information on read/write
 	 * activity with
 	 *	args->busy =
-	 *		!dma_resv_test_signaled(obj->resv, true);
+	 *		!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ);
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
 	args->busy = 0;
-	dma_resv_iter_begin(&cursor, obj->base.resv, true);
+	dma_resv_iter_begin(&cursor, obj->base.resv, DMA_RESV_USAGE_READ);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (dma_resv_iter_is_restarted(&cursor))
 			args->busy = 0;
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
index 444f8268b9c5..a200d3e66573 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
@@ -66,7 +66,7 @@ bool __i915_gem_object_is_lmem(struct drm_i915_gem_object *obj)
 	struct intel_memory_region *mr = READ_ONCE(obj->mm.region);
 
 #ifdef CONFIG_LOCKDEP
-	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, true) &&
+	GEM_WARN_ON(dma_resv_test_signaled(obj->base.resv, DMA_RESV_USAGE_READ) &&
 		    i915_gem_object_evictable(obj));
 #endif
 	return mr && (mr->type == INTEL_MEMORY_LOCAL ||
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 3173c9f9a040..0ccb91385f84 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -85,7 +85,7 @@ static bool i915_gem_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return true;
 
 	/* we will unbind on next submission, still have userptr pins */
-	r = dma_resv_wait_timeout(obj->base.resv, true, false,
+	r = dma_resv_wait_timeout(obj->base.resv, DMA_RESV_USAGE_READ, false,
 				  MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		drm_err(&i915->drm, "(%ld) failed to wait for idle\n", r);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index cd149aa99364..57abeba399cb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -40,7 +40,8 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 	struct dma_fence *fence;
 	long ret = timeout ?: 1;
 
-	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_iter_begin(&cursor, resv,
+			    dma_resv_usage_rw(flags & I915_WAIT_ALL));
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		ret = i915_gem_object_wait_fence(fence, flags, timeout);
 		if (ret <= 0)
@@ -117,7 +118,8 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, obj->base.resv, flags & I915_WAIT_ALL);
+	dma_resv_iter_begin(&cursor, obj->base.resv,
+			    dma_resv_usage_rw(flags & I915_WAIT_ALL));
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
 		i915_gem_fence_wait_priority(fence, attr);
 	dma_resv_iter_end(&cursor);
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 4a6bb64c3a35..95985bcc47f6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -219,7 +219,8 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_detach;
 	}
 
-	timeout = dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * HZ);
+	timeout = dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_WRITE,
+					true, 5 * HZ);
 	if (!timeout) {
 		pr_err("dmabuf wait for exclusive fence timed out.\n");
 		timeout = -ETIME;
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 42cd17357771..f11c070c3262 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1541,7 +1541,8 @@ i915_request_await_object(struct i915_request *to,
 	struct dma_fence *fence;
 	int ret = 0;
 
-	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+	dma_resv_for_each_fence(&cursor, obj->base.resv,
+				dma_resv_usage_rw(write), fence) {
 		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 7ea0dbf81530..303d792a8912 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -579,7 +579,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
 	dma_resv_for_each_fence_unlocked(&cursor, f) {
 		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 2916480d9115..19e09a88dcca 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -848,7 +848,8 @@ int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
 		op & MSM_PREP_NOSYNC ? 0 : timeout_to_jiffies(timeout);
 	long ret;
 
-	ret = dma_resv_wait_timeout(obj->resv, write, true,  remain);
+	ret = dma_resv_wait_timeout(obj->resv, dma_resv_usage_rw(write),
+				    true,  remain);
 	if (ret == 0)
 		return remain == 0 ? -EBUSY : -ETIMEDOUT;
 	else if (ret < 0)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index b55a8a723581..53baf9aae4b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -558,7 +558,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
+	ret = dma_resv_get_singleton(nvbo->bo.base.resv,
+				     DMA_RESV_USAGE_WRITE,
 				     &asyw->state.fence);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 74f8652d2bd3..c6bb4dbcd735 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -962,11 +962,11 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 	struct dma_fence *fence;
 	int ret;
 
-	/* TODO: This is actually a memory management dependency */
-	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRITE,
+				     &fence);
 	if (ret)
-		dma_resv_wait_timeout(bo->base.resv, false, false,
-				      MAX_SCHEDULE_TIMEOUT);
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE,
+				      false, MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index cd6715bd6d6b..26725e23c075 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -353,7 +353,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 	if (ret)
 		return ret;
 
-	dma_resv_for_each_fence(&cursor, resv, exclusive, fence) {
+	dma_resv_for_each_fence(&cursor, resv, dma_resv_usage_rw(exclusive),
+				fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9416bee92141..fab542a758ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -962,7 +962,8 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		return -ENOENT;
 	nvbo = nouveau_gem_object(gem);
 
-	lret = dma_resv_wait_timeout(nvbo->bo.base.resv, write, true,
+	lret = dma_resv_wait_timeout(nvbo->bo.base.resv,
+				     dma_resv_usage_rw(write), true,
 				     no_wait ? 0 : 30 * HZ);
 	if (!lret)
 		ret = -EBUSY;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96bb5a465627..0deb2d21422f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -316,7 +316,8 @@ panfrost_ioctl_wait_bo(struct drm_device *dev, void *data,
 	if (!gem_obj)
 		return -ENOENT;
 
-	ret = dma_resv_wait_timeout(gem_obj->resv, true, true, timeout);
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_READ,
+				    true, timeout);
 	if (!ret)
 		ret = timeout ? -ETIMEDOUT : -EBUSY;
 
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 6a36b0fd845c..33e5889d6608 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -61,7 +61,8 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 		struct dma_fence *fence;
 		int rel = 0;
 
-		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
+		dma_resv_iter_begin(&cursor, bo->tbo.base.resv,
+				    DMA_RESV_USAGE_READ);
 		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			if (dma_resv_iter_is_restarted(&cursor))
 				rel = 0;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index a6f875118f01..9872d0b3e31a 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -533,7 +533,8 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		DRM_ERROR("failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
-	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
+	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
+				   &work->fence);
 	if (r) {
 		radeon_bo_unreserve(new_rbo);
 		DRM_ERROR("failed to get new rbo buffer fences\n");
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index a36a4f2c76b0..71bf9299e45c 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -161,7 +161,9 @@ static int radeon_gem_set_domain(struct drm_gem_object *gobj,
 	}
 	if (domain == RADEON_GEM_DOMAIN_CPU) {
 		/* Asking for cpu access wait for object idle */
-		r = dma_resv_wait_timeout(robj->tbo.base.resv, true, true, 30 * HZ);
+		r = dma_resv_wait_timeout(robj->tbo.base.resv,
+					  DMA_RESV_USAGE_READ,
+					  true, 30 * HZ);
 		if (!r)
 			r = -EBUSY;
 
@@ -523,7 +525,7 @@ int radeon_gem_busy_ioctl(struct drm_device *dev, void *data,
 	}
 	robj = gem_to_radeon_bo(gobj);
 
-	r = dma_resv_test_signaled(robj->tbo.base.resv, true);
+	r = dma_resv_test_signaled(robj->tbo.base.resv, DMA_RESV_USAGE_READ);
 	if (r == 0)
 		r = -EBUSY;
 	else
@@ -552,7 +554,8 @@ int radeon_gem_wait_idle_ioctl(struct drm_device *dev, void *data,
 	}
 	robj = gem_to_radeon_bo(gobj);
 
-	ret = dma_resv_wait_timeout(robj->tbo.base.resv, true, true, 30 * HZ);
+	ret = dma_resv_wait_timeout(robj->tbo.base.resv, DMA_RESV_USAGE_READ,
+				    true, 30 * HZ);
 	if (ret == 0)
 		r = -EBUSY;
 	else if (ret < 0)
diff --git a/drivers/gpu/drm/radeon/radeon_mn.c b/drivers/gpu/drm/radeon/radeon_mn.c
index 9fa88549c89e..68ebeb1bdfff 100644
--- a/drivers/gpu/drm/radeon/radeon_mn.c
+++ b/drivers/gpu/drm/radeon/radeon_mn.c
@@ -66,8 +66,8 @@ static bool radeon_mn_invalidate(struct mmu_interval_notifier *mn,
 		return true;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, true, false,
-				  MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_READ,
+				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0)
 		DRM_ERROR("(%ld) failed to wait for user bo\n", r);
 
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index b991ba1bcd51..49bbb2266c0f 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -96,7 +96,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
 	struct dma_fence *f;
 	int r = 0;
 
-	dma_resv_for_each_fence(&cursor, resv, shared, f) {
+	dma_resv_for_each_fence(&cursor, resv, dma_resv_usage_rw(shared), f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 377f9cdb5b53..4000ad2f39ba 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -478,8 +478,8 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return -EINVAL;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
-				  MAX_SCHEDULE_TIMEOUT);
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
+				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0) {
 		DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
 		return r ? r : -ETIME;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 94fe51b3caa2..a53506d21635 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -703,7 +703,8 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 	struct dma_fence *fence;
 	int ret;
 
-	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(write),
+				fence) {
 		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index fc124457ba2f..9d9a0039359c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -272,7 +272,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
-	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_iter_begin(&cursor, resv, DMA_RESV_USAGE_READ);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
@@ -301,7 +301,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 	struct dma_resv *resv = &bo->base._resv;
 	int ret;
 
-	if (dma_resv_test_signaled(resv, true))
+	if (dma_resv_test_signaled(resv, DMA_RESV_USAGE_READ))
 		ret = 0;
 	else
 		ret = -EBUSY;
@@ -313,7 +313,8 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 
-		lret = dma_resv_wait_timeout(resv, true, interruptible,
+		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_READ,
+					     interruptible,
 					     30 * HZ);
 
 		if (lret < 0)
@@ -416,7 +417,8 @@ static void ttm_bo_release(struct kref *kref)
 			/* Last resort, if we fail to allocate memory for the
 			 * fences block for the BO to become idle
 			 */
-			dma_resv_wait_timeout(bo->base.resv, true, false,
+			dma_resv_wait_timeout(bo->base.resv,
+					      DMA_RESV_USAGE_READ, false,
 					      30 * HZ);
 		}
 
@@ -427,7 +429,7 @@ static void ttm_bo_release(struct kref *kref)
 		ttm_mem_io_free(bdev, bo->resource);
 	}
 
-	if (!dma_resv_test_signaled(bo->base.resv, true) ||
+	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ) ||
 	    !dma_resv_trylock(bo->base.resv)) {
 		/* The BO is not idle, resurrect it for delayed destroy */
 		ttm_bo_flush_all_fences(bo);
@@ -1072,14 +1074,14 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
 	long timeout = 15 * HZ;
 
 	if (no_wait) {
-		if (dma_resv_test_signaled(bo->base.resv, true))
+		if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_READ))
 			return 0;
 		else
 			return -EBUSY;
 	}
 
-	timeout = dma_resv_wait_timeout(bo->base.resv, true, interruptible,
-					timeout);
+	timeout = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_READ,
+					interruptible, timeout);
 	if (timeout < 0)
 		return timeout;
 
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index a4cb296d4fcd..74ebadf4e592 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -130,6 +130,7 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 	struct vgem_file *vfile = file->driver_priv;
 	struct dma_resv *resv;
 	struct drm_gem_object *obj;
+	enum dma_resv_usage usage;
 	struct dma_fence *fence;
 	int ret;
 
@@ -151,7 +152,8 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 
 	/* Check for a conflicting fence */
 	resv = obj->resv;
-	if (!dma_resv_test_signaled(resv, arg->flags & VGEM_FENCE_WRITE)) {
+	usage = dma_resv_usage_rw(arg->flags & VGEM_FENCE_WRITE);
+	if (!dma_resv_test_signaled(resv, usage)) {
 		ret = -EBUSY;
 		goto err_fence;
 	}
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 0007e423d885..35bcb015e714 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -518,9 +518,10 @@ static int virtio_gpu_wait_ioctl(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	if (args->flags & VIRTGPU_WAIT_NOWAIT) {
-		ret = dma_resv_test_signaled(obj->resv, true);
+		ret = dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ);
 	} else {
-		ret = dma_resv_wait_timeout(obj->resv, true, true, timeout);
+		ret = dma_resv_wait_timeout(obj->resv, DMA_RESV_USAGE_READ,
+					    true, timeout);
 	}
 	if (ret == 0)
 		ret = -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 6d0abc2b0beb..5d5a438b1e23 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -739,8 +739,8 @@ static int vmw_user_bo_synccpu_grab(struct vmw_user_buffer_object *user_bo,
 	if (flags & drm_vmw_synccpu_allow_cs) {
 		long lret;
 
-		lret = dma_resv_wait_timeout(bo->base.resv, true, true,
-					     nonblock ? 0 :
+		lret = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_READ,
+					     true, nonblock ? 0 :
 					     MAX_SCHEDULE_TIMEOUT);
 		if (!lret)
 			return -EBUSY;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 23c3fc2cbf10..29452e150424 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1169,8 +1169,8 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		if (bo->moving)
 			dma_fence_put(bo->moving);
 
-		/* TODO: This is actually a memory management dependency */
-		return dma_resv_get_singleton(bo->base.resv, false,
+		return dma_resv_get_singleton(bo->base.resv,
+					      DMA_RESV_USAGE_WRITE,
 					      &bo->moving);
 	}
 
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index d32cd7538835..f9901d273b8e 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -67,7 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
+	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
+				     DMA_RESV_USAGE_WRITE,
 				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 40ac9d486f8f..d96d8ca9af56 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -49,6 +49,49 @@ extern struct ww_class reservation_ww_class;
 
 struct dma_resv_list;
 
+/**
+ * enum dma_resv_usage - how the fences from a dma_resv obj are used
+ *
+ * This enum describes the different use cases for a dma_resv object and
+ * controls which fences are returned when queried.
+ */
+enum dma_resv_usage {
+	/**
+	 * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
+	 *
+	 * This should only be used for userspace command submissions which add
+	 * an implicit write dependency.
+	 */
+	DMA_RESV_USAGE_WRITE,
+
+	/**
+	 * @DMA_RESV_USAGE_READ: Implicit read synchronization.
+	 *
+	 * This should only be used for userspace command submissions which add
+	 * an implicit read dependency.
+	 */
+	DMA_RESV_USAGE_READ,
+};
+
+/**
+ * dma_resv_usage_rw - helper for implicit sync
+ * @write: true if we create a new implicit sync write
+ *
+ * This returns the implicit synchronization usage for write or read accesses,
+ * see enum dma_resv_usage.
+ */
+static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
+{
+	/* This looks confusing at first sight, but is indeed correct.
+	 *
+	 * The rational is that new write operations needs to wait for the
+	 * existing read and write operations to finish.
+	 * But a new read operation only needs to wait for the existing write
+	 * operations to finish.
+	 */
+	return write ? DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE;
+}
+
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
  *
@@ -147,8 +190,8 @@ struct dma_resv_iter {
 	/** @obj: The dma_resv object we iterate over */
 	struct dma_resv *obj;
 
-	/** @all_fences: If all fences should be returned */
-	bool all_fences;
+	/** @usage: Controls which fences are returned */
+	enum dma_resv_usage usage;
 
 	/** @fence: the currently handled fence */
 	struct dma_fence *fence;
@@ -178,14 +221,14 @@ struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor);
  * dma_resv_iter_begin - initialize a dma_resv_iter object
  * @cursor: The dma_resv_iter object to initialize
  * @obj: The dma_resv object which we want to iterate over
- * @all_fences: If all fences should be returned or just the exclusive one
+ * @usage: controls which fences to include, see enum dma_resv_usage.
  */
 static inline void dma_resv_iter_begin(struct dma_resv_iter *cursor,
 				       struct dma_resv *obj,
-				       bool all_fences)
+				       enum dma_resv_usage usage)
 {
 	cursor->obj = obj;
-	cursor->all_fences = all_fences;
+	cursor->usage = usage;
 	cursor->fence = NULL;
 }
 
@@ -242,7 +285,7 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
  * dma_resv_for_each_fence - fence iterator
  * @cursor: a struct dma_resv_iter pointer
  * @obj: a dma_resv object pointer
- * @all_fences: true if all fences should be returned
+ * @usage: controls which fences to return
  * @fence: the current fence
  *
  * Iterate over the fences in a struct dma_resv object while holding the
@@ -251,8 +294,8 @@ static inline bool dma_resv_iter_is_restarted(struct dma_resv_iter *cursor)
  * valid as long as the lock is held and so no extra reference to the fence is
  * taken.
  */
-#define dma_resv_for_each_fence(cursor, obj, all_fences, fence)	\
-	for (dma_resv_iter_begin(cursor, obj, all_fences),	\
+#define dma_resv_for_each_fence(cursor, obj, usage, fence)	\
+	for (dma_resv_iter_begin(cursor, obj, usage),	\
 	     fence = dma_resv_iter_first(cursor); fence;	\
 	     fence = dma_resv_iter_next(cursor))
 
@@ -419,14 +462,14 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
 			     struct dma_fence *fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
-int dma_resv_get_fences(struct dma_resv *obj, bool write,
+int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
 			unsigned int *num_fences, struct dma_fence ***fences);
-int dma_resv_get_singleton(struct dma_resv *obj, bool write,
+int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
 			   struct dma_fence **fence);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
-			   unsigned long timeout);
-bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
+long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
+			   bool intr, unsigned long timeout);
+bool dma_resv_test_signaled(struct dma_resv *obj, enum dma_resv_usage usage);
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
 #endif /* _LINUX_RESERVATION_H */
-- 
2.25.1

