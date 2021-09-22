Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 401814144B5
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbhIVJNF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhIVJMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C18C061760
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so4781599wri.1
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=UEJYZHOyM5FWBh9nFOlDTSRbwlHNw/8R8L9nK56tUJVXe7V/Ima+jW2VZw79JO7ka5
         cwoWdjIm9cs5G6xD0D6y8VuS/watKoxa8d/UNOMfg8GszX4sOsfkzjzV0XYC9fIWclKK
         /P4nvvEmmNMAqQnYiexWsKOfznTEAwGPGPyhPkzbsoyqxZOp99fDoYBBQIiTwOC4MF0O
         /IgJEPAeTiCKfmLDL7RT4EPLT0Z4AgjvVCNNGf5R2ubbC8ncoiGYIa/OB2vc/GGgJNzM
         BohW0I5Vi6ffGgY6Lx4WV6D9P/vqlF1qFv5p+BkHL/TXYoSUowrshpIl9weAL3duuDBo
         wjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=ML/v9z2CywYFMIbemjRYqxlooSdN2eCpluRDOmXYkbI6RcKCFVJvlDZp7s20Ytw472
         LIv3Y5IGvXU04kGHljwXXWerGUrOpOKwcVuaD6uxHfzRngyv8JGbHM74k5PtvTL8mgm9
         una097GyiOAPgfkZXj3ENiEEh+X4DJ15BXJWt+6T6r/TDUP1/sMF1P19HEfFuh3uwy0U
         QvDoM0t8fns0XuPueHsHYm9+SXNHVVutm0tceCtFMx46c0mY4UbZ7Ijw1RBLubBHe52I
         xHKmvLECiTd/NK1FGEKicYLb0sZ1NpV+t+vrqMcUTi8A6rL49FREjrHsgM+hSc7QgQKt
         wYMQ==
X-Gm-Message-State: AOAM532nAeiTECPgBr/F8hjiEuQ7adtYN7X+Fwds3C+Gw0zywTpXtRMh
        Vc6tx/LHDEBdsA7G9tIM3xA=
X-Google-Smtp-Source: ABdhPJz1tDCj/P5Xzak0LokdOWDqixMC4Hm+RqE58sLy9CPecXzeoWkCE/IuZQKIb8Y1zBAL+6TWYg==
X-Received: by 2002:a05:6000:18a4:: with SMTP id b4mr33406906wri.96.1632301863666;
        Wed, 22 Sep 2021 02:11:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:03 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in i915_gem_object_wait_priority
Date:   Wed, 22 Sep 2021 11:10:35 +0200
Message-Id: <20210922091044.2612-18-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 31 +++++-------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index a13193db1dba..569658c7859c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -118,32 +118,13 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
 			      unsigned int flags,
 			      const struct i915_sched_attr *attr)
 {
-	struct dma_fence *excl;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			i915_gem_fence_wait_priority(shared[i], attr);
-			dma_fence_put(shared[i]);
-		}
-
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-	if (excl) {
-		i915_gem_fence_wait_priority(excl, attr);
-		dma_fence_put(excl);
-	}
+	dma_resv_iter_begin(&cursor, obj->base.resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence)
+		i915_gem_fence_wait_priority(fence, attr);
+	dma_resv_iter_end(&cursor);
 	return 0;
 }
 
-- 
2.25.1

