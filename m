Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA8897971
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbfHUMcE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:32:04 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32904 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbfHUMcE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:32:04 -0400
Received: by mail-wr1-f68.google.com with SMTP id u16so1891086wrr.0
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UxUGbbxrsVyQ07eBAkefUI1EVjRjDsWAVX0KbzpOWig=;
        b=af08BLwO83E7JdmOEyxg5WFmlICXN3aYGrFqtUOXsTWqohYCI6/pNYice5RZygmDCw
         GDQvdBb9ooPrb4Bw3v4pWlvA23AsrxmXy2cfnS9MIAuSysNJZPxyEXZd5MLISsjmAWbr
         wOb41Lszrau6xTi9oKcSj3KmYy+SrhC7w36GMH/rw/JqQn6KkGWP+XTOIy0/k/47z5RA
         VqITALB13qeus0JfaMS+KCn6QzoHC6fMGbT2ogLnRchcFwVzGNB8W2YLTBmcKuxDnso6
         A5oJ4nTxlNkRwpS9+G06D1C5s7jZ5NiL13m0xtTttNpm+qqLPcMfT6E3bxcUyDyREPWo
         VwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UxUGbbxrsVyQ07eBAkefUI1EVjRjDsWAVX0KbzpOWig=;
        b=gSbDbhjDPMG5qW5CqFaIhD5LlljuLowUMD7YKreU5L6xfv4nIbP0fnsF44PEbJxABl
         tbpx+qiAIonuF1qWeg4y2WS13/Yq4HgGDmFaMRxiXz8EgGLeL3XB45bOolZip97BqW62
         yXsTcaUoKn3QVr8HXFadJWDL8AIwpO+hYetbM7CVG4A7UdD4LPO+cF4PSgXKkhKDKvt+
         2HzfEDc7K7Oq08LatmkRC0Hvbt4KbED3tPmJoLgsQeS0Xmks/OoKztXKC5BvMwf1V8Aa
         iwCFPKww/UpE/XNBiHeXwfYQO80iwXZqDV0iFod/VXY2u0a1yJSUoj9F6pgLxZVAo39o
         NWfA==
X-Gm-Message-State: APjAAAUgdHq6yogQDmImIUW+DlExQFkdrE+a9dwxV+zEwtXqV3i9iaAM
        ozsImQXXofbYa3amJwcegHw=
X-Google-Smtp-Source: APXvYqyOGKA32P9a2FCSHJ/cdyfspfJ22W6OZiPp1a8+BxtgjK4MwvVnqjKR2WMVyXcq9bcPEqgiuA==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr12795364wrt.278.1566390720116;
        Wed, 21 Aug 2019 05:32:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/10] dma-buf/resv: replace exclusive fence with new fences container
Date:   Wed, 21 Aug 2019 14:31:46 +0200
Message-Id: <20190821123147.110736-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace the exclusive fence implementation with the new writers container
and change all users accordingly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                    |  20 ++--
 drivers/dma-buf/dma-resv.c                   | 106 +++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c     |   2 +-
 drivers/gpu/drm/drm_gem.c                    |   7 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c     |  16 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.c         |   3 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c      |   2 +-
 drivers/gpu/drm/radeon/radeon_display.c      |   4 +-
 drivers/gpu/drm/radeon/radeon_sync.c         |   2 +-
 drivers/gpu/drm/radeon/radeon_uvd.c          |   3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 |   2 +-
 include/linux/dma-resv.h                     |  33 +-----
 15 files changed, 78 insertions(+), 132 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 220cfa9ca82b..33fb3608e8ba 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -195,7 +195,7 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
-	struct dma_fence *fence_excl, *readers;
+	struct dma_fence *writers, *readers;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
 	__poll_t events;
@@ -213,10 +213,10 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		return 0;
 
 	rcu_read_lock();
-	fence_excl = dma_fence_get_rcu_safe(&resv->fence_excl);
+	writers = dma_resv_fences_get_rcu(&resv->writers);
 	readers = dma_resv_fences_get_rcu(&resv->readers);
 
