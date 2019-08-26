Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C698D9D219
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732767AbfHZO5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36049 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732765AbfHZO5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so16186220wme.1
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SElhppA69wDnCPCmKnv/cac9uYMqmLDib2ZQGXrzALk=;
        b=ExQ5VZwTyjOf0sWUI9rDSujBvMTmTLUQ5vLZ2pBM3awqFEFUY2C2Gu66O8WbmuUT65
         NnT+xAqJOr7FCxAHZGkarXvx4Smlh0b7A2Y9PEcaLbzTWqBuVNw74EtyJsvJqbyMSWVq
         JULGvrwUheiRfawk+qzcFzqqdrbJUg4BJMTK+JwGfN6EwkANw81v4lvHbMoAOhkYoAwZ
         YasvcxXhCJEcM23owsidH9DD/hoF2PlSDO+IbEOCx4yz4OhvO9c0AQZgMo953vRQpPyL
         2GcpZHVj/qsoT2nb79Ph1P5ntO5yboCFnJiZ3D3q/ZN0/eFwWymq835BpR/HynMY8LZV
         Pbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SElhppA69wDnCPCmKnv/cac9uYMqmLDib2ZQGXrzALk=;
        b=NjahywAfY0W0fAaR8EX9RAydZXKhSEdVeu5R3lSYg8jxs5fp1+9tORY1aHU7p40QaU
         Ix+BJgTrs3q6JV0P/SqAfOEyW5aZ0T5vJ7YT3bWiYahL9TOzNiYV02sNLx2EWyzCbEK3
         TzYipsFvzuLHtCjGUz2XV3jeRMD1Fe5jMgKTFg7laGcDo6cyEKDRmAKKGO3gXT+ed+x2
         2igCl75eFj3G9Jgod3MRPhGoK7gTiFwo90LF/4WcQEisSrw/IeV0JwJM50T/FWyYu0/6
         TdVvAghQzPJPB7SnSAz3m5UgItr0E64EaR2geth3tRYqxDiZkKva5EbD0Jq71QKZ/Mz0
         W+pw==
X-Gm-Message-State: APjAAAWPS92UKX1X/iO6XIGgqehlKan/Zk0+jD+pBVoT+K+zoJXX0N0x
        js8o4O7YMiy1YG+Vao7f1b0=
X-Google-Smtp-Source: APXvYqxny+I1a9v/+X4Rng8uxT4VSTINE1OPTc5thRg4Zw86p9aZ7NthUOXGVnCV3n7A2R8R8gC7AA==
X-Received: by 2002:a1c:f103:: with SMTP id p3mr21370246wmh.18.1566831460608;
        Mon, 26 Aug 2019 07:57:40 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:40 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] dma-buf/resv: drop the sequence count
Date:   Mon, 26 Aug 2019 16:57:31 +0200
Message-Id: <20190826145731.1725-10-christian.koenig@amd.com>
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

We can now grab a reference to all the fences in question,
no need for the sequence counter any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c               | 22 ++--------------------
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 13 ++++---------
 include/linux/dma-resv.h                 |  3 ---
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 7fa0e86b4e75..51067edff930 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -50,12 +50,6 @@
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
@@ -244,8 +238,6 @@ void dma_resv_init(struct dma_resv *obj)
 {
 	ww_mutex_init(&obj->lock, &reservation_ww_class);
 
-	__seqcount_init(&obj->seq, reservation_seqcount_string,
-			&reservation_seqcount_class);
 	RCU_INIT_POINTER(obj->fence_excl, NULL);
 	dma_resv_fences_init(&obj->shared);
 }
@@ -321,13 +313,8 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_fence_get(fence);
 
-	preempt_disable();
-	write_seqcount_begin(&obj->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(obj->fence_excl, fence);
+	rcu_assign_pointer(obj->fence_excl, fence);
 	dma_resv_fences_set(obj, &obj->shared, NULL);
-	write_seqcount_end(&obj->seq);
-	preempt_enable();
 
 	dma_fence_put(old_fence);
 }
@@ -377,13 +364,8 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 
 	old = dma_resv_get_excl(dst);
 
-	preempt_disable();
-	write_seqcount_begin(&dst->seq);
-	/* write_seqcount_begin provides the necessary memory barrier */
-	RCU_INIT_POINTER(dst->fence_excl, excl);
+	rcu_assign_pointer(dst->fence_excl, excl);
 	dma_resv_fences_set(dst, &dst->shared, shared);
-	write_seqcount_end(&dst->seq);
-	preempt_enable();
 
 	dma_fence_put(old);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 0ef338a8cd9f..34256fff1f90 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -86,7 +86,6 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	struct dma_fence_array_cursor cursor;
 	struct dma_fence *fence, *shared;
 	struct drm_i915_gem_object *obj;
-	unsigned int seq;
 	int err;
 
 	err = -ENOENT;
@@ -112,22 +111,18 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
+	shared = dma_resv_fences_get_rcu(&obj->base.resv->shared);
+	fence = dma_fence_get_rcu_safe(&obj->base.resv->fence_excl);
 
 	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy =
-		busy_check_writer(rcu_dereference(obj->base.resv->fence_excl));
+	args->busy = busy_check_writer(fence);
+	dma_fence_put(fence);
 
 	/* Translate shared fences to READ set of engines */
-	shared = dma_resv_fences_get_rcu(&obj->base.resv->shared);
 	dma_fence_array_for_each(fence, cursor, shared)
 		args->busy |= busy_check_reader(fence);
 	dma_fence_put(shared);
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 040e3f04a8ad..44f975d772e8 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -48,8 +48,6 @@
 struct dma_resv;
 
 extern struct ww_class reservation_ww_class;
-extern struct lock_class_key reservation_seqcount_class;
-extern const char reservation_seqcount_string[];
 
 /**
  * struct dma_resv_fences - fences inside a reservation object
@@ -81,7 +79,6 @@ void dma_resv_fences_commit(struct dma_resv *obj,
  */
 struct dma_resv {
 	struct ww_mutex lock;
-	seqcount_t seq;
 
 	struct dma_fence __rcu *fence_excl;
 	struct dma_resv_fences	shared;
-- 
2.17.1

