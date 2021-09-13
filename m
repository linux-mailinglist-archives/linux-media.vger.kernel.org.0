Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A434408CA0
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240288AbhIMNUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 09:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238734AbhIMNUW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 09:20:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD9CC0617A7
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:42 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso6946077wms.3
        for <linux-media@vger.kernel.org>; Mon, 13 Sep 2021 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ywYiPBqYLCJ23trq34bYRpm7rnat1pMXJ6GgV3mhHgc=;
        b=A5lNs2MC/N0NsksmvdHX/ybghY3pb390BUp8YGF91muqiTAho89imbSUvtWtO0svRP
         lYstGtNDVY0ikAKhwKuM11qNKiVdYZXbzOXpPwzXc4Jt5UukYV8PjLou6zK/l+uM0VOX
         Klb+hmB2u2G9Ub8UPA54IoiUjp2mw2qMaeYHvzWPStvc11BtCIQ1QcL4bfpsiRJ+zaSp
         0bSz0Agre+2HiHecyk1hrShlKkVwNHREX9GV/EYX1oz4tO1xwlAmPTGbDZBBjrtpj4H6
         2Ls+so7KMHz/GW6GQS+NTXewXWkWmrYoGLMRM0WvO/ZuWl/ejbKnI16r4OhxSNXvzcik
         q3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ywYiPBqYLCJ23trq34bYRpm7rnat1pMXJ6GgV3mhHgc=;
        b=oTp7eltTT2fuoCSMlhj1FXn95+nyjJFmp36sXphtNjGFFPT+GVrB1elSwner93EPBl
         6xLQCaY3EMdCHG4tzPg9e6m7Y/64HNcQxIpbhTmddTQySuX1iei56AUuFqwsdiOhRnQw
         YGJXCHUQ3ohxUlh2ZqRKCGrj/uA6ydpsr9yZTPzonPIVz6oMgXR61s/8KTg9/gnWKPhS
         sNXzcTUwKum2OdhIKj/bNQU/M4Fn4j/8t8Kkj5fKKnnndUE4f7IH6m1nqa8Bb6J4dl4H
         W9WYEbakdbGVAEuhe0RZS3wFnBYoQxIPfo54hh60t2m//o5HAyYtkO8/rao2WwFvcKN/
         r8ww==
X-Gm-Message-State: AOAM531PP5L/2GCIL9QvLHg0B3oRqSlmoV0HorPjlO/2A1c5O2U9sBw9
        RgxK0+0fNo7Ig1BItc1szv0=
X-Google-Smtp-Source: ABdhPJzqAAz9usdIPSG+fQU4iIicyc4vSAGCAFCzdcYdUrhMteKzMJM6QOeBvNhZH9MSD7CZy4OBOg==
X-Received: by 2002:a05:600c:2259:: with SMTP id a25mr4541562wmm.133.1631539061673;
        Mon, 13 Sep 2021 06:17:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id h18sm7602834wrb.33.2021.09.13.06.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 06:17:41 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
Subject: [PATCH 23/26] drm/nouveau: use the new interator in nv50_wndw_prepare_fb
Date:   Mon, 13 Sep 2021 15:17:04 +0200
Message-Id: <20210913131707.45639-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..9a0c42d38a47 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,12 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	dma_resv_for_each_fence_unlocked(nvbo->bo.base.resv, &cursor, false,
+					 fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = fence;
+		break;
+	}
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

