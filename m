Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED799D21B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732765AbfHZO5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41637 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732764AbfHZO5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id j16so15624312wrr.8
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5cVaQRT3UrzN/JVV2XBVPxxZtPaTn2yeMscXhWBD97M=;
        b=aIKDE70lebG/WBYIKMHpK2XwXCWkcCpEna8tYNovj0n/Ts0UM7Sqvwp498ltgXgVJ6
         /ptiFiEkGZHy/BkFxZ1tViY8/h9tqR4VWMNBpXbPdS61CGS9X3xYi/cvT1CbfUaJHah1
         Dy2i7Kuxv4wPHqKgjLegwVqwGX8KDam95ryQpYbhZ2Jhe9x8TBjUvaLKscd5x4T7w26A
         ObAlF010atmxUQt3Er3bMZbMKNCXkyHWyYEvbuNByBehOfpPJQgnNWqHn1WMi07oycxg
         PxBrc7dn9c6RCMpVd8gQISkekJUY+6BXya0VpoFNagn6ulDURmKiswvn0AqNZUz5Et0k
         o3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cVaQRT3UrzN/JVV2XBVPxxZtPaTn2yeMscXhWBD97M=;
        b=gF2KUTsoST9ZnWQdKacDH8B7t3lysUfGre3lqCBMlUWFEBMK8nZlrLuecXrB3e7HAy
         tP4vYBkmIqyeBeDAPP88iP9cdNXPDbEJbhrBkEsUnHC+98GCEl+upH9HU4Ht2tQlp0Bd
         YNsVvJ7GY5eMM04aaloATNYYun0X7Mxs78f60E8HNsxshOrX6xsjL1DKb9ca9JyARFiW
         59HsRQ3diFN+KG+W/oeRAuKwk1qSILp8dcnNv8RB8j50Ig3KgCXKtbiSUoBJTiDcjGX0
         Sqeb/mzEe2Q3IiJlUqTV313LueWsGtF5HDH3AEtT3ZhMdSp/n+oNRKzCp5RBFW1vsGi9
         YZOA==
X-Gm-Message-State: APjAAAUWJlRcsgMQBDZYZZLBwb2UASdewjT2BHs8NXutINpMwVlfj9Ng
        cvBFqUaPIf2MwwpgQLot0iY=
X-Google-Smtp-Source: APXvYqyWIzLaGf99wJW8u9kuaJeq6mkstYlMH3nAOjnbq//vnTaRll1BDIpfI19qxA1p7Hrg3g2Aaw==
X-Received: by 2002:adf:9e09:: with SMTP id u9mr22979725wre.169.1566831459938;
        Mon, 26 Aug 2019 07:57:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:39 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 8/9] dma-buf/resv: use new dma_fence_array based implementation
Date:   Mon, 26 Aug 2019 16:57:30 +0200
Message-Id: <20190826145731.1725-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new dma_fence_array based implementation for shared fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                     | 102 +---
 drivers/dma-buf/dma-resv.c                    | 492 +++---------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  52 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  36 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  19 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  18 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  20 +-
 drivers/gpu/drm/i915/i915_gem_batch_pool.c    |   2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  14 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  18 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |  12 +-
 drivers/gpu/drm/radeon/radeon_sync.c          |  14 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  13 +-
 include/linux/dma-resv.h                      |  40 +-
 15 files changed, 186 insertions(+), 683 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 433d91d710e4..51c17dfc8ceb 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
 #include <linux/anon_inodes.h>
 #include <linux/export.h>
 #include <linux/debugfs.h>
@@ -194,12 +195,10 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
+	struct dma_fence *fence_excl, *shared;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence_excl;
 	__poll_t events;
-	unsigned shared_count, seq;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -213,26 +212,15 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
-retry:
-	seq = read_seqcount_begin(&resv->seq);
 	rcu_read_lock();
+	fence_excl = dma_fence_get_rcu_safe(&resv->fence_excl);
+	shared = dma_resv_fences_get_rcu(&resv->shared);
 
-	fobj = rcu_dereference(resv->fence);
-	if (fobj)
-		shared_count = fobj->shared_count;
-	else
-		shared_count = 0;
-	fence_excl = rcu_dereference(resv->fence_excl);
-	if (read_seqcount_retry(&resv->seq, seq)) {
-		rcu_read_unlock();
-		goto retry;
-	}
-
-	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
+	if (fence_excl && (!(events & EPOLLOUT) || !shared)) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
 		__poll_t pevents = EPOLLIN;
 
