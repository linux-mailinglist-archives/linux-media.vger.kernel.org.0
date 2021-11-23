Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872CA45A550
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237636AbhKWOZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237432AbhKWOY7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:59 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D66C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:51 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so2718691wme.4
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=Ja54Ddld8qqcZzstvG4AWszv693k3+shcyjQQbG2LPx7hKiWSdJNF2r3KSmAbJXvdm
         8McOvaW400TjaB2kWzfse3ek0xNbhsiKxJ0kmCOq/Zb3P078UY+yYrLPDCyQ16MmUXFL
         60wxFFhfIDxNHxTQCAJ34NqXkVp4RpdzXHRVhqwlPUD7ffpMYR/6TDD9l88ECCjV8kI+
         kzKCX90I2GvSJSo3rnMES+fwkX2bHC7ujjVEnJiAalnRBsClJLm5xl7wVjv1BaHFdL+c
         kjWWj23ceMuVppYKU9CJhxgap7sY46qvF1aRJVpm/wNzsfnHY5amUQtG8C5E4KdyBU3w
         WryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=Hibqt9Dllel23uF5Xj4wGZ4ePJiPPBKNsYAKPFhJFc9Bwm0MLidfrHHcmzNV+lQDZE
         8UK9KMh8VRcvplbGpVpB6BUjhVqN1flUHJV/sN+PCMz4cKYkKcvnw2kRf86E2Svaw+Xk
         4HbirQQ8AQc8zn0UPom4B93flD/IVeIlJWyKpaB0Lc8s/VRHQx6Ni6jB1ZCuORp6rczY
         OY17NZks+yBP57oSdt30hTA9A0nAMIz9BEFAxu2BbUFS1/DDl4j84IEeVeOpVA7UDQdJ
         iJN8Yf10KvWeK8LH+qMVP0i88jdodPLAnqXExdWBvMRMkkP04nyTFZ+hPJLi79Y3iDfH
         YElA==
X-Gm-Message-State: AOAM532QwFa/wPNsXOnfpmIcKSd+ByN9h1LrSN+ZwtQVH5sKo0kF+u4W
        JTPnNZWjlInOy/h6o+rvGvs=
X-Google-Smtp-Source: ABdhPJxz92PdTZx0DqNVL5rxsfV9YMFTqsBGNNgkSTOxdwTO2DMKRD+TWoxN1P6DgrLeGDMhFYfXhA==
X-Received: by 2002:a05:600c:224a:: with SMTP id a10mr3515571wmm.154.1637677309951;
        Tue, 23 Nov 2021 06:21:49 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:49 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 20/26] drm/nouveau: support more than one write fence in fenv50_wndw_prepare_fb
Date:   Tue, 23 Nov 2021 15:21:05 +0100
Message-Id: <20211123142111.3885-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..b55a8a723581 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: We only use the first writer here */
-		asyw->state.fence = dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
+				     &asyw->state.fence);
+	if (ret)
+		return ret;
+
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

