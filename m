Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B6D4177B0
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347199AbhIXPdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347198AbhIXPdP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4864DC061613
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:42 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g16so28700495wrb.3
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=Z9YgoSWQMi0swZmjtdlmJm9oQRufLdcZM/Fk+QKFTcWara2nRxH6ZMFLLIE1ojh9JW
         qd+ITxakFpjTfC1yoC92bAHElJOaI8R0p+b79QFmgAhPYkJ9Y1757HhpBSBRiNQGsHeY
         1h3zAGM2YraR5hAj0XGyZxRjdSfk7+Xe7tG2d71RsgdUi3AgaqZ6X0vmALeIzqVK8Hjl
         PAZlW7gjLCgVifRauC7krU+ad1grJuZXnV02Xi7aDLfTfioqsSefV06PoJVgBFVZqt4D
         YxLzJzTgjV5SDZc1+Sj6PS+nel+/d+VXvWcTx4J87buVta4c2F3F1wiXJ+23MfR90BWe
         5QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/+r4v7UIazK0HaIgNf9t5Xden24q10DFKnoad4rknzc=;
        b=RIhmvKPq2ZKYggj/EXhFv/Z90o2oaiH+HvQd9Ra39jIfP9T9FNVTuf7ApR5I65/ZOo
         y0a7ddV3vPdD4MFg4J27lPEPol4ExyX7YDBfO0K2+WPouqdZYLhG2Cy7kbL/7dkZKrfh
         N3g9z6GMjFyE5M4hSw87WPblsBNQpaiolhPGez0p/uCD22gKY+UXI4hSnsFWV807XTiw
         IeIk0Sg9Qb4lbc1CzoZXJX9VDrBV1dhJpPC0PWHdC7PvNKtTPkcXuZjcEogTonbUKt0g
         +FH/izm6zUmqfCbNTBTMSTTRHZE1MQKWitiArho21Tve+e4TeLjJa9Gau9T2v6l3ZvWo
         mJqA==
X-Gm-Message-State: AOAM530lknL5J6fzzwqx+p8rydSFHg12fAo8oIvyjg+9aSWXsastUE+3
        fA30Q8tHmWU6RsE/ghq2Qko=
X-Google-Smtp-Source: ABdhPJyExBTORM3Xmjlq/oYuKANVHGlgS1MmSJcPgu3g82awnnlo3Aai1c/s1G1zWoB7O3vsEv2p1A==
X-Received: by 2002:adf:9147:: with SMTP id j65mr12063286wrj.163.1632497500882;
        Fri, 24 Sep 2021 08:31:40 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:40 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 24/27] drm/nouveau: use the new iterator in nouveau_fence_sync
Date:   Fri, 24 Sep 2021 17:31:10 +0200
Message-Id: <20210924153113.2159-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

