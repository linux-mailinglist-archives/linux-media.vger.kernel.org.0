Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107A58209F
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbfHEPqC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:46:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41816 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726847AbfHEPqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:46:02 -0400
Received: by mail-wr1-f68.google.com with SMTP id c2so81679492wrm.8
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XU22kvabM0UAeUTon64K6xj93zNYGy477hyrLlnkqqs=;
        b=tEGanAP7V+39A/ck+Ix+YYs2iIz2rRrLG3XU2C8x50EPhssYveTxIH5YLXv1iO8NLP
         Lz439rOUOqi8fXqe4wfoWU2uGi9eXaUfCcF2bVNF3EATqzeUy6KBWm6gt78IINvpszPt
         qyztvbL0349xAwgCDsqhK8Ixv51qLMO7qDYQBNWVCQAvUxWW2iba0f/Zu/xMMyXl8sRn
         BBrYi5gfunSpGZ8dBDo2QlyRO/sBtG31jV9VvfbYOhAAq0m7eb6a9LzjtQvXwudBmNT+
         voSa/3e+xAeaoMeVdUEotFwLUZnZj+Lgt+n1BoOEt3B44baXnBKBbSlhu/kjU1nK2CMJ
         ktew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XU22kvabM0UAeUTon64K6xj93zNYGy477hyrLlnkqqs=;
        b=X+0kPhCTAQrgnOeT/CJj1UVhBvjWRv5R/LOaqAv1Gk6KAu/evkegED8xUNikFp25hE
         /CMlwvB81GQkp+xRV84wibyjy9D2iSFSG2sR7i7xXNRpZGPzybo/Ob5CvfM8BvpI37pt
         TVqFMgIkomrN+OWYCZMv6QxjyNNIpZajjHYn3oCOmL/LTIzh05ym3Y2tNxCi2SqstApH
         lyvGhOUBUhre0A8vcr5gVgtNN+I65JYrufE1zHSuqGSbkMjKX4QONYzIlLdScbv8DXFM
         5v3XxT/3P0lXvglvtMHGBYk8/VdJMMJIcWojqfpeHYSbrecveg15b/4GmelvQQQYM9PS
         iCcg==
X-Gm-Message-State: APjAAAV89fjxzj1bvkfMUGlXwqoXiB3Vt7FHyB016TL2aifcJlYdHCVG
        /Jqn1nPfiSUbLxV+IwBSMCA=
X-Google-Smtp-Source: APXvYqzHdYFy9XMLdFXHPaQajeeRSYmmHeXb+ImtY7dbzuQuBVRElYCX9hzmLr8fW66jkiqAFEWqKA==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr18757753wrn.142.1565019959731;
        Mon, 05 Aug 2019 08:45:59 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
        by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:45:59 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk
Subject: [PATCH 5/5] dma-buf: nuke reservation_object seq number
Date:   Mon,  5 Aug 2019 17:45:54 +0200
Message-Id: <20190805154554.3476-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only remaining use for this is to protect against setting a new exclusive
fence while we grab both exclusive and shared. That can also be archived by
looking if the exclusive fence has changed or not after completing the
operation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                     | 14 ++---
 drivers/dma-buf/reservation.c                 | 58 +++++++------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  8 +--
 drivers/gpu/drm/i915/gem/i915_gem_busy.c      | 11 ++--
 include/linux/reservation.h                   |  3 -
 5 files changed, 33 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f45bfb29ef96..c4ee4ccbfc40 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -199,7 +199,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	struct reservation_object_list *fobj;
 	struct dma_fence *fence_excl;
 	__poll_t events;
-	unsigned shared_count, seq;
+	unsigned shared_count;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -214,16 +214,16 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		return 0;
 
 retry:
-	seq = read_seqcount_begin(&resv->seq);
 	rcu_read_lock();
 
+	fence_excl = rcu_dereference(resv->fence_excl);
 	fobj = rcu_dereference(resv->fence);
 	if (fobj)
 		shared_count = fobj->shared_count;
 	else
 		shared_count = 0;
