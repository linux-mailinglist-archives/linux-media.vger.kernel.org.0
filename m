Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E12141387A
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhIURip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbhIURik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D84C06175F
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:11 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w17so33489764wrv.10
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=h7aWFD+PuXjbmRX3VotvrSo1eGQ9b4/D6z3u2RBc7nF/p9Q8pGGt8wCirYKhydLZbh
         56n2fuwcu7ieonzQ+WeS3T/iBMyRSDxDfA6wSUMLqZdS39Gf8yWiu9KgYD2VJwpY/LVq
         4PtaQAQyDYchHHzd+qETppCMxu9E1vpOGn7zlKXJ+540EKsj18c5mXHmrVEOxy/51kcn
         FvANxPcTH9LZu7Nexi4iTrtxHCh4cYokAO/x3MGw+YMCAckk9V1Mgl/ZXoipVOX4c2Ha
         DaabBD89vP9E1qJ177UIKGU7nf8sbG9EtW8OrPw+0tKCkFvyyE1iDwnCVl/Ead4UdrFb
         vVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=Q+5IlBU1HCoVEvtDtZ6hIBwlEUhAkIaoj7f56zRCk/U4DYhtuA27WdJ9k1SFmvEg5f
         42llsJ1camYm7gg8ow17C00t/WByVD6tJCwdI6DHGWIP2qvDpRpimCa9Z1yd92QWQuJ3
         gNSsFNziJGAWZWzU0fmNKiv1a4cSNZLq7zvl4RmoWIwXnam2i3/KyVF77+tVvijrQj8V
         LoYTCHxoKPi7CCPSxaMYsEbPDKsQiQlGSG3u3oFafqNTXhCCbWOCm/Aa5ntok+W30gjm
         tGPlVv7X/Ec6CqAxDMp3iD2MaHxTkPoczt/Xj5iyRVIPcjAgnLLqF5vaQHF+wOECImzv
         NSNA==
X-Gm-Message-State: AOAM532sv0LItpe8uGTFnDpCZIQA2Z/EbYLw+XPHsL2Wx/Z1PCzO3lUF
        JBVV8IN+c1JVIKxyUcEWjH4=
X-Google-Smtp-Source: ABdhPJwuU2dsXpBoxIjBquv0otOKHcIDlb4fqCEVICYLhfwpq5O4jStIhLoDxEEYt7EXLlnyghpt2w==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr5873639wmi.157.1632245830102;
        Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/26] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Tue, 21 Sep 2021 19:36:42 +0200
Message-Id: <20210921173659.246165-9-christian.koenig@amd.com>
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

