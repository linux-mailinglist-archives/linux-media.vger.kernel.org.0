Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC7341EA61
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353418AbhJAKIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353412AbhJAKIK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEEAC06177E
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:25 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id q17-20020a7bce91000000b0030d4e298215so810294wmj.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
        b=Qjc1wIHm7C7+FZ0zf0J37xwTtZPLvOO6ASxDvrf3+VcrFSzE2KmeNFyiQaE/Vl+Rlq
         Jx8kk1cYPA9lPwImZ1HbLMioQPlM2SjpvNPVxIxJBpkB8GUbwvvObtiKWmwMYipkoOub
         uT6mAfqw8T6viENClrMypA9d0xMDMZ+/yfHRCaWYevYJyI1Is/7lIqgbFJye0EzBZk+L
         8ySgBLZ2PuMN1K4kXFltYLbBP9Y4Fhi1bIWjh6eoU2jvmPteWnEA7hb2fVoO2a0Lp1eX
         RDZu6OZZm8gVpIB8h+eQqnKJI4oKdq6bepcKhAJ4cXMWNn3gAJVsXB/hmshmn+ZWnSh0
         lPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
        b=J2/paFn1+0oaxD+YfmdoaFgnYCT7A4j8HZhq5o7tG2NRbCTjmufm7N9BOxB68AxeRF
         xB9gQNmLUksJWjUSYqoEeQY2nSdMvwWFpJCN7LbdlZXnjUG1dEXCq2uP7iMRJ53/xlL3
         PbtURxNi6rBRjYch9Td8ZxXendQkB7waGKvt7mHLTjeAV18tOyQiqm2cySkdfOIzD3IJ
         /mxnuFzOGq+sXOM/JJ2MkE6VRU3nbQH1w2U+SGWt8T4/ok4DSaC6JQ57PRVt6L6oGxjq
         quky9c79uvr+ZUwRAg8mjUvRv+8isYh7VPTT+wYuYZwJ6QV7URpMk4Gfdb41K4oCTLZB
         eZaA==
X-Gm-Message-State: AOAM531oOEk2tDE6Q0o4whlFBG5GOs4UaTECXq8RQS8yMnr7WntaBXeo
        QiM2BCAUgaILSg4IBGdSMbc=
X-Google-Smtp-Source: ABdhPJxdwp7ya/4uzZlQK5Pj4CHR/r3oHjNKAdXCi+hVDyDFWhNfKd+r+tsruJgQprqOmZaeu4PP9Q==
X-Received: by 2002:a05:600c:190c:: with SMTP id j12mr3706058wmq.122.1633082784009;
        Fri, 01 Oct 2021 03:06:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:23 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/28] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Fri,  1 Oct 2021 12:05:54 +0200
Message-Id: <20211001100610.2899-13-christian.koenig@amd.com>
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

