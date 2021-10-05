Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8BA5422530
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhJELjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbhJELjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:54 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBA6C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:04 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v25so26045408wra.2
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=fXkIv4LYqrWSj/haf82FkIbG6x6ikZnDIM995pFTL1k4+UacTss2LOSPgElEKQKXiI
         FT7EAlF4VVCVijHUScp/eiDMpIncorlu0WwQznEqMk4DCm1Mr5/r94r/9GND6rnQARdk
         NC2VUrJI+yc83iJqVRFvg/nznN/AlszipTv0fG27zaza8M6BmVg0njhxVCIH7FMtmxix
         +8vRjogRN2M980b3VDplDAgakPyIeRqEKAw5YRqbcaWlZnhcFf4tGdGvA2lnKQyTCgFP
         Ar6Vh8VcOJXrPwclK6M2vy/PiwbMsv0vVwjEm+US11mTH7Cgyx8QsqfhFttIrKjIzow9
         F1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=VE4S5pbODqKSb5W15O9GSAtS4zi4j2H1Clumu7q8Yq5OPW0uccQqXr2+a/BsZZSRlB
         D8KyBPNWays10WkX30tGMN2rxgemoXXJlEFvFjUub5NHQOp/fkxoKHrUXqES+PlwXe0d
         MyFjXQpIA9ukwmFW3YQ3py+4MwfkpmAquRdXNdhX/TruByKH+OeoI9ZjyBCyXnrKTlII
         HWI0u4bJtkwSvbnLEouijFPM3q9Q2jUpLLHecL3ejMi+TGuu7fCbu5VxDMz0jjhMR6mL
         bKW9B1tGpQ7H19YwaGrXVoA/yNMEfxnLL7JvBW6+cWgfW/1tD1Qri+d7mkbLla02Kj/0
         jiIw==
X-Gm-Message-State: AOAM531Mu6jjLb/zzMTHgZvCOaVSsg1cnHT+pLW8slF46TN/PLILRf2h
        L6ZKg57gLy53nI/APjxSb1M=
X-Google-Smtp-Source: ABdhPJyUXOVHSAR/7XsB9uLEj1OfENOt7PpZDbN1ST092ZoFuq9VfvDJtA4MPcogNmIXBIDiz+orQA==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr20764288wri.75.1633433883061;
        Tue, 05 Oct 2021 04:38:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/28] drm/i915: use new iterator in i915_gem_object_wait_reservation
Date:   Tue,  5 Oct 2021 13:37:34 +0200
Message-Id: <20211005113742.1101-21-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 51 +++++-------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..a13193db1dba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,22 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			timeout = i915_gem_object_wait_fence(shared[i],
-							     flags, timeout);
-			if (timeout < 0)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
+	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (timeout < 0)
+			break;
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	dma_resv_iter_end(&cursor);
 
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
 	return timeout;
-- 
2.25.1