-	fence_excl = rcu_dereference(resv->fence_excl);
-	if (read_seqcount_retry(&resv->seq, seq)) {
+
+	if (rcu_dereference(resv->fence_excl) != fence_excl) {
 		rcu_read_unlock();
 		goto retry;
 	}
@@ -1157,7 +1157,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 	struct reservation_object *robj;
 	struct reservation_object_list *fobj;
 	struct dma_fence *fence;
-	unsigned seq;
 	int count = 0, attach_count, shared_count, i;
 	size_t size = 0;
 
@@ -1189,12 +1188,11 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 
 		robj = buf_obj->resv;
 		while (true) {
-			seq = read_seqcount_begin(&robj->seq);
 			rcu_read_lock();
+			fence = rcu_dereference(robj->fence_excl);
 			fobj = rcu_dereference(robj->fence);
 			shared_count = fobj ? fobj->shared_count : 0;
-			fence = rcu_dereference(robj->fence_excl);
-			if (!read_seqcount_retry(&robj->seq, seq))
+			if (rcu_dereference(robj->fence_excl) != fence)
 				break;
 			rcu_read_unlock();
 		}
diff --git a/drivers/dma-buf/reservation.c b/drivers/dma-buf/reservation.c
index 69c826553c72..d8ed6235a3eb 100644
--- a/drivers/dma-buf/reservation.c
+++ b/drivers/dma-buf/reservation.c
@@ -49,12 +49,6 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
-struct lock_class_key reservation_seqcount_class;
-EXPORT_SYMBOL(reservation_seqcount_class);
-
-const char reservation_seqcount_string[] = "reservation_seqcount";
-EXPORT_SYMBOL(reservation_seqcount_string);
-
 /**
  * reservation_object_init - initialize a reservation object
  * @obj: the reservation object
@@ -62,9 +56,6 @@ EXPORT_SYMBOL(reservation_seqcount_string);
 void reservation_object_init(struct reservation_object *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
-
-	__seqcount_init(&obj->seq, reservation_seqcount_string,
-			&reservation_seqcount_class);
 	RCU_INIT_POINTER(obj->fence, NULL);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
 }
@@ -251,12 +242,10 @@ void reservation_object_add_excl_fence(struct reservation_object *obj,
 		dma_fence_get(fence);
 
 	preempt_disable();
-	write_seqcount_begin(&obj->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
+	/* pointer update must be visible before we modify the shared_count */
 	if (old)
-		old->shared_count = 0;
-	write_seqcount_end(&obj->seq);
+		smp_store_mb(old->shared_count, 0);
 	preempt_enable();
 
 	/* inplace update, no shared fences */
@@ -340,11 +329,8 @@ int reservation_object_copy_fences(struct reservation_object *dst,
 	old = reservation_object_get_excl(dst);
 
 	preempt_disable();
-	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(dst->fence_excl, new);
-	RCU_INIT_POINTER(dst->fence, dst_list);
-	write_seqcount_end(&dst->seq);
+	rcu_assign_pointer(dst->fence, dst_list);
 	preempt_enable();
 
 	if (src_list)
@@ -380,18 +366,14 @@ int reservation_object_get_fences_rcu(struct reservation_object *obj,
 
 	do {
 		struct reservation_object_list *fobj;
-		unsigned int i, seq;
+		unsigned int i;
 		size_t sz = 0;
 
 		shared_count = i = 0;
 
 		rcu_read_lock();
-		seq = read_seqcount_begin(&obj->seq);
-
-		fence_excl = rcu_dereference(obj->fence_excl);
-		if (fence_excl && !dma_fence_get_rcu(fence_excl))
-			goto unlock;
 
+		fence_excl = dma_fence_get_rcu_safe(&obj->fence_excl);
 		fobj = rcu_dereference(obj->fence);
 		if (fobj)
 			sz += sizeof(*shared) * fobj->shared_max;
@@ -428,7 +410,8 @@ int reservation_object_get_fences_rcu(struct reservation_object *obj,
 			}
 		}
 
-		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
+		if (i != shared_count ||
+		    rcu_dereference(obj->fence_excl) != fence_excl) {
 			while (i--)
 				dma_fence_put(shared[i]);
 			dma_fence_put(fence_excl);
@@ -472,18 +455,17 @@ long reservation_object_wait_timeout_rcu(struct reservation_object *obj,
 					 bool wait_all, bool intr,
 					 unsigned long timeout)
 {
-	struct dma_fence *fence;
-	unsigned seq, shared_count;
+	struct dma_fence *fence, *fence_excl;
 	long ret = timeout ? timeout : 1;
+	unsigned shared_count;
 	int i;
 
 retry:
 	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
 	i = -1;
 
-	fence = rcu_dereference(obj->fence_excl);
+	fence = fence_excl = rcu_dereference(obj->fence_excl);
 	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
 		if (!dma_fence_get_rcu(fence))
 			goto unlock_retry;
@@ -524,13 +506,13 @@ long reservation_object_wait_timeout_rcu(struct reservation_object *obj,
 		}
 	}
 
+	if (rcu_dereference(obj->fence_excl) != fence_excl) {
+		dma_fence_put(fence);
+		goto unlock_retry;
+	}
+
 	rcu_read_unlock();
 	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
-
 		ret = dma_fence_wait_timeout(fence, intr, ret);
 		dma_fence_put(fence);
 		if (ret > 0 && wait_all && (i + 1 < shared_count))
@@ -575,14 +557,15 @@ reservation_object_test_signaled_single(struct dma_fence *passed_fence)
 bool reservation_object_test_signaled_rcu(struct reservation_object *obj,
 					  bool test_all)
 {
-	unsigned seq, shared_count;
+	struct dma_fence *fence_excl;
+	unsigned shared_count;
 	int ret;
 
 	rcu_read_lock();
 retry:
+	fence_excl = rcu_dereference(obj->fence_excl);
 	ret = true;
 	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
 		unsigned i;
@@ -603,12 +586,11 @@ bool reservation_object_test_signaled_rcu(struct reservation_object *obj,
 				break;
 		}
 
-		if (read_seqcount_retry(&obj->seq, seq))
+		if (rcu_dereference(obj->fence_excl) != fence_excl)
 			goto retry;
 	}
 
 	if (!shared_count) {
-		struct dma_fence *fence_excl = rcu_dereference(obj->fence_excl);
 
 		if (fence_excl) {
 			ret = reservation_object_test_signaled_single(
@@ -616,7 +598,7 @@ bool reservation_object_test_signaled_rcu(struct reservation_object *obj,
 			if (ret < 0)
 				goto retry;
 
-			if (read_seqcount_retry(&obj->seq, seq))
+			if (rcu_dereference(obj->fence_excl) != fence_excl)
 				goto retry;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 1d3ee9c42f7e..a2a2ae592f20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -251,12 +251,8 @@ static int amdgpu_amdkfd_remove_eviction_fence(struct amdgpu_bo *bo,
 	new->shared_max = old->shared_max;
 	new->shared_count = k;
 
-	/* Install the new fence list, seqcount provides the barriers */
-	preempt_disable();
-	write_seqcount_begin(&resv->seq);
-	RCU_INIT_POINTER(resv->fence, new);
-	write_seqcount_end(&resv->seq);
-	preempt_enable();
+	/* Install the new fence list */
+	rcu_assign_pointer(resv->fence, new);
 
 	/* Drop the references to the removed fences or move them to ef_list */
 	for (i = j, k = 0; i < old->shared_count; ++i) {
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6ad93a09968c..6e8a6e4f39ff 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -83,7 +83,7 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
 	struct reservation_object_list *list;
-	unsigned int seq;
+	struct dma_fence *fence_excl;
 	int err;
 
 	err = -ENOENT;
@@ -110,11 +110,9 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 *
 	 */
 retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
 	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy =
-		busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
+	fence_excl = rcu_dereference(obj->base.resv->fence_excl);
+	args->busy = busy_check_writer(fence_excl);
 
 	/* Translate shared fences to READ set of engines */
 	list = rcu_dereference(obj->base.resv->fence);
@@ -129,7 +127,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
+	if (args->busy &&
+	    rcu_dereference(obj->base.resv->fence_excl) != fence_excl)
 		goto retry;
 
 	err = 0;
diff --git a/include/linux/reservation.h b/include/linux/reservation.h
index 56b782fec49b..2b0b2a1aeae2 100644
--- a/include/linux/reservation.h
+++ b/include/linux/reservation.h
@@ -46,8 +46,6 @@
 #include <linux/rcupdate.h>
 
 extern struct ww_class reservation_ww_class;
-extern struct lock_class_key reservation_seqcount_class;
-extern const char reservation_seqcount_string[];
 
 /**
  * struct reservation_object_list - a list of shared fences
@@ -71,7 +69,6 @@ struct reservation_object_list {
  */
 struct reservation_object {
 	struct ww_mutex lock;
-	seqcount_t seq;
 
 	struct dma_fence __rcu *fence_excl;
 	struct reservation_object_list __rcu *fence;
-- 
2.17.1

