Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFFB41779F
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347183AbhIXPdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347181AbhIXPdJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:09 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A70C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t18so28761144wrb.0
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=pFwZpIzK/LMtY4OsZhjTXzHSD72F01e+k2NV8lY6cZ7PGoSTxw3n6jgeiq4UhDo5JI
         jgdJEwvyr31jJT4CPMMF0TEhEAZRN9620dWtJs5o9bmhiKD2beVKeh/BfMGbT+teNKrL
         js2gt4P2AkNYQ3x2eBQh/pCSaHp0YGNWgInxbKgRmYQoW58ykaCeKnDnOOKvbTELJsMD
         8Gh3+rrb4kSPIDdT3p/Rn9BSbu0/B4zmGm1h5D9UtQGfi1pzWsnT4u5jm3DCu4uwmLKa
         OcCpLKlDOnP1LZdTvlM1SjhnIk3ijiZK6s++8F4BmimDUoRPDPHT6BFElXfoGfXgZw3C
         kj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=ckc/rTLYX3n5U8aBIovG5IrjW9rFo+lKAWYIDZtATzmSj6M4cl4lHtwC9xOA47j6HN
         0Lyx9Tkc9V+bvf2xR7HTV9uDYLNSm5SAP0fwmnbnz91cc0+pRPivFr+Q8c8vdn6wYrvU
         edKp6XZmmJlaKahmDuvx7TWrUmJqpctUr2oa1QCt8CkKBxgAKmLvODEr7Mb31N0vrfIe
         HfXazrfXbuHEPLYJy1AqiEPyaIbNVkRgz0+8sG4GszzCzxY3aCeN23d9O3463NzcgPZa
         p4RokUr6jK+hKv6ksZiEQt8/BMGQpRtobS0ICZD3NqpRUj0kIxgT4uxubBG1wCl7IyVt
         YvTw==
X-Gm-Message-State: AOAM531jaToqDmzXKrUytdxnmcgLZ8k1vsLBUy2NsRWe0VJe41BO6SGR
        WOihRgn6WtNC7FmoEGmxTkk=
X-Google-Smtp-Source: ABdhPJwWULq+EjLBYu8IpzfvBCbg1EetZ0enHJ6BjWFO8X3kOoGEU7xjuFzefEKYfgPy1rAVdzphSQ==
X-Received: by 2002:a05:6000:144d:: with SMTP id v13mr11902637wrx.303.1632497494380;
        Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/27] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Fri, 24 Sep 2021 17:31:03 +0200
Message-Id: <20210924153113.2159-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: use dma_resv_for_each_fence instead, according to Tvrtko the lock is
    held here anyway.
v3: back to using dma_resv_for_each_fence_unlocked.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 53 ++++++----------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..7ea0dbf81530 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,25 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    unsigned long timeout,
 				    gfp_t gfp)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *f;
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
 	might_sleep_if(gfpflags_allow_blocking(gfp));
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			if (shared[i]->ops == exclude)
-				continue;
-
-			pending = i915_sw_fence_await_dma_fence(fence,
-								shared[i],
-								timeout,
-								gfp);
-			if (pending < 0) {
-				ret = pending;
-				break;
-			}
-
-			ret |= pending;
-		}
-
-		for (i = 0; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
-	}
-
-	if (ret >= 0 && excl && excl->ops != exclude) {
-		pending = i915_sw_fence_await_dma_fence(fence,
-							excl,
-							timeout,
+	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
+		if (pending < 0) {
 			ret = pending;
-		else
-			ret |= pending;
-	}
-
-	dma_fence_put(excl);
+			break;
+		}
 
+		ret |= pending;
+	}
+	dma_resv_iter_end(&cursor);
 	return ret;
 }
 
-- 
2.25.1

