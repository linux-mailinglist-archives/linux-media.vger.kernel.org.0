Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29CC140F7C1
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244291AbhIQMhC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244052AbhIQMhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:37:00 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F19CC061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q11so14925802wrr.9
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fK8E2pCKjRcBSyfXu2xH9VECGzfOaqRD3Tk7GXUBKRw=;
        b=BTyXf9UtKDzLAi4jeEUDgvEODrUW5OGr0NQtvBSadofvysxt2m40uJVudR8svWEYbf
         aSoxQesCOlzc2KKmx5mzPd5v8zLlHvm5XOwqfZni26Wjf6k7icqlxviwG+cbHC2YLrhn
         n0LG+uvbBz94U77jNUdyIy0Lc/ENRXibz1nXMz/QGsFHLKyZdhV4FQpjK28sYB3TDgLP
         7854Ci4cs44519k4S6JP4TC5lzJhUiP3dvRW5cTf0/CyXH5oeWUo9geH5YgnsnnafbPG
         QGKlcI605ltdy+hnr+JUPP09JNFVSMHgHgob7e+LdOh/xemqCDh1Nb2wPJX/zWWrOatE
         59qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fK8E2pCKjRcBSyfXu2xH9VECGzfOaqRD3Tk7GXUBKRw=;
        b=d+gMTX2GjxLdIGJyzvGfWWnqyo43kXtXVL8HnAx6Io35xHG9mecmRHNj66sL0McDB5
         x4s2L9h6XcrxlMGK6Z6Zm86U00wB8WuePZfdZLRtFlGfA5Td3Y31qR6DdtkliSM7Hfvg
         4dM5sdoik7Sj8YWGDiPdHJWNphQedkPVCeajH/6VBrD6HPRx6QNXkiuQgxi5ZtX2o8Up
         EKvsZyKMB6iYH4hBBBFsVDVs70ssVlbaQ2r4SgQhgYiCI5PKzgbFN7s1KZdk01F5jLLk
         6x0Jof1Ipjgs9ERDlF5InZRVOWlMQWrpfQuMX5Dpe5QuKVXTaTrscv7wvgPppENeIHDk
         Sikg==
X-Gm-Message-State: AOAM530YCSooyK+GqpTyyLgtFN3TvpuUNDe1l7SLKEPgu8CA7GGDIJRi
        EvRJ1qV/dMBA4dwkJgSc8u0=
X-Google-Smtp-Source: ABdhPJwPpOc101oPI9x/Zh1EJ6JRH0QuWwO8FmQqIwXXJwqsL70lbNjH1SjLmsPw8jrnjwj+whe1lQ==
X-Received: by 2002:adf:f904:: with SMTP id b4mr11825741wrr.403.1631882135743;
        Fri, 17 Sep 2021 05:35:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 23/26] drm/nouveau: use the new interator in nv50_wndw_prepare_fb v2
Date:   Fri, 17 Sep 2021 14:35:10 +0200
Message-Id: <20210917123513.1106-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..566f50f53f24 100644
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
@@ -561,7 +563,15 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = dma_fence_get(fence);
+		break;
+	}
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

