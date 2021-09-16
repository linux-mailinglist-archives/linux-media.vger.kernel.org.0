Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F87840D8AD
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238120AbhIPLcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238105AbhIPLcQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:16 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B19C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t18so8998722wrb.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxJJJSDTCra1CfnYbs8O9yM7o+tTKEbenryub8bPxkg=;
        b=UHV5dYRsTneue6sR2lXOMtMnnszWRzQ/QgM2uyVbHfRIsg0V+/mU68kjhEYlzAB0rI
         nh4eiCEGCrFPoOAWytHogtseepDsKCABfjnnvsCGQ9/rYqSaTaLkdI9DXngxupG7ubfg
         oakRwWh9bvS0srZ8WP/2VUCmMrrrtHrm4XKy09c54wBlc+/+pIKh8UwpSGamnXFv0Hpz
         FENScW02c+9JPp8AwoAmagniP9mHm3GJQKUiPmRLUc2nWUKn/Br++shaUuP7CedwzcT8
         m/llPq+aDUS1jqqIeQaZjPOyFB4jOicrFvM9E2CsjhwSy1pBAkmg/61iOGvBYCmG/B0Q
         8KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxJJJSDTCra1CfnYbs8O9yM7o+tTKEbenryub8bPxkg=;
        b=lQvPBFBiFoV4uPssz6d/ICK6i7mwVLW/OVzBd9sMx8sshdK/U8eQOdRSGwhgdqvf/V
         LYn6Z5N08hRgUvh8101XBhuHtvOtjK3ViXl7/Gr1vw8NkAxZH2fYC2KSmG4AWyz61O73
         8cJvTp42xJL7l8MaJ2QTQP6k6fs0aGD4OMzlbJHe5XDgS5Pf49sZLyxitw1bdyxVdnH3
         Ya2uff6aYs5M59Yvb7iNJv/mJfcRIrmclQ3DKTvYcKyrcmqIgpUK1V+tmgQQBppcxqcG
         MyvygN5MRtEHqugyjQUmYacJbJ+KjruB271MqFlKa0QrFqYZ0oDz3FmJg/k9BXJWmD5a
         6XNA==
X-Gm-Message-State: AOAM530/GTc6crmjQutpxBwIuWfd02v39XI2EdaIJmHQB7WutpV/yoTk
        oBin56Gegaytu4f4JctY/Aw=
X-Google-Smtp-Source: ABdhPJyzOq64SeC5x+VItbC5K1NTXS+pYXcHXULfFOBsvENWjCaq/UO38GedGwHkvqw4YdrRI4rOng==
X-Received: by 2002:a05:6000:1379:: with SMTP id q25mr5456718wrz.280.1631791853981;
        Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Thu, 16 Sep 2021 13:30:25 +0200
Message-Id: <20210916113042.3631-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1129e17e9f09..b3859c8ded85 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1332,10 +1332,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_iter resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1349,14 +1348,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(bo->base.resv, &resv_cursor, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

