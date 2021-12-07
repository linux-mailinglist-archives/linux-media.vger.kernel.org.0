Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1222446BB3F
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbhLGMiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236437AbhLGMiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:13 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279D9C061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:43 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id i5so29206221wrb.2
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gbmJORdWFTlKxxvK7X3M8XQMp1KTxZM5H1KKK8r07Vo=;
        b=D40iYFgmEVwmrxxeFd+eiQP9lgOoeXjNyjZ76/AkBDfS7vRlO8/gojz/MhisRbJPBN
         6p5tj8wINL3FMgbEPFLwsjMPSQtmdmkJeCKG0oRJjyrSj4VVw5WSQTXzzsACApjm+mKF
         NHgcuHhCtWJqSh89jPMCnU94KS85erHU7HRS/p7N0KfJkEW8FbKJ9IN1oLUuVrsIunxU
         WTDDf6QRM+aMfhQEMTwwp8KO/WsKpSOe5l2YD11zx0xboCA7gYXRAe1qOXhyraOfUmE2
         CquzkID+ShqHiLujajslKD2xrT4wNt9ETq6PmlsLA8aBVwkH3PqpYw14+BOYG3Om4fdl
         U8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gbmJORdWFTlKxxvK7X3M8XQMp1KTxZM5H1KKK8r07Vo=;
        b=KSJqS0ZW0DaeJzVTxPX1ZpbquXPJ57CpnsazEcxJO397kFlHXMkfcx8ate9xsj9Cl2
         IJ5YyAy4ef4JLmoJTja4uP5O0p9kdYhqatD6uDNulHeAdupdIplOS+xadYXZDpDG6LcF
         IgNx3J8+nQXcva7hLPNnk58FTcVdoYzvr5tNc4gQb4UqjZbbLToGTF66vV2YZ09woQ8Z
         RXfCptYVO/t6dICEJbR+IG6c9RvTRRX99dF1cQIoI6aOG/N5pqesNeIgs3+f8WM5sGRl
         N/Y8xE832cevAL/1OStXSRWPYR3TYP1ENuWCEV9pXHVKItMlc7nrBDKcTDCoYaFn/mTd
         7chw==
X-Gm-Message-State: AOAM531lkIgHFO5xqa7QENogQt58rwvb9VivBNfBgwTT93dyx1LboRtu
        wPmkZRrvHUWJDPdM0DQJBHo=
X-Google-Smtp-Source: ABdhPJzsvOjakge7Q2aJ3vV+UweZHczFmOCuSFOQgQ5ISW5R51JI7fM+hJ1q7P5Fnzx7QhHc1j484w==
X-Received: by 2002:adf:f990:: with SMTP id f16mr48998131wrr.128.1638880481759;
        Tue, 07 Dec 2021 04:34:41 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:41 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 22/24] dma-buf: wait for map to complete for static attachments
Date:   Tue,  7 Dec 2021 13:34:09 +0100
Message-Id: <20211207123411.167006-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have previously done that in the individual drivers but it is
more defensive to move that into the common code.

Dynamic attachments should wait for map operations to complete by themselves.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c                   | 18 +++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +-------------
 drivers/gpu/drm/nouveau/nouveau_prime.c     | 17 +----------------
 drivers/gpu/drm/radeon/radeon_prime.c       | 16 +++-------------
 4 files changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 528983d3ba64..d3dd602c4753 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -660,12 +660,24 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
 				       enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
+	signed long ret;
 
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
+	if (IS_ERR_OR_NULL(sg_table))
+		return sg_table;
+
+	if (!dma_buf_attachment_is_dynamic(attach)) {
+		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
+					    DMA_RESV_USAGE_KERNEL, true,
+					    MAX_SCHEDULE_TIMEOUT);
+		if (ret < 0) {
+			attach->dmabuf->ops->unmap_dma_buf(attach, sg_table,
+							   direction);
+			return ERR_PTR(ret);
+		}
+	}
 
-	if (!IS_ERR_OR_NULL(sg_table))
-		mangle_sg_table(sg_table);
-
+	mangle_sg_table(sg_table);
 	return sg_table;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 4896c876ffec..33127bd56c64 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -102,21 +102,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	int r;
 
 	/* pin buffer into GTT */
-	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
-	if (r)
-		return r;
-
-	if (bo->tbo.moving) {
-		r = dma_fence_wait(bo->tbo.moving, true);
-		if (r) {
-			amdgpu_bo_unpin(bo);
-			return r;
-		}
-	}
-	return 0;
+	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
 }
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 60019d0532fc..347488685f74 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -93,22 +93,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 	if (ret)
 		return -EINVAL;
 
-	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
-	if (ret)
-		goto error;
-
-	if (nvbo->bo.moving)
-		ret = dma_fence_wait(nvbo->bo.moving, true);
-
-	ttm_bo_unreserve(&nvbo->bo);
-	if (ret)
-		goto error;
-
-	return ret;
-
-error:
-	nouveau_bo_unpin(nvbo);
-	return ret;
+	return 0;
 }
 
 void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index 4a90807351e7..42a87948e28c 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -77,19 +77,9 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 
 	/* pin buffer into GTT */
 	ret = radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
-	if (unlikely(ret))
-		goto error;
-
-	if (bo->tbo.moving) {
-		ret = dma_fence_wait(bo->tbo.moving, false);
-		if (unlikely(ret)) {
-			radeon_bo_unpin(bo);
-			goto error;
-		}
-	}
-
-	bo->prime_shared_count++;
-error:
+	if (likely(ret == 0))
+		bo->prime_shared_count++;
+
 	radeon_bo_unreserve(bo);
 	return ret;
 }
-- 
2.25.1

