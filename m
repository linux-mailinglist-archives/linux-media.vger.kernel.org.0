Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E33041388A
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhIURi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbhIURiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:50 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04C3C061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:19 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t8so41613396wrq.4
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=ASeqxfhV9w2u70s80hnfGNFnU5dmjRz2YBiQ7UHNSa6DuGjH6nEjSaGOFwjoGr3Ngk
         OsF6e8rljOOHzPaM6Uqo+nNAkMenqie0UR85wYUOMF2itNkuiZxgp+PcNuoFkh0uAR+o
         JCO5W25qt9EiZ5MAlAbwfVhOeHFAIs82EXwXLh9sZwVM1cqEmD0rX+cEsi4gFtAOpmIN
         And+T7i3omYCqT/+l4z0ZAG7LaYrj9oxsxh1FiKcpQXNHbQV65w2ipTVrRwtcNYWNkI6
         6uD9G0l6ICgnEPEYBG3H7aMWoIFirlglUQZrYgEFE++swyz3i5KTGb+NpmtqgIOSwgBW
         3nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sR69q70gSeg6sG3/QgjbBFqvIqYfytfoA0SgvZr7HAU=;
        b=7KwR5aTaPEkimlmiHiZrZEpkw/Nwqh09W+FJQEWJ2XRPs1N2PFp2DWlvltXGqjjWYq
         IANCAJ7kFQrKMNnYGFVjsCsSgwpvRuz5OS+JJsqGKM8pqJexFOaxjTQF69ihwx4c7I05
         yHpONf75UEbdRn81EXZz8t7gKt941gmAsNOs82ZKTWew9SFPdu6lKh5xoc8RXHvJTFz7
         muKdzrYaXiL+TFsAdRFS92cyJmPEzWUWpFy+qzj6+P+q7mmyh2cBZBXh5L09+MjZEYDX
         eSdF2l7kuJ5529qcqeXRsU2Dnyc1OwB0aDYWzocPGQaL8EIyrJ9q1Vm+RFUsr4VjjH+j
         4qDA==
X-Gm-Message-State: AOAM530mcSNTz5c1D3urKN0Faj95uIT9I7OQJhzAjRsFyZEIaP8+fg7C
        Z0VxCrdsZZjEyx2Fz5bpfCU=
X-Google-Smtp-Source: ABdhPJwlzB0biUHAG3WLi9lDLjR+cNGbXPohCdHBMasqxBhW5gM4Vorg44beBvytvEnF/f+/0iN96g==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr36944797wrm.394.1632245838354;
        Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:18 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/26] drm/i915: use new iterator in i915_gem_object_wait_priority
Date:   Tue, 21 Sep 2021 19:36:50 +0200
Message-Id: <20210921173659.246165-17-christian.koenig@amd.com>
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

