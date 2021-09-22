Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31484144A4
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbhIVJM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbhIVJMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:24 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7247C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u15so4674236wru.6
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=Wmjw1pDUM1dPsRsh0ipZiHtkzQcaJwOirp0OO1edNKKgMQlQbPcuJEaERE1B3p1B3t
         9qHPdmBFLHrytpz7DgGFrq72Vkl4cPAKVfPbF53x+9uiYUhdkt0iUeq66KI9FL1Mkw9S
         Appom2ELN7oFpsPdhN04gy7VhUpYbVUobMkJfTljsfdoNb0RkMYi/akbeqf7OZEBTA2D
         OCnjiKqybrMjS6kTW0A0naVyd/xiGXEK4lE3UZXT661BJY+rOzuAT+eS2Rb5dqVXsne2
         aVLDjnLAUpL/fMOrxs3tIE1axZG4kioyNnrM/0qZf6YKMliPqIqMiLudZjJ4r4rkDD3j
         d6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12q+kmLcqrOLQ+PRaX5+iil+oP7YjLgyfMuSdQvd75Y=;
        b=6jeqeVpyMQ+jT2wn0iIfp5nhY0alXsiNQi7ULCT/t15FwsUbnV/53AW0AvWMyZ51t4
         WyLzcFy5iswbv6WsJ0yefMd0i0JkJ9MzOGaReqUBKa97tNhBBNieGQTiLf8MZhmxNtWn
         sAHrpTl0LT9Hi6hyCD5RfY50Mp0IImSvKU4HU0c5VpSE2k3lbEkZe68Su1gQU8cq8U5x
         VkCC/F8N0SmHow054bqPQLSkcJVOjVQ4QZEgeze4RPGwuGBSwnFee/L2mMaMR39ZumBg
         AE9c6vNTsd91D8KWolkoHmGDbA7mvYeRklv1b7AU4IIEAJ4nhq1pCbY60B6O5PwIWu9Q
         jZsw==
X-Gm-Message-State: AOAM533vYdmcwlUuCkSeIE3MzAsN8wSqOEjNTRTUaEW2dDQJL0zPhd7i
        Ndp9AULU7REDun18zX8j/sg=
X-Google-Smtp-Source: ABdhPJxLtnVBL2qGTr0DJS7EpEFnWd/DL8VH9t8rWHlTnKyhTQmOFa7YQHWgMljEzUTSmd1Rd0gKeg==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr9111559wmi.157.1632301853482;
        Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:53 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Wed, 22 Sep 2021 11:10:25 +0200
Message-Id: <20210922091044.2612-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..301b0b4b082e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

