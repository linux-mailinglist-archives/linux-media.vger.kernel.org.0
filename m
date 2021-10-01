Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DB141EA68
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353483AbhJAKIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353386AbhJAKIO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:14 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76071C061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so14655903wri.1
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=AzKiJlwT3VxO44dRR9XUeDPKxjRN3IWI2nv20mvSeTTXH4RstYBlN4dN50+WShjt13
         fLz4+VVBKSv/KrO6M3pX63u+/9u+Ctu4DKJRMkTBMEfq1E5ZMinrOVvpnl6fxWtMC2LG
         ZeRqoQQ5bN5nXzkVrJTcWHSnhGtGOYrl9UDbN18jxzJxew/l1ZaWTi+hnVl+GxOsMWHZ
         QcUJecwJSuCF6815sP/fNKt9yL9mEthSWDrkCUEyTscCd2PSwvq8KalGHjz3Hko8ypli
         706GmZTT14mR3KyVQCAB4xnYQ86Fz32DPqEVlk/eSNNKXoQJnR+N823QVg17+8xgzxmF
         hBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=ENjHasRFgYZ7Vxs8o7xL7hGf4Kta2NjsGAvtimaRSpXjYXBuZBQ4H2sixoOxfmFy/v
         aWlh7cnB3g8rVHmp8giGJF8L66RfZ9yL7NmhSiFsgPVO9Keg25mrM90/sNk5ZiDTk0rG
         i9uF8+g5CaSyy4aJebSmCcCIlRt2KnISHFHrUMpZdPMQi7txO8RUnDkC1Hxq9GKUqEHo
         k/wtD+j12HJ/32A4NbQgmZDiNiOFou4dQbKHl9xXQrrLpEPokpJc3G1nF4qdH3E2ejoX
         nntcLLYWLlixdusuWwpt+3UiNPXS/5U/B0E+6UH82CCpqHgnn75lLo8x/SIntGBdsE7c
         nE0g==
X-Gm-Message-State: AOAM531O2QETaOmAK8CXhAXwkAdktCZrTs4NsRoFt6o60nAbxk3YDDll
        l4SsBapiMjCKe8MTZxdZ7b4=
X-Google-Smtp-Source: ABdhPJyStwefq0t9iGN9OcfJ/7fDO+KwhT1qseTmxxqq08hFNrxxVRmAQiqqNgPam0/3z7wBw1f1lA==
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr11473987wrz.337.1633082789101;
        Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:28 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/28] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Fri,  1 Oct 2021 12:06:00 +0200
Message-Id: <20211001100610.2899-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