-		if (shared_count == 0)
+		if (!shared)
 			pevents |= EPOLLOUT;
 
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -244,28 +232,21 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & pevents) {
-			if (!dma_fence_get_rcu(fence_excl)) {
-				/* force a recheck */
-				events &= ~pevents;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-			} else if (!dma_fence_add_callback(fence_excl, &dcb->cb,
-							   dma_buf_poll_cb)) {
+			if (!dma_fence_add_callback(fence_excl, &dcb->cb,
+						    dma_buf_poll_cb)) {
 				events &= ~pevents;
-				dma_fence_put(fence_excl);
 			} else {
 				/*
 				 * No callback queued, wake up any additional
 				 * waiters.
 				 */
-				dma_fence_put(fence_excl);
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			}
 		}
 	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
+	if ((events & EPOLLOUT) && shared) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
 
 		/* Only queue a new callback if no event has fired yet */
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -278,35 +259,19 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		if (!(events & EPOLLOUT))
 			goto out;
 
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
-
-			if (!dma_fence_get_rcu(fence)) {
-				/*
-				 * fence refcount dropped to zero, this means
-				 * that fobj has been freed
-				 *
-				 * call dma_buf_poll_cb and force a recheck!
-				 */
-				events &= ~EPOLLOUT;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-				break;
-			}
-			if (!dma_fence_add_callback(fence, &dcb->cb,
-						    dma_buf_poll_cb)) {
-				dma_fence_put(fence);
-				events &= ~EPOLLOUT;
-				break;
-			}
-			dma_fence_put(fence);
-		}
-
-		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
+		if (!dma_fence_add_callback(shared, &dcb->cb,
+					    dma_buf_poll_cb)) {
+			events &= ~EPOLLOUT;
+		} else {
+			/* No callback queued, wake up any additional waiters. */
 			dma_buf_poll_cb(NULL, &dcb->cb);
+		}
 	}
 
 out:
+	dma_fence_put(fence_excl);
+	dma_fence_put(shared);
+
 	rcu_read_unlock();
 	return events;
 }
@@ -1154,11 +1119,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	int ret;
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
+	struct dma_fence_array_cursor cursor;
 	struct dma_resv *robj;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
-	unsigned seq;
-	int count = 0, attach_count, shared_count, i;
+	struct dma_fence *fence, *shared;
+	int count = 0, attach_count;
 	size_t size = 0;
 
 	ret = mutex_lock_interruptible(&db_list.lock);
@@ -1188,32 +1152,20 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->name ?: "");
 
 		robj = buf_obj->resv;
-		while (true) {
-			seq = read_seqcount_begin(&robj->seq);
-			rcu_read_lock();
-			fobj = rcu_dereference(robj->fence);
-			shared_count = fobj ? fobj->shared_count : 0;
-			fence = rcu_dereference(robj->fence_excl);
-			if (!read_seqcount_retry(&robj->seq, seq))
-				break;
-			rcu_read_unlock();
-		}
-
+		rcu_read_lock();
+		fence = dma_resv_get_excl(robj);
+		shared = dma_resv_fences_get_rcu(&robj->shared);
 		if (fence)
 			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
-			if (!dma_fence_get_rcu(fence))
-				continue;
-			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
+		dma_fence_array_for_each(fence, cursor, shared)
+			seq_printf(s, "\tReaders fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-			dma_fence_put(fence);
-		}
+		dma_fence_put(shared);
 		rcu_read_unlock();
 
 		seq_puts(s, "\tAttached Devices:\n");
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index d67eaa3fa650..7fa0e86b4e75 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -236,46 +236,6 @@ void dma_resv_fences_commit(struct dma_resv *obj,
 }
 EXPORT_SYMBOL(dma_resv_fences_commit);
 
