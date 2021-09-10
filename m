Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459AB406861
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbhIJI2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhIJI2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:21 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4431C061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:10 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so591165wmh.1
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
        b=a5N8gtB7x7wOQgsGTg5fo6+i3lIEKECnuhibaXMwLjgukcuTNZnoX/3B4gLOY6qTQW
         i3liQ75PyfcOy0oqfGQACaIn4EGODYUmw+q+IsAAy61R1AV4yWfcHCC4TbwvMFNrxPl1
         MnDak6yqI7rxnrWXq/TFK35N/EcQ5xqfgaiI8JpZJErEWXa3MFX/T5fIHNviAH77Rmnq
         Bt7P6vIRsHeHvDy/+Q0tlyKZh/0bRqahIBIgUgVi1b//SkXKgLFzjdMFp9eYNpQnGa3U
         sPWtLqZSUSWtqyuJ2iUhXZok33rbWfgQ3+08gdlVjLKdw65v59E+akJuUgTUPRM46EtZ
         i85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
        b=0+QZh+SWgxES3QVYX0pY9ia+wDy8LIFf0mIbL3g9xvtfFpl+MkxakbUE2M6vFY21x5
         fLo+QTRCAjyIO3ZWuZ/e5rAau+rw9X8QNubpFMsPBZrZkgrme93QcM9ZjaVlR7WsICWL
         o+YgZroJ3Wj/0sILH0e56yuzshbiRWhkz9lpDsV07ZG28b4kr+IzAuIPttuzBXSJ9+mP
         vhnJeEr8pzCUqkGoPCH5os7WQT+miCwln1AGCy5udMvHd87eolnCAR2fS6K5zcYy8Jdf
         Bu3cT4pA8mCN7yz4mIufms256lZ6OSuNNVeHODeH6798wizTVAyMTZRoovMGs7WVFvhK
         gZdg==
X-Gm-Message-State: AOAM532u1utQeyQWdtJCxTCVCtzCU7O55OibCjKi1YB6YxX2YEwKGxpP
        oGOiV7bhNoekqjBm2zZc2t858IVWPiTMRDVi
X-Google-Smtp-Source: ABdhPJwNg4sxGjY/to3Qc4OVsIG5ULofcu9pKXMqJiXuSTeSZcYd/FZeSHgrkCBst++XlHhVhSWXsg==
X-Received: by 2002:a1c:238a:: with SMTP id j132mr7157728wmj.185.1631262429324;
        Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 13/14] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Fri, 10 Sep 2021 10:26:54 +0200
Message-Id: <20210910082655.82168-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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
index 05d0b3eb3690..dc8d7ca1e239 100644
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
+	struct dma_resv_cursor cursor;
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

