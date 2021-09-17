Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18B640F7AD
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244206AbhIQMgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244172AbhIQMgq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FA5C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:24 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q11so14924814wrr.9
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=H+xduvAwk0tvPlIz4R7BPPhKlSH4Dd6FCZuuyCcoDfZ1PJKqAqjQU5QrSxkNzlqOSQ
         8Pj9zBBcyObfKfKzOIRE++aGIbZCUL1GjuL/YbGZT6cZEnWRq7Cq2i/NfrGPSTYqPtDz
         QRnRqiH8WMWIk0EdkmuKL9Fp21P8PYXNxNalhnT8PNJfio7fWWBM6icmCcHBSYlaL070
         UidpS/l7dlQI1ZLhsqsSRex9za9ebt04HaI6Eq8g6QkpBvW+6sryAhmKcHuGHdSd65hj
         hTpY3DXhThLxd1eemaZsgN64+kO+ePO3SKxKl8c3Ipiw+vm2RqoCucf+FJR9nfdp1uiG
         Cemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=Wkn0rKWFhUjvl8hHL8/Aqv8C9FAxYmjqY5A0+GsyAndxh1lN4+GUGznSNZmIG6AKVT
         pferdcrHlaEbj/75KZhtwafEJexqIKtumrNbKkuA3V3vLb+3LFm3uHOKgtDv0PGMgh5j
         RQR7s+yrCouI3Jw1Rdlb84twXY61SFSQV1P6Scl7QpK5WURIXj97Fkc+wORhng8LJb+X
         YGNf7G4C+peWc0Go0ETuxtaevQUM3InDsQiETmCc2cgJ9Et8oNtOmOV8eR0u2GNq73Fa
         sfZS+lb/Yf5BGn+5hBPNX7zzS+Db8O+a4BEPSkx7+MGA0vUaStVRE2KG+tSOP74+4TMk
         G9eA==
X-Gm-Message-State: AOAM533rr6x/ixl2SHPI7ec5UiCJz9vRY6J4SFM+kvZ9teXiaj0rYWxR
        DobR1fkvHkttY80YapWkwo82vh8mQxE=
X-Google-Smtp-Source: ABdhPJxuQxhRcJcS8mN1wjn/sh65dvXJvqvjiWb+kwA4oOJfMAluglm+7xiaJRdFYnbZ1ZUHOHC/Vg==
X-Received: by 2002:a5d:6cc2:: with SMTP id c2mr11396765wrc.53.1631882122963;
        Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Fri, 17 Sep 2021 14:34:55 +0200
Message-Id: <20210917123513.1106-9-christian.koenig@amd.com>
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

