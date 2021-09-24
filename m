Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A95417796
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347168AbhIXPdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347141AbhIXPdD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:03 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BEBC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d21so28560197wra.12
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=a4akh4ID5KuyrpALon1xoq8zr/R246FjYrieniK5ios7B0UV0Ai5dD8IlAkFIgcotS
         CQxisOr7JpNwDrc7+ebqHN1zLQNaNWVCAPOMYv1/KVTUsL+LWfZcNUiP4vOTqdcJ13F0
         51PObG/lazWsxIUOc2VafqxP2JYM5of6F1MW5smH30LNbCYYeN0jErS9IJSw81LxkRKU
         m27Vd/XtNf8ajn0sQj+YdbpPLMR2xMKH9/kshK06g/zmP6XCjfZn9DCJ1xw60903fqPb
         ehWMFECagkjPjoMx8hesovqK4Orywl/g/By7IFg/UTQ1bNGN+rpHPnyUURw5Ng69Qeeg
         EUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w7BNkgXvEij5lrUuBoEgmNvE08Hfx+8QGysrl5h5aK0=;
        b=LflI2eLHQjXiQmsG1QtgfUAksvOnFbfLFJrFjAR4VXKley3uEruBk7/5fK/7GqbweH
         YTCoerHHTNOLqY970tYGAfsrxvQrei6shNBm1VH0NRHJfjnKwnYHAvPhoFPLfXRitkW2
         dO+iYHx/OUm/ctaDRjqtpfQk9CFVHwew8O00yOZjK0vK4Q2ZIIvRU/ojc8vB2Ja+S84S
         qzG4FzwXxbMsT2dgCXJrMTu0WtA+vIQVe8/iJUwfEykPGmJzha/xj+R19+GL8+qG8nAI
         CtE6bzF173+aYSQhZ6n3+2tMRMEa3jLgpNQnU+M4Cms0u9h7lpuQMOFPRJNjfByU2ZIO
         vQsw==
X-Gm-Message-State: AOAM533KSA7GkY3ySBELq1rdnnZKda5nk7aGq1lJKopR0sbV1l2SHvLT
        Hp6K8+ULYJCM3U3x7n5+m3o=
X-Google-Smtp-Source: ABdhPJx7+QBhgNXmmAEUe0jGUM1umwFutgTQGiyXVPu52SHAcwWcciqMjSgrBc9YWfE+rcEQvn8NsA==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr2718379wmi.179.1632497485903;
        Fri, 24 Sep 2021 08:31:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:25 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/27] drm/amdgpu: use new iterator in amdgpu_ttm_bo_eviction_valuable
Date:   Fri, 24 Sep 2021 17:30:57 +0200
Message-Id: <20210924153113.2159-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