-/**
- * dma_resv_list_alloc - allocate fence list
- * @shared_max: number of fences we need space for
- *
- * Allocate a new dma_resv_list and make sure to correctly initialize
- * shared_max.
- */
-static struct dma_resv_list *dma_resv_list_alloc(unsigned int shared_max)
-{
-	struct dma_resv_list *list;
-
-	list = kmalloc(offsetof(typeof(*list), shared[shared_max]), GFP_KERNEL);
-	if (!list)
-		return NULL;
-
-	list->shared_max = (ksize(list) - offsetof(typeof(*list), shared)) /
-		sizeof(*list->shared);
-
-	return list;
-}
-
-/**
- * dma_resv_list_free - free fence list
- * @list: list to free
- *
- * Free a dma_resv_list and make sure to drop all references.
- */
-static void dma_resv_list_free(struct dma_resv_list *list)
-{
-	unsigned int i;
-
-	if (!list)
-		return;
-
-	for (i = 0; i < list->shared_count; ++i)
-		dma_fence_put(rcu_dereference_protected(list->shared[i], true));
-
-	kfree_rcu(list, rcu);
-}
-
 /**
  * dma_resv_init - initialize a reservation object
  * @obj: the reservation object
@@ -286,8 +246,8 @@ void dma_resv_init(struct dma_resv *obj)
 
 	__seqcount_init(&obj->seq, reservation_seqcount_string,
 			&reservation_seqcount_class);
-	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
+	dma_resv_fences_init(&obj->shared);
 }
 EXPORT_SYMBOL(dma_resv_init);
 
@@ -297,7 +257,6 @@ EXPORT_SYMBOL(dma_resv_init);
  */
 void dma_resv_fini(struct dma_resv *obj)
 {
-	struct dma_resv_list *fobj;
 	struct dma_fence *excl;
 
 	/*
@@ -308,8 +267,7 @@ void dma_resv_fini(struct dma_resv *obj)
 	if (excl)
 		dma_fence_put(excl);
 
-	fobj = rcu_dereference_protected(obj->fence, 1);
-	dma_resv_list_free(fobj);
+	dma_resv_fences_fini(&obj->shared);
 	ww_mutex_destroy(&obj->lock);
 }
 EXPORT_SYMBOL(dma_resv_fini);
@@ -328,69 +286,8 @@ EXPORT_SYMBOL(dma_resv_fini);
  */
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
 {
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k, max;
-
 	dma_resv_assert_held(obj);
-
-	old = dma_resv_get_list(obj);
-
-	if (old && old->shared_max) {
-		if ((old->shared_count + num_fences) <= old->shared_max)
-			return 0;
-		else
-			max = max(old->shared_count + num_fences,
-				  old->shared_max * 2);
-	} else {
-		max = 4;
-	}
-
-	new = dma_resv_list_alloc(max);
-	if (!new)
-		return -ENOMEM;
-
-	/*
-	 * no need to bump fence refcounts, rcu_read access
-	 * requires the use of kref_get_unless_zero, and the
-	 * references from the old struct are carried over to
-	 * the new.
-	 */
-	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
-		struct dma_fence *fence;
-
-		fence = rcu_dereference_protected(old->shared[i],
-						  dma_resv_held(obj));
-		if (dma_fence_is_signaled(fence))
-			RCU_INIT_POINTER(new->shared[--k], fence);
-		else
-			RCU_INIT_POINTER(new->shared[j++], fence);
-	}
-	new->shared_count = j;
-
-	/*
-	 * We are not changing the effective set of fences here so can
-	 * merely update the pointer to the new array; both existing
-	 * readers and new readers will see exactly the same set of
-	 * active (unsignaled) shared fences. Individual fences and the
-	 * old array are protected by RCU and so will not vanish under
-	 * the gaze of the rcu_read_lock() readers.
-	 */
-	rcu_assign_pointer(obj->fence, new);
-
-	if (!old)
-		return 0;
-
-	/* Drop the references to the signaled fences */
-	for (i = k; i < max; ++i) {
-		struct dma_fence *fence;
-
-		fence = rcu_dereference_protected(new->shared[i],
-						  dma_resv_held(obj));
-		dma_fence_put(fence);
-	}
-	kfree_rcu(old, rcu);
-
-	return 0;
+	return dma_resv_fences_reserve(obj, &obj->shared, num_fences);
 }
 EXPORT_SYMBOL(dma_resv_reserve_shared);
 
@@ -404,41 +301,8 @@ EXPORT_SYMBOL(dma_resv_reserve_shared);
  */
 void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
-	struct dma_resv_list *fobj;
-	struct dma_fence *old;
-	unsigned int i, count;
-
-	dma_fence_get(fence);
-
 	dma_resv_assert_held(obj);
-
-	fobj = dma_resv_get_list(obj);
-	count = fobj->shared_count;
-
-	preempt_disable();
-	write_seqcount_begin(&obj->seq);
-
-	for (i = 0; i < count; ++i) {
-
-		old = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj));
-		if (old->context == fence->context ||
-		    dma_fence_is_signaled(old))
-			goto replace;
-	}
-
-	BUG_ON(fobj->shared_count >= fobj->shared_max);
-	old = NULL;
-	count++;
-
-replace:
-	RCU_INIT_POINTER(fobj->shared[i], fence);
-	/* pointer update must be visible before we extend the shared_count */
-	smp_store_mb(fobj->shared_count, count);
-
-	write_seqcount_end(&obj->seq);
-	preempt_enable();
-	dma_fence_put(old);
+	dma_resv_fences_add(&obj->shared, fence);
 }
 EXPORT_SYMBOL(dma_resv_add_shared_fence);
 
@@ -452,32 +316,19 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
 	struct dma_fence *old_fence = dma_resv_get_excl(obj);
-	struct dma_resv_list *old;
-	u32 i = 0;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_get_list(obj);
-	if (old)
-		i = old->shared_count;
-
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
-	if (old)
-		old->shared_count = 0;
+	dma_resv_fences_set(obj, &obj->shared, NULL);
 	write_seqcount_end(&obj->seq);
 	preempt_enable();
 
