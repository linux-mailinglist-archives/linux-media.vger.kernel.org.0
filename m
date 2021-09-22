Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B534144C1
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234332AbhIVJNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234344AbhIVJMk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:40 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9221AC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:10 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u15so4676188wru.6
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=Z+ma+j9Hsi98m6TMPrZyOvlgwiJE/auOQVt8b0s7y/8hIwKxWopqqf9B/x9kCEu1dX
         u5zApj6Mhy5xObgS+EcT50eDY5gp9X7lv42gnFKQ/bjog+gmUFYs1JOcuv11r8YN0rlt
         D9+YmIj/jVYhvokdNnAdzuFYADJQ1o3BxPcSccng/l+b4JES0EEzpEvSAq9bhXZ8QBVs
         xrgkJRCATuiPRa5P3tcJh1reWSQPgzEUUVGCYptD6b+yolzaXJMBd51V1TnIOJSBs/pR
         vpNF/A16HsDx3qhIdmH12RJ4KVY/YeejI8677AzQPUrFw6NXunkIuOSzTr1UxqbQH6Vk
         q11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=TnGcgWLuVVcMhx+l0G8uoMOK3VJpRmu8jBbNM5LJY+YwpeHJ4mDVlM+DYqlWEFrlt6
         e7YsWpDFCLV79QBNfYu7t8m6wWAK1A1hBDDxsB3T0lPmBaxBkDKyTPnfaKM9D9opcPle
         8Ta8C7ZAa3NklfPQ67zRrQGmRmyDXt405EwekXHAAahqdx4FTzbzpM9I6PDShglQEC5V
         Ad4qu0WmpDERFdEneY77uX9igvCR1EHoDW8pQkA5qM6dQ2xsViYxibPts/dH2ASgoim+
         VZWN/3cdjpRYKdfU78wZF3KPrlbaf+tHG1mRQGAWmCuTNsur7HZBmMopfBRfjed2t23A
         7Y0Q==
X-Gm-Message-State: AOAM533K7unvDme2BEXIQqh0XVEIk0XkrdOgYYWF2qfNRCycrhyFYq+2
        GTumBAzAJegu72ACYWxP+YE=
X-Google-Smtp-Source: ABdhPJyXD1oAbzynMTqbYHQz9JPlAZOmN6Jct+hP4Cq4joyLvYGSkZ9Mwngyo0eOjqZf5mY3RSBXdA==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr9032321wmq.154.1632301869258;
        Wed, 22 Sep 2021 02:11:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:08 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/26] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Wed, 22 Sep 2021 11:10:41 +0200
Message-Id: <20210922091044.2612-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..30712a681e2a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,13 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

