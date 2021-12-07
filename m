Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8A346BB26
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbhLGMh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236399AbhLGMhy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:37:54 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1584BC061574
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:24 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id i5so29204400wrb.2
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=Y+hr4KgXcRYlg2AL5TUx/Lvbyq/Xvn6LXODTNFfEvNUT6g8YsKLk+Alfj9N0hV2tKQ
         ki75IGuOZjQejcLYDNFc9H1I1cYdcFUBAzX+ArSb8Y4hNpOe2psbq1NIvuyOL8N2tYg9
         2dy5S/Mqk5YsSvuMZaBiAPvSk05GQDlpEpIrpQGqzmRr0ahPUzn0ob+VFGZVg5xFGduO
         WMOrJxZiYmLQE4pom3D46irwgpj6BlHi5y/6NKbi7CJtMLErVVxxxOlMd4aHnXQB+DIq
         7uczyZIAwsse0HXaJbFh1Oqa8PD5BpSr9/kVmJaZEbMS9QIJeFvcPDx3IW9bKC95Ad0k
         9+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
        b=Dk6ii/W3vHlzHfGvOw2vh8QFJzcRKs/ncM3YhafpRzZ+qBqMsUCK4gu4OdylCpNcns
         wJDooyFoZmHm8qUaXU5Vgzc/p2ZKtAl4S63zvT78P93UguOuT03BGMpHjEcDmmSF4tIT
         SPq48rdKmyVFmniBYmfTo1sMKsJHBlT+iyOAdz1x9IeDPAZ1F/03yzawtg83zwEKC7MT
         mfWAKPQ9W7GfuC2ZPL1hClgIbvJdlAuOc0Obmk1XyH4FxfbYnrdZXKDdG1yPo0BHwwD1
         Jbq4HAZ0ba0jIwPD/Rj1M6svVLXF5hG7lf3e+mp7HDo2nOXORRu7a5xu1JNcVbEnXARY
         HTaA==
X-Gm-Message-State: AOAM533EF90yWdRFZzPDnlQPEh1/YGVQD4bspcMb2C3I2pawgXvixRRo
        DJdwXFy4+4j+rxYvSjkAYEjfLzn5qPRaqg==
X-Google-Smtp-Source: ABdhPJxTYxD0RI3PjI0sUFLGAXoyxrSp+JUq8J9ytxbHZy3ajralYS/NFY+EP9Eg+mIgbsLFAcKFNg==
X-Received: by 2002:adf:f749:: with SMTP id z9mr52001158wrp.379.1638880462755;
        Tue, 07 Dec 2021 04:34:22 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:22 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/24] drm/radeon: stop using dma_resv_excl_fence
Date:   Tue,  7 Dec 2021 13:33:56 +0100
Message-Id: <20211207123411.167006-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

