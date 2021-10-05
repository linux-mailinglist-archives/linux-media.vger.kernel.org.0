Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC7342253A
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhJELkB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbhJELkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:40:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DB8C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id o20so18738519wro.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=cZ1Qg0IzziLYxlztyN7Jov8fdVA9Z9OZHWF/mRQTnVO/Hs+aabSsX9pQ7BRORlTR8z
         z1fCFEe1IYn6M0TGgoFW4cOyrFS1tFHajxI8/+rO/J4fmcYd7FfRmj3URaqWz0Ptpo4m
         cqM+MU1Niw9fVDJ29e6V9ByMYZf7WaNSCsynJDsaSqsfm9zo9O4UtxRoW5BEp74bCbM+
         Vmo1zYQ3ZLjeuY0yVa/6UFgLakSzfYgc/G3sQgPvSIUtCC6HgLp9h+PjxcfyGMwt2h9/
         f32m7y7zZ2JC3TfNmZy1BVVzGJFTNM2mRq9wwZ8HmOSHV7596/eJ592gtSDyRNZOOiDN
         2w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=aaXP9devjGoG9M1FgNPvfvN1TSEsIwKlxeEBnKc8R3nxfU4asR2uP+O2SaZD11D+5+
         AqdNE2WGxjnshC+y+mm1q9YVfxj9nddwujCYArB15GJ945yu79drSKwONiKpZrOLp1Bk
         GCBppUMZKwpdES1wCVMJfExclde5Q0h9Pv8dmvPshFOxXmiGgq7ZholosSix73upj8Yt
         HPzFu++oyyWyrXLlv553zyTctVTCbGDnE8LukWHXxRMAOP1MzDqfkQ6jikeyWPVz6J6x
         wbBa5XUaD68iY6CHHKwKyBzmvkfKN4fVONmUeqwtz37/PniJtEiXBvQyn3/H6/tOYMv1
         j3HQ==
X-Gm-Message-State: AOAM533GIRcTOuMqVgrDA6JcEB98/VZQPVk+AHcVuJXtbSD6TS/++Pr6
        Y/A3f87uzcXAlZzvx+y9Op0=
X-Google-Smtp-Source: ABdhPJx/9VCCcnhhpoVwOwL9dqyLZX5PdhLg+A8sIi0bCCcPaAHK7OisD+NY2Uqpow4qFcMSrTbmGQ==
X-Received: by 2002:a05:6000:1889:: with SMTP id a9mr21077367wri.300.1633433888552;
        Tue, 05 Oct 2021 04:38:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:08 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/28] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Tue,  5 Oct 2021 13:37:40 +0200
Message-Id: <20211005113742.1101-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

