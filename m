Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9B541388B
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhIURi6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhIURiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:50 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B584FC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t7so8356217wrw.13
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=a9krJ2t/4rCoMhY2ba+hYXGDEbzVtrs8Qj2S/sJU/giM1RRFDlXUhGqEGGWqh3gxVC
         ywhbXfyTJq1kqLNWeE/8ovcJyT8m19gmoD8q9Rf7+7Yiohbd7ZuN7lcXjDJEqwzroWuk
         arTVuKVf9WrFjmxzWrQmBd4OPMYLYcma5qZvytiZDRhwx9qVgtqahgKK9NWEbVfnQ9d5
         OhyR1XWliiM3a62uVGN+bF+VzWn1goIFpDHkaCoqxm6RA3hZL1T8m5KB6+X1NI7g+A6c
         /H+D9820Uhdb/dvS9F3m2YJzay3HxwcpZCLcGhB+37riCACel85YoFThg66ae0icSBvI
         mGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=0BO8AiPdnpTu4a15JFVb91qyOsj83/wcbTEHnAO+tm1Y5fKRHlok05QGpG/vUXICHN
         b6AdbhmdwW9awedvcutWsVeA4JXBoQ84qpuk4HhpyazmSoObPxfEpT12Gd6wcjmw2XV7
         Un5E3zounnc3MDsfVTniUq8JCC6OTpAzF2JEVAd27oT6RXHyGtVEiMRyE091EWDkzHBi
         cQFUIC5q0c20XawYAIEF5Htw2t2UpKaAHIHiowoSBEKKh/Mvee7pk3/iLhmR3kZlLiAK
         m/ppbzK7i2ZkkUE8s7rAQ7BncTe0VpAoDv5wR6q3P/Qzu99LKLABsZ6Xgq84q/WXkrQb
         bZTw==
X-Gm-Message-State: AOAM531XXbLh6SGjbqyxsdBaAP16seycVyMAC4fE33rVTgn4PQBIbA8H
        4McVCVBYdsZRz54pb7PC4VU=
X-Google-Smtp-Source: ABdhPJxxIOl/g5v3YleZbdawmAqTWqcWJi+qApO8EQQP+Y3T5XpYP1wzfMUxh7iazzCQ+tMH/GX+Iw==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr5837379wmq.154.1632245837417;
        Tue, 21 Sep 2021 10:37:17 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:17 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/26] drm/i915: use new iterator in i915_gem_object_wait_reservation
Date:   Tue, 21 Sep 2021 19:36:49 +0200
Message-Id: <20210921173659.246165-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 51 +++++-------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..a13193db1dba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,22 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			timeout = i915_gem_object_wait_fence(shared[i],
-							     flags, timeout);
-			if (timeout < 0)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
+	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (timeout < 0)
+			break;
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	dma_resv_iter_end(&cursor);
 
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
 	return timeout;
-- 
2.25.1