-	if (fence_excl && (!(events & EPOLLOUT) || !readers)) {
+	if (writers && (!(events & EPOLLOUT) || !readers)) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
 		__poll_t pevents = EPOLLIN;
 
@@ -232,16 +232,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & pevents) {
-			if (!dma_fence_add_callback(fence_excl, &dcb->cb,
+			if (!dma_fence_add_callback(writers, &dcb->cb,
 						    dma_buf_poll_cb)) {
 				events &= ~pevents;
-				dma_fence_put(fence_excl);
+				dma_fence_put(writers);
 			} else {
 				/*
 				 * No callback queued, wake up any additional
 				 * waiters.
 				 */
-				dma_fence_put(fence_excl);
+				dma_fence_put(writers);
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			}
 		}
@@ -1122,7 +1122,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	struct dma_buf_attachment *attach_obj;
 	struct dma_fence_array_cursor cursor;
 	struct dma_resv *robj;
-	struct dma_fence *fence, *readers;
+	struct dma_fence *fence, *writers, *readers;
 	int count = 0, attach_count;
 	size_t size = 0;
 
@@ -1154,10 +1154,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 		robj = buf_obj->resv;
 		rcu_read_lock();
-		fence = dma_resv_get_excl(robj);
+		writers = dma_resv_fences_get_rcu(&robj->writers);
 		readers = dma_resv_fences_get_rcu(&robj->readers);
-		if (fence)
-			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
+		dma_fence_array_for_each(fence, cursor, writers)
+			seq_printf(s, "\tWriters fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 8723af0a7a4d..8ef7dbc7fd8e 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -39,22 +39,16 @@
 /**
  * DOC: Reservation Object Overview
  *
- * The reservation object provides a mechanism to manage readers and
- * exclusive fences associated with a buffer.  A reservation object
- * can have attached one exclusive fence (normally associated with
- * write operations) or N read fences.  The RCU mechanism is used to
- * protect read access to fences from locked write-side updates.
+ * The reservation object provides a mechanism to manage readers and writers
+ * associated with a buffer. A reservation object can have attached any number
+ * of read and writer operation in the form of dma_fence objects. The RCU
+ * mechanism is used to protect read access to fences from locked write-side
+ * updates.
  */
 
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
-struct lock_class_key reservation_seqcount_class;
-EXPORT_SYMBOL(reservation_seqcount_class);
-
-const char reservation_seqcount_string[] = "reservation_seqcount";
-EXPORT_SYMBOL(reservation_seqcount_string);
-
 static void dma_resv_fences_init(struct dma_resv_fences *fences)
 {
 	RCU_INIT_POINTER(fences->fence, NULL);
@@ -284,9 +278,7 @@ void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
 
-	__seqcount_init(&obj->seq, reservation_seqcount_string,
-			&reservation_seqcount_class);
-	RCU_INIT_POINTER(obj->fence_excl, NULL);
+	dma_resv_fences_init(&obj->writers);
 	dma_resv_fences_init(&obj->readers);
 }
 EXPORT_SYMBOL(dma_resv_init);
@@ -301,7 +293,7 @@ void dma_resv_fini(struct dma_resv *obj)
 	 * This object should be dead and all references must have
 	 * been released to it, so no need to be protected with rcu.
 	 */
-	dma_fence_put(rcu_dereference_protected(obj->fence_excl, true));
+	dma_resv_fences_fini(&obj->writers);
 	dma_resv_fences_fini(&obj->readers);
 	ww_mutex_destroy(&obj->lock);
 }
@@ -312,25 +304,14 @@ EXPORT_SYMBOL(dma_resv_fini);
  * @obj: the reservation object
  * @fence: the shared fence to add
  *
- * Add a fence to the exclusive slot.  The obj->lock must be held.
+ * Add a fence to the exclusive slots.  The obj->lock must be held.
  */
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
-	struct dma_fence *old_fence = dma_resv_get_excl(obj);
-
 	dma_resv_assert_held(obj);
 
-	dma_fence_get(fence);
-
-	preempt_disable();
-	write_seqcount_begin(&obj->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(obj->fence_excl, fence);
+	dma_resv_fences_set(obj, &obj->writers, fence);
 	dma_resv_fences_set(obj, &obj->readers, fence);
-	write_seqcount_end(&obj->seq);
-	preempt_enable();
-
-	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
 
@@ -346,11 +327,9 @@ void dma_resv_prune_fences(struct dma_resv *obj)
 
 	dma_resv_assert_held(obj);
 
-	fence = dma_resv_get_excl(obj);
-	if (dma_fence_is_signaled(fence)) {
-		RCU_INIT_POINTER(obj->fence_excl, NULL);
-		dma_fence_put(fence);
-	}
+	fence = dma_resv_fences_deref(obj, &obj->writers);
+	if (dma_fence_is_signaled(fence))
+		dma_resv_fences_set(obj, &obj->writers, NULL);
 
 	fence = dma_resv_fences_deref(obj, &obj->readers);
 	if (dma_fence_is_signaled(fence))
@@ -367,36 +346,27 @@ EXPORT_SYMBOL(dma_resv_prune_fences);
 */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_fence *old, *excl, *readers;
+	struct dma_fence *writers, *readers;
 
 	dma_resv_assert_held(dst);
 
 	rcu_read_lock();
-	excl = dma_fence_get_rcu_safe(&src->fence_excl);
+	writers = dma_resv_fences_get_rcu(&src->writers);
 	readers = dma_resv_fences_get_rcu(&src->readers);
 	rcu_read_unlock();
 
-	old = dma_resv_get_excl(dst);
-
-	preempt_disable();
-	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, excl);
+	dma_resv_fences_set(dst, &dst->writers, writers);
 	dma_resv_fences_set(dst, &dst->readers, readers);
-	write_seqcount_end(&dst->seq);
-	preempt_enable();
-
-	dma_fence_put(old);
 
 	return 0;
 }
 EXPORT_SYMBOL(dma_resv_copy_fences);
 
 /**
- * dma_resv_get_fences_rcu - Get an object's readers and exclusive
+ * dma_resv_get_fences_rcu - Get an object's readers and writers
  * fences without update side lock held
  * @obj: the reservation object
- * @pfence_excl: the returned exclusive fence (or NULL)
+ * @pfence_excl: the returned writers (or NULL)
  * @pshared_count: the number of shared fences returned
  * @pshared: the array of shared fence ptrs returned (array is krealloc'd to
  * the required size, and must be freed by caller)
@@ -404,30 +374,32 @@ EXPORT_SYMBOL(dma_resv_copy_fences);
  * Retrieve all fences from the reservation object. If the pointer for the
  * exclusive fence is not specified the fence is put into the array of the
  * shared fences as well. Returns either zero or -ENOMEM.
+ *
+ * TODO: Deprecated and shouldn't be used any more.
  */
 int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			    struct dma_fence **pfence_excl,
 			    unsigned *pshared_count,
 			    struct dma_fence ***pshared)
 {
-	struct dma_fence *excl, *readers;
+	struct dma_fence *writers, *readers;
 	struct dma_fence **shared;
 	unsigned int shared_count;
 
 	rcu_read_lock();
-	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	writers = dma_resv_fences_get_rcu(&obj->writers);
 	readers = dma_resv_fences_get_rcu(&obj->readers);
 	rcu_read_unlock();
 
 	shared_count = readers ? 1 : 0;
-	if (excl && !pfence_excl)
+	if (writers && !pfence_excl)
 		++shared_count;
 
 	if (shared_count) {
 		shared = kmalloc_array(shared_count, sizeof(*shared),
 				       GFP_KERNEL);
 		if (!shared) {
-			dma_fence_put(excl);
+			dma_fence_put(writers);
 			dma_fence_put(readers);
 			return -ENOMEM;
 		}
@@ -435,8 +407,8 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 		shared_count = 0;
 		if (readers)
 			shared[shared_count++] = readers;
-		if (excl && !pfence_excl)
-			shared[shared_count++] = excl;
+		if (writers && !pfence_excl)
+			shared[shared_count++] = writers;
 
 		*pshared = shared;
 		*pshared_count = shared_count;
@@ -446,7 +418,7 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 	}
 
 	if (pfence_excl)
-		*pfence_excl = excl;
+		*pfence_excl = writers;
 
 	return 0;
 }
