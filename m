Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA15413892
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbhIURi7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbhIURiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:51 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956BFC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u18so39819389wrg.5
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=OdZW+PfRzgrlxVjfo5TXSSRU1Vzc9VwZlZNm7YtMibzcCGVVUiDh/LcmC8BAepp/dm
         0zBTdmPx4VlEALJ+59YfuNyzGSk9qvfJ/TqXtqaUzBuxW6aRAsCH8OtpOc5U3RoIlK3W
         gT4BwoDzEK8RTeeLeAWRw6QjBeo0kYar1bLUErNG469+db/uhmhLGFPJF3rubMnui1tB
         9ZQ1kaDms1SL/x3gwuZhh769t+9nZiJz5j9eRGaRnLwEYNJ/PchAgIVGNHbUMmuY1XkY
         Jm4LA5+Mr6Vp6H0G0ore7LEqnZfi8LqxpWtCNbk5EhCLUj5FbNCFP8ho/xYQRU83Aw2Q
         KtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
        b=kY5V+Zfh96HsV9C2u42lh9GOjv10dKVGWZhI0dxin9Iihjr5xoUF5mD21pLtDdOTNl
         ayitV+JrxgAk0YdHVofUr9RwhRCXzoyyBL2vkYUhG1TbcLDJhIDyAerhx1IVOyLVNGaR
         KZGN/dV1yrhehiWvi1pJABsWWqrX3rohE40MacYrdnvjWOxBfiWl4Uu9JbTzkPmRLblP
         SMV3aSenkoAXokLxvbKSlkHfFhyFq/brPkt7RY5HRlN6qeyRvTU1YqPDBaysv61ZU2FN
         gWCYmlv5j7oSfrzHxChVCndpek2lBcXiGNjpZSgNb9cfxa3prMV6y3XBeLzgsOmpmPpo
         7Gsg==
X-Gm-Message-State: AOAM532CAvLwYLOjZYOsCi8zf3hns2IgEKHzN0W8p1CHJDJhhlayQCrW
        sZwN0XUhBm0zq2aHmY3xX0A=
X-Google-Smtp-Source: ABdhPJzfEkVN1WbVC0V7qUCQDGsZ5/tjLsAvTQKDIeoLa33W3vnBvshbSRqX9qiMyIQ/Bbv2k9e+rg==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr36265877wrx.413.1632245841278;
        Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in drm_gem_fence_array_add_implicit v3
Date:   Tue, 21 Sep 2021 19:36:53 +0200
Message-Id: <20210921173659.246165-20-christian.koenig@amd.com>
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

