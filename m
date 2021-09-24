Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D494177A8
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347193AbhIXPdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347185AbhIXPdL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A0EC061613
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i23so28764698wrb.2
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=YcayZl7Kc7T3Pj3XVmGGOuIjTxpVoAoI2od6lbwc9TSJwmi1zd2t7gVnV0cfgzyTig
         +v4iCwgn+C/amFzCz6IV5oMD3rhliK1MCiVloKsAwGJiE8yKBag0B88v64dyrnQlbJ3p
         N5qSv7jL72pGt6itiSaEbCXydbAN7OJSxmtqAoaRdgi4AJlduo3WFUSMDZ6R1mjKutmS
         vtGx9Uy43a9KEsMUOxZCwgD+iL1JYZZ1bIiBPnZzkvkXpdgp/+Jbg2WlXPL4Q85rlpmg
         xcl33SGH6IJWsFCEzL2oYC2aVlzRD4zUmvtv6U5jz91dAsMdPmExJuBtBf5lNZJKSxZZ
         Fa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
        b=MZVcO2z4CIP1TlYYLxpOxjEHTR1koD4lbIFvI/VhFEEc3b2jnOlIKcy7NDogveZJmH
         0mORwKkDtx0yR21c5e+7zHtqaDoBB/dHmGPYXYkbRC2+X/1sxVgZ3s2KTsNteeNhxI+6
         8sP+hGFv3IrGqp+GlYINs+3qA928X0unCjWd+OsKGtoPJZXrIAINzBA5zCmHlyf94zR+
         ZE8H91W226BOSxeLI9IJgkY5J3PIzBaG7jbGcrpola2t45aCyG462mjb31bMGgJf/vFK
         MuqvemX3L5buTVShhJtl5JGqqRX4DR+Ylrq0seqM1o/BCEaF4ISDLfK71/93rFnS2Ms6
         wrqQ==
X-Gm-Message-State: AOAM531Rqj1pltnIeg99fm6W3rvzgZQUZuPS5bLOMqjHjBxoxfSXWPZX
        sGvDQpZadyiOxvVxPz88fL8=
X-Google-Smtp-Source: ABdhPJyQdLXkMxahC1Tzbt4CRsN/npvnT2ZtzZDDhzFaKodNBkXw9jGP/wgMZdIO8YjjpySbz9jZuA==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr12305654wru.110.1632497496045;
        Fri, 24 Sep 2021 08:31:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/27] drm/i915: use new iterator in i915_gem_object_wait_reservation
Date:   Fri, 24 Sep 2021 17:31:05 +0200
Message-Id: <20210924153113.2159-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