@@ -454,9 +426,9 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
 
 /**
  * dma_resv_wait_timeout_rcu - Wait on reservation's objects
- * readers and/or exclusive fences.
+ * readers and/or writers.
  * @obj: the reservation object
- * @wait_all: if true, wait on all fences, else wait on just exclusive fence
+ * @wait_all: if true, wait on all fences, else wait on just writers
  * @intr: if true, do interruptible wait
  * @timeout: timeout value in jiffies or zero to return immediately
  *
@@ -468,11 +440,11 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			       bool wait_all, bool intr,
 			       unsigned long timeout)
 {
-	struct dma_fence *excl, *readers;
+	struct dma_fence *writers, *readers;
 	long ret = timeout ? timeout : 1;
 
 	rcu_read_lock();
-	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	writers = dma_resv_fences_get_rcu(&obj->writers);
 	readers = dma_resv_fences_get_rcu(&obj->readers);
 	rcu_read_unlock();
 
@@ -482,11 +454,11 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			goto out;
 	}
 
-	if (excl)
-		ret = dma_fence_wait_timeout(excl, intr, ret);
+	if (writers)
+		ret = dma_fence_wait_timeout(writers, intr, ret);
 
 out:
-	dma_fence_put(excl);
+	dma_fence_put(writers);
 	dma_fence_put(readers);
 	return ret;
 }
@@ -496,7 +468,7 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
  * dma_resv_test_signaled_rcu - Test if a reservation object's
  * fences have been signaled.
  * @obj: the reservation object
- * @test_all: if true, test all fences, otherwise only test the exclusive
+ * @test_all: if true, test all fences, otherwise only test the writers
  * fence
  *
  * RETURNS
@@ -504,21 +476,21 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	struct dma_fence *excl, *readers;
+	struct dma_fence *writers, *readers;
 	bool ret = true;
 
 	rcu_read_lock();
-	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	writers = dma_resv_fences_get_rcu(&obj->writers);
 	readers = dma_resv_fences_get_rcu(&obj->readers);
 	rcu_read_unlock();
 
-	if (excl)
-		ret = dma_fence_is_signaled(excl);
+	if (writers)
+		ret = dma_fence_is_signaled(writers);
 
 	if (test_all && readers)
 		ret &= dma_fence_is_signaled(readers);
 
-	dma_fence_put(excl);
+	dma_fence_put(writers);
 	dma_fence_put(readers);
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 3e4685565f82..fde3aa1ad76d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -141,7 +141,7 @@ __dma_resv_make_exclusive(struct dma_resv *obj)
 {
 	struct dma_fence *readers = dma_fence_get_rcu(obj->readers.fence);
 
-	dma_resv_add_excl_fence(obj, readers);
+	dma_resv_fences_set(obj, &obj->writers, readers);
 	dma_fence_put(readers);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index f8bc5baf0a44..7ba84897d52d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -204,7 +204,7 @@ int amdgpu_sync_resv(struct amdgpu_device *adev,
 		return -EINVAL;
 
 	/* always sync to the exclusive fence */
