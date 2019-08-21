Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9045D97969
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbfHUMb4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43702 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfHUMb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id y8so1848590wrn.10
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=byMlpBQbF3xVofh0lp2jF4TITt+perQZbz2APhqasSc=;
        b=GLfbiDkfSe/jJ4+8lnG4Ss4t3NH78q/f0NgMoBe3PR6g2vyVF6LPqmkOg5dLwMzq22
         7/rZaqj3bAEH6E+7/qBjb9hc7Ot8yTbAO0pA6BXFFZqwdX81uDvi8MDHAmOtLcRUUlqx
         T8D+U75/EYIgD54eIHMzfKAIf/uRvo4mjR5FzbYYFdT+kQXsOX/qbEo1nNLT1FkHvGAE
         S9NsHh26tpU1LuH49GJV+OBfb+EiVL24WnzgSDiuG6CA1f6aeNLk9G/M82S76i335D7w
         juO5WLd+XTHS8VJbtU8LxsbiUnK7nsKQpCsnzDlFeNFsfbXyWfuPa3tjO2aCBMqVsVkE
         ZMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=byMlpBQbF3xVofh0lp2jF4TITt+perQZbz2APhqasSc=;
        b=H1d3E6YTXT8nBj8Fzy/T1tC0MVq7otZSgnaQUiEwSCron1X+9wY9kYb99C6lkNkJIp
         cbxZ5CPaO7cJT2YgIXBc8rV9odAOVDd0fcmS0ULGqlPRHmN3NFHAz/rLa22S0y2Nf7zG
         xm5y6aQKQjO978ZISMp0D2ZxM5wT83QAze6lji0odbjB5XHsWZstI35wqElwwcdZnRHD
         seg0XMyi3b/hso0DcuRhRI+6mEHX7hEcoDLEjqvE3B1AXRV5zHoi6DM1z19y4FGpdK+a
         xe4ZDBTmrKYg1boFPvgBpFsz7SGBgjHppWrS5jai/8V5mTjceviLKpolLO9li1U6kdue
         AKYg==
X-Gm-Message-State: APjAAAXxbxlYFQngJDVqPe1tYmR/lAMSr9gfp+8OH5uhWF7tBXRNlqz6
        6PTb3GC+8lBEXBKxzR40OuI=
X-Google-Smtp-Source: APXvYqwNErrT3VpJ56IEwwDi6ZOxVcfM0i0WoOtcvyeOpdiiTb+T1UcsF4wj8z/pUdF2Mx6eA42Eog==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr993728wrr.119.1566390714544;
        Wed, 21 Aug 2019 05:31:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/10] dma-buf/resv: stop pruning shared fences when exclusive is added
Date:   Wed, 21 Aug 2019 14:31:43 +0200
Message-Id: <20190821123147.110736-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First step towards new shared fence container implementation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c              | 16 +---------------
 drivers/gpu/drm/msm/msm_gem.c           | 14 ++++++--------
 drivers/gpu/drm/nouveau/nouveau_fence.c |  2 +-
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 24adc32d36d4..d3a9a3bb15f0 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -271,32 +271,18 @@ EXPORT_SYMBOL(dma_resv_add_shared_fence);
 void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence)
 {
 	struct dma_fence *old_fence = dma_resv_get_excl(obj);
-	struct dma_resv_list *old;
-	u32 i = 0;
 
 	dma_resv_assert_held(obj);
 
-	old = dma_resv_get_list(obj);
-	if (old)
-		i = old->shared_count;
-
-	if (fence)
-		dma_fence_get(fence);
+	dma_fence_get(fence);
 
 	preempt_disable();
 	write_seqcount_begin(&obj->seq);
 	/* write_seqcount_begin provides the necessary memory barrier */
 	RCU_INIT_POINTER(obj->fence_excl, fence);
-	if (old)
-		old->shared_count = 0;
 	write_seqcount_end(&obj->seq);
 	preempt_enable();
 
-	/* inplace update, no shared fences */
-	while (i--)
-		dma_fence_put(rcu_dereference_protected(old->shared[i],
-						dma_resv_held(obj)));
-
 	dma_fence_put(old_fence);
 }
 EXPORT_SYMBOL(dma_resv_add_excl_fence);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 348a7ad2c044..90e3dc3b927a 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -668,14 +668,12 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	int i, ret;
 
 	fobj = dma_resv_get_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_get_excl(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_get_excl(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
 	if (!exclusive || !fobj)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 8df390078c85..42ddddbb49e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -350,7 +350,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 	fobj = dma_resv_get_list(resv);
 	fence = dma_resv_get_excl(resv);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-- 
2.17.1