-	/* inplace update, no shared fences */
-	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
-
 	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
@@ -490,9 +341,7 @@ EXPORT_SYMBOL(dma_resv_add_excl_fence);
  */
 void dma_resv_prune_fences(struct dma_resv *obj)
 {
-	struct dma_resv_list *list;
 	struct dma_fence *fence;
-	unsigned int i;
 
 	dma_resv_assert_held(obj);
 
@@ -502,20 +351,9 @@ void dma_resv_prune_fences(struct dma_resv *obj)
 		dma_fence_put(fence);
 	}
 
-	list = dma_resv_get_list(obj);
-	if (!list)
-		return;
-
-	for (i = 0; i < list->shared_count; ++i) {
-		fence = rcu_dereference_protected(list->shared[i],
-						  dma_resv_held(obj));
-
-		if (!dma_fence_is_signaled(fence))
-			continue;
-
-		RCU_INIT_POINTER(list->shared[i], dma_fence_get_stub());
-		dma_fence_put(fence);
-	}
+	fence = dma_resv_fences_deref(obj, &obj->shared);
+	if (fence && dma_fence_is_signaled(fence))
+		dma_resv_fences_set(obj, &obj->shared, NULL);
 }
 EXPORT_SYMBOL(dma_resv_prune_fences);
 
@@ -528,73 +366,25 @@ EXPORT_SYMBOL(dma_resv_prune_fences);
 */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned i;
+	struct dma_fence *old, *excl, *shared;
 
 	dma_resv_assert_held(dst);
 
 	rcu_read_lock();
-	src_list = rcu_dereference(src->fence);
-
-retry:
-	if (src_list) {
-		unsigned shared_count = src_list->shared_count;
-
-		rcu_read_unlock();
-
-		dst_list = dma_resv_list_alloc(shared_count);
-		if (!dst_list)
-			return -ENOMEM;
-
-		rcu_read_lock();
-		src_list = rcu_dereference(src->fence);
-		if (!src_list || src_list->shared_count > shared_count) {
-			kfree(dst_list);
-			goto retry;
-		}
-
-		dst_list->shared_count = 0;
-		for (i = 0; i < src_list->shared_count; ++i) {
-			struct dma_fence *fence;
-
-			fence = rcu_dereference(src_list->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &fence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(fence)) {
-				dma_resv_list_free(dst_list);
-				src_list = rcu_dereference(src->fence);
-				goto retry;
-			}
-
-			if (dma_fence_is_signaled(fence)) {
-				dma_fence_put(fence);
-				continue;
-			}
-
-			rcu_assign_pointer(dst_list->shared[dst_list->shared_count++], fence);
-		}
-	} else {
-		dst_list = NULL;
-	}
-
-	new = dma_fence_get_rcu_safe(&src->fence_excl);
+	excl = dma_fence_get_rcu_safe(&src->fence_excl);
+	shared = dma_resv_fences_get_rcu(&src->shared);
 	rcu_read_unlock();
 
