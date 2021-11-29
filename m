Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D5A461656
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243964AbhK2Naf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237107AbhK2N22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:28 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCCA7C09B077
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:28 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l16so36250991wrp.11
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=DvxyvmA4UkCgdWcyCMMQaRiMvazH42UIQQOpJO5EerdANdxHj4KctvJTw1jId0sMdt
         UNipWKXziNXoJmDw3V19P2Iuqpg4Njhzt+PqLRQp5htQ8+upc+XS8TQ2VmsiQAB8sJ3u
         lwvMO3IftrF7bS/FOL2sYTRPvzDb8VK0giPv7FEZN8v4VA2ZomSLM+5Xm4vmsOCopeC0
         7dn8ho9Chxqh+uIWLz1M+KCYJOys7m3cTffo7iBowhR8YSIt5ezUfyF9xCxEgywMlq5b
         4gQdEIgOUbbvzuH4efae6HvT1R8fZLie5Gk1ljIRoZzsxwNaUcrjWY3K/1ovoaIleTyX
         ot3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
        b=vuv2XcNhXwRIAJaJ26hZJ3wrXuKOZKJuFzzXt0UxXwf97AJW2WibeunyAii6GtUG9j
         p+VFlW6qbgF0vZNE9s5lAqdKAcX4dLEaOYgtAR3+Hh2da04nbcdDXBw3MSoaYOo7z6TJ
         6fi5dWmTzjzVNZNURpm6aozKBVF1f6Yp8RBKiiL6QrQTPsA7UDd0ONOWHCvTBJs+1Ep7
         cHZVdUTgdh68NBEEd79FY0cj92IUwjUGx95VVpj2gedTSjW9p15cOJsLk1FW6eqKe3Mm
         fFObxBKZs4GPk7FRig3OK96ZGPUWoKl2xOtuNIYxVjW27vufIodskiP6L5xWaqhIkA9c
         BGNQ==
X-Gm-Message-State: AOAM533PDpmxG5Vr3tqQznJ/xE88ylkTM8CngTsJwKffGpcMUlesZ3Da
        NGbjY3fLly5kJfv7YtWTKto=
X-Google-Smtp-Source: ABdhPJx/isgwTDi2SrqXAXlYd86/rMNxzip0CZRacAJNcrcxqfNYJ4bA/CaByWKIpkS+/y0WMI24LA==
X-Received: by 2002:a5d:452b:: with SMTP id j11mr33442239wra.432.1638187647380;
        Mon, 29 Nov 2021 04:07:27 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:27 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 20/28] drm/nouveau: support more than one write fence in fenv50_wndw_prepare_fb
Date:   Mon, 29 Nov 2021 13:06:51 +0100
Message-Id: <20211129120659.1815-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

