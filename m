Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCF640F7B6
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244235AbhIQMgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbhIQMgv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAEFC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:29 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so7937653wri.1
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fnU59rAAZAZupB1agRScvsRy8FcaokBV3fXPNRfJmuM=;
        b=NZ//04R2oA7Ofi5J5H9RYrX45fRztLC6ng7eE/q30lidghN+eTwjRXi3eo0pqp9kzU
         jiToExYNvC0YZ4dCb5/1H8M9v+PSKKiEQM35cmsEXHcqFzJNFoqyZccU1bUeDY3VJNVt
         VRWu0rHHMU8kPTfZhz15x+SOfsbnVmmwejweeDiyJJms/DoBS8hUzsO3i0f/T01kXVS4
         zEBYwfw532UGxfMqh6JMYGhbP+/tlJ04RS0YWUv8zSj00wVYsIDKaoMhfkUhFOtJGaiX
         SEyhKBQECkFaIhI5ZyXYV/HCXFLPncsAJt53y0tzdLvcC9UAyKAxfrPF2orWgob9r8Uw
         +ewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fnU59rAAZAZupB1agRScvsRy8FcaokBV3fXPNRfJmuM=;
        b=zknVh9nX2yD5HdPb3EaArs6iGUcmML+Z8Ei14qvOdSENC+/BsKQ62uSU1TssIWgUWc
         4Xtn3Gco/gdRWT2eSzPvMyPp0v/BPxUVdj4jPHKLJD439/Z+5OUm8ycc97sgb6NQp4/N
         57TovA5sQvgxWyxgIQVkiYCYM+h3LdtWIdMG+pNqNP6IckMqYsBv9nhE9ev5xeWJtaw2
         uH0Dhvc8X3lOWYXbb1ydWEDoeO+u8pri+XFvZD6SEeZSXXqbNHLHsPV990GFwTusYn1O
         09qopTQQUgDNHyFeSwy0jaJxMRMhOogRqB0agfQ11Pqyrmpw+W3wqvxgQCQshKuMbM5c
         32FA==
X-Gm-Message-State: AOAM53129YFxsJ3cPmdXhksuA15Vp0Dm7htAb5H2rhHKo+Qtw3yz4cvW
        UlDXY16ZjJm2k/r8SUVmQlA=
X-Google-Smtp-Source: ABdhPJzfu4I1UPKXKEbsuR5FDbWn0p6UMTBQKmzpVOnvlDOvS1QnIwGdIoATAJR2bte/LnKCgf+aJA==
X-Received: by 2002:a5d:54cf:: with SMTP id x15mr12200396wrv.27.1631882128177;
        Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 14/26] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Fri, 17 Sep 2021 14:35:01 +0200
Message-Id: <20210917123513.1106-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/i915_sw_fence.c | 57 ++++++++--------------------
 1 file changed, 15 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..7635b0478ea5 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,29 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
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
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, f) {
+		rcu_read_unlock();
+		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
 							gfp);
-		if (pending < 0)
+		rcu_read_lock();
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
+	rcu_read_unlock();
 	return ret;
 }
 
-- 
2.25.1