-	src_list = dma_resv_get_list(dst);
 	old = dma_resv_get_excl(dst);
 
 	preempt_disable();
 	write_seqcount_begin(&dst->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	RCU_INIT_POINTER(dst->fence_excl, excl);
+	dma_resv_fences_set(dst, &dst->shared, shared);
 	write_seqcount_end(&dst->seq);
 	preempt_enable();
 
-	dma_resv_list_free(src_list);
 	dma_fence_put(old);
 
 	return 0;
@@ -619,86 +409,54 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			    unsigned *pshared_count,
 			    struct dma_fence ***pshared)
 {
-	struct dma_fence **shared = NULL;
-	struct dma_fence *fence_excl;
-	unsigned int shared_count;
-	int ret = 1;
-
-	do {
-		struct dma_resv_list *fobj;
-		unsigned int i, seq;
-		size_t sz = 0;
-
-		shared_count = i = 0;
-
-		rcu_read_lock();
-		seq = read_seqcount_begin(&obj->seq);
-
-		fence_excl = rcu_dereference(obj->fence_excl);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
-
-		fobj = rcu_dereference(obj->fence);
-		if (fobj)
-			sz += sizeof(*shared) * fobj->shared_max;
-
-		if (!pfence_excl && fence_excl)
-			sz += sizeof(*shared);
-
-		if (sz) {
-			struct dma_fence **nshared;
-
-			nshared = krealloc(shared, sz,
-					   GFP_NOWAIT | __GFP_NOWARN);
-			if (!nshared) {
-				rcu_read_unlock();
-
-				dma_fence_put(fence_excl);
-				fence_excl = NULL;
-
-				nshared = krealloc(shared, sz, GFP_KERNEL);
-				if (nshared) {
-					shared = nshared;
-					continue;
-				}
-
-				ret = -ENOMEM;
-				break;
-			}
-			shared = nshared;
-			shared_count = fobj ? fobj->shared_count : 0;
-			for (i = 0; i < shared_count; ++i) {
-				shared[i] = rcu_dereference(fobj->shared[i]);
-				if (!dma_fence_get_rcu(shared[i]))
-					break;
-			}
-		}
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *excl, *shared, *f;
+	struct dma_fence **array;
+	unsigned int count;
+
+	rcu_read_lock();
+	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	shared = dma_resv_fences_get_rcu(&obj->shared);
+	rcu_read_unlock();
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
+	if (to_dma_fence_array(shared))
+		count = to_dma_fence_array(shared)->num_fences;
+	else if (shared)
+		count = 1;
+	else
+		count = 0;
+
+	if (excl && !pfence_excl)
+		++count;
+
+	if (count) {
+		array = kmalloc_array(count, sizeof(*shared),
+				      GFP_KERNEL);
+		if (!array) {
+			dma_fence_put(excl);
+			dma_fence_put(shared);
+			return -ENOMEM;
 		}
 
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
+		count = 0;
+		dma_fence_array_for_each(f, cursor, shared)
+			array[count++] = dma_fence_get(f);
+		dma_fence_put(shared);
 
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[++shared_count] = fence_excl;
+		if (excl && !pfence_excl)
+			array[count++] = excl;
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		*pshared = array;
+		*pshared_count = count;
+	} else {
+		*pshared = NULL;
+		*pshared_count = 0;
 	}
 
-	*pshared_count = shared_count;
-	*pshared = shared;
-	return ret;
+	if (pfence_excl)
+		*pfence_excl = excl;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dma_resv_get_fences_rcu);
 
@@ -718,93 +476,29 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			       bool wait_all, bool intr,
 			       unsigned long timeout)
 {
-	struct dma_fence *fence;
-	unsigned seq, shared_count;
+	struct dma_fence *excl, *shared;
 	long ret = timeout ? timeout : 1;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = rcu_dereference(obj->fence_excl);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
-
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
-		}
-
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence = rcu_dereference(fobj->shared[i]);
-
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
-	}
-
+	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	shared = dma_resv_fences_get_rcu(&obj->shared);
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
+	if (wait_all && shared) {
+		ret = dma_fence_wait_timeout(shared, intr, ret);
+		if (ret <= 0)
+			goto out;
 	}
-	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
-}
-EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
-
-
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
 
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
+	if (excl)
+		ret = dma_fence_wait_timeout(excl, intr, ret);
 
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
+out:
+	dma_fence_put(excl);
+	dma_fence_put(shared);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
 
 /**
  * dma_resv_test_signaled_rcu - Test if a reservation object's
@@ -818,51 +512,23 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	unsigned seq, shared_count;
-	int ret;
+	struct dma_fence *excl, *shared;
+	bool ret = true;
 
 	rcu_read_lock();
-retry:
-	ret = true;
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		unsigned i;
-
-		struct dma_resv_list *fobj = rcu_dereference(obj->fence);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
-
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
-		}
-
-		if (read_seqcount_retry(&obj->seq, seq))
-			goto retry;
-	}
+	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	shared = dma_resv_fences_get_rcu(&obj->shared);
+	rcu_read_unlock();
 
-	if (!shared_count) {
-		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
+	if (excl)
+		ret = dma_fence_is_signaled(excl);
 
-		if (fence_excl) {
-			ret = dma_resv_test_signaled_single(fence_excl);
-			if (ret < 0)
-				goto retry;
+	if (test_all && shared)
+		ret &= dma_fence_is_signaled(shared);
 
-			if (read_seqcount_retry(&obj->seq, seq))
-				goto retry;
-		}
-	}
+	dma_fence_put(excl);
+	dma_fence_put(shared);
 
-	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 76e3516484e7..82a1eaa8184d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -23,6 +23,7 @@
 #define pr_fmt(fmt) "kfd2kgd: " fmt
 
 #include <linux/dma-buf.h>
+#include <linux/dma-fence-array.h>
 #include <linux/list.h>
 #include <linux/pagemap.h>
 #include <linux/sched/mm.h>
@@ -219,54 +220,27 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 					struct amdgpu_amdkfd_fence *ef)
 {
 	struct dma_resv *resv = bo->tbo.base.resv;
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k;
+	unsigned int i;
+	int r;
 
 	if (!ef)
 		return -EINVAL;
 
-	old = dma_resv_get_list(resv);
-	if (!old)
-		return 0;
-
-	new = kmalloc(offsetof(typeof(*new), shared[old->shared_max]),
-		      GFP_KERNEL);
-	if (!new)
-		return -ENOMEM;
+	r = dma_resv_fences_reserve(resv, &resv->shared, 0);
+	if (r)
+		return r;
 
-	/* Go through all the shared fences in the resevation object and sort
-	 * the interesting ones to the end of the list.
-	 */
-	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
+	for (i = 0; i < resv->shared.staged->num_fences; ++i) {
 		struct dma_fence *f;
 
-		f = rcu_dereference_protected(old->shared[i],
-					      dma_resv_held(resv));
-
-		if (f->context == ef->base.context)
-			RCU_INIT_POINTER(new->shared[--j], f);
-		else
-			RCU_INIT_POINTER(new->shared[k++], f);
+		f = resv->shared.staged->fences[i];
+		if (f->context == ef->base.context) {
+			resv->shared.staged->fences[i] = dma_fence_get_stub();
+			dma_fence_put(f);
+		}
 	}
