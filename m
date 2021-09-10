Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC68406863
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 10:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbhIJI20 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 04:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbhIJI2W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 04:28:22 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBF8CC061574
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id u16so1450126wrn.5
        for <linux-media@vger.kernel.org>; Fri, 10 Sep 2021 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=AF9j13vF2C40YiZF8YnlmkRI+2y0Zgx5gxsyI8poos90I9FQMyjQftYcu/PQQbKRid
         qbgd2bSNKqUg3uORGqVR3m7f44omguz6cGmpda84jTegLUf6kT9iGnfiiMCKVxGpozGt
         4DkOkj8JqIxYhcy+Rr+gGXH4WA060kafbhcNNdhGWWVehKlZ9gj/F8BgSvTTUyTPsQe5
         V2k5ZBmi2Rg2/UiszoM7SXqfPfEp1yQVwjHSCgWMRZjh8ZMnmEuNrI3xnBZxt3f7DFRD
         yv8Chc8CTkXgJgzEe9h+eMgYid1dfBUqacTAw9N4IkxYm0gzfAl1auYyqd4X66ZoZHkn
         o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
        b=rCayaOyXAN8DJE3UhEUkreQuJChY3RVVR/HjV67hwLj9cQ/sgnBoG3tSwz5DWObGNg
         2nEHJOoF281mMBIc1uxKxGvyCksYnEUuv2TiiKDysPF/hWUsq9itWqFXBrBgAylyejCH
         eFMJo0XhFXEF/bWb/l+TqT0eDNOegOWjDt6tL2YkJeSHCVdeYrZ/6WT30c9lhpUHrmN/
         Dtr9FYMXaDvKy2Rwu0lAUTd6aSdS+HO0wlDXijB4eD2O9Hv3fgrBnct2rfS26vH28yhX
         Xr32YeZAUzD5C10kreeoifzOkZuncD84SVv2KqW1jAhaVJVudXRd7ZxCQ77coSeEnY9M
         8pQQ==
X-Gm-Message-State: AOAM5306xCnm3rbnXCBZhICrNl7SMHGcJE5sR0zD0I19MESUA8JS+uud
        t4jPyGlYyVjiJ8CWTYu+QwI=
X-Google-Smtp-Source: ABdhPJwY9+avZrDVp15kV3L6A7ao2zBHMwJf/F8q7CwTgO/k1/czo3Esq+RiUn9i7G+1GaBzEM4rZA==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr8365190wro.339.1631262430440;
        Fri, 10 Sep 2021 01:27:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l10sm4429756wrg.50.2021.09.10.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 14/14] drm/radeon: use new iterator in radeon_sync_resv
Date:   Fri, 10 Sep 2021 10:26:55 +0200
Message-Id: <20210910082655.82168-14-christian.koenig@amd.com>
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
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

