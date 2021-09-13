Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7FC9408E16
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242313AbhIMNbd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240069AbhIMNTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:19:53 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6375C061788
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:34 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id i23so14676163wrb.2
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bKAQHY4Xeuziw06SdV33IAa0ClPBsmLs4nux6eiiOrw=;
        b=CrnHSbYi6TvXO5lyMKh7RJfU3Xa4s0V+wY9O40UQWrxQBNnV7bD4hXyK2p1hIC9rYk
         7FxtXuAkUYTfh7shO5V+xDy7Ax4GAFM8Ps+fcjqRTBZxSbWoRNUx/k9EUsgpOZaenLVn
         ddpY1dVyOrNV6fjc/YSnA46byJWTsv340oQef/C/9QjoW4DKGi8IFe2hZLU/nhiuInux
         /5TKpnJMexJOyl7Wd1laH0hLAeEpuZYS6yhyGy6Z0S0UdTQ8VbGXAUYSRHQ5YrS/E3Q8
         hME3/Se/UrnIFuomu6ZRPO4Fjr8oZZ0Hrqe/QAhzy4WURj5vuMc5pw9+s2NW42uWopjn
         fI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKAQHY4Xeuziw06SdV33IAa0ClPBsmLs4nux6eiiOrw=;
        b=JPgiFj9Sju5HFXDNZHiWd54wKYEj8Jkv8Ko1R8RHo/Mb3Pv6/tQ6q6404zVvk7RYT+
         OrrnXS4p52mZrVBvaYvz49d606wMjrNrimvi6aBkfKK6dev1nkbRpOv7gEe5Vwk6PkLJ
         vCZP0jpz9IvkmiBmWKJq5odxLEL+AF5BILUwKjsq24UKnu0fIZZxUuq2/svqPaFQWvag
         hAGmDG5XYOW7BrJbGhpfqhF4qkHK44+FCZPD+qtQaTmYWChfMKth4tFXs3EoHWEQAtds
         NDE4ZP1pnJ5pAXuxlZQ2Tz38ZjpSAScptBDnWcp3wbHpZyWuQsNM4MCaFIsBjkgEouq2
         g2DA==
X-Gm-Message-State: AOAM532ZiQ6fh/lIuBbAX8LTi0dBEibYBKHFacszvg8teSIyDxDufKdM
        KVQ4nxjoXHBLjmb/Qkywmbs=
X-Google-Smtp-Source: ABdhPJz7WNMbXswxujEpSHrQYGaaxUUrUs6tHCs/mUGI2195wSxF+ircdolil7LhOv9eq1jdr1QwYg==
X-Received: by 2002:adf:f084:: with SMTP id n4mr12386191wro.362.1631539053358;
        Mon, 13 Sep 2021 06:17:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/26] drm/i915: use new iterator in i915_gem_object_wait_reservation
Date:   Mon, 13 Sep 2021 15:16:57 +0200
Message-Id: <20210913131707.45639-17-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 49 +++++-------------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 1e97520c62b2..13174541f6c8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,24 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
+	dma_resv_for_each_fence_unlocked(resv, &cursor, flags & I915_WAIT_ALL,
+					 fence) {
 
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
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (timeout < 0) {
+			dma_fence_put(fence);
+			break;
 		}
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
 	}
 
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
-
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