-	new->shared_max = old->shared_max;
-	new->shared_count = k;
-
-	/* Install the new fence list, seqcount provides the barriers */
-	preempt_disable();
-	write_seqcount_begin(&resv->seq);
-	RCU_INIT_POINTER(resv->fence, new);
-	write_seqcount_end(&resv->seq);
-	preempt_enable();
 
-	/* Drop the references to the removed fences or move them to ef_list */
-	for (i = j, k = 0; i < old->shared_count; ++i) {
-		struct dma_fence *f;
-
-		f = rcu_dereference_protected(new->shared[i],
-					      dma_resv_held(resv));
-		dma_fence_put(f);
-	}
-	kfree_rcu(old, rcu);
+	dma_resv_fences_commit(resv, &resv->shared);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index bf0f00508987..07edf19795b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -139,43 +139,11 @@ int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
 static int
 __dma_resv_make_exclusive(struct dma_resv *obj)
 {
-	struct dma_fence **fences;
-	unsigned int count;
-	int r;
+	struct dma_fence *shared = dma_resv_fences_deref(obj, &obj->shared);
 
-	if (!dma_resv_get_list(obj)) /* no shared fences to convert */
-		return 0;
-
-	r = dma_resv_get_fences_rcu(obj, NULL, &count, &fences);
-	if (r)
-		return r;
-
-	if (count == 0) {
-		/* Now that was unexpected. */
-	} else if (count == 1) {
-		dma_resv_add_excl_fence(obj, fences[0]);
-		dma_fence_put(fences[0]);
-		kfree(fences);
-	} else {
-		struct dma_fence_array *array;
-
-		array = dma_fence_array_create(count, fences,
-					       dma_fence_context_alloc(1), 0,
-					       false);
-		if (!array)
-			goto err_fences_put;
-
-		dma_resv_add_excl_fence(obj, &array->base);
-		dma_fence_put(&array->base);
-	}
+	dma_resv_add_excl_fence(obj, shared);
 
 	return 0;
-
-err_fences_put:
-	while (count--)
-		dma_fence_put(fences[count]);
-	kfree(fences);
-	return -ENOMEM;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 95e5e93edd18..7ae62dd48115 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -28,6 +28,8 @@
  *    Christian König <christian.koenig@amd.com>
  */
 
+#include <linux/dma-fence-array.h>
+
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -193,10 +195,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev,
 		     struct dma_resv *resv,
 		     void *owner, bool explicit_sync)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *f, *array;
 	void *fence_owner;
-	unsigned i;
 	int r = 0;
 
 	if (resv == NULL)
