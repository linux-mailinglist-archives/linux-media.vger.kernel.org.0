Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E363743E212
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 15:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhJ1N3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 09:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbhJ1N3B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 09:29:01 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB29AC061570
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id b71so5044283wmd.0
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 06:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=F0uECfBAkPnxcTaaBNKjvRgDOvagF9vnqC8sbabETVI=;
        b=A/4UogMjSc8zQovGLXoblqVKJOl8bYZcitPpecVLxmxRfG6GDEgCJRCSjTFHun0aSD
         imL2m4WTdRWmc/zh0qvyk7bguneOTAGSeOUv5Y+n+gfGTApaWRHLcLy6B4uR9do15sdw
         1XA2HJxLuTMqkAtDer2bpF8IjjnFQ+zZrlxF8PT99gjhjiShO8milE1ZJmsyFXSAdDbi
         xWCD8G9t683h5Yqk1TRUp1fEeEHp3xC8fSPXFELa82La/iItpIPTCwiWtJ9JXD4DC4x5
         fvLg3mSWULqYZuCovLQyyXzVl5HAgAqNzGW374YwJmUHQu8H7Uulm2ryJGPZVoaD/M+p
         gpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0uECfBAkPnxcTaaBNKjvRgDOvagF9vnqC8sbabETVI=;
        b=2+3LsJKkTsqUpbHTqJ2zKfR6iME8QnyciUr5pOOivzhCCn1kmBJqUj9BMcA/wq3gBp
         +N53TIHgJKya+n+rA/VwoVPzYiQYh9PR2MyBUWtQaMUIgP3CfP3EOCjn1FrXdMjV4eV1
         r976D0WDB1GPJZHc8qT9bciQ5djYIsCHyYYuywGWWU05Tn1YkF7yPCjzl2QLSVf9THYq
         dR/vtoMtGFBcKv4El46nlHeusTq3+pj0pNZlxaHDPmQ09or3YWvXpwFZruogZqXY1z8F
         7SlJ4yc1ZPctXfWTHTFA+/HuhzB7shD4jwJ5hI1IZzJRMkDWpTVObYkz7DriXHlzdR9N
         /kFQ==
X-Gm-Message-State: AOAM531VKplFBcnIuHwUkvVlv/J+XURAw0ll+KYa3R7bqDreFcMeYIyF
        zZaiaA48zdLsBCV6JG7CtLVFMkMFc1o=
X-Google-Smtp-Source: ABdhPJxxWVtcxYU9iftgYazqCFP/sUSWmT5rCt1z6ncO18Obe7fDA9DTTFpIPtN7KUSLRq3trOGntQ==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr4590744wmi.31.1635427593520;
        Thu, 28 Oct 2021 06:26:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l11sm2935695wrt.49.2021.10.28.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:26:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: stop getting excl fence separately
Date:   Thu, 28 Oct 2021 15:26:26 +0200
Message-Id: <20211028132630.2330-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028132630.2330-1-christian.koenig@amd.com>
References: <20211028132630.2330-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just grab all fences for the display flip in one go.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         | 1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d58e37fd01f4..4da7eb65e744 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -457,7 +457,6 @@ struct amdgpu_flip_work {
 	uint64_t			base;
 	struct drm_pending_vblank_event *event;
 	struct amdgpu_bo		*old_abo;
-	struct dma_fence		*excl;
 	unsigned			shared_count;
 	struct dma_fence		**shared;
 	struct dma_fence_cb		cb;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc..68108f151dad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -83,9 +83,6 @@ static void amdgpu_display_flip_work_func(struct work_struct *__work)
 	unsigned i;
 	int vpos, hpos;
 
-	if (amdgpu_display_flip_handle_fence(work, &work->excl))
-		return;
-
 	for (i = 0; i < work->shared_count; ++i)
 		if (amdgpu_display_flip_handle_fence(work, &work->shared[i]))
 			return;
@@ -203,7 +200,7 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 		goto unpin;
 	}
 
-	r = dma_resv_get_fences(new_abo->tbo.base.resv, &work->excl,
+	r = dma_resv_get_fences(new_abo->tbo.base.resv, NULL,
 				&work->shared_count, &work->shared);
 	if (unlikely(r != 0)) {
 		DRM_ERROR("failed to get fences for buffer\n");
@@ -253,7 +250,6 @@ int amdgpu_display_crtc_page_flip_target(struct drm_crtc *crtc,
 
 cleanup:
 	amdgpu_bo_unref(&work->old_abo);
-	dma_fence_put(work->excl);
 	for (i = 0; i < work->shared_count; ++i)
 		dma_fence_put(work->shared[i]);
 	kfree(work->shared);
-- 
2.25.1

