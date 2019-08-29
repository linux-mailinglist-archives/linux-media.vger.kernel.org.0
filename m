Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9B8A1CB6
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 16:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfH2O3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 10:29:23 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35542 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfH2O3X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 10:29:23 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so4115646wmg.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=N4tzF5ZJXTgKfqcRosNis+efs/wFEuz1xTl1VpiMyO0=;
        b=o4USWOkNUcJcJk2i5BUVKmMP46dwQ6nHcENwePmgNaZCtn1TyhafxSHQX5pA0d3MrI
         R9drdt67SNuxkXWmvJwoRESzyzvTM+Tdvd2M9T6KKwdXHKTqKXGqE1aB7zQz1nRCVHW5
         vet+jugOfy56V4JD0xw2JbjpGkP6FXNTvW3c1VmGArHcrkgAFOlP8Sa1+RCbu2N+Z2aA
         tjdSKbBUNoAKNENY6tTVVuvY86W5kuHc9XXEqBmsTlTe+0HxRhfWHIbK3e5wAg+T8W/F
         qbad5PNl1Yy/7X6qZFFW6Oo7y60haPANoo+4gwD6zh2shzbOqzBybdAOw9D3taqF5pmk
         Xs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4tzF5ZJXTgKfqcRosNis+efs/wFEuz1xTl1VpiMyO0=;
        b=XaxJgkckvtNik6g082d2nNEPCqs+XDZouOz9/l/rAIVCCk4FY7m6mavAFdFTZIJ/Ad
         qsVvkpawG+Ce18tDk6GvCK1tCjjP4yxydq2nCx4ef/pIyxbmGi2PoZHN6M6k1glU5uTF
         4WuZBN6uyP0VEAaqRS87dcixM4tom4ilemKwCK9LstLStaNC3ns9O0/IsIpNIdg/2Nfb
         neRS03gisSkcEgC3S2WxYqa0PC6YowU5MEdu693f8UBEfeHxdzXTBf8HMi2+AbSQkRvL
         J8btEXzyAUtw6KQNaOCQwwIeOoNuGsUbDMWSVKpDK0OMZEcgbUmcGgGUVyr+YDYEFTdq
         Lzmw==
X-Gm-Message-State: APjAAAWEDAaLDponSQ8YFLuFK4F0wjYKaOBMgIqQzfTttZTJzqHWLDmV
        H6bkHFHyO89KtronaS5NqGMEru0d
X-Google-Smtp-Source: APXvYqx6tcKU1r7qaaYSr8sMssGM//Lu4xfotFoq5cn8rHzDfn/+zTlOF7MIv+pK5f1a63O1TAUJWA==
X-Received: by 2002:a1c:c542:: with SMTP id v63mr11679165wmf.97.1567088961582;
        Thu, 29 Aug 2019 07:29:21 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d57:5a0b:4833:fc9f])
        by smtp.gmail.com with ESMTPSA id w13sm6188214wre.44.2019.08.29.07.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:29:21 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/ttm: use the parent resv for ghost objects v2
Date:   Thu, 29 Aug 2019 16:29:15 +0200
Message-Id: <20190829142917.13058-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829142917.13058-1-christian.koenig@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This way we can even pipeline imported BO evictions.

v2: Limit this to only cases when the parent object uses a separate
    reservation object as well. This fixes another OOM problem.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index fe81c565e7ef..2ebe9fe7f6c8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -517,7 +517,9 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	kref_init(&fbo->base.kref);
 	fbo->base.destroy = &ttm_transfered_destroy;
 	fbo->base.acc_size = 0;
-	fbo->base.base.resv = &fbo->base.base._resv;
+	if (bo->base.resv == &bo->base._resv)
+		fbo->base.base.resv = &fbo->base.base._resv;
+
 	dma_resv_init(fbo->base.base.resv);
 	ret = dma_resv_trylock(fbo->base.base.resv);
 	WARN_ON(!ret);
@@ -716,7 +718,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 		if (ret)
 			return ret;
 
-		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
+		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
 
 		/**
 		 * If we're not moving to fixed memory, the TTM object
@@ -729,7 +731,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 		else
 			bo->ttm = NULL;
 
-		ttm_bo_unreserve(ghost_obj);
+		dma_resv_unlock(&ghost_obj->base._resv);
 		ttm_bo_put(ghost_obj);
 	}
 
@@ -772,7 +774,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 		if (ret)
 			return ret;
 
-		dma_resv_add_excl_fence(ghost_obj->base.resv, fence);
+		dma_resv_add_excl_fence(&ghost_obj->base._resv, fence);
 
 		/**
 		 * If we're not moving to fixed memory, the TTM object
@@ -785,7 +787,7 @@ int ttm_bo_pipeline_move(struct ttm_buffer_object *bo,
 		else
 			bo->ttm = NULL;
 
-		ttm_bo_unreserve(ghost_obj);
+		dma_resv_unlock(&ghost_obj->base._resv);
 		ttm_bo_put(ghost_obj);
 
 	} else if (from->flags & TTM_MEMTYPE_FLAG_FIXED) {
@@ -841,7 +843,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	if (ret)
 		return ret;
 
-	ret = dma_resv_copy_fences(ghost->base.resv, bo->base.resv);
+	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
 	/* Last resort, wait for the BO to be idle when we are OOM */
 	if (ret)
 		ttm_bo_wait(bo, false, false);
@@ -850,7 +852,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	bo->mem.mem_type = TTM_PL_SYSTEM;
 	bo->ttm = NULL;
 
-	ttm_bo_unreserve(ghost);
+	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 
 	return 0;
-- 
2.17.1