@@ -205,14 +206,12 @@ int amdgpu_sync_resv(struct amdgpu_device *adev,
 	/* always sync to the exclusive fence */
 	f = dma_resv_get_excl(resv);
 	r = amdgpu_sync_fence(adev, sync, f, false);
-
-	flist = dma_resv_get_list(resv);
-	if (!flist || r)
+	if (r)
 		return r;
 
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	array = dma_resv_fences_deref(resv, &resv->shared);
+	dma_fence_array_for_each(f, cursor, array) {
+
 		/* We only want to trigger KFD eviction fences on
 		 * evict or move jobs. Skip KFD fences otherwise.
 		 */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fb09314bcfd4..733ee08cc0cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -39,6 +39,7 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 #include <linux/swiotlb.h>
+#include <linux/dma-fence-array.h>
 
 #include <drm/ttm/ttm_bo_api.h>
 #include <drm/ttm/ttm_bo_driver.h>
@@ -1470,9 +1471,8 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 {
 	unsigned long num_pages = bo->mem.num_pages;
 	struct drm_mm_node *node = bo->mem.mm_node;
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
-	int i;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *f, *array;
 
 	/* Don't evict VM page tables while they are busy, otherwise we can't
 	 * cleanly handle page faults.
@@ -1485,15 +1485,10 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_get_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
-	}
+	array = dma_resv_fences_deref(bo->base.resv, &bo->base.resv->shared);
+	dma_fence_array_for_each(f, cursor, array)
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 
 	switch (bo->mem.mem_type) {
 	case TTM_PL_TT:
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 7d83e04ec36e..8fd8c939bcf7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -7,6 +7,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
+#include <linux/dma-fence-array.h>
 
 #include "etnaviv_drv.h"
 #include "etnaviv_gem.h"
@@ -459,9 +460,9 @@ static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+	struct dma_fence_array_cursor cursor;
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
+	struct dma_fence *fence, *shared;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
 	seq_printf(m, "%08x: %c %2d (%2d) %08lx %p %zd\n",
@@ -470,16 +471,9 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = rcu_dereference(robj->fence);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
-			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
-	}
-
+	shared = dma_resv_fences_deref(robj, &robj->shared);
+	dma_fence_array_for_each(fence, cursor, shared)
+		etnaviv_gem_describe_fence(fence, "Shared", m);
 	fence = rcu_dereference(robj->fence_excl);
 	if (fence)
 		etnaviv_gem_describe_fence(fence, "Exclusive", m);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 3d4f5775a4ba..0ef338a8cd9f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -4,6 +4,8 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
+#include <linux/dma-fence-array.h>
+
 #include "gt/intel_engine.h"
 
 #include "i915_gem_ioctls.h"
@@ -81,8 +83,9 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 		    struct drm_file *file)
 {
 	struct drm_i915_gem_busy *args = data;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *fence, *shared;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
 	unsigned int seq;
 	int err;
 
@@ -117,17 +120,10 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 		busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
 
 	/* Translate shared fences to READ set of engines */
-	list = rcu_dereference(obj->base.resv->fence);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
-			args->busy |= busy_check_reader(fence);
-		}
-	}
+	shared = dma_resv_fences_get_rcu(&obj->base.resv->shared);
+	dma_fence_array_for_each(fence, cursor, shared)
+		args->busy |= busy_check_reader(fence);
+	dma_fence_put(shared);
 
 	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
 		goto retry;
diff --git a/drivers/gpu/drm/i915/i915_gem_batch_pool.c b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
index 274cf5b19fc9..8b3788968590 100644
--- a/drivers/gpu/drm/i915/i915_gem_batch_pool.c
+++ b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
@@ -112,7 +112,7 @@ i915_gem_batch_pool_get(struct i915_gem_batch_pool *pool,
 			 * trapping a reference to all the old fences, rather
 			 * than replace the existing fence.
 			 */
-			if (rcu_access_pointer(resv->fence)) {
+			if (rcu_access_pointer(resv->shared.fence)) {
 				dma_resv_lock(resv, NULL);
 				dma_resv_prune_fences(resv);
 				dma_resv_unlock(resv);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 348a7ad2c044..44370a95e110 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -663,12 +663,12 @@ void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive)
 {
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *fence, *shared;
 	int i, ret;
 
-	fobj = dma_resv_get_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
+	shared = dma_resv_fences_deref(obj->resv, &obj->res->shared);
+	if (!shared) {
 		fence = dma_resv_get_excl(obj->resv);
 		/* don't need to wait on our own fences, since ring is fifo */
 		if (fence && (fence->context != fctx->context)) {
@@ -678,12 +678,10 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 		}
 	}
 
-	if (!exclusive || !fobj)
+	if (!exclusive)
 		return 0;
 
-	for (i = 0; i < fobj->shared_count; i++) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj->resv));
+	dma_fence_array_for_each(fence, cursor, shared) {
 		if (fence->context != fctx->context) {
 			ret = dma_fence_wait(fence, true);
 			if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 8df390078c85..e55e64fb676f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -28,6 +28,7 @@
 
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
+#include <linux/dma-fence-array.h>
 #include <trace/events/dma_fence.h>
 
 #include <nvif/cl826e.h>
@@ -334,11 +335,11 @@ int
 nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
 	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *fence, *shared;
 	struct nouveau_fence *f;
-	int ret = 0, i;
+	int ret = 0;
 
 	if (!exclusive) {
 		ret = dma_resv_reserve_shared(resv, 1);
@@ -347,10 +348,10 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fobj = dma_resv_get_list(resv);
 	fence = dma_resv_get_excl(resv);
+	shared = dma_resv_fences_deref(resv, &resv->shared);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence && (!exclusive || !shared)) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
@@ -369,16 +370,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		return ret;
 	}
 
-	if (!exclusive || !fobj)
+	if (!exclusive)
 		return ret;
 
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+	dma_fence_array_for_each(fence, cursor, shared) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index a4f4175bbdbe..5e29e5d45e50 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -28,6 +28,8 @@
  *  Alon Levy <alevy@redhat.com>
  */
 
+#include <linux/dma-fence-array.h>
+
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 
@@ -57,12 +59,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
+		struct dma_resv *resv = bo->tbo.base.resv;
+		struct dma_fence_array *array;
+		struct dma_fence *shared;
 		int rel;
 
 		rcu_read_lock();
-		fobj = rcu_dereference(bo->tbo.base.resv->fence);
-		rel = fobj ? fobj->shared_count : 0;
+		shared = dma_resv_fences_get_rcu(&resv->shared);
+		array = to_dma_fence_array(shared);
+		rel = array ? array->num_fences : shared ? 1 : 0;
+		dma_fence_put(shared);
 		rcu_read_unlock();
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 55cc77a73c7b..ff7abd32ec55 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -27,6 +27,7 @@
  * Authors:
  *    Christian König <christian.koenig@amd.com>
  */
+#include <linux/dma-fence-array.h>
 
 #include "radeon.h"
 #include "radeon_trace.h"
@@ -90,10 +91,9 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *f, *fshared;
 	struct radeon_fence *fence;
-	unsigned i;
 	int r = 0;
 
 	/* always sync to the exclusive fence */
@@ -104,13 +104,11 @@ int radeon_sync_resv(struct radeon_device *rdev,
 	else if (f)
 		r = dma_fence_wait(f, true);
 
-	flist = dma_resv_get_list(resv);
-	if (shared || !flist || r)
+	if (shared || r)
 		return r;
 
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	fshared = dma_resv_fences_deref(resv, &resv->shared);
+	dma_fence_array_for_each(f, cursor, fshared) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f78f52cc2e6d..6e09ceb43f2d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -453,22 +453,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
-	struct dma_resv_list *fobj;
 	struct dma_fence *fence;
-	int i;
 
-	fobj = dma_resv_get_list(&bo->base._resv);
 	fence = dma_resv_get_excl(&bo->base._resv);
 	if (fence && !fence->ops->signaled)
 		dma_fence_enable_sw_signaling(fence);
 
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-					dma_resv_held(bo->base.resv));
-
-		if (!fence->ops->signaled)
-			dma_fence_enable_sw_signaling(fence);
-	}
+	fence = dma_resv_fences_deref(&bo->base._resv, &bo->base._resv.shared);
+	if (fence && !fence->ops->signaled)
+		dma_fence_enable_sw_signaling(fence);
 }
 
 static void ttm_bo_cleanup_refs_or_queue(struct ttm_buffer_object *bo)
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c70f13fa6789..040e3f04a8ad 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -72,32 +72,19 @@ void dma_resv_fences_add(struct dma_resv_fences *fences,
 void dma_resv_fences_commit(struct dma_resv *obj,
 			    struct dma_resv_fences *fences);
 
-/**
- * struct dma_resv_list - a list of shared fences
- * @rcu: for internal use
- * @shared_count: table of shared fences
- * @shared_max: for growing shared fence table
- * @shared: shared fence table
- */
-struct dma_resv_list {
-	struct rcu_head rcu;
-	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
-};
-
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
  * @lock: update side lock
  * @seq: sequence count for managing RCU read-side synchronization
  * @fence_excl: the exclusive fence, if there is one currently
- * @fence: list of current shared fences
+ * @shared: array of read operations for implicit sync
  */
 struct dma_resv {
 	struct ww_mutex lock;
 	seqcount_t seq;
 
 	struct dma_fence __rcu *fence_excl;
-	struct dma_resv_list __rcu *fence;
+	struct dma_resv_fences	shared;
 };
 
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
@@ -129,20 +116,6 @@ dma_resv_fences_get_rcu(struct dma_resv_fences *fences)
 	return dma_fence_get_rcu_safe(&fences->fence);
 }
 
-/**
- * dma_resv_get_list - get the reservation object's
- * shared fence list, with update-side lock held
- * @obj: the reservation object
- *
- * Returns the shared fence list.  Does NOT take references to
- * the fence.  The obj->lock must be held.
- */
-static inline struct dma_resv_list *dma_resv_get_list(struct dma_resv *obj)
-{
-	return rcu_dereference_protected(obj->fence,
-					 dma_resv_held(obj));
-}
-
 /**
  * dma_resv_lock - lock the reservation object
  * @obj: the reservation object
@@ -266,14 +239,7 @@ static inline struct ww_acquire_ctx *dma_resv_locking_ctx(struct dma_resv *obj)
  */
 static inline void dma_resv_unlock(struct dma_resv *obj)
 {
-#ifdef CONFIG_DEBUG_MUTEXES
-	/* Test shared fence slot reservation */
-	if (rcu_access_pointer(obj->fence)) {
-		struct dma_resv_list *fence = dma_resv_get_list(obj);
-
-		fence->shared_max = fence->shared_count;
-	}
-#endif
+	dma_resv_fences_commit(obj, &obj->shared);
 	ww_mutex_unlock(&obj->lock);
 }
 
-- 
2.17.1

