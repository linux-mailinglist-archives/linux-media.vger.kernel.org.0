Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57A5413894
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhIURjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhIURix (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:53 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E5AC061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q11so41607940wrr.9
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=DezIZ/zqMrvJNRjJQJ4BuPA9RmY6cMYv+qgLYnYUdJ0wrEi1pCUIw5oE48WT0E5GOG
         76i3HhS+tXzI246ez7iO8wVoJeZtgN2Mc+VCepgLpbukZBG3v7VqwdQ6kn1DfqaXpSIj
         SiT8xbas7bXl4zWAjJVRFV/6RDPdJt5NkW4xRQSkysAnNUO1yQhVqh7dMvsarlt9jwZT
         Wq+yA7WctZAY9EjVCtezUAQ72jocWEsSzrTAZrae2jQIRmZsS5a+5nA0Bcatd5PnU+AT
         N1dcvhDVpIqWW3Gmvb3JfGnGNfGu2bd2EVIWdYXmOAkOweHJ7UVSXW2umV2KCCs93Xr6
         wGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=7F6qg9p9rAbh8Qt5eSTgcANl0QWMBt+Rtbcl5k7KyqfmVOn4rgJdharEX+/6DlUrIA
         yQX2HE+msecmBPzo11k7StIg178TWk0St12LhhJNW+jynbVzh6qTsd1jc5wtZt9mrQGe
         hPPwY64cgbjbq3wnGJDruvUe5IQdp80Z5V45nfo0rrL2u3V64BYNY2wxGzk4u4XRAwrS
         FL1X18TGiaysSedEIs6xQJt83CtpwV8N4j8EsBp5/dPvqPzZLSHlLjy1OC2MULbW8vRv
         6oAkeZkVspePKyTOk+GehPg1GYAlL6wk55Kn8KXmyhV6kp37GAX/q2bkMdSfVDmJDNJi
         +e5Q==
X-Gm-Message-State: AOAM531z993YvCHszi/2IM4TqgTBsfmqUlu+0UeK4yy5PO28WGXhRlSE
        R5cYCgjtl3qW1uNYuBeLhiU=
X-Google-Smtp-Source: ABdhPJy7cYuUUlpnJMsuf+6C2wZsn3j0cyxhPGwEVbTrknxs0LwBf+UF0phAMYO3oZbMh+Z4JaDCng==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr35969754wrv.414.1632245843068;
        Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/26] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Tue, 21 Sep 2021 19:36:55 +0200
Message-Id: <20210921173659.246165-22-christian.koenig@amd.com>
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

