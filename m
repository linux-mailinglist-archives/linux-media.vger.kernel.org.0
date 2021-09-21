Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BF2413895
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 19:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhIURjC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 13:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhIURiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 13:38:54 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1DDC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q11so41608057wrr.9
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=Xq6wWVc1Z5F20PfHJazg6KxBBd7H0P4vmtq5bsruWiPGA1FBoghnkqRe8v7Rm3Vdm2
         MWfugL/sxAGlOOkbkCdeJsEVIMvZPuMaL3YJpQq1KoJVJ1dRYF743yK65vALbsH9ngzN
         LowqiylRSlyhD3MsM9u7ZxsR5jKZGgBiCSRNUgcr43cUkIP/kMZRdESEklGP2dvm1ifP
         5ByHiEME8AAPJDb8HxnFbpnCnpM2JALTb4JhEErxaqm0WYddCdPvgyZnOjkEcKIiBTMK
         x7dhZGl+nzgrBF7yMXENqyJOO9rx+5oziJD48cT1Cr5kUk3v31p2LpBLf7Kzu4Jg9yPo
         mbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=0VwpemhBbQAtMLXBZQJPXCltH8U7aEHxhKaaOQ6PFsBJNNTsrIw8x5jWRdRKYgxjFO
         VYoqKYayEeB7xILZa37M9g2kjjaegNGkeX6xeTvhpobq7Wnp+YF7FscjzXIOtpEJcFCw
         TLakp7Lm6y5jEYydxaEJhE1A7MI8j6xcD5ETu1Si54fqW/d80bO6IhL6HaoQuCiwNXf9
         mIIwjCoWEeI17H8VtRe6i6qFZ/1kgVn5tDZc42ZLl2WuE/ToQcBxEQ/f5P60vSx16AaQ
         GqcbsBQTuDDf0+PGuM1TTqqzyD0ObBrUHt2TpCttKV1knRLB5WHDT0LngfH0fcRCTkCa
         uALQ==
X-Gm-Message-State: AOAM533VppH0OjznxgvkuTS+ykXe4wcUu7S0A3DdoMb8VJy/ZSfglzPs
        8QeE1enGBPA0/1y91jNkofPaLcjnlSs=
X-Google-Smtp-Source: ABdhPJw5SwJWsbXOIR14p9znCpQlgAn5mTDseUxR0CQ7UeKD9FpPAvUU95sczDMftuP1OP+CPnIalg==
X-Received: by 2002:a1c:2246:: with SMTP id i67mr5874747wmi.157.1632245843939;
        Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id z13sm23310477wrs.90.2021.09.21.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/26] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Tue, 21 Sep 2021 19:36:56 +0200
Message-Id: <20210921173659.246165-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

