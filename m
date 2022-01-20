Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A624B494EF4
	for <lists+linux-media@lfdr.de>; Thu, 20 Jan 2022 14:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbiATN17 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jan 2022 08:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235822AbiATN15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jan 2022 08:27:57 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1EEC061574
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:57 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j5-20020a05600c1c0500b0034d2e956aadso13683287wms.4
        for <linux-media@vger.kernel.org>; Thu, 20 Jan 2022 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MJIzfIJj7sWuWjvaqjpDxEclvLa+rSTBKh+L03ndIwY=;
        b=ekjPpJAozA6LxPPVdAKtYDk42hFPyFuhG5BfIUELwEybWx1WpK/qO675Vxxnjm9N1J
         FGzN7j+lwtYs9onFyzLMWgAdArffNeYKtaq6FnXANnnD+n6ozJ+uhxeXsMrzFn+mWLde
         65rgv6HORwE+xWXke2o0ifZ8DNHJnR1V1uhCvGUQR2iHvtDlOD0S7F/HXSPoYJ1ETDvo
         eu90RacJN/V9YNw6wjKKdNa8fOCnLcdZ38UicFER+5dKjC15DUaPltMh7pv9adMUzF8L
         eK4rq2XYHdFy+WuC1VUS9T9KfIJMqvejpKqDe6TXbf5x19DBECGXTccXqrAsV24pIil8
         MJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MJIzfIJj7sWuWjvaqjpDxEclvLa+rSTBKh+L03ndIwY=;
        b=SE6DxPd0BIEKCY80GrkhgM1W7yUiz/CEtGRPb5AIAetPkxdpzPzWkOLlAie7+utqL8
         9w2S7WZWw+M31U8m4uT24Mu4arIomHJ5lsNvX3nP0YqeCYfQko183iDz3wSV0HpE+8Xd
         hluB7456LVmG5cOWTeT9ZJA1F2g4cwPDdOgb9ufYhCh5f+t9LxiadWqzXgegE/9MyV9Y
         zwhvlu3x9FaxcgnExwDtGo6ID05VguZwjEY+cPOIkjHf1LnqhQWo88NjEWiaAMix3KIL
         8zAKZ8jacoRYV5bTbJtjytQ99uRuJsQOY7mov91a+iGF6PTW/nXF5Yl74rZH19aJ6EtH
         i5SQ==
X-Gm-Message-State: AOAM533JFE7zxRWP28MhaYY85u/dBRe4100NiD5mvDyxjmWutnA/xudl
        A2PnYcjxGBX2RNbCUUSlr/I=
X-Google-Smtp-Source: ABdhPJxe1yXhLFbTZqTl/1VYY+bHWZMwGg4IghMIwBsfK936MvpBoLcopcjIVyOB6uAhgdQrnk2HVg==
X-Received: by 2002:adf:e38b:: with SMTP id e11mr6122168wrm.691.1642685275872;
        Thu, 20 Jan 2022 05:27:55 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 05:27:55 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, gustavo@padovan.org,
        daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 8/9] drm/i915: use dma_fence extractor functions
Date:   Thu, 20 Jan 2022 14:27:46 +0100
Message-Id: <20220120132747.2348-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of manually messing with the data structures use the iterators
and extraction helpers provided by the framework.

This whole handling should essentially go away when boost handling is
implemented in the core dma-buf framework.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 40 ++++++--------------
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 31 ++++------------
 drivers/gpu/drm/i915/i915_request.c      | 47 +++++++-----------------
 3 files changed, 33 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 470fdfd61a0f..4ea7a5b26405 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -41,6 +41,8 @@ static __always_inline unsigned int
 __busy_set_if_active(struct dma_fence *fence, u32 (*flag)(u16 id))
 {
 	const struct i915_request *rq;
+	struct dma_fence *current_fence;
+	unsigned int i;
 
 	/*
 	 * We have to check the current hw status of the fence as the uABI
@@ -58,40 +60,22 @@ __busy_set_if_active(struct dma_fence *fence, u32 (*flag)(u16 id))
 	 *
 	 * 2. A single i915 request.
 	 */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-		struct dma_fence **child = array->fences;
-		unsigned int nchild = array->num_fences;
-
-		do {
-			struct dma_fence *current_fence = *child++;
-
-			/* Not an i915 fence, can't be busy per above */
-			if (!dma_fence_is_i915(current_fence) ||
-			    !test_bit(I915_FENCE_FLAG_COMPOSITE,
-				      &current_fence->flags)) {
-				return 0;
-			}
-
-			rq = to_request(current_fence);
-			if (!i915_request_completed(rq))
-				return flag(rq->engine->uabi_class);
-		} while (--nchild);
-
-		/* All requests in array complete, not busy */
-		return 0;
-	} else {
-		if (!dma_fence_is_i915(fence))
-			return 0;
+	dma_fence_array_for_each(current_fence, i, fence) {
 
-		rq = to_request(fence);
-		if (i915_request_completed(rq))
+		/* Not an i915 fence, can't be busy per above */
+		if (!dma_fence_is_i915(current_fence) ||
+		    !test_bit(I915_FENCE_FLAG_COMPOSITE, &current_fence->flags))
 			return 0;
 
+		rq = to_request(current_fence);
 		/* Beware type-expansion follies! */
 		BUILD_BUG_ON(!typecheck(u16, rq->engine->uabi_class));
-		return flag(rq->engine->uabi_class);
+		if (!i915_request_completed(rq))
+			return flag(rq->engine->uabi_class);
 	}
+
+	/* All requests in array complete, not busy */
+	return 0;
 }
 
 static __always_inline unsigned int
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index dab3d30c09a0..13f37b6aedf7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -72,11 +72,6 @@ static void fence_set_priority(struct dma_fence *fence,
 	rcu_read_unlock();
 }
 
