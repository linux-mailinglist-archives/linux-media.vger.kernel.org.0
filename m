Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3E52C3136
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 20:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgKXTqN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 14:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgKXToU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 14:44:20 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E78CC061A53
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:20 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id t4so10607633wrr.12
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 11:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6BIBjiOdivrzYawdrQqwhLZi7LHNHFFVX0tDFPG1aP4=;
        b=S+ft6BuTv+JtOVsSGQS38Kw5N5F+7HgwyqOwHtI4YmLpPi8myfl9uf/3DTCLKlBmG8
         U/KUA9OBoVwRem49Ansk6PTyOuiFaTFxK5D05JMdRD7lLxS4N3xkpFovqXuy2TQqaVfs
         llG68eAtYZkhHtrj0DvGypS6D7uB0GwhKM0lfgXPgCLQye/PAwFaX277L5GeutR9iNmh
         3abHn1zZaQm+XcmKhu1ZDH9CVjBLpPUHmv40UTGu0vA3rVieMl0msCICGCSRSV8YmCU3
         Ejlgn+3iG7Xh/BB4gBDCEWBaPXBQe4QCQgSdD1+cWLIE9PhTH1syZe5cBsnSIciT4eb5
         rpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6BIBjiOdivrzYawdrQqwhLZi7LHNHFFVX0tDFPG1aP4=;
        b=rmwXk/jWngnr4gT9hiJp3U6qJGZ682Kj8F3mlBYgtd6fYJjUvcCBimuA45wsiTt5ZF
         mSKYWYsPEhqA4Jj3nHG3sCh3aETmSBcxme+fiEOUEJSpEgTQ//QEfEwASoWwrwN59zqh
         qiWBW7fg9s52hmvQIvU45WrSF7T9FKFUf+l/id/7MdYoBeUix2PRP4TZ+TMW+4f2CBg+
         JrT5flrruB+NMm+PAISbXN4gCEMHeSy5QlCSHj0ABWJEg4lc+r7AyeheAM4pGONtc0lp
         fxcC8yp1XAv8JZbELRSpAOJNPTdYY3Qdgs/sVSyMT4UMqef+aI4e6Hn0JqQIdIPvMkJe
         6UlQ==
X-Gm-Message-State: AOAM530uekK0UXBaV9ve5s3R3PQjJf/L1OeM4QaZM5woQh1aobiXsMZD
        ghJQcZyG/VkA0qL7SC3bG09yxw==
X-Google-Smtp-Source: ABdhPJxIYo1Qzypys+c2KpL3kCVX7Czyu1/i5hvXZTCGnC8/99RXCscGF1oBsQHzN7Tg9eA66na2nA==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr126337wrn.56.1606247059082;
        Tue, 24 Nov 2020 11:44:19 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 11:44:18 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/40] drm/amd/amdgpu/gfx_v10_0: Remove a bunch of set but unused variables
Date:   Tue, 24 Nov 2020 19:38:00 +0000
Message-Id: <20201124193824.1118741-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c: In function ‘gfx_v10_rlcg_wreg’:
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1416:18: warning: variable ‘grbm_idx’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1415:18: warning: variable ‘grbm_cntl’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1413:15: warning: variable ‘scratch_reg3’ set but not used [-Wunused-but-set-variable]
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:1412:15: warning: variable ‘scratch_reg2’ set but not used [-Wunused-but-set-variable]

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index a6d03931f7fa4..d4760f4e269a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -1409,23 +1409,14 @@ static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 {
 	static void *scratch_reg0;
 	static void *scratch_reg1;
-	static void *scratch_reg2;
-	static void *scratch_reg3;
 	static void *spare_int;
-	static uint32_t grbm_cntl;
-	static uint32_t grbm_idx;
 	uint32_t i = 0;
 	uint32_t retries = 50000;
 
 	scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
 	scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-	scratch_reg2 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG2)*4;
-	scratch_reg3 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG3)*4;
 	spare_int = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_BASE_IDX] + mmRLC_SPARE_INT)*4;
 
-	grbm_cntl = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_CNTL_BASE_IDX] + mmGRBM_GFX_CNTL;
-	grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
-
 	if (amdgpu_sriov_runtime(adev)) {
 		pr_err("shouldn't call rlcg write register during runtime\n");
 		return;
-- 
2.25.1