-	f = dma_resv_get_excl(resv);
+	f = dma_resv_fences_deref(resv, &resv->writers);
 	r = amdgpu_sync_fence(adev, sync, f, false);
 	if (r)
 		return r;
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 6854f5867d51..213410f8af6e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1412,14 +1412,13 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 	unsigned int i, fence_count;
 
 	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_rcu(obj->resv);
+		struct dma_fence *fence;
 
+		fence = dma_resv_fences_deref(obj->resv, &obj->resv->writers);
 		return drm_gem_fence_array_add(fence_array, fence);
 	}
 
-	ret = dma_resv_get_fences_rcu(obj->resv, NULL,
-						&fence_count, &fences);
+	ret = dma_resv_get_fences_rcu(obj->resv, NULL, &fence_count, &fences);
 	if (ret || !fence_count)
 		return ret;
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b9bcd310ca2d..72af3547d2e3 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -294,7 +294,7 @@ int drm_gem_fb_prepare_fb(struct drm_plane *plane,
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_rcu(obj->resv);
+	fence = dma_resv_fences_get_rcu(&obj->resv->writers);
 	drm_atomic_set_fence_for_plane(state, fence);
 
 	return 0;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 15f36ccd6e53..df6452f90576 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -460,9 +460,9 @@ static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	struct dma_fence *fence, *writers, *readers;
 	struct dma_fence_array_cursor cursor;
 	struct dma_resv *robj = obj->resv;
-	struct dma_fence *fence, *readers;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
@@ -474,8 +474,8 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 	readers = dma_resv_fences_deref(robj, &robj->readers);
 	dma_fence_array_for_each(fence, cursor, readers)
 		etnaviv_gem_describe_fence(fence, "Shared", m);
-	fence = rcu_dereference(robj->fence_excl);
-	if (fence)
+	writers = dma_resv_fences_deref(robj, &robj->writers);
+	dma_fence_array_for_each(fence, cursor, readers)
 		etnaviv_gem_describe_fence(fence, "Exclusive", m);
 	rcu_read_unlock();
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 0f18ba97b228..36fe5881667a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -84,9 +84,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct dma_fence_array_cursor cursor;
-	struct dma_fence *fence, *readers;
+	struct dma_fence *fence, *writers, *readers;
 	struct drm_i915_gem_object *obj;
-	unsigned int seq;
 	int err;
 
 	err = -ENOENT;
@@ -112,21 +111,18 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
+	writers = dma_resv_fences_get_rcu(&obj->base.resv->writers);
+	readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
 
 	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy =
-		busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
+	args->busy = busy_check_writer(writers);
 
 	/* Translate shared fences to READ set of engines */
-	readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
 	dma_fence_array_for_each(fence, cursor, readers)
 		args->busy |= busy_check_reader(fence);
-	dma_fence_put(readers);
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
+	dma_fence_put(writers);
+	dma_fence_put(readers);
 
 	err = 0;
 out:
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 6b3fad03b342..f865eadae965 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1324,8 +1324,9 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_get_excl(bo->base.resv);
+	struct dma_fence *fence;
 
+	fence = dma_resv_fences_deref(bo->base.resv, &bo->base.resv->writers);
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 350cd2a9ea51..a97878fbbc96 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -348,7 +348,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fence = dma_resv_get_excl(resv);
+	fence = dma_resv_fences_deref(resv, &resv->writers);
 	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index e81b01f8db90..6ef589081c6b 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -533,7 +533,9 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		DRM_ERROR("failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
-	work->fence = dma_fence_get(dma_resv_get_excl(new_rbo->tbo.base.resv));
+	work->fence = dma_resv_fences_deref(new_rbo->tbo.base.resv,
+					    &new_rbo->tbo.base.resv->writers);
+	dma_fence_get(work->fence);
 	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
 	radeon_bo_unreserve(new_rbo);
 
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 971dd6c01e60..bf595428dabf 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -97,7 +97,7 @@ int radeon_sync_resv(struct radeon_device *rdev,
 	int r = 0;
 
 	/* always sync to the exclusive fence */
-	f = dma_resv_get_excl(resv);
+	f = dma_resv_fences_deref(resv, &resv->writers);
 	fence = f ? to_radeon_fence(f) : NULL;
 	if (fence && fence->rdev == rdev)
 		radeon_sync_fence(sync, fence);
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 1ad5c3b86b64..72bfcddbce2b 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -465,6 +465,7 @@ static int radeon_uvd_validate_codec(struct radeon_cs_parser *p,
 static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 			     unsigned offset, unsigned buf_sizes[])
 {
+	struct dma_resv *resv = bo->tbo.base.resv;
 	int32_t *msg, msg_type, handle;
 	unsigned img_size = 0;
 	struct dma_fence *f;
@@ -477,7 +478,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return -EINVAL;
 	}
 
-	f = dma_resv_get_excl(bo->tbo.base.resv);
+	f = dma_resv_fences_deref(resv, &resv->writers);
 	if (f) {
 		r = radeon_fence_wait((struct radeon_fence *)f, false);
 		if (r) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 19eeefbbb65a..53d4035778d0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -455,7 +455,7 @@ static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_fence *fence;
 
-	fence = dma_resv_get_excl(&bo->base._resv);
+	fence = dma_resv_fences_deref(&bo->base._resv, &bo->base._resv.writers);
 	if (fence && !fence->ops->signaled)
 		dma_fence_enable_sw_signaling(fence);
 
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index b23e16975f39..72c3c4f99711 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -48,8 +48,6 @@
 struct dma_resv;
 
 extern struct ww_class reservation_ww_class;
-extern struct lock_class_key reservation_seqcount_class;
-extern const char reservation_seqcount_string[];
 
 /**
  * struct dma_resv_fences - fences inside a reservation object
@@ -76,15 +74,14 @@ void dma_resv_fences_commit(struct dma_resv *obj,
  * struct dma_resv - a reservation object manages fences for a buffer
  * @lock: update side lock
  * @seq: sequence count for managing RCU read-side synchronization
- * @fence_excl: the exclusive fence, if there is one currently
+ * @writers: array of write operations for implicit sync
  * @readers: array of read operations for implicit sync
  */
 struct dma_resv {
 	struct ww_mutex lock;
-	seqcount_t seq;
 
-	struct dma_fence __rcu *fence_excl;
-	struct dma_resv_fences	readers;
+	struct dma_resv_fences writers;
+	struct dma_resv_fences readers;
 };
 
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
@@ -243,25 +240,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
-/**
- * dma_resv_get_excl - get the reservation object's
- * exclusive fence, with update-side lock held
- * @obj: the reservation object
- *
- * Returns the exclusive fence (if any).  Does NOT take a
- * reference. Writers must hold obj->lock, readers may only
- * hold a RCU read side lock.
- *
- * RETURNS
- * The exclusive fence or NULL
- */
-static inline struct dma_fence *
-dma_resv_get_excl(struct dma_resv *obj)
-{
-	return rcu_dereference_protected(obj->fence_excl,
-					 dma_resv_held(obj));
-}
-
 /**
  * dma_resv_get_excl_rcu - get the reservation object's
  * exclusive fence, without lock held.
@@ -278,11 +256,8 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
 {
 	struct dma_fence *fence;
 
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
 	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
+	fence = dma_resv_fences_get_rcu(&obj->writers);
 	rcu_read_unlock();
 
 	return fence;
-- 
2.17.1

