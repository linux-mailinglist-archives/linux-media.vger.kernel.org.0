Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8422B45A532
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237791AbhKWOY2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbhKWOY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:28 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDF2C06173E
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:19 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i5so39316698wrb.2
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7hlTa22QWarOC/D/GwKDXYcY+ynnKGNkNozyiGKICA8=;
        b=FCdGllJcVHqCf8Mmrtx2o7c65xOYOBgWAvUxQotbylOv8rRvg/Bq+IgN1z+q3ft3PG
         6M53Gq3PXfQiwwptvIh7434kf2II0sG1H/89bI2FFMyTEBuHwBtoMnhc3MzehUMsPJyt
         iez5pmeOKWR8S95xi4ThBz9xsuoLgfOSjHJmbbaTlV84X0YDkTjIz08b6sZlOhBymIAS
         kB24R7Ap1E+ADonJbwkmN7X7hUAAXUUNqGw9yEQ4cUr4XqamE5tBXVAlfPfZ9kjtdKkp
         pCf9WvPHz3qOgaa66apwZF2VTyjjoVrO1h25QN8PKOUrXgjWo76nWwIi1JzqYPhiWR7s
         5QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7hlTa22QWarOC/D/GwKDXYcY+ynnKGNkNozyiGKICA8=;
        b=0urALGJGfxTvD10YvJk+tTbcCt2QuZ7i0JdK2Qkz3eCe0l++5VqvcbgB1/+ruTMfaQ
         X+alLf/xRndH8PYyRZnovXmL3SkfP4O0Rnb5+OguEzUa2CglBlclrubMd62dOA8iNlri
         OD0b9hWWq0DxoXeOSWA+0PArP56xfg5ub5Gem1Q1+CeZn9PlqFjEL+U8rZQAAveaRrM8
         MV7kSLvzgt7t+4ZxfxVL7LJ7MDx9DbCmfLNMY5kWFWG9afXhh5cYow1zUOAdZZvtS7VF
         UHaFzM+qdGRmV5KWvkMd3WBwzETnwxvuqSMIMyIWL5rFSy9ZGSvUs7H7Kdxx7L6I43a6
         1yiw==
X-Gm-Message-State: AOAM530xQSutUCWTkdxnLuHhciv3StUrU+gV1yGyLosLEb8XYMTXCuJj
        rWsCEVFDsmwinXA7vpV4Red/ZgzazyU=
X-Google-Smtp-Source: ABdhPJwCq/sc20/U9XtjBTriweP61eqo5pPpAjSWR3OVyPxWa7Xtu5CDeOGg3nJ6y0Zp+4UlErbNFg==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr7407992wrb.436.1637677278619;
        Tue, 23 Nov 2021 06:21:18 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:18 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/26] drm/amdgpu: partially revert "svm bo enable_signal call condition"
Date:   Tue, 23 Nov 2021 15:20:46 +0100
Message-Id: <20211123142111.3885-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Partially revert commit 5f319c5c21b5909abb43d8aadc92a8aa549ee443.

First of all this is illegal use of RCU to call dma_fence_enable_sw_signaling()
since we don't hold a reference to the fence in question and can crash badly.

Then the code doesn't seem to have the intended effect since only the
exclusive fence is handled, but the KFD fences are always added as shared fence.

Only keep the handling to throw away the content of SVM BOs.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index eab4380f28e5..c15687ce67c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -116,17 +116,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 
 	abo = ttm_to_amdgpu_bo(bo);
 	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
-		struct dma_fence *fence;
-		struct dma_resv *resv = &bo->base._resv;
-
-		rcu_read_lock();
-		fence = rcu_dereference(resv->fence_excl);
-		if (fence && !fence->ops->signaled)
-			dma_fence_enable_sw_signaling(fence);
-
 		placement->num_placement = 0;
 		placement->num_busy_placement = 0;
-		rcu_read_unlock();
 		return;
 	}
 
-- 
2.25.1

