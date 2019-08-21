Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B8E9796F
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbfHUMcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:32:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38868 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfHUMcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:32:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so1868103wrr.5
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N0zzGM8v41eOHCbSQA8yKPg6o6HCQG8GTTvuJGvyuNA=;
        b=Is2rjH57MI4MTGXhmRnV7kfPnbgvir3xwEDz6Fk+zcA5fc11pdP7ju+1E7Mp5H4z7W
         2jplSUT8ZERwkPJjUtuxXVFCkWgS88pvo3B0qBLn+3rB5qJ5oMP8GKQC2aWAgkOvaCGD
         xGklYntaeINd7UtgoOC1NUtxqSommc+INoHXNgKqv+ORPea9mIT29+TjTiU5RgqrTkzg
         JNiFkzlKarTEyP8huyVBM7q+/7TCCn3sEKHQOwt8fzfh6wBhBPDf49NHpucOTR2GnWVs
         0xP7JM042E83Wqhnmrb23KtpZCEks1l+8n19235sKX2k8h913X1n8gP01yNA8IqLx0Mo
         j7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0zzGM8v41eOHCbSQA8yKPg6o6HCQG8GTTvuJGvyuNA=;
        b=Ojfus0Nyt7NCWfqyrbfaQAO6UWiEbLYbp8iPkHc4mHKfkKmOd4SJtxduSYJCQiVD9j
         4n6G3JjtQ+Gnjlm6U4lLXCzkqcy+aXBqRTjzNwDgY18Uzhgc8UEipoZRpH5iKk9wY6pX
         WsgTzh+AjP3ERpSlL+llev9E2I8XcufIqifQLvBTiBNDNalfVj/gVhD99AWjrupqMtC7
         pZmxiElYf7umBKqIgHqZQbh6sbVNYUAk/ff926E2UTp0nX5QM2L4CN+2JwyYVYRK12dN
         wsH8HpjImtbPLjmRJwGGkrxRuDFX5U9HLvhyanlNyNMGxWTG2vWgtAwpctQhtCx1Dtow
         dYLg==
X-Gm-Message-State: APjAAAUbWzUVqVHJAF4r3pSb0fnDVGC+O7OMvVqbthp+M3kmfpAwpcsq
        0Dul+/a46KJ/45nnhgGX58s=
X-Google-Smtp-Source: APXvYqzmkCAwGIBNgpbuCvJkvFytPCJ2vvIyrxQD7icPKfBoLCfVC45NP410xThlSUQgiRtiTBsEXg==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr39569519wrn.54.1566390717935;
        Wed, 21 Aug 2019 05:31:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:56 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/10] dma-buf/resv: replace shared fence with new fences container
Date:   Wed, 21 Aug 2019 14:31:45 +0200
Message-Id: <20190821123147.110736-9-christian.koenig@amd.com>
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

Replace the old shared fences with the new readers container
and change all callers accordingly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                     |  99 +---
 drivers/dma-buf/dma-resv.c                    | 524 +++---------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  58 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  37 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      |  17 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  19 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  18 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      |  20 +-
 drivers/gpu/drm/i915/i915_gem_batch_pool.c    |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |   4 +-
 drivers/gpu/drm/lima/lima_gem.c               |   4 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  14 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |  19 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             |  11 +-
 drivers/gpu/drm/qxl/qxl_release.c             |   5 +-
 drivers/gpu/drm/radeon/radeon_object.c        |   2 +-
 drivers/gpu/drm/radeon/radeon_sync.c          |  14 +-
 drivers/gpu/drm/radeon/radeon_vm.c            |   3 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  22 +-
 drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  12 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |   4 +-
 drivers/gpu/drm/vgem/vgem_fence.c             |   4 +-
 include/linux/dma-resv.h                      |  42 +-
 28 files changed, 224 insertions(+), 747 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 433d91d710e4..220cfa9ca82b 100644
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
+	struct dma_fence *fence_excl, *readers;
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
+	readers = dma_resv_fences_get_rcu(&resv->readers);
 
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
+	if (fence_excl && (!(events & EPOLLOUT) || !readers)) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
 		__poll_t pevents = EPOLLIN;
 
-		if (shared_count == 0)
+		if (!readers)
 			pevents |= EPOLLOUT;
 
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -244,12 +232,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
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
 				dma_fence_put(fence_excl);
 			} else {
@@ -263,9 +247,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		}
 	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
