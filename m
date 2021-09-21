Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D21413884
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhIURiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhIURip (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA91DC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u15so41553996wru.6
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=o0c5sLphEjpIBKOSaXz5/fHrqrt2IVkgr4hU24XlAYU+cJn1rlTPVFMpMV9PZMrr59
         YxGpKauocLOGbH9BMqAgJLgx7Nnt7J3CDCBZrXFYS283UM4SmTjzlhNy+5Lkrl8SHMUG
         pbdXUFXD3Y+so3/GzAr/IPyGAwwQ8mvwmEXFfaG2qje4PTfxJI2xkqFg+Gg2lW3a8htx
         SSjVQ2CnY/LzXP+nzPKfJIb2IYoHw49dU3RzXsny0D4nMJ3VepBtB/yj9Le+uChGfjpz
         Jq/ZqZwg8d7dEsaBbRPBDFroQpr3NTH2gM1ervLAeJV2opj8QsYlrp5puq5TfHTMVHPj
         K+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=g8SpjFVwmvqFPEzZUXbKKMUt+JI2Of4w8HiBZ6JdSRagmrdh0g4o4ibpZcgwFKCoBO
         twNbY5iGLjkBkO620QiLQnOoOqY40Ef25PWBJDYIpTJZsFfMdKEY3wSWHzKu/iI8DnCA
         xE/88keezoqqiwWh4qrkuQZcN1PkSkLEGxfG8ntu9HP8lxAm3gL4+oehWjqdoROnIW9n
         1jPKIDzPsW2DCdAx1cwk6ymY5cGg1NSjvaCiBOMnoxfnENcv2X0s5S0nsNGbNEzxthz2
         RdIW7NsVV6vlXw3SL98A5kx9sInCz9pEbzSAgRdzya+oxXB8q/Ujfv024pRFxy/TUQ6U
         DlCA==
X-Gm-Message-State: AOAM533YpyBTmWQl3wwEFunVoRCcPJNlN0rJH4Fy//y7t3THSuRpnoYb
        qh4fx6usUo1pSHN1/JXrgxM=
X-Google-Smtp-Source: ABdhPJwMhsbn+SQN7/l3vKaNbjoCRSrcF4KCBqzFjyHJHxwrJ6QRt566viqlaxP8rbXtCqAr7Xbm7g==
X-Received: by 2002:adf:fb50:: with SMTP id c16mr16649214wrs.120.1632245835526;
        Tue, 21 Sep 2021 10:37:15 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:15 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/26] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Tue, 21 Sep 2021 19:36:47 +0200
Message-Id: <20210921173659.246165-14-christian.koenig@amd.com>
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

