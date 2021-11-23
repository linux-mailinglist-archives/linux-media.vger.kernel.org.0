Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE7445A54F
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 15:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbhKWOY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 09:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbhKWOY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 09:24:58 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167A8C061574
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o29so18892770wms.2
        for <linux-media@vger.kernel.org>; Tue, 23 Nov 2021 06:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=BTqipD6axEdvFS1qNdyue067ov95lW4E2a6zp708LmkVTtkeerVpwqnJhPFVrfumv5
         xuFk26cb70nj8GVHRLOG39Vvc7V/P2EZdcXBxNZNOD2NsKSknt5c27AARzTevTtm2l+v
         IzcyNOSovh/8bHnvDDoZQM60pa9MIUQBtVINjJqOtiAhluOxMhPtqxK89mdvMu+vOyFX
         JLWKvlTQxKjNKHvhQVl8vfh+LMGXeWTb0Gz95PfKUPbVp58UHNSo96bX6Nn8H6Oh6mKO
         1GyeZKiYXijk1nFVpBzuBdxGOBTnm7lFJbmry3asbr57LXcqvIAS3Wp4y6jmjODSdzFf
         KGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=h7WLVxhQyqffgQWn8Rix+hKSKg5ZRuBr2YdLWpkwHdAAs8r13Quf/imaIUydfMO1YX
         CeXgpkXlonq3xZA3i8biOWfedATmeTY0AxtNmS4RT1lD0Vd3yH6Z8kTpp1eKhmHq7ZFm
         pfQRKiAORCY+728S6EYUuWqa4ri2u0ozENj1kbSUqnWtned1i0l0O26h5txJbxLujIIV
         jE5llTnKRa6t4XExHQxw4mGqj978UzLwaOd0eHeZx50CCasvWL3fU0JaoSLnTyz+Uewc
         GEdX42PsUabDFseNVZcOGTSVrqOb/g4BlXBKOab9k2PDNrifB58ujsiCTvQ245V26ibU
         s0RQ==
X-Gm-Message-State: AOAM533WXxal6bTb8S4VKFfgRs5nfU0Pc8QcGkHDwEbXRgL9W9H/1Sm5
        gnCQRL4fSmWCjDeBB3Iv+AUE39AJ2RU=
X-Google-Smtp-Source: ABdhPJwsYTfsgAB3lOAVoiiFf/7GcQC8rbzKcBIGp6cEfhtBHCNSmGTA2nFXLk/Ck8OjVaGW+Vb6rg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr3443925wmi.115.1637677308688;
        Tue, 23 Nov 2021 06:21:48 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 06:21:48 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/26] drm: support more than one write fence in drm_gem_plane_helper_prepare_fb
Date:   Tue, 23 Nov 2021 15:21:04 +0100
Message-Id: <20211123142111.3885-20-christian.koenig@amd.com>
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
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

