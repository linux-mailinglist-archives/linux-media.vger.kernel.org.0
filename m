Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE7341EA60
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353441AbhJAKIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353413AbhJAKIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:10 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE0AC06177D
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:24 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id a18so2536889wru.4
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=X3REhpDlVS9wIOne/RNjbJmWqf4pS8COhuSJuljJkQs36loC2xUyvxhwrAkwFnXfQ4
         WhItcIOHXFQ+J/XU0dNuURjauprDX/PchS89rW9dl9Ph5q0AYkizqqR+Ckkej4fNU5ze
         2UeyStYcoP1QsJUzuVa8cKuUZHK1siDvXW3xdTHwoz33ZHZrVx3HeE2PVSf09uSfNGZZ
         MN1mRHOGXjlW0E/0pHkO/Xf++MISf45UPyhYro7bkuAdoeQD1kVuc/FrIeGs6Ggm25SY
         FGgt5GB5ffo9/rdXivPFP5HvW4O1sZ9wedRGj4Kq4awx/lDT7C+aFKSZfSUR6wqo0rIn
         bw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
        b=pJuO0SbN1ZvPO+6svPCx3WIy9SR/eiMBCz/MeeToJg9PqfNPlx75VEWrMh3+i7ODKs
         PXz9/A6S2GM9dcAb8gESYFf2CnKvWvfQ8FRaa8COMISfwFT0u7xEL6IKGzizyKybx3s4
         8PzCb4oQIgtkGCur6L74nzdfS9rTIjAiJ0NqC7qNcbOltXQ/8rZGc9eRAqkIkspFth1u
         m6Uxce58EgOBjkOcAa8eczno7Yox8b1R/0r1wi97Z7YT5K6X96aksI7l7+JO4n6iBK6x
         rzo4tEmo1Ihy8ysZ+srfYxUKixIgsdG85DEbRlQvF9S/eGPvAd0KMMhbmyEhgEi832+w
         OWxQ==
X-Gm-Message-State: AOAM532ubdjnmAGMxYwoozI8V9w9nftmmsFNKoANBR7rJ41DKGIykw1F
        wlWOAPoZpBoSfYj6wA4RxAw=
X-Google-Smtp-Source: ABdhPJxkclJUwXiD8adtQWL2MmswZa03hGkkN/MaPO7pzJbsoLrk9yT4EdDewfRqp5qIEMwOCW0Xkw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr10547558wrn.273.1633082783149;
        Fri, 01 Oct 2021 03:06:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/28] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date:   Fri,  1 Oct 2021 12:05:53 +0200
Message-Id: <20211001100610.2899-12-christian.koenig@amd.com>
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

