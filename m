Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5594D413879
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhIURio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhIURij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:39 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798E0C061757
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t7so8354885wrw.13
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=f90LXtFRXtKJDn4uKSQnEBW8D1SlWElg5O4xeEUOqGVkwdBPNP/q8LJYXvMSmVlEmT
         qVgkUrV2iqSXc3JyfSV1HGVZSR+HEO4zuaoP0pGWlse9f3W9Hdscnt3CO+gqpv5lc1aL
         9bfbs4m1hfr4lHxxkaBlmX5+SOoJFNh68TG3f4pg62cltvOsYtxOewJjWhOL/BgrHRnp
         Lw7YgzjP9T4Mp82ESB1ImssdMR3uou+yDcLky9LWguv9W+5TQzFVJSjzFVRuvUt1nTX/
         dciLLbCqC+IX2tyabgMUWY1pnfnhdfClexC4voHBtSqFfd4V1aMvxgNSK5JRdLWAdSAt
         DJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=JIvcQkmhyCdiXfikUAtgf0VIyOaeKYavc+SA/n8DUGiqJnr9f1nV1v/x3hZnVXOqem
         RCMBV8llY8xb2p6rKppUF/zwGt5tJA21qK5uB68jzH2yGQZYG5DGM6M2PrV3PMbvBJ/X
         vGKrNpCB48IJzbhJomLaOJV92lM0Ve2r3g1rod9jGvnt3nRSQParnlBhaiLoZTLkl1Kb
         lW006eXLGE4nfEfO1z+kRTzbKkU/TP3Q14eebr8vW2tluCr1ESgsUuKr2F8Q2O+U6ZFt
         XY89IQMNinlG7ecQNha9Z4uWZBd6onAHVgXthoY/kU122TYyF9jdAqQKt9Y/ha08EIJ2
         bP/g==
X-Gm-Message-State: AOAM532X62ZdVKWzEEgMS20ijbK0aG9o53ND6KmAavn8hTBhshG663ZM
        AdAfYZtdMBg9Ewtgl9D9PXI=
X-Google-Smtp-Source: ABdhPJwjPZB/DU++bulTsI5pVdxKg1lMKPfow8+x4fcDYyYQLiGzaVVz3OqzT+5zXi11WvQ7Em1M0Q==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr5795434wmd.9.1632245829165;
        Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:08 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Tue, 21 Sep 2021 19:36:41 +0200
Message-Id: <20210921173659.246165-8-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..f7d8487799b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_iter cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(&cursor, resv, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

