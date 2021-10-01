Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEDE241EA6F
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353478AbhJAKIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353386AbhJAKIU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:20 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD7EC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:36 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o19so6826524wms.1
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=GEIzzdUFcSKpvoIwIy/MzrJapJAKZntSukZ5p6roG1d5bVF3FTwA+A/81iLTZfDJm7
         B14RDR0mktQK41PBvkpcUZEYZaPZ6hyZsZHjxZde46wLYQqRqlTECjtWvnAMkk9RlrL4
         PlQRRB85sJS8tCJhNJhAljJg8zPFWdayIFN+7h/y+N1mXlaA5i8uxoUphxVnv25weZp2
         z7EeR6gOksmOb2HpP8Nd21+iaqaQycJfOPfM7dJ7g2MRLIQxGhaSBQa1PhmHR4VMqIip
         Fszd2ATa+I3mGa0kyJb6vrgPEoG/1mKQxtiPPz3rosU18N7AchmnH74E9obNFjBS3I3k
         6OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=ahji4mVvuYeQhE5zjUJ3abDorSPV0f7DjT+wZWcdJw7UFKpAoUtzn9SycpRcAxrEey
         ALPg0CWXsLb6Gy3pc4Ho4N2GxPv999z2YQz69Ztugr4Q5nHAH38KqNmxlG6ovzjv9GzJ
         dnxvYrT8qTlexadFtDlwGjw1L8N4aOanI8VNNGZEWKIg6ZYdiuAyTg9OLWyqumjSJPNn
         i5mf2nuCsRt7JWyU+CznTHSpOt8ez/pIR1FJ0Pk8aKN+18CSjAJVtchAaKoUoIP5Bd7e
         CEYe32N5WLWdVxqtEacsLQBX/8ja+Jzhqduc1KKHfu4IqQcb9KZK62ufbTEMUPsVx0hc
         eN9Q==
X-Gm-Message-State: AOAM531a3EqZAZBIR+JvQNc7erVA7LWlaXvIdKgoQ9A5MBUEFEOVZN0S
        rdVTm3hIQEwBIjaE3kc7+ms=
X-Google-Smtp-Source: ABdhPJweZo3sMdXN2Yo33ydRmQ3ZjHih+i0AoWONKI3PwdRb0YyzMGRwcws91yM/HxU4EVObzQH2FA==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr3537527wme.137.1633082795149;
        Fri, 01 Oct 2021 03:06:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/28] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Fri,  1 Oct 2021 12:06:07 +0200
Message-Id: <20211001100610.2899-26-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

