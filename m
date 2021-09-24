Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8854177B3
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347213AbhIXPdR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347209AbhIXPdQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:16 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26142C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t8so28740604wrq.4
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=hef6b05hQy+5lGerGWpcfLcr9CeyiiWOn1lDY3P3sgSPdAg6Nb+txTI3e7Ym276Coc
         BUmcrvtRlg63/BmdOK5uhpfgtLSoyr/L6RUKzu/Ct7NAbo17Qhb8aR/3KwXoMnJFNDFp
         RDbXA2+0Bnwyi7I47FHZUjyj1KN7amdrhZiCQJ406fGjD6o/vP5JydsEWwgtZpdTYvyB
         wOFv/6F/YNr1LHOsUb8SbVNSQTRM/VUovKgc751PksR3+qI27eTUQmsaglPU7+crkhXG
         gvXcPxVHpse/eyifuhbJrWCL22RzvujeHGxTcbVN3e/O6yi/0vd2LtfLGY01dJC2Yrks
         Dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KGewx1QiQQVkw015IvGnnogZeqnpnoxIhP9ykI50FyQ=;
        b=fOos5BZRwVeL2Ti3UKqkArIAGNhkV8kSnKbRVdncLJ9mnUSdLToHlcJretpkIL4tfa
         iBTMbTvO7SLQu4S0Qcnfr8vUxrS7nQp4ABLVT8QCthXwLJ90ZSyNv2b5ceBLtUyzsB5O
         kVSKT7KPb5fPqvmr5bP18pC7lr+D9MfkjCGvbMDjqK5ePOTkML1NxUdbmv9p6GLelNqx
         yRGSiT1/9DO3voa9cTDipYlyQSIHnrl0VbOFePtI8ryPhIzPeyxe+C2Krquq5Stfzn9o
         AC+kQ16AmrpU9VN+QddVQDHGX2DJjnjFFpRpQjQjgzTmDwwlRpFvdXYpWdhE3M1nSbos
         IaaQ==
X-Gm-Message-State: AOAM530MlTn1cj5D4SL6GPsdBezPPFmJzPsOT81TV38GRIUUOlKAJgbG
        0VWz/4swflKsBYsXcUncd6g=
X-Google-Smtp-Source: ABdhPJwCQ50FiYFb6laK69EQMOH+0x7uDi595rBzL2mWBKY4VTN0iDpCqcFixhE+dNDw9UjaQDD1KQ==
X-Received: by 2002:a05:6000:184e:: with SMTP id c14mr12162487wri.242.1632497501846;
        Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:41 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 25/27] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Fri, 24 Sep 2021 17:31:11 +0200
Message-Id: <20210924153113.2159-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

