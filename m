Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47EA40F7B9
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244267AbhIQMgy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244220AbhIQMgy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:54 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07331C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a194-20020a1c98cb000000b0030b41ac389fso2048275wme.2
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sw+MS6XteEXCpv8sKsyjs9ShzNFMcMc6sPLH9JOk0jI=;
        b=U31LlhZncd5tO2cW45QRi3rq9TCmIkt4nY6X7fcCPa7vfRLh04v/W/R34ftcc+RnLW
         zwnuGViVtar56E22SHre1HV2qH3m/hpv2Jux083/+ucvWQD/YiLNdQpuSluW7HbiFu2M
         IaONrwS3ZC3icPOBEbEUrEqdUmQB+burkje3wuRSYVTLCfmbK7oKfR0Rb6+w6YrvPKL/
         UKzEb466lwVCRLNz1H0R6auREPQ82I8rJPdzSUdqtpTFsEqGphdkGyDwmczQbp7mnFUe
         1Z2PUx1LLkja3DzAnO0dsFpSe2UlvNQkHhCaYgw+9eEX8wDT9odd5sL2d28mWVXaiUrn
         hi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sw+MS6XteEXCpv8sKsyjs9ShzNFMcMc6sPLH9JOk0jI=;
        b=CzDJRXw26nrSNLgZhfXJEuy54gFl8u/w3j33CXMtKxaSpgmDm08TEW0mfZhSjx16AV
         VDuBip/1s+tN/QPgvsKw1Cjo8CS/lU/RTW/qH0p9eATtNvdPG8/8SG3fGxkOFyZzNuCN
         wBuRz6gO491R6VyTbaWfY7MiqeMA4Bfbp4YeZBSQ943O87L2otRUaCNOTbMj88+RCn5P
         w1kIJ6wjaFSQ3q0QjOIgGuXeWez6HNTwnwPtP7fxL1tkCPqUvwyTbLogliUhDTxIRD6p
         NYbnJiSgz1U6cV2slZoH0wRrIyv9mphYGJlpxEne1dfRPn0IlmahWnY+ZG4yHix/y/GZ
         uGCw==
X-Gm-Message-State: AOAM531UK27WmbuPXLI1BybjJ7keDdcvkykZFHA4jkQGAXYYfpIDh40Q
        65QldihOD1EmMNhn17PrBFfQWE4tSjw=
X-Google-Smtp-Source: ABdhPJxhkEFsuKkLknoNrRxVOQijCepLFFhcg793t2v1pp6SYTYBtLT6kE3SwOvHHAB5lvDB9caSEg==
X-Received: by 2002:a05:600c:4f0b:: with SMTP id l11mr14772678wmq.0.1631882130695;
        Fri, 17 Sep 2021 05:35:30 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:30 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 17/26] drm/i915: use new iterator in i915_gem_object_wait_priority v2
Date:   Fri, 17 Sep 2021 14:35:04 +0200
Message-Id: <20210917123513.1106-18-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 34 +++++++-----------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index e416cf528635..de8084b6af42 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -122,32 +122,18 @@ i915_gem_object_wait_priority(struct drm_i915_gem_object *obj,
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
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj->base.resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		i915_gem_fence_wait_priority(fence, attr);
+		rcu_read_lock();
 	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 	return 0;
 }
 
-- 
2.25.1

