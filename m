Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC8640F7BD
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244279AbhIQMg5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244253AbhIQMg4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 705A2C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:34 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id s24so7202522wmh.4
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j7dWmZ5SavrHHTbVPyl3pWrCBr/RL2bOHTMMTnJ649k=;
        b=DvS8f4lkWP+ukbTxyx8NLbmQo0JecP0yTi8V9mwXk8o/IbJTNYe2YlDalIWzkkzPUw
         04+S2IxOxKqG1cfDvcj3sEGgbOCb291u4pgMCfHuRqCVqUG8OoCwrsAbfoR/BR8IJN7z
         g9E9N681nC+EN7/SGXphQws8tHfev5dO8iyAgUq5vQol3HZodnKlyXikemRwLbfkjmd4
         AjQQaIGoSUiEbLxMScL5evZgyevkbC1uRjJXdRgPQ0Al8ohm0ldx5WcB0ebTbS3HiKkJ
         aLqd6Fj6y7lK2tBtIBe/ZN6pznqMKkycu1wWp3NfPEeiok7Ge0yHY+cvWnC8jTEVCoTq
         ktpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j7dWmZ5SavrHHTbVPyl3pWrCBr/RL2bOHTMMTnJ649k=;
        b=4/geoVz5jPkdmqLa57e5DxLKYN3AtcEEWVMQNWWf3KjWr50t0VEbKj+y0w5ifoKyjF
         LmYcgG5quunCROb04cEpasDKHkJ43WlO0w1L+QTOll1xNRS9JwwWeHnkZTby23OHnkA1
         fD24qagxNoD2KJ82DR695X2oZXR966NJtRxIhB0nnoWYJuX7otgG0u5gOZrlW1BLo7YT
         BIJaNG0aCdH91rHS+k2FJS4Lne6O+ou1/K3I0J1oTWdz0hVRu+BAmNUZ/cNhbiZO7cvg
         QgHytPs1KrAwu9P83CsOp7CsA2tPfFDbA1AfgEOykzW00bpTLPUxxpjsvjyXU0H3HM2k
         JXJA==
X-Gm-Message-State: AOAM531e3eTvr/QhRBYRqBc5SZYR7EI/TWW3NiyMpljsASGC1yOpVvKs
        CfvqQqf1Cgq8CpdAgiK7FsAfh/LkT44=
X-Google-Smtp-Source: ABdhPJyUPm27pFXNdl4Rlzw33QBSbUFZ4QLV1vHG8Ty6t+fL7l1sHDIbj5v4mOUBXGv6CbVZZrTv8g==
X-Received: by 2002:a05:600c:4154:: with SMTP id h20mr14745069wmm.172.1631882133129;
        Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 20/26] drm: use new iterator in drm_gem_fence_array_add_implicit v2
Date:   Fri, 17 Sep 2021 14:35:07 +0200
Message-Id: <20210917123513.1106-21-christian.koenig@amd.com>
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
 drivers/gpu/drm/drm_gem.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..c2c41b668f40 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
+
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj->resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		rcu_read_lock();
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

