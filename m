Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521D9408C93
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240295AbhIMNUY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240076AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C72BC0613F0
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q26so14649610wrc.7
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rra4xyyjcasAg6ZlFYF7J0CFdUiNG1F5+45b95OFcSo=;
        b=F2VCkKNgS3/ntznKYeL0uVjzZrdrvnAYfaXfMrjLUIb25/2fg3bmcLfhyHFocl3Ec4
         OmLl2YEZNjo2hqWqJt9V29zKL/+BkfPOcVCUUsYVRqOJ8WC0qKJh218VIjLurv4aMiPd
         8imGKKd0+7fhQ/dRbXXWRXnlFLhijI79EYAMtsHHVfOsMKViRmp9zjZN2Eyw/NZ4xhW4
         GeXqbhXq1NSWCfVFTnBSf23pFsOtL10oFE4Q2onEVeRbzfJvbHnO8wOeoGBAd1QVdTrx
         tcnX3WO4evFT+STKW64j9+uMLeV0CxKJ1eGwANLo8g+Qpzi9GElTLBrOCuvDvI0M+Ctd
         XOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rra4xyyjcasAg6ZlFYF7J0CFdUiNG1F5+45b95OFcSo=;
        b=WYKToZpz554G0zy8IZ8e6ciR307fxFrFO2M2wht6Ds1gb0ExD7DrLdJuRrBAWnh79Q
         vKXc3ARy4EfBmZs1ZzkVI2lW8vM7VixvMYQQKClqsc3CnI7u+TjOzxdkKPhxOf3xfonP
         IAKTaPvcHlzAfjwfQSa1R4/CyEUDbsUZXNHuTPT9n/7cf5wnqLhKLgRe71boo4+FMLEI
         b6UXJNx7dCqUPxOfKSFUnBv+yZ97PyJ6DBaXeHtCfOWhWVzBn6GSdOk9qiawLVrI3Qp/
         DsYFyvsjEjG1YCCuQnrDoSYtp4l/frrdo5om4Om0EuN6YzmLzUkY6XvR4iNSrX1NyH8r
         Gwzw==
X-Gm-Message-State: AOAM530mc0mHY+nhREBsa6TPB9tR/8MiW5a7cSSBh0S2GlGjOqNP4KLs
        7tsfYeeyYJXd+Amzv7/RYco=
X-Google-Smtp-Source: ABdhPJwHC8/YYowut4uEWvJhicHR005YlLSPuJF8DC6fA642PetzlqaMz4t70TkmU4LYpXSzvBFoAg==
X-Received: by 2002:a5d:58e2:: with SMTP id f2mr12386562wrd.272.1631539050800;
        Mon, 13 Sep 2021 06:17:30 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:30 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/26] drm/i915: use the new iterator in i915_sw_fence_await_reservation
Date:   Mon, 13 Sep 2021 15:16:55 +0200
Message-Id: <20210913131707.45639-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 52 ++++++----------------------
 1 file changed, 10 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index c589a681da77..09d2c9f96c52 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -572,56 +572,24 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 				    unsigned long timeout,
 				    gfp_t gfp)
 {
-	struct dma_fence *excl;
+	struct dma_resv_cursor cursor;
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
+	dma_resv_for_each_fence_unlocked(resv, &cursor, write, f) {
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
+			dma_fence_put(f);
+			break;
+		}
 
+		ret |= pending;
+	}
 	return ret;
 }
 
-- 
2.25.1

