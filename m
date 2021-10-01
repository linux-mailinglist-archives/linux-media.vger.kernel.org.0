Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488F341EA6C
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353470AbhJAKIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353456AbhJAKIR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:17 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D14AC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:33 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k7so14492633wrd.13
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=Ea4WSe15oLwwlNdQvSBetjw7fNJ7A/u0TCKXwUS2Vcmu5XZOlo48VdQej41rFjqpqq
         eYUy0mXBw/fut1muWHXT9+1hqksgRHF+THgYMqbL9k5FUlMmOi1T+aRUA1Y1EWNB8nIg
         14CRVkMV35yMz083mG8awueAhh/p0mRuRB4+OW1j7FsMBVOz/VzCd2taDBnx1lfH3izG
         5TK658+MW+NsmHWlVc8ztktPuQFIk70ARmz3/5rbvmNDPfiI3J3VHWVzUx8kG/9pz4Og
         ukqvNwGCE7yyRFAz7fTKND4foPrqoPRCRq5PcO4qzShXhX+PCfN3hn7VHPM1PjmU7din
         RG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=m1s463UkcwddKqjsZqrUSng87Ddp0dF7i/sdngYW+mJyhBYEogq7BHuZs1/Rk8SDST
         sdprf/irxGbVheRTypEqZmjNJVnQZcyjNQV+NZ/7Ge0lhrUtPuNf+1xnc2ZkIxpJARBx
         rj6IG4Ve39gCc0Efb7quuK7Mf6nyVaWwj2VYzS8uPVJPhi7ao8dF2AxzOAcht94zAXQb
         knQGsV9V4OzY4EFKew/b0V4LNyq3iHHInDFX85qEN4nWJR0A3Q1Df8ZrhuJ5jfXPgFH4
         Ks3q5LbsN8E+l6tjBKiWZt8J/sPZU2GBEX741K7oGtQtBVmgYmQOtEoN56rVyO/nUyfz
         LBHQ==
X-Gm-Message-State: AOAM533nRtXLPtdlTnBlrdjz0Ug1izUohUDNiqqyH2x1UrVmtZ8Y2sMb
        rxUirD6r7PrPD2wipVqB23hnnqg5LHQ=
X-Google-Smtp-Source: ABdhPJyhTV6eK+nXojv3NtgnfpImqFkB7246DJKrxQRsA2i58ql61cG9cmL2nAfe56n6teyJszJRNw==
X-Received: by 2002:adf:a4cf:: with SMTP id h15mr11320275wrb.56.1633082791648;
        Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/28] drm/i915: use new iterator in i915_gem_object_wait_priority
Date:   Fri,  1 Oct 2021 12:06:03 +0200
Message-Id: <20211001100610.2899-22-christian.koenig@amd.com>
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

