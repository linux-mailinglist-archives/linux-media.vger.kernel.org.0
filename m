Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE0442252D
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234460AbhJELjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbhJELjx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:53 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEC2C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:02 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r10so20306173wra.12
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=UIPXW+MTchbtoJ2xeQX9Jumz2jRoJ+ZZisMmJyBf98g+r4pJJHLgy0XYWi1+vrfHbx
         RyB34tkcLcGpxzMatSHdZoBL1jcOqHIhPI7W6QdqFpDLDiFAOV17qWS6T8MgAg/VMCvE
         YoG4HpUtYNDch7hUQWNShMiHZV59R+5EY0axUPiJUvG/lLBhphONFUdC1JHs5tpg+LOI
         Ya8jDPPy3x2c0pbptAmfLsnRPbe5CktIxLhOr2iMuOUCAre0DJPGwfh/YqzkC/ERn8KU
         Drg8SdLgLCDL1+WE8qX844gGU4dZTkGPsdxMth1n2yHtp/IbHAXXtkEqedyfjx9h95oO
         Ti4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=YAvF59ge3Uedq7kYO4zWUrjKS0UuvHaFH8Ouep3vXSYUQMMVhgp7brttQJjXpZW+ql
         w6rERoEqozJkfPZEiYYdQ1Xfl1ezfNW/2pRp2r1V5Uz1VBI1tt12DeXYD5ztsuFcF944
         yVevapEmIXpnBwiO4BzdqG8sspICL6wrw/9/eUNaH+bbU2kcWH6Taj9Qd5vy5W9noMNI
         gEoxIEL+h1pqzjfKn4qGylxB0zQC92t13FwAFzYA+g/+AUfqa/LcR0IMKMJIAGB/Cb3q
         r9+LhKmARfcbd+182nIk8UYZa3aBmbOv77nA/34jR0djHiNs/X8yOw8hueQaeMZct/2K
         yJLw==
X-Gm-Message-State: AOAM531q+gNFD1ExQSXwpmVacMJiR/JxO8xIOyB7YOF/GBofMB5ZOEja
        Zw51dMapJHzuN4vVA/9gk4U=
X-Google-Smtp-Source: ABdhPJz/GxB+AkBgjIJxBlVBJJ43v4DXj8xhDk4JW5tfXfEI+JBMQXLs2m/7kM2t89e3D3pOxTDZ/w==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr20722865wrs.270.1633433881286;
        Tue, 05 Oct 2021 04:38:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/28] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Tue,  5 Oct 2021 13:37:32 +0200
Message-Id: <20211005113742.1101-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

