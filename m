Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC9E46BB38
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 13:34:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236446AbhLGMiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Dec 2021 07:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbhLGMiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Dec 2021 07:38:07 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68A1C061359
        for <linux-media@vger.kernel.org>; Tue,  7 Dec 2021 04:34:34 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id i5so29205404wrb.2
        for <linux-media@vger.kernel.org>; Tue, 07 Dec 2021 04:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=cO8itEDO0Y4+CDmudoe9BP9YVtjl4oXUFSIFHAE2oRZtmKBaE7Dv/HhUYUQFZ2rNpg
         dm8oPUeaAjB8wJlr2LExU95+QydcPiXXuVPnooI7Xui42eTaWROr3Fe2jsCHGC7CAk4P
         g2eMHPGEJgaynGDKnTDc+2yPrLLzXyS/dBpmwFPslxFkQwkVuLC7LOUPikAgP+TBF4tG
         vDDMoKS5BZtKc8Wve+Spdnjrfk4efyfb2EBGlFh1FkvAf4vXmOJDmJbBeE9qd8QzHqq0
         sFFRLaI53Je8qxymR4Hd+eeEnQQa/YKo7BTlCYHagFzlwumihgS7yFI+yrLxOomzrydW
         cpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=ZTGKCU87uzO4z0Xp4eqh70D+jubXkmWPpMGFffKMYd8xQ+of8VcHiutuwKEZOARj6v
         ifZfr5F2S1fukzhKM6rPsu+FoI+Qzx8qI0Xi0Ur91syJwMtez+j0+4nAxjC2n64joOT0
         44pZn2Z4Rdl1U6IranwryO8LOWQg6ChA0w2U8BnbdrNOe1Z75vbTlOp3KsRxPlrfvb0o
         CaKi18Tp8XMqllCgev+VTY9YfvH6+QZyKSF6yxAy6mnH8bp8jlcKZMMAvpsswQpRhNFd
         S2YZ50Guj5DCI0b5kvXamPD4YfWwC1uJ5F95JEfrTcepVezls7Tbs5kiowHFm7NqsPUC
         bWUA==
X-Gm-Message-State: AOAM531Hd54LP2znfU+LwjVL5+P/HhkhUSsItMUG/dwf1H7nBMvS9OZn
        0mh78POP+W1ZWYxQHiy7xDUcD5euaHTbTA==
X-Google-Smtp-Source: ABdhPJwDjvg0eXOQ+wfJ/r0O7+OWZzD8u3llg0zC7WG3fgEyNqUmzQHoEt6NtHSQM5Q/O13PiZLgbQ==
X-Received: by 2002:a05:6000:1681:: with SMTP id y1mr50889475wrd.52.1638880473632;
        Tue, 07 Dec 2021 04:34:33 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 04:34:33 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 16/24] drm/nouveau: support more than one write fence in fenv50_wndw_prepare_fb
Date:   Tue,  7 Dec 2021 13:34:03 +0100
Message-Id: <20211207123411.167006-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