-static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
-{
-	return fence->ops == &dma_fence_chain_ops;
-}
-
 void i915_gem_fence_wait_priority(struct dma_fence *fence,
 				  const struct i915_sched_attr *attr)
 {
@@ -85,25 +80,15 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
 
 	local_bh_disable();
 
-	/* Recurse once into a fence-array */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-		int i;
+	/* The chain is ordered; if we boost the last, we boost all */
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence *array, *element;
+		unsigned int i;
 
-		for (i = 0; i < array->num_fences; i++)
-			fence_set_priority(array->fences[i], attr);
-	} else if (__dma_fence_is_chain(fence)) {
-		struct dma_fence *iter;
-
-		/* The chain is ordered; if we boost the last, we boost all */
-		dma_fence_chain_for_each(iter, fence) {
-			fence_set_priority(to_dma_fence_chain(iter)->fence,
-					   attr);
-			break;
-		}
-		dma_fence_put(iter);
-	} else {
-		fence_set_priority(fence, attr);
+		/* Recurse once into a fence-array */
+		array = dma_fence_chain_contained(fence);
+		dma_fence_array_for_each(element, i, array)
+			fence_set_priority(element, attr);
 	}
 
 	local_bh_enable(); /* kick the tasklets if queues were reprioritised */
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ad175d662b4e..2d8add5b5da9 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1345,18 +1345,15 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	struct dma_fence *iter;
 	int err = 0;
 
-	if (!to_dma_fence_chain(fence))
-		return __i915_request_await_external(rq, fence);
-
 	dma_fence_chain_for_each(iter, fence) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(iter);
+		struct dma_fence *tmp = dma_fence_chain_contained(iter);
 
-		if (!dma_fence_is_i915(chain->fence)) {
+		if (!dma_fence_is_i915(tmp)) {
 			err = __i915_request_await_external(rq, iter);
 			break;
 		}
 
-		err = i915_request_await_dma_fence(rq, chain->fence);
+		err = i915_request_await_dma_fence(rq, tmp);
 		if (err < 0)
 			break;
 	}
@@ -1386,24 +1383,14 @@ static bool is_same_parallel_context(struct i915_request *to,
 
 int
 i915_request_await_execution(struct i915_request *rq,
-			     struct dma_fence *fence)
+			     struct dma_fence *array)
 {
-	struct dma_fence **child = &fence;
-	unsigned int nchild = 1;
+	struct dma_fence *fence;
+	unsigned int i;
 	int ret;
 
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-
-		/* XXX Error for signal-on-any fence arrays */
+	dma_fence_array_for_each(fence, i, array) {
 
-		child = array->fences;
-		nchild = array->num_fences;
-		GEM_BUG_ON(!nchild);
-	}
-
-	do {
-		fence = *child++;
 		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
 
@@ -1425,7 +1412,7 @@ i915_request_await_execution(struct i915_request *rq,
 		}
 		if (ret < 0)
 			return ret;
-	} while (--nchild);
+	}
 
 	return 0;
 }
@@ -1482,10 +1469,10 @@ i915_request_await_request(struct i915_request *to, struct i915_request *from)
 }
 
 int
-i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
+i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *array)
 {
-	struct dma_fence **child = &fence;
-	unsigned int nchild = 1;
+	struct dma_fence *fence;
+	unsigned int i;
 	int ret;
 
 	/*
@@ -1496,16 +1483,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 	 * amdgpu and we should not see any incoming fence-array from
 	 * sync-file being in signal-on-any mode.
 	 */
-	if (dma_fence_is_array(fence)) {
-		struct dma_fence_array *array = to_dma_fence_array(fence);
-
-		child = array->fences;
-		nchild = array->num_fences;
-		GEM_BUG_ON(!nchild);
-	}
+	dma_fence_array_for_each(fence, i, array) {
 
-	do {
-		fence = *child++;
 		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
 
@@ -1537,7 +1516,7 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 		if (fence->context)
 			intel_timeline_sync_set(i915_request_timeline(rq),
 						fence);
-	} while (--nchild);
+	}
 
 	return 0;
 }
-- 
2.25.1

