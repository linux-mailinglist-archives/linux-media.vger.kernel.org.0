Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254A63AB235
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 13:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhFQLSW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 07:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhFQLSU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 07:18:20 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE24C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id my49so9189883ejc.7
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
        b=aHbD1drE9FbjEyitAtdun/cQ3QyTanLaK+Y3bCT4fKCTIR1PW3W0pDZm1VyNa4MchY
         UHbjP+Vc4GfVwUbmH5SjvBJy8Tcy3t9PfEyqdPVDWzv53NDA2H7q3MauZcUyJFaf3EO4
         tDUmoCFv+cGdLDcG+/qRhmeK6NgN5HvSpG0O8SO3Fgc518ut9tY6DR8Se8bVv/GFjZ8y
         3ZrnuqclHm/x0QdgrXwv4D1uG0vYGia2mgjevoWFppjq8bPFcCWN71PDWzC5SP3Y+bhG
         Ue/Bk8A57XcjO8PzTNgxZfc/10yl9mozKfHv+sIOJhuSev6jgqstGh3JUKAwbFq6BQYx
         8pYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aaz1/XKVq6nri9Uw2UQQseQfjyJkmrID5vYRDnEleeE=;
        b=qKVGYCoHqIlemISAByxzYcRHGpAFSZqtbVFyHTMnnmLvMZ5Kyu0sTI12EYJzEZkWEv
         Vj2ZhQ8P3O5HlZ69M9HsOOrCtYenrmszfFLPLPcUbDWfApvb8SvrEC+QNvk57leKFKmn
         W/6Si27/ZyJqXY4UOPKmJ7rcJ04N8Q8rkg8n3ehXU/iO21pA7SSXX/9+ERq8Dq4rORZg
         P66T07sp71vaq+p+ARH7olgk5cwNJbYVosFCzWMfvJoTFTrb/hHVEer9vzm2P9/la+xI
         5wBIdm2aIp2zArvfaDF7orCR89XcMA5L6Kodoiu0MjiTaLVn/ZdmXucfVxlZz7ygrq6t
         Sl3w==
X-Gm-Message-State: AOAM53372q6TwHa9KWA+jT+OUpNyXAr2/6+BQOqK5cpEHYjMdihqnCVC
        rsgdfDugnoNCazN3b7cy/Ho=
X-Google-Smtp-Source: ABdhPJwoYJMNnGPh7pQmMwrYk0Y7Rh5oWm9rnGO6B3+1nHi8CA4dRJA2EJOwZaRm1RPhr6RMumZCeQ==
X-Received: by 2002:a17:906:a95:: with SMTP id y21mr4725045ejf.522.1623928571596;
        Thu, 17 Jun 2021 04:16:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
        by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 04:16:11 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, sumit.semwal@linaro.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org
Subject: [PATCH 15/16] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Thu, 17 Jun 2021 13:15:57 +0200
Message-Id: <20210617111558.28486-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

