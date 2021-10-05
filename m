Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E81422526
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbhJELjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234430AbhJELjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F33BC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:57 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id g198-20020a1c20cf000000b0030d60cd7fd6so2676527wmg.0
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
        b=TSeRJ+qkpA1eghV4lfrllybunGX8WejkpRoxqq543rLTeKa7DZHVn2wR1tASvGcF+2
         YSnfrhiqlKVwwq3BwbMQ8DZBMrrqtJVajopWt5DmbRT2UhlzHcEPKYiydW11gfVTNyU6
         8itx/NTbG2pZpcn4uY+lOPwXhQohZpgaiKl5R1mKTyzcEUjPhQJOUF69bLIlyWrHZY3c
         ITPm+xuWN/jJ/Prvdb4ygpwtdCHFOHsrYXNV5DDV7gR42jBubLvvLN3bk+cSkpQsDZhD
         HqnnQjO/NQ7RIre8RhRO/fCRaTpelP0GJ5hg1J0rEHuydghCZvFou7sMwLraORdyoo45
         0J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
        b=rTWlEFGBiZSMcLdaZiyk4ilEtQE6qod4MsHETz4iqkSVD1Zwb/s4OmjX7apBdrVxpO
         ILOdHbADH8YBDGZ5rsah9JRKTjaMIW4zWyjqyy71vu+CDsfRccJ0z3Oixn6b0P1yjjmT
         N6HqmhAGGH6SHly3YGF31XGD4gIVGgo0ImqfmWEhilvxrWxWCjFcMzLHYvpTAGctq4t0
         0QvbbEy5jEgQbOS+PtHMp5T0/lqWtcCbfiMErSp6LvwbDp5JfSsHRmzaqKxC32H6U6mg
         9vOw48HyhY+nWt1MbabCNq2HZZEidGwznK0ZuDKRl0c5QE9nFz3oeqYQ1NnrIA/CxnFJ
         xZiQ==
X-Gm-Message-State: AOAM530evY1+b0sZcz5ZXySQVtHbUNbIP27/5U/tdtC33S2+LXU0NY76
        jUif9qUS3+3IGa1DqRZtJRs=
X-Google-Smtp-Source: ABdhPJxEKoCjAGY0f/BN1VErxnsB/ujyvHpiYNyMr6i4pPYMxemcnlX3MniDy/X3LY0S+x/nRkMabQ==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr2887218wmk.51.1633433875811;
        Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/28] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Tue,  5 Oct 2021 13:37:26 +0200
Message-Id: <20211005113742.1101-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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
index e8d70b6e6737..722e3c9e8882 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1345,10 +1345,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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
@@ -1362,14 +1361,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
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

