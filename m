Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AD642252E
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhJELjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234457AbhJELjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:54 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CDEC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:03 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id r4-20020a7bc084000000b0030d6fc48bd2so1671739wmh.1
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=e4mi27Oq3YlVEcrneTSljO0iFxdWD6NSy7KfjN6JQzzLGENydQHNaD5ZXlQNS57HXg
         V6z+uw0e0WrbV6rjdUVYQ1M3TZiMjwZMhAhjobIbwwweFSgEYjaLcoaVRp1L7qfsgkhx
         pHuB/6uOZNkks6QAEIKvILbDhp9bZ2a1bzk1ZHDeAjkpfO+UEAYayUqsMxyZ6vMZERDW
         U6+s+HZwqPFEhr+hCCx8eWYBtMD0yLyGaCxdH+UlZZkePyis8FO3AGhEqsypTsfJB7ys
         HiOciUOxMqeoI+29d1rYnMnm3gLDtMsNw4nwwEwx3422rr1jLyzstXRF5n3smYVo49lr
         g9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
        b=aO9EUnvF8C7vPUqscxfAowaDRm6Q5SZleyjUtzl//i7S/fxhIMZaXbw9jOT8Rn5cDb
         CSm0R7gmk+3YyJg3s76arZjnaOOfM9TOBnn1DIW0DLtxHqaGkKAsAD7THy4FAcmwqXB3
         9auEu7HvPACAfrbcKHvxkDkqVqZ8tkMrJBjVV0xl2W2Ci+fCEd7jQGNb+/WLze6asnW1
         zMUGwi3NJlbRlIp6WgC5cClGPwA79Y/8KpGeM5TBuPlYRG0l5ywcmZFkEdN0SjsuqEHG
         Sq9iqBSqBMsrqYhh55oc+uX6jDdrd/7HATvO+PTMKh3LDfyAvsHvYLA2vZaqXkCnyKDz
         Vq0g==
X-Gm-Message-State: AOAM530tUa4Yedi5K901bVsQ2SGif0mR0l4U2bgWsT8ArHXnNLauTnUm
        l18X8dc6dA1twGeZ80wFssk=
X-Google-Smtp-Source: ABdhPJyslNVLhU/j3RKfrcNX0BbLvueb4NTsL8tx8+qiCeSNd6VOcfLk+ssWP2IJh2hj44goc3yijg==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr2861064wml.41.1633433882153;
        Tue, 05 Oct 2021 04:38:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/28] drm/i915: use the new iterator in i915_request_await_object v2
Date:   Tue,  5 Oct 2021 13:37:33 +0200
Message-Id: <20211005113742.1101-20-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

