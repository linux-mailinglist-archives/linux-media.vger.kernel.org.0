Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281F54144A5
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhIVJM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhIVJMZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:25 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07ECC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:55 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d6so4581998wrc.11
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=ZePG+/1vd1IThRDah7nHJcPUXQ93Anh10UUA4HX4u82Sn+rE+pACGJDmlxiqUFTYHp
         r5M+FeSXVpVfIDACWNCAgLEkJ7rKl3tUbqsy0GvGcdRD0/1jsouksS3ufmn7JQuxtt34
         FFqTgybS7bebTRgTNX2Yot19rhUmrB53cCoZq6Zfo5Trocz4lNqfcwKrdcf5tSJCOgd/
         bRZ0f017zLWNH9R2tXLGKyzIyxrczENdb1YfYppIhN919HhIEWAiEkO7LBLnmYzo0tT6
         BbQWcIllCGM8sf1x2iY3fwaMm/YEknjvL9GquztLB+jZHYX76Dyo8XUSk/TwsnCFzNEN
         qtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=F26SRALLMQR5tA/lfWAwTBzoERbYjARb0NKOXrlyDjqcs9N0LdZnvRjzv54fWCbirn
         hSp2hMXijuf/MBBYw05q/qNwHEdjh3q19f9QS9bjMy4xp/VPnBOJudtGHjgh98bUJLih
         OjVwjnFIYLNfROViN/0thx2BlBLorEIq/emRdy4N4zwgZ46Fs9lCSnXfIPQzoN+GB6bS
         1anFfh6/u+LWFJOGPt4Dgi39bi6r/6IRAKE6nYKUe5B+oqJvNDOdju4/UhLA7kOy4afV
         c3SxOsZKeDam9w579wUB8yGYxrRs3O9Do+CiNe0T0VTNJJK1NIOyct5zhzezQ7Ucy9kM
         vn3w==
X-Gm-Message-State: AOAM531wtiR7VQIV/RyoO2HQ2nVunwVi7DjzTsWs/7CzPt22lC1a1iNw
        OtwEFNpXptXbjWOX4ThJ9wU=
X-Google-Smtp-Source: ABdhPJxPq6i7Q3c7lCY+x7H8Hymlc6kGWpNzBUmA2nIK9j/c174ZhU0tZSOYi2ReXcx3vCsnZConZA==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr9557710wmh.117.1632301854575;
        Wed, 22 Sep 2021 02:10:54 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:54 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Wed, 22 Sep 2021 11:10:26 +0200
Message-Id: <20210922091044.2612-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

