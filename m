Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1224177AD
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347205AbhIXPdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347196AbhIXPdN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:13 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659EAC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:40 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id t28so15276123wra.7
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=LqIJKlQBXsG7Yc8cj0wu8e+zpM+ggMNapNCxgSE3sA3BXCeRQfZXfYBiUMyShPkWwF
         oL0yYy6+FuFweL8evwpfXLe7KsUQT1cRcGwNKDJTayuWJMZxrmBssXfy6tNFistzneu5
         YIgCRNeoWDeSKToAGWUSON7PPEH9jzCqDSKnHBKgbbBYlKQCMubaJNoBBq67UsfHLVF/
         3A/cxE3KByKJtVe2TVdwchsrA3y+QM8ltA0GRo8u2gcNrsyppg05rDQxX/8TwDDWX+a9
         XWgey+cnt52gL738JuvwoyEVoRUu/YczhvzHO49m+ytujObmT4tU39KP9UwQQUr1o0UR
         o+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=lFRCNgLr9mKUdtTZ4SntuF9y12/4jNwDMHNN4Kkd/i0zgcmQRmX8iBxbmUkdVkXUAZ
         f1UkfvqIuu812eYQrNYqvZX3MvXrV3YI8a18kHFbJL6Y2YqsO1Mr0U2VBTPTo4WgMiIY
         2wy5AoqjYc8fQQTcv0sg4+0wzaPLE+doU1sfsOReKgzuNYSVP3KwdS1G/Vla7xJ5NY+L
         h7qb/ei8LGeFY48lHS44tPt0PqtbGFG1L3HxmWiQEMKo0g7xE/D+HXrqiOvRTP6miIPN
         rlPoWbRo/YBHTibgyAe6ddgkbQhvYC/lfSOfI36QRGKgl+hFB4H1IXX0AnemNYJDfMOX
         0g6Q==
X-Gm-Message-State: AOAM531/PfbqsPpO64fh1TOq5NR2VnWw7Q/xjcdYIvXgVZfhAjgRM2Rg
        WaJZJXDMNq/SKyM1JKJk8wQ=
X-Google-Smtp-Source: ABdhPJyy/4U2GaT2BMEka+ag/8o17YZY2/EO0i+JqubriX7iz9usIJ4MLyYl+KmBqFvgybBZUwg4AA==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr12367035wrd.160.1632497499033;
        Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:38 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/27] drm: use new iterator in drm_gem_fence_array_add_implicit v3
Date:   Fri, 24 Sep 2021 17:31:08 +0200
Message-Id: <20210924153113.2159-22-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
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
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

