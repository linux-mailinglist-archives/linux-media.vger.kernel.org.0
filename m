Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A374144AF
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbhIVJM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbhIVJMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:37 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB61FC061756
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:07 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id w17so4591663wrv.10
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=Ua1WTdcULCVJgyuOvvfgOq9UKM6ZT/ugK3x8DSROR31LC/bzEtDJKSpn9wN+Oa1+iC
         5QQiBwuz2KUY0d4ev3JsfeSNM9p7o2mUpGKHfUXnubRAOf1d97WBSmyQkFkucFHCYwCS
         qG1S66N9Ff1/DGJOyZP1Vd33RRL34FRqP7sdtUS6vlPQEWZUmxbgLCJnbN3xw4IU51Pe
         vqbTj1L/FTQzRntNRxky4xEJV5yc1f1JIWY65V80gtwkTGEPvYfpucuMS6pL+ukOvJ6L
         Q6PKskYsBoW5erXrsxIabA05RlKIGxaQpDlols8wd3FcOXLTsBTepAoYwCckAWKnDccm
         lsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=d3GURGi01MfM8iEc1v56gOUm348Uq4viL6xSSAD0h6teLmaJpuFT72QwyGsp3d0lhD
         2KOhlqXlDd4zXX2axDJ5mglbIagD9nr4xNPk2PJh9/RSJbop/zHsQZtzeYRuD9N8eoHf
         cxeCKNs3ZmKFEBRDjDzq23/pMq98w6o7qT2gD91O2pDMte4Iczl9LSRLpAc4v7tvYtTn
         X9E8ZcZfkd6ETlbV+Uwafpn3/XHMLSmRWUVgB2DST4v8oQi6X4eSoAJPrCuIFm2V5pxj
         oTYZks7SQoxSNbDphLSUUvJkXeSQTmIMy+xkJkdZ8XN7+yjKzKyxfzABfnnjZI7SLulJ
         vi9A==
X-Gm-Message-State: AOAM53114Jenl+ActdNjVcyywWw5QhqOIa7PZTD/69a5+NLyV8Qe1AnO
        8k6SUqdOdBApxugZxR1bFF4=
X-Google-Smtp-Source: ABdhPJwEnHZflQbZNIvlY5UfSsq0l60zNStoX16GjYgyxjqV6JFzPSHp+xvb2qeAILGpSnOZhNb/rA==
X-Received: by 2002:adf:f183:: with SMTP id h3mr39765708wro.32.1632301866385;
        Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in drm_gem_fence_array_add_implicit v3
Date:   Wed, 22 Sep 2021 11:10:38 +0200
Message-Id: <20210922091044.2612-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

