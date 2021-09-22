Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2CF4144B4
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234311AbhIVJNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbhIVJMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:36 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FEF5C06175F
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w17so4591242wrv.10
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=Z7r0BHBb473Aw7EwDwvEQngSxDBhifuHEtikWVS1sp3F5PH3aho2z4JFwIKzC47F0I
         VvIMxADlwdyoDZ+tbusNCy9pJhCkdUj2GXxb41/Ice0WJ8/LU/25Gscc+/P3HZQN/5Vd
         REHPj3N68K2ygL/4wvzrFZTgWz8DXvN4r6u7RYgxN13cjYULjzEQZxfvT28sz0V9Yz12
         KG7r2GXM3yQetzsZoc5ktCtCN8u097ajH8HICBG55Trb3Xm/yxvbj2RXlMODwtkj2LX4
         yxm0I1tdPZ6fOT3IcbJfqB7UL5qp3RgoYit36Cwa3BkEJC28yWvPMhc/zwJueF/I89Hw
         zGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=B8wJS9MVQtJml5J9g64IoQ3BmLJK1qwWf+E9JAwsaxHmRPS6qGOqR9a+RDs6eLJv3P
         H46eY2Jf0GB7t5QD621eesV2nmIVkwNezq3xoNty3x517cPdcdVAQcowe+AhjDwMXF7V
         6GD5DbQdRw43Y5wR/jtbaVgWz4B6IKv12B5u7wiv2QDltdsbVfl0hdunriNkq81Mzv/R
         0bi+aOcjjn/9odzBIVWGhKV83EWMnKJK7hvhwjzTQQ6PfEkVAACGJgcT56latawXByMs
         G3oqvFbBsKOtSgHq/VOMXcATQC8ww2nsR1BGyDuqtsWW7UklrvoLnvuR0PeVro8oYOMM
         uXpA==
X-Gm-Message-State: AOAM5336pWvvQ74zOAjY6GmJo8FYYCl/admqnEGrlXyq0pT9XagcwqCp
        6uu19MF+dDgpr0TyenfxXuI=
X-Google-Smtp-Source: ABdhPJx7PXS+33TVwrtZR0GnbwAPurCWxNCjO00cJ/+f/zD5z38yi9pUm3aDPZTtXgdpTFI1I9TPYQ==
X-Received: by 2002:a05:6000:186d:: with SMTP id d13mr25375692wri.169.1632301862830;
        Wed, 22 Sep 2021 02:11:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/26] drm/i915: use new iterator in i915_gem_object_wait_reservation
Date:   Wed, 22 Sep 2021 11:10:34 +0200
Message-Id: <20210922091044.2612-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

