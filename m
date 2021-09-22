Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BC34144B1
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbhIVJM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234302AbhIVJMg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:36 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9F6C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:02 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t8so4716009wrq.4
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=OQw3taNzsYhWATKFzLk911O5MomNV/u2wPTsKdsUi8GxlnHcckIV29qRm2hTOMB7rx
         lg3IGBEq99RD40LxnmmsJlCnf1iuRL4uqnEgSpckj1k2IHBckXUdFtq1oDAcyrxnwo30
         pfkjgfoCb5E2qndxF3EQjOqBCVVrwvdxy9lypEYU295zeTbZ7xIDYGDuP1IIbtpKt2Nn
         qfjWluTlol8S279jmq4ooLzcN4if9nObuQugIXU+qFT1MwWaMyDbRTVzHY9j3llQZQya
         HhNtvW98UKFcC4iS38uuOM9zxknjPL5zMVD4MwosTOMjeXjJ++7RXHpLqaJpFWMwJtOR
         Xoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+B96AdxRkADIO5Sz7pGY2LZZPwHDe6rOqsFSHpv8M0=;
        b=I6va/DzUuH9sJ4tXctMxvTpzTQrP+6CO5rChgp/ny9u3tacpYYmjfnl2fFFy99d7/p
         2GwIJXTxco9s3GAQY4H2B/3GxOffyaH0U85e9ykJWyTNP8s2KVIem70HzpJ13M6kHL2S
         He55DGn3CYPyakwtelDBwa4RkpgCUm+CJv0swmAm29Um/N+gVrR89WKAS5+KZCw90V4l
         B6UWTpDbNRqbD9mWCwYIEkREYGad+zpIxgD3dCQnqnkw5e+RQAJhy1FTvfYQxuhSKTW9
         vBtROpO+CYyPR1NAKmfB/rzn6AS14YE52GrjRHb9tVZQd/bmI1msco05rYmbEptzh7Z5
         DL6w==
X-Gm-Message-State: AOAM532AiIsTWp0scrLpf+Xz5yj2nbvucb9RKk5rdFwNoSZ6hBh0Xupg
        0LoQUfR0Tu0WFWH3sOe9/Do=
X-Google-Smtp-Source: ABdhPJwpKHCOSQia+v3VvCz701dY2E0K0K306u9sdLi6iAtxvw96RuEoUpevDzAmYZ7FfLKBgaLzTw==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr41115150wrn.101.1632301860992;
        Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/26] drm/i915: use the new iterator in i915_sw_fence_await_reservation v3
Date:   Wed, 22 Sep 2021 11:10:32 +0200
Message-Id: <20210922091044.2612-15-christian.koenig@amd.com>
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