+	if ((events & EPOLLOUT) && readers) {
 		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
 
 		/* Only queue a new callback if no event has fired yet */
 		spin_lock_irq(&dmabuf->poll.lock);
@@ -278,32 +261,15 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
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
+		if (!dma_fence_add_callback(readers, &dcb->cb,
+					    dma_buf_poll_cb)) {
+			dma_fence_put(readers);
+			events &= ~EPOLLOUT;
+		} else {
+			/* No callback queued, wake up any additional waiters. */
+			dma_fence_put(readers);
 			dma_buf_poll_cb(NULL, &dcb->cb);
+		}
 	}
 
 out:
@@ -1154,11 +1120,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	int ret;
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
+	struct dma_fence_array_cursor cursor;
 	struct dma_resv *robj;
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
-	unsigned seq;
-	int count = 0, attach_count, shared_count, i;
+	struct dma_fence *fence, *readers;
+	int count = 0, attach_count;
 	size_t size = 0;
 
 	ret = mutex_lock_interruptible(&db_list.lock);
@@ -1188,32 +1153,20 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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
+		readers = dma_resv_fences_get_rcu(&robj->readers);
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
+		dma_fence_array_for_each(fence, cursor, readers)
+			seq_printf(s, "\tReaders fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-			dma_fence_put(fence);
-		}
+		dma_fence_put(readers);
 		rcu_read_unlock();
 
 		seq_puts(s, "\tAttached Devices:\n");
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 83033b3e8521..8723af0a7a4d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -39,12 +39,11 @@
 /**
  * DOC: Reservation Object Overview
  *
- * The reservation object provides a mechanism to manage shared and
+ * The reservation object provides a mechanism to manage readers and
  * exclusive fences associated with a buffer.  A reservation object
  * can have attached one exclusive fence (normally associated with
- * write operations) or N shared fences (read operations).  The RCU
- * mechanism is used to protect read access to fences from locked
- * write-side updates.
+ * write operations) or N read fences.  The RCU mechanism is used to
+ * protect read access to fences from locked write-side updates.
  */
 
 DEFINE_WD_CLASS(reservation_ww_class);
