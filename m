Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FCA40F7C0
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244282AbhIQMg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244280AbhIQMg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:58 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3945FC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:36 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id x6so14882605wrv.13
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=qcdDHMrY9dAkH1CfZYbl1paITikRgjzIfXYfcWhnMMotQgyVybJVfg2I6jsbnrUtto
         i9d1iz2w9lUQ3Tp8eoYJkCgSPF538vXT52MeHh7t3IAMa+I5GdC8Z15ZEdU4E2R3y0Mq
         KTiVQB7w8RP9jLv3SpXH6ZC/MbL5lRAyEXTpTzhlRaYhDu4wUC0Ni1XL3/Lh1TQFbDJ5
         wFj7/2W5b3e9HYXeb0gEx/AVdp7HAg2s+yhCjpKf/AfwiKhgQDH5R4df+kLyTxBxO8Dl
         pXUj1RvL9fDfnLXP+wD2tBv+WWBeQN9WG4+vRGP107Tz3CROmbXvVOfPI3g25qQFOzex
         vv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=dr5NJp/+vY3DeiYDVb0Y2VxZZJYmaNID7rESb8a8kIi6ig5B2TWLsGfXbWZnhTJaDU
         p/byKqSkun83PpyxknLMZh0Jhg/47uM/Hvfx5/lxwFR0TQYvfBmejNohn2AuekA9nwPb
         gWmcclm7oo3wKibXpEpCQi6OtwYO9lBZB97OqNKqP/oZIHxypDo+zDfRniBPyde5n52C
         IrSR/ZqAULhNxS3DXlkfr+LAJu265Hv5+oO8RwD6eNXl3H7ZlW7rASLPAUOfDuGgpKjQ
         Zk+jX9KLd13fzOB3OxDMJdLJlGFTcRVbCfH+tcww/kO4SK8RHGEJ9vosR8VgOag8z+UN
         MEPg==
X-Gm-Message-State: AOAM532+ehh0AKYIcZsh/bHa5UOYTfQNtTU34aJlQXsYfW6Xsy9lEH6U
        Df2MCvX04YehJqqVEaFimyE=
X-Google-Smtp-Source: ABdhPJw/ijoW4HVKLdVG3icsgL3cLccAIbN1qtLlkqGp8bmKWjWNYHwK4hhXW43D4RigPblzMDVsKg==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr11700230wrc.162.1631882134915;
        Fri, 17 Sep 2021 05:35:34 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:34 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 22/26] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Fri, 17 Sep 2021 14:35:09 +0200
Message-Id: <20210917123513.1106-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

