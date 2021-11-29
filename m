Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3D946164D
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243209AbhK2NaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhK2N2I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:08 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A46C09B070
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:17 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so36233727wrd.9
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=KJ7diNsGhQm/8Ndo7DLAVfBuhYtC+4Pxq8mfU3h1qgbXKcUPTd8zGoZPYRUg+is0MT
         DWl4HXOFMpYpzQA2nbcRJMEXgFSGmne6TPWQM2Jn5FEkoEJHa7K5JrThAzSKbLqE4QuT
         4tONh0cSokz9MJ/xTaJ4fG5zVaMQt2w90hCIcR7HpGty8ZRjn5CbCgGLdxMp5F5h7Mv4
         iMwyLw2LPjRCVMWT3LJJ5qG3Wd493nQ3ulBUQFcJpQO1EPOK2g7FP32dodX5we+cIkq9
         VdR1HX7qAuvWfpz8waMHBuMN5UKGuag2eeOxbP9PXw3G2lwAHvRrA+b4Ursld7TZaUcw
         geOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=ShLry1GuWZVslx6Lh1pb7qo5pIg68RPaPtjQ73wcsztrCgGCr73UTusFx4euJ2U4L8
         hVAEuxAfESR2+9zyHYGV5tJ5zUUkBstFMehg4YIxvvZNbqy+K40/Isgg7oNmOvl+lJ9m
         hkkFrbwtTtXc50MZjuVR5zq/gSI9fKCYUWQFNmf/DJuQizRDmAR/EDAn5DQsdb7DeuFg
         yWX6qkHubbX3NbE8KNFNcgOas2zdozN+iV16nKntFpAtWrgcBXrXSq/6xPjXwgDI9D7J
         pIXvkkbOjz7DgTLikg7eaZ7Mt/da1HRtyKmFjmNsbLuW5LOKBvIq7NlI8Y1uUrxnOzzt
         a8fQ==
X-Gm-Message-State: AOAM532lrtwfWnTR4otfgdvzKckAryKWlTSY1vKsMI8LLw/2TvMe1FGX
        dFUqym6U3aPzbfMYp7ROq6U=
X-Google-Smtp-Source: ABdhPJwYrRulNH1UIlUAXhJlQmOktxSeuXrTf3FJAf53GCRTDT8EtzYwHmYDRisvTYtIhveJBbbQ1w==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr32384261wro.175.1638187636140;
        Mon, 29 Nov 2021 04:07:16 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:15 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/28] drm/radeon: stop using dma_resv_excl_fence
Date:   Mon, 29 Nov 2021 13:06:44 +0100
Message-Id: <20211129120659.1815-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..a6f875118f01 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -533,7 +533,12 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		DRM_ERROR("failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
-	work->fence = dma_fence_get(dma_resv_excl_fence(new_rbo->tbo.base.resv));
+	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
+	if (r) {
+		radeon_bo_unreserve(new_rbo);
+		DRM_ERROR("failed to get new rbo buffer fences\n");
+		goto cleanup;
+	}
 	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
 	radeon_bo_unreserve(new_rbo);
 
-- 
2.25.1