@@ -235,17 +234,18 @@ void dma_resv_fences_add(struct dma_resv_fences *fences,
 	struct dma_fence *old;
 	unsigned int i;
 
-#ifndef CONFIG_DEBUG_MUTEXES
 	for (i = 0; i < staged->num_fences; ++i) {
 		old = staged->fences[i];
 
-		if (old->context == fence->context ||
-		    dma_fence_is_signaled(old)) {
+		if (old->context == fence->context
+#ifndef CONFIG_DEBUG_MUTEXES
+		    || dma_fence_is_signaled(old)
+#endif
+		    ) {
 			dma_fence_put(old);
 			goto replace;
 		}
 	}
-#endif
 
 	BUG_ON(staged->num_fences >= dma_fence_array_max_fences(staged));
 	i = staged->num_fences++;
@@ -276,46 +276,6 @@ void dma_resv_fences_commit(struct dma_resv *obj,
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
@@ -326,8 +286,8 @@ void dma_resv_init(struct dma_resv *obj)
 
 	__seqcount_init(&obj->seq, reservation_seqcount_string,
 			&reservation_seqcount_class);
-	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
+	dma_resv_fences_init(&obj->readers);
 }
 EXPORT_SYMBOL(dma_resv_init);
 
@@ -337,151 +297,16 @@ EXPORT_SYMBOL(dma_resv_init);
  */
 void dma_resv_fini(struct dma_resv *obj)
 {
-	struct dma_resv_list *fobj;
-	struct dma_fence *excl;
-
 	/*
 	 * This object should be dead and all references must have
 	 * been released to it, so no need to be protected with rcu.
 	 */
-	excl = rcu_dereference_protected(obj->fence_excl, 1);
-	if (excl)
-		dma_fence_put(excl);
-
-	fobj = rcu_dereference_protected(obj->fence, 1);
-	dma_resv_list_free(fobj);
+	dma_fence_put(rcu_dereference_protected(obj->fence_excl, true));
+	dma_resv_fences_fini(&obj->readers);
 	ww_mutex_destroy(&obj->lock);
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
-/**
- * dma_resv_reserve_shared - Reserve space to add shared fences to
- * a dma_resv.
- * @obj: reservation object
- * @num_fences: number of fences we want to add
- *
- * Should be called before dma_resv_add_shared_fence().  Must
- * be called with obj->lock held.
- *
- * RETURNS
- * Zero for success, or -errno
- */
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences)
-{
-	struct dma_resv_list *old, *new;
-	unsigned int i, j, k, max;
-
-	dma_resv_assert_held(obj);
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
-}
-EXPORT_SYMBOL(dma_resv_reserve_shared);
-
-/**
- * dma_resv_add_shared_fence - Add a fence to a shared slot
- * @obj: the reservation object
- * @fence: the shared fence to add
- *
- * Add a fence to a shared slot, obj->lock must be held, and
- * dma_resv_reserve_shared() has been called.
- */
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
-{
-	struct dma_resv_list *fobj;
-	struct dma_fence *old;
-	unsigned int i, count;
-
-	dma_fence_get(fence);
-
-	dma_resv_assert_held(obj);
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
-}
-EXPORT_SYMBOL(dma_resv_add_shared_fence);
-
 /**
  * dma_resv_add_excl_fence - Add an exclusive fence.
  * @obj: the reservation object
@@ -501,6 +326,7 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
+	dma_resv_fences_set(obj, &obj->readers, fence);
 	write_seqcount_end(&obj->seq);
 	preempt_enable();
 
@@ -516,9 +342,7 @@ EXPORT_SYMBOL(dma_resv_add_excl_fence);
  */
 void dma_resv_prune_fences(struct dma_resv *obj)
 {
-	struct dma_resv_list *list;
 	struct dma_fence *fence;
-	unsigned int i;
 
 	dma_resv_assert_held(obj);
 
@@ -528,20 +352,9 @@ void dma_resv_prune_fences(struct dma_resv *obj)
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
+	fence = dma_resv_fences_deref(obj, &obj->readers);
+	if (dma_fence_is_signaled(fence))
+		dma_resv_fences_set(obj, &obj->readers, NULL);
 }
 EXPORT_SYMBOL(dma_resv_prune_fences);
 
@@ -554,73 +367,25 @@ EXPORT_SYMBOL(dma_resv_prune_fences);
 */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_resv_list *src_list, *dst_list;
-	struct dma_fence *old, *new;
-	unsigned i;
+	struct dma_fence *old, *excl, *readers;
 
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
+	readers = dma_resv_fences_get_rcu(&src->readers);
 	rcu_read_unlock();
 
-	src_list = dma_resv_get_list(dst);
 	old = dma_resv_get_excl(dst);
 
 	preempt_disable();
 	write_seqcount_begin(&dst->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
+	RCU_INIT_POINTER(dst->fence_excl, excl);
+	dma_resv_fences_set(dst, &dst->readers, readers);
 	write_seqcount_end(&dst->seq);
 	preempt_enable();
 
-	dma_resv_list_free(src_list);
 	dma_fence_put(old);
 
 	return 0;
@@ -628,7 +393,7 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 EXPORT_SYMBOL(dma_resv_copy_fences);
 
 /**
- * dma_resv_get_fences_rcu - Get an object's shared and exclusive
+ * dma_resv_get_fences_rcu - Get an object's readers and exclusive
  * fences without update side lock held
  * @obj: the reservation object
  * @pfence_excl: the returned exclusive fence (or NULL)
@@ -645,92 +410,51 @@ int dma_resv_get_fences_rcu(struct dma_resv *obj,
 			    unsigned *pshared_count,
 			    struct dma_fence ***pshared)
 {
-	struct dma_fence **shared = NULL;
-	struct dma_fence *fence_excl;
+	struct dma_fence *excl, *readers;
+	struct dma_fence **shared;
 	unsigned int shared_count;
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
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
-			while (i--)
-				dma_fence_put(shared[i]);
-			dma_fence_put(fence_excl);
-			goto unlock;
-		}
+	rcu_read_lock();
+	excl = dma_fence_get_rcu_safe(&obj->fence_excl);
+	readers = dma_resv_fences_get_rcu(&obj->readers);
+	rcu_read_unlock();
 
-		ret = 0;
-unlock:
-		rcu_read_unlock();
-	} while (ret);
+	shared_count = readers ? 1 : 0;
+	if (excl && !pfence_excl)
+		++shared_count;
 
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-	else if (fence_excl)
-		shared[++shared_count] = fence_excl;
+	if (shared_count) {
+		shared = kmalloc_array(shared_count, sizeof(*shared),
+				       GFP_KERNEL);
+		if (!shared) {
+			dma_fence_put(excl);
+			dma_fence_put(readers);
+			return -ENOMEM;
+		}
 
-	if (!shared_count) {
-		kfree(shared);
-		shared = NULL;
+		shared_count = 0;
+		if (readers)
+			shared[shared_count++] = readers;
+		if (excl && !pfence_excl)
+			shared[shared_count++] = excl;
+
+		*pshared = shared;
+		*pshared_count = shared_count;
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
 
 /**
  * dma_resv_wait_timeout_rcu - Wait on reservation's objects
- * shared and/or exclusive fences.
+ * readers and/or exclusive fences.
  * @obj: the reservation object
  * @wait_all: if true, wait on all fences, else wait on just exclusive fence
  * @intr: if true, do interruptible wait
@@ -744,93 +468,29 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			       bool wait_all, bool intr,
 			       unsigned long timeout)
 {
-	struct dma_fence *fence;
-	unsigned seq, shared_count;
+	struct dma_fence *excl, *readers;
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
+	readers = dma_resv_fences_get_rcu(&obj->readers);
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
+	if (wait_all && readers) {
+		ret = dma_fence_wait_timeout(readers, intr, ret);
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
+	dma_fence_put(readers);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
 
 /**
  * dma_resv_test_signaled_rcu - Test if a reservation object's
@@ -844,51 +504,23 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	unsigned seq, shared_count;
-	int ret;
+	struct dma_fence *excl, *readers;
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
+	readers = dma_resv_fences_get_rcu(&obj->readers);
+	rcu_read_unlock();
 
-	if (!shared_count) {
-		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
+	if (excl)
+		ret = dma_fence_is_signaled(excl);
 
-		if (fence_excl) {
-			ret = dma_resv_test_signaled_single(fence_excl);
-			if (ret < 0)
-				goto retry;
+	if (test_all && readers)
+		ret &= dma_fence_is_signaled(readers);
 
-			if (read_seqcount_retry(&obj->seq, seq))
-				goto retry;
-		}
-	}
+	dma_fence_put(excl);
+	dma_fence_put(readers);
 
-	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled_rcu);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 76e3516484e7..ec4f29934b09 100644
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
+	r = dma_resv_fences_reserve(resv, &resv->readers, 0);
+	if (r)
+		return r;
 
-	/* Go through all the shared fences in the resevation object and sort
-	 * the interesting ones to the end of the list.
-	 */
-	for (i = 0, j = old->shared_count, k = 0; i < old->shared_count; ++i) {
+	for (i = 0; i < resv->readers.staged->num_fences; ++i) {
 		struct dma_fence *f;
 
-		f = rcu_dereference_protected(old->shared[i],
-					      dma_resv_held(resv));
-
-		if (f->context == ef->base.context)
-			RCU_INIT_POINTER(new->shared[--j], f);
-		else
-			RCU_INIT_POINTER(new->shared[k++], f);
+		f = resv->readers.staged->fences[i];
+		if (f->context == ef->base.context) {
+			resv->readers.staged->fences[i] = dma_fence_get_stub();
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
+	dma_resv_fences_commit(resv, &resv->readers);
 
 	return 0;
 }
@@ -840,6 +814,7 @@ static int process_update_pds(struct amdkfd_process_info *process_info,
 static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		       struct dma_fence **ef)
 {
+	struct dma_resv *resv = vm->root.base.bo->tbo.base.resv;
 	struct amdkfd_process_info *info = NULL;
 	int ret;
 
@@ -887,7 +862,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 				  AMDGPU_FENCE_OWNER_KFD, false);
 	if (ret)
 		goto wait_pd_fail;
-	ret = dma_resv_reserve_shared(vm->root.base.bo->tbo.base.resv, 1);
+	ret = dma_resv_fences_reserve(resv, &resv->readers, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(vm->root.base.bo,
@@ -2132,7 +2107,8 @@ int amdgpu_amdkfd_add_gws_to_process(void *info, void *gws, struct kgd_mem **mem
 	 * Add process eviction fence to bo so they can
 	 * evict each other.
 	 */
-	ret = dma_resv_reserve_shared(gws_bo->tbo.base.resv, 1);
+	ret = dma_resv_fences_reserve(gws_bo->tbo.base.resv,
+				      &gws_bo->tbo.base.resv->readers, 1);
 	if (ret)
 		goto reserve_shared_fail;
 	amdgpu_bo_fence(gws_bo, &process_info->eviction_fence->base, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index bf0f00508987..3e4685565f82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -139,43 +139,12 @@ int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
 static int
 __dma_resv_make_exclusive(struct dma_resv *obj)
 {
-	struct dma_fence **fences;
-	unsigned int count;
-	int r;
+	struct dma_fence *readers = dma_fence_get_rcu(obj->readers.fence);
 
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
+	dma_resv_add_excl_fence(obj, readers);
+	dma_fence_put(readers);
 
 	return 0;
-
-err_fences_put:
-	while (count--)
-		dma_fence_put(fences[count]);
-	kfree(fences);
-	return -ENOMEM;
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2f11ebd95528..a2dddd8d897c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1286,7 +1286,7 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 	struct dma_resv *resv = bo->tbo.base.resv;
 
 	if (shared)
-		dma_resv_add_shared_fence(resv, fence);
+		dma_resv_fences_add(&resv->readers, fence);
 	else
 		dma_resv_add_excl_fence(resv, fence);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 95e5e93edd18..f8bc5baf0a44 100644
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
+	array = dma_resv_fences_deref(resv, &resv->readers);
+	dma_fence_array_for_each(f, cursor, array) {
+
 		/* We only want to trigger KFD eviction fences on
 		 * evict or move jobs. Skip KFD fences otherwise.
 		 */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fb09314bcfd4..3c2efd14f945 100644
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
+	array = dma_resv_fences_deref(bo->base.resv, &bo->base.resv->readers);
+	dma_fence_array_for_each(f, cursor, array)
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 
 	switch (bo->mem.mem_type) {
 	case TTM_PL_TT:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f555843daef0..c269d4c169c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2724,7 +2724,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		goto error_free_root;
 
-	r = dma_resv_reserve_shared(root->tbo.base.resv, 1);
+	r = dma_resv_fences_reserve(root->tbo.base.resv,
+				    &root->tbo.base.resv->readers, 1);
 	if (r)
 		goto error_unreserve;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 7d83e04ec36e..15f36ccd6e53 100644
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
+	struct dma_fence *fence, *readers;
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
+	readers = dma_resv_fences_deref(robj, &robj->readers);
+	dma_fence_array_for_each(fence, cursor, readers)
+		etnaviv_gem_describe_fence(fence, "Shared", m);
 	fence = rcu_dereference(robj->fence_excl);
 	if (fence)
 		etnaviv_gem_describe_fence(fence, "Exclusive", m);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 998c96b40d8a..5faab8f0e67f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -168,7 +168,7 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		struct dma_resv *robj = bo->obj->base.resv;
 
 		if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
-			ret = dma_resv_reserve_shared(robj, 1);
+			ret = dma_resv_fences_reserve(robj, &robj->readers, 1);
 			if (ret)
 				return ret;
 		}
@@ -202,8 +202,8 @@ static void submit_attach_object_fences(struct etnaviv_gem_submit *submit)
 			dma_resv_add_excl_fence(obj->resv,
 							  submit->out_fence);
 		else
-			dma_resv_add_shared_fence(obj->resv,
-							    submit->out_fence);
+			dma_resv_fences_add(&obj->resv->readers,
+					    submit->out_fence);
 
 		submit_unlock_object(submit, i);
 	}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 3d4f5775a4ba..0f18ba97b228 100644
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
+	struct dma_fence *fence, *readers;
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
+	readers = dma_resv_fences_get_rcu(&obj->base.resv->readers);
+	dma_fence_array_for_each(fence, cursor, readers)
+		args->busy |= busy_check_reader(fence);
+	dma_fence_put(readers);
 
 	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
 		goto retry;
diff --git a/drivers/gpu/drm/i915/i915_gem_batch_pool.c b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
index 274cf5b19fc9..b0f760c070b0 100644
--- a/drivers/gpu/drm/i915/i915_gem_batch_pool.c
+++ b/drivers/gpu/drm/i915/i915_gem_batch_pool.c
@@ -112,7 +112,7 @@ i915_gem_batch_pool_get(struct i915_gem_batch_pool *pool,
 			 * trapping a reference to all the old fences, rather
 			 * than replace the existing fence.
 			 */
-			if (rcu_access_pointer(resv->fence)) {
+			if (rcu_access_pointer(resv->readers.fence)) {
 				dma_resv_lock(resv, NULL);
 				dma_resv_prune_fences(resv);
 				dma_resv_unlock(resv);
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index fcbe433a968c..267be92c4c7a 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -911,8 +911,8 @@ static void export_fence(struct i915_vma *vma,
 	 */
 	if (flags & EXEC_OBJECT_WRITE)
 		dma_resv_add_excl_fence(resv, &rq->fence);
-	else if (dma_resv_reserve_shared(resv, 1) == 0)
-		dma_resv_add_shared_fence(resv, &rq->fence);
+	else if (dma_resv_fences_reserve(resv, &resv->readers, 1) == 0)
+		dma_resv_fences_add(&resv->readers, &rq->fence);
 }
 
 int i915_vma_move_to_active(struct i915_vma *vma,
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index ff3d9acc24fc..1d5ef3d6d3e2 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -136,7 +136,7 @@ static int lima_gem_sync_bo(struct lima_sched_task *task, struct lima_bo *bo,
 	int err = 0;
 
 	if (!write) {
-		err = dma_resv_reserve_shared(bo->gem.resv, 1);
+		err = dma_resv_fences_reserve(&bo->gem.resv->readers, 1);
 		if (err)
 			return err;
 	}
@@ -298,7 +298,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		if (submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE)
 			dma_resv_add_excl_fence(bos[i]->gem.resv, fence);
 		else
-			dma_resv_add_shared_fence(bos[i]->gem.resv, fence);
+			dma_resv_fences_add(&bos[i]->gem.resv->readers, fence);
 	}
 
 	lima_gem_unlock_bos(bos, submit->nr_bos, &ctx);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 90e3dc3b927a..3d9a1d53c309 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -663,11 +663,10 @@ void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
 int msm_gem_sync_object(struct drm_gem_object *obj,
 		struct msm_fence_context *fctx, bool exclusive)
 {
-	struct dma_resv_list *fobj;
-	struct dma_fence *fence;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *fence, *readers;
 	int i, ret;
 
-	fobj = dma_resv_get_list(obj->resv);
 	fence = dma_resv_get_excl(obj->resv);
 	/* don't need to wait on our own fences, since ring is fifo */
 	if (fence && (fence->context != fctx->context)) {
@@ -676,12 +675,11 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 			return ret;
 	}
 
-	if (!exclusive || !fobj)
+	if (!exclusive)
 		return 0;
 
-	for (i = 0; i < fobj->shared_count; i++) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(obj->resv));
+	readers = dma_resv_fences_deref(obj->resv, &obj->res->readers);
+	dma_fence_array_for_each(fence, cursor, readers) {
 		if (fence->context != fctx->context) {
 			ret = dma_fence_wait(fence, true);
 			if (ret)
@@ -701,7 +699,7 @@ void msm_gem_move_to_active(struct drm_gem_object *obj,
 	if (exclusive)
 		dma_resv_add_excl_fence(obj->resv, fence);
 	else
-		dma_resv_add_shared_fence(obj->resv, fence);
+		dma_resv_fences_add(&obj->resv->readers, fence);
 	list_del_init(&msm_obj->mm_list);
 	list_add_tail(&msm_obj->mm_list, &gpu->active_list);
 }
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 2e1556b7af26..4d038d2004fb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -225,8 +225,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 			 * strange place to call it.  OTOH this is a
 			 * convenient can-fail point to hook it in.
 			 */
-			ret = dma_resv_reserve_shared(msm_obj->base.resv,
-								1);
+			ret = dma_resv_fences_reserve(&msm_obj->base.resv->readers,
+						      1);
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e0b1bbee936f..6b3fad03b342 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1660,7 +1660,7 @@ nouveau_bo_fence(struct nouveau_bo *nvbo, struct nouveau_fence *fence, bool excl
 	if (exclusive)
 		dma_resv_add_excl_fence(resv, &fence->base);
 	else if (fence)
-		dma_resv_add_shared_fence(resv, &fence->base);
+		dma_resv_fences_add(&resv->readers, &fence->base);
 }
 
 struct ttm_bo_driver nouveau_bo_driver = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 42ddddbb49e4..350cd2a9ea51 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -28,6 +28,7 @@
 
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
+#include <linux/dma-fence-array.h>
 #include <trace/events/dma_fence.h>
 
 #include <nvif/cl826e.h>
@@ -334,22 +335,20 @@ int
 nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
 	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct dma_fence_array_cursor cursor;
+	struct dma_fence *fence, *readers;
 	struct nouveau_fence *f;
-	int ret = 0, i;
+	int ret = 0;
 
 	if (!exclusive) {
-		ret = dma_resv_reserve_shared(resv, 1);
+		ret = dma_resv_fences_reserve(resv, &resv->readers, 1);
 
 		if (ret)
 			return ret;
 	}
 
-	fobj = dma_resv_get_list(resv);
 	fence = dma_resv_get_excl(resv);
-
 	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
@@ -369,16 +368,14 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		return ret;
 	}
 
-	if (!exclusive || !fobj)
+	if (!exclusive)
 		return ret;
 
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+	readers = dma_resv_fences_deref(resv, &resv->readers);
+	dma_fence_array_for_each(fence, cursor, readers) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index a4f4175bbdbe..89b91793a657 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -28,6 +28,8 @@
  *  Alon Levy <alevy@redhat.com>
  */
 
+#include <linux/dma-fence-array.h>
+
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
 
@@ -57,12 +59,15 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
+		struct dma_resv *resv = bo->tbo.base.resv;
+		struct dma_fence_array *array;
+		struct dma_fence *readers;
 		int rel;
 
 		rcu_read_lock();
-		fobj = rcu_dereference(bo->tbo.base.resv->fence);
-		rel = fobj ? fobj->shared_count : 0;
+		readers = dma_resv_fences_deref(resv, &resv->readers);
+		array = to_dma_fence_array(readers);
+		rel = array ? array->num_fences : readers ? 1 : 0;
 		rcu_read_unlock();
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 312216caeea2..b73cbbc60167 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -229,6 +229,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 static int qxl_release_validate_bo(struct qxl_bo *bo)
 {
 	struct ttm_operation_ctx ctx = { true, false };
+	struct dma_resv *resv = bo->tbo.base.resv;
 	int ret;
 
 	if (!bo->pin_count) {
@@ -238,7 +239,7 @@ static int qxl_release_validate_bo(struct qxl_bo *bo)
 			return ret;
 	}
 
-	ret = dma_resv_reserve_shared(bo->tbo.base.resv, 1);
+	ret = dma_resv_fences_reserve(resv, &resv->readers, 1);
 	if (ret)
 		return ret;
 
@@ -458,7 +459,7 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
 
-		dma_resv_add_shared_fence(bo->base.resv, &release->base);
+		dma_resv_fences_add(&bo->base.resv->readers, &release->base);
 		ttm_bo_add_to_lru(bo);
 		dma_resv_unlock(bo->base.resv);
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 2abe1eab471f..37abde91a79b 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -873,7 +873,7 @@ void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
 	struct dma_resv *resv = bo->tbo.base.resv;
 
 	if (shared)
-		dma_resv_add_shared_fence(resv, &fence->base);
+		dma_resv_fences_add(&resv->readers, &fence->base);
 	else
 		dma_resv_add_excl_fence(resv, &fence->base);
 }
diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 55cc77a73c7b..971dd6c01e60 100644
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
+	struct dma_fence *f, *readers;
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
+	readers = dma_resv_fences_deref(resv, &resv->readers);
+	dma_fence_array_for_each(f, cursor, readers) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index e0ad547786e8..c4c474e283bd 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -826,12 +826,13 @@ static int radeon_vm_update_ptes(struct radeon_device *rdev,
 	for (addr = start; addr < end; ) {
 		uint64_t pt_idx = addr >> radeon_vm_block_size;
 		struct radeon_bo *pt = vm->page_tables[pt_idx].bo;
+		struct dma_resv *resv = pt->tbo.base.resv;
 		unsigned nptes;
 		uint64_t pte;
 		int r;
 
 		radeon_sync_resv(rdev, &ib->sync, pt->tbo.base.resv, true);
-		r = dma_resv_reserve_shared(pt->tbo.base.resv, 1);
+		r = dma_resv_fences_reserve(resv, &resv->readers, 1);
 		if (r)
 			return r;
 
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f78f52cc2e6d..19eeefbbb65a 100644
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
+	fence = dma_resv_fences_deref(&bo->base._resv, &bo->base._resv.readers);
+	if (fence && !fence->ops->signaled)
+		dma_fence_enable_sw_signaling(fence);
 }
 
 static void ttm_bo_cleanup_refs_or_queue(struct ttm_buffer_object *bo)
@@ -932,9 +925,11 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	spin_unlock(&man->move_lock);
 
 	if (fence) {
-		dma_resv_add_shared_fence(bo->base.resv, fence);
+		struct dma_resv *resv = bo->base.resv;
+
+		dma_resv_fences_add(&resv->readers, fence);
 
-		ret = dma_resv_reserve_shared(bo->base.resv, 1);
+		ret = dma_resv_fences_reserve(resv, &resv->readers, 1);
 		if (unlikely(ret)) {
 			dma_fence_put(fence);
 			return ret;
@@ -1091,7 +1086,8 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 	bool type_found = false;
 	int i, ret;
 
-	ret = dma_resv_reserve_shared(bo->base.resv, 1);
+	ret = dma_resv_fences_reserve(bo->base.resv,
+				      &bo->base.resv->readers, 1);
 	if (unlikely(ret))
 		return ret;
 
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 131dae8f4170..b9a2778df67c 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -130,8 +130,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			if (!entry->num_shared)
 				continue;
 
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
+			ret = dma_resv_fences_reserve(bo->base.resv,
+						      &bo->base.resv->readers,
+						      entry->num_shared);
 			if (!ret)
 				continue;
 		}
@@ -153,8 +154,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 		}
 
 		if (!ret && entry->num_shared)
-			ret = dma_resv_reserve_shared(bo->base.resv,
-								entry->num_shared);
+			ret = dma_resv_fences_reserve(bo->base.resv,
+						      &bo->base.resv->readers,
+						      entry->num_shared);
 
 		if (unlikely(ret != 0)) {
 			if (ret == -EINTR)
@@ -201,7 +203,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 	list_for_each_entry(entry, list, head) {
 		bo = entry->bo;
 		if (entry->num_shared)
-			dma_resv_add_shared_fence(bo->base.resv, fence);
+			dma_resv_fences_add(&bo->base.resv->readers, fence);
 		else
 			dma_resv_add_excl_fence(bo->base.resv, fence);
 		if (list_empty(&bo->lru))
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 7a06cb6e31c5..253f832c29d5 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -543,7 +543,7 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
 		bo = to_vc4_bo(&exec->bo[i]->base);
 		bo->seqno = seqno;
 
-		dma_resv_add_shared_fence(bo->base.base.resv, exec->fence);
+		dma_resv_fences_add(&bo->base.base.resv->readers, exec->fence);
 	}
 
 	list_for_each_entry(bo, &exec->unref_list, unref_head) {
@@ -642,7 +642,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
 	for (i = 0; i < exec->bo_count; i++) {
 		bo = &exec->bo[i]->base;
 
-		ret = dma_resv_reserve_shared(bo->resv, 1);
+		ret = dma_resv_fences_reserve(&bo->resv->readers, 1);
 		if (ret) {
 			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
 			return ret;
diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 9268f6fc3f66..deeef3d4deba 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -162,8 +162,8 @@ int vgem_fence_attach_ioctl(struct drm_device *dev,
 	dma_resv_lock(resv, NULL);
 	if (arg->flags & VGEM_FENCE_WRITE)
 		dma_resv_add_excl_fence(resv, fence);
-	else if ((ret = dma_resv_reserve_shared(resv, 1)) == 0)
-		dma_resv_add_shared_fence(resv, fence);
+	else if ((ret = dma_resv_fences_reserve(resv, &resv->readers, 1)) == 0)
+		dma_resv_fences_add(&resv->readers, fence);
 	dma_resv_unlock(resv);
 
 	/* Record the fence in our idr for later signaling */
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c70f13fa6789..b23e16975f39 100644
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
+ * @readers: array of read operations for implicit sync
  */
 struct dma_resv {
 	struct ww_mutex lock;
 	seqcount_t seq;
 
 	struct dma_fence __rcu *fence_excl;
-	struct dma_resv_list __rcu *fence;
+	struct dma_resv_fences	readers;
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
+	dma_resv_fences_commit(obj, &obj->readers);
 	ww_mutex_unlock(&obj->lock);
 }
 
@@ -324,8 +290,6 @@ dma_resv_get_excl_rcu(struct dma_resv *obj)
 
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
-int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence);
 
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 void dma_resv_prune_fences(struct dma_resv *obj);
-- 
2.17.1

