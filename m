Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443D440D8BC
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbhIPLc2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238223AbhIPLc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:27 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0FBDC061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id u15so8923854wru.6
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T5DpcdED+phJfKVqBt5o/EY6OXcAzmvE0YoSHl5BvtE=;
        b=fU0uZ2J+RWIVpW3DVAc8sgy4js4N5IF5HUiLnumZX7CwWYlCQj1o8SF4+pP0pjNDr/
         PfmAp2IWKPlEa061UWBfkdc+kT7ftsk6t0qM0e+3iin4JRN/j3AOEEYzAcMbHSSjxhFV
         ehYmyCLWBUBk+TQKYYi1Z056TEOUl35zFps/GJcuiFReWVO95lsd4yx8rYoocpqaCfUg
         ReJykU+0c1018M5cKEc1PMEzLcPlEon0pYVApNIcqqXw7OMMIhOlYHiW4n278xr0JnHg
         3Xi5HPWBxlbj8fIqL9YX2nEimV23EBK1qDBHgg2XK9YPzAF75tyYsdQqXJDf04Mr6X++
         ziMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T5DpcdED+phJfKVqBt5o/EY6OXcAzmvE0YoSHl5BvtE=;
        b=LRbHdgIjFUZX8RKWBCFzfiszcktGeeStEYjem+EQtXU3DeOAMm+N89aDyBbeMOo7Uf
         agF3QbU763wo0icpqpz5SEXjdXKmVLXkheKQ016vYDYNeRl8MO/qDc+KJHA3DCwfOS+l
         5/WCBXOIGYUyjNK9j8105rLqy9SYJyrFXEyzJQ2UArcNuH6JJmL0aWgYFjgJTur2WJE0
         HOJQLAWvkPEsdxaW8MDkU5BxBhyivt/b434+kEKj8Yy3Wz963Qm92E0EoxHEt+nVch0c
         d+FnsvEpbseDh/rpovmjeWUytMkd0nty8S6RrnV394YNtl9RfSOH2jvzCgEdfL9WrVr4
         kdaQ==
X-Gm-Message-State: AOAM531rsPKy0RSSFSgeI6Ne8wwodiRbfdZYtS2f6aVYBvypwvDelkON
        LxIk+7d1Nbkt5PSZVspCiHU=
X-Google-Smtp-Source: ABdhPJxIpVQhY2q/5xndvHi56fGo62qGWSuTVugbwaz+TG+lrzUbPfyvd1h/e4YHKxL+T1luxuGFoQ==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr5444215wrr.173.1631791865576;
        Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/26] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Thu, 16 Sep 2021 13:30:38 +0200
Message-Id: <20210916113042.3631-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 05d0b3eb3690..f3584d840edc 100644
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
+	dma_resv_for_each_fence(resv, &cursor, exclusive, fence) {
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

