Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6E45A544
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbhKWOYs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237881AbhKWOYr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:47 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70FE2C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:39 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id o29so18892279wms.2
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=Aap9qb0CGJMazHPh76Zb+XR1OFS8Jd/j6yOThIDHqJ6I7ART5j3CY5Ipx2vkhBzcze
         QlI7onwvUrpPJY9975hB53OwS3Vy9uPVDO8z2uqK00BFn3NtLS2WWDTH0nYEq17ZRaXd
         NVbIAAtVVhRUkFwmDnCpIVN9MZW6l0/i0L2b14TR7QHs2hPT3sUW0i+Z4VjpSc6KF0KL
         MCWEIlyf8P8lAHUGA0f9oj7TSfxyjtJq4VjJ5OYtQ/R4allQQPRZpEZZFaWkaRYcvN+3
         jigULy1EE+5MzZLa4ZjE5k1kDEKydxv1lyxw1JiIokAki8vmDSBdOTuz0dyMU8YbVFzD
         sBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=49r6c1Ek8WbBN+hCwQbP+TB3kUNHd0asYgzt/N/kOqF44WewFkriJvNsuBSGka3CwV
         oMDxJc7SLidLuwxgSI09+8deS5LRlKrJs8vYUQHTIraYvgVioklYFmImPgL5IQQM+SmQ
         BGddOJVQYpmyxRiyNsey0SVT8kq5nNSwXq8vvIAQ1Z9dvzGnrwLU0lSZvFbal7UQxg8Q
         vRFy1OtyA6A/768qvcCn2MSsJk0Hs72iyzvm0P5ZLgCnkt8/hVnnNqbGevdYjWrzrTxb
         B3SG6nKsReGW4A/bPZsSso3uY822O82v9gw4INH7dH41sx87mEdZx8pgWOnf0kuxIx0W
         iWyg==
X-Gm-Message-State: AOAM532rOlf6blBBG9LAR7iOLQd3e6QgtpN50RFDPe72zjPIxp62mo++
        bqiY2AepkDUSdOYzEuh+e14=
X-Google-Smtp-Source: ABdhPJyZg/cZ9stJjKdPoHG3fhLgr87QipAPe+4ZbOIDj9J1X5VBkse+LtX/RaUO8k5CsW0Rixncew==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr3498372wmb.90.1637677298054;
        Tue, 23 Nov 2021 06:21:38 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:37 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/26] drm/radeon: stop using dma_resv_excl_fence
Date:   Tue, 23 Nov 2021 15:20:58 +0100
Message-Id: <20211123142111.3885-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

