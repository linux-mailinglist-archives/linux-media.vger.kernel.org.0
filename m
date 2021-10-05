Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038A5422539
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234499AbhJELkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhJELj7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:59 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4AEC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:09 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id o20so18738434wro.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=hBJOAL4dfMmkGwORlAx6thdAixCmACJcwxAh6lxA1dr/HFbJfPqIM8yhBHLoTZm5cX
         RabyEg9nbNetODRaRYA7Ofos5BqsIyXI/t5XzeavLaQ/jpVufxzMZrkKRaDvhifPxTz0
         gCc0pOd1Rjh1AdUO8l05w9s+OevbRe27fvFE/ltO3Q+SMHXmI9bBggiypVCiygDTZPj0
         5eJ5OBJQo1yaklWP68+gjHRU6vRXVFRNO+wrIjNjuFuhJDyFWA4MlwfrC6nuiBQM6TOk
         iRNNStQAd1aJ/XDvJLbEkyaMhsTh6Jwn+vXSWUSirLP3zt0mYKGCceFZMZVYM656bH+5
         gvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=efWUAoQ1maEy/mO8XHlFiceuCzvqtxsK7UrEbKFgbHUaTJHbEIjuQ+5bxobJJxbRCK
         Y34q7IBMUOxtT4+wxDug3g0uxn6R49DrOv4dmtI8Ujb02IlJaWFwvNZcmOECh8UeKWSr
         DfzmXOTPyohKhJrG2VKRCBZfgTeXvVNcPdvAoxDCNvbT+NtScowLkB/EgGuJTHloQy0P
         ThZQw+ZZGS9NvcIG2ENiRkxdp/Iq9j5+/IC/FmiprFRcuYHi2tRFfdcoOOunsRmcturk
         +Y46MR9gbSO+f2cHaSTKDfNRt2FBeWX2A4HUMj2unz4WTuSX7xYFttJrA+AdYrxzVit7
         0jbA==
X-Gm-Message-State: AOAM532LHm7kcQE4HZhOBpAW91xYwQL333gCtG2F4u0lV3EuVzaF5f9G
        KNLORuBYc7T5WSB27hjKAvE=
X-Google-Smtp-Source: ABdhPJxApiqsSEFGK2w+UXcwh1se1qIjU71xvk48Y7rm34ZDOgO6bjuWg2yVUMXU3Lt4Y+/RxVGBrA==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr19790040wrc.209.1633433887720;
        Tue, 05 Oct 2021 04:38:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:07 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/28] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Tue,  5 Oct 2021 13:37:39 +0200
Message-Id: <20211005113742.1101-26-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 48 +++++++------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 05d0b3eb3690..26f9299df881 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -339,14 +339,15 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 }
 
 int
-nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool exclusive, bool intr)
+nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
+		   bool exclusive, bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct dma_fence *fence;
 	struct dma_resv *resv = nvbo->bo.base.resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	struct nouveau_fence *f;
-	int ret = 0, i;
+	int ret;
 
 	if (!exclusive) {
 		ret = dma_resv_reserve_shared(resv, 1);
@@ -355,10 +356,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 			return ret;
 	}
 
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-
-	if (fence) {
+	dma_resv_for_each_fence(&cursor, resv, exclusive, fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
@@ -366,41 +364,19 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 		if (f) {
 			rcu_read_lock();
 			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
+			if (prev && (prev == chan ||
+				     fctx->sync(f, prev, chan) == 0))
 				must_wait = false;
 			rcu_read_unlock();
 		}
 
-		if (must_wait)
+		if (must_wait) {
 			ret = dma_fence_wait(fence, intr);
-
-		return ret;
-	}
-
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
-		struct nouveau_channel *prev = NULL;
-		bool must_wait = true;
-
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
-		f = nouveau_local_fence(fence, chan->drm);
-		if (f) {
-			rcu_read_lock();
-			prev = rcu_dereference(f->channel);
-			if (prev && (prev == chan || fctx->sync(f, prev, chan) == 0))
-				must_wait = false;
-			rcu_read_unlock();
+			if (ret)
+				return ret;
 		}
-
-		if (must_wait)
-			ret = dma_fence_wait(fence, intr);
 	}
-
-	return ret;
+	return 0;
 }
 
 void
-- 
2.25.1

