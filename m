Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165F040F7AF
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244207AbhIQMgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244166AbhIQMgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:47 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42371C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w17so6771317wrv.10
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=SO70r9SPYDkl1XMyj0huOLAPFmdIU/7ZO4zWgU5Dpzy/bzQ61KlGNo+7xBceV6FSYt
         WD85kj6Xps1VCNe86OkoRhxHupXCOMn7cHcN0DhQxvTonVh6UDNa57vqXq3qX3DSz1C0
         f/6dyrUP2wNRzXywrxwrPvLNBcm06YANoVsLplyOwFjI9j9k0eac4xfrq2dRwb96RPGS
         h/MiUpKGX/oXEGmw0a14vepokZKAGGPUrljQaRA6i6K7CQxp4A5wMWuXSd+pITu9LMh0
         Klcskx3eZ2JCYh9HjIfjMjRWAzsScG1CgngpNL6EKl8AnKuvQS+JZhixWztoI7IUb4Ce
         yNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=FVFXvmubTHEmSF+3PQ7WbZmsOUspxlf2jVjVVfTxSUsoTfrtUG/yEzhthFOUTvz172
         B5bhcGMWdnU9BWpXacJagVZIQuXG/kpqu4MRTG6Z3uIBBWuBk3r5w/spL2+nWHnuA63+
         4fwGmGinQFmNrVWLAYGtDNKDrnuXmJliLiF7fLY3Qbu1xyfcLUASonPPOLmg5fBklM49
         2tFEXDsLjS+VX6N5EIvS65trlXmeeb+mWwdRHgPsGebIbfJbr/JXC7V3Orgus2q02AmJ
         nbm5TMG2ew7XTs20locpCe+MxWpJ+C3D+xyOPXR6zdYVzHqNtg9YcIKO7Wu0NGyrwM09
         2o1A==
X-Gm-Message-State: AOAM530I8mUuyRo8MJLr/YmRhrCmbn2reZ5/IRUeiOfRAsCIUxe8Jw0U
        XGlF8wpO82vHbP1JvkZOZXPH0v0Kke0=
X-Google-Smtp-Source: ABdhPJwOJvxsaerqCyTR6Vw7gWrPLu9hZ8OXjaUvsKD7Ysuf/lHgKybjHvCLAxaiBnBfnGjpX897ug==
X-Received: by 2002:adf:9bdb:: with SMTP id e27mr11699354wrc.162.1631882123948;
        Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:23 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Fri, 17 Sep 2021 14:34:56 +0200
Message-Id: <20210917123513.1106-10-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1129e17e9f09..4511cd15c3a6 100644
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
+	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

