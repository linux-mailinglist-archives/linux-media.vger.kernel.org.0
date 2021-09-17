Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787F240F7AC
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244191AbhIQMgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244166AbhIQMgp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:45 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 809E0C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d6so14867430wrc.11
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ia/BXArBzSo5qPiEzEa5zvEcCQIRTZj8N0lxekHwmwI=;
        b=l28NLQta/6LZmjFira6x6hBmN6dKFHo7l6S1OF757Ag7zBeYzOXOsbRDVoH9q3pmet
         GQTZnUoFNuuvtSD0iw9zqZP37/cwS3phSK+KTnF6sorAGcHMW+GndrCOAKz4cYq9X7Jf
         OeMnQqOV1SRqHKiLk0Btb1BXLMaZBUfmd4pwbtcuwnyype7KzVElH9kas883I0JAwcaP
         rVPBkUoA8qv+rfFeUjAAbfsngIphcbZjIQLcAp2+Cli24cVheLpMjfWrD5Op2CxuUTNs
         nzQKXUWRfytQFFccG1fwHnWQD3zL0fGcdMvVrxiO8iWvADAW87EQZel//vYrwzU0fLcx
         KqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ia/BXArBzSo5qPiEzEa5zvEcCQIRTZj8N0lxekHwmwI=;
        b=qRQXzKyOqpnqYq8FeCmGuwdjAy3oUqG1iVk/yZ+sVEuuzS/HVGAiG1QKrsbIXuIFEN
         skn7KpvYkNBVHVeDkezUlCOPT3lnGoyDF8hre12de8M4ceGH8yoJEkqdqoLvngUt6FrC
         dNuuxn0eEVj/1LqOe81HIWJJ2nWMIywfBk8PkzUT1Hio6ZYWUwaHGwFwt1na5QG+oRkZ
         UYJPj0QcvMSe2vWQTKP2QzaX9aQ/sdvEHLE64Dj/wy7+rsPegLb9I73F1ldV1stjjYzX
         VlFeUt0P6xW/gMNbpUUzAsm86qRoHXJi8kjiHbKhwRktkJndSj42zG4FOhAXsqP1N7lZ
         fXlw==
X-Gm-Message-State: AOAM5330h3aAaG4iyDRKVFTtWPcsOPu5d6Aqsw9MeCzXjvNpLXO+/Nqp
        Gc/shzpTyeEBEqniB4vhxzj+fNtFKXc=
X-Google-Smtp-Source: ABdhPJwHB/pYnsex5U2dINaNbU/mxD0mYLE7uWX0oUu8MqBCU7Lxq9wRahgOXOsody97PreA7tSz0w==
X-Received: by 2002:adf:f884:: with SMTP id u4mr11415641wrp.411.1631882122116;
        Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:21 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date:   Fri, 17 Sep 2021 14:34:54 +0200
Message-Id: <20210917123513.1106-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 3b22c0013dbf..7d804c0c69b0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,22 +269,16 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

