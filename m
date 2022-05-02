Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 936AD517494
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386305AbiEBQla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386321AbiEBQlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:17 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E671DEC3
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:46 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d5so20239707wrb.6
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ANagkIapfhSoILXgRSazGJNpDPTeoeZ/i/DcazZHEZQ=;
        b=bTOuNbcCcpWCjHPdLC317BrGpkkTWG9yauH9kogTYDUS11gKUb/mgOriNiNu5FbMvh
         LAemZaOirJJUTzK3l2TFLtT8rRLpJvT7BZfdmi8xJtNUvDM/vFRM8b5haRUFr6Y1+4MC
         qCKqOvdTddBF7iTIx2hrrK3YFoDENFIjRM7SFF17g1uVfGU//XWTc8I0OyxhXUnfX96I
         8uHIPUuJmFcLDSrWHLzz2KRoGB52or1JhX5W0KPckcLJO6LOVnmxfQCirdxkWAXiCOoS
         b2OuUlzj4WKBC2Mr8e27FrWEEW5t0RhonknV7AExdcqkeJi7rBjBtbm8ey43b2ZNpyHP
         lxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ANagkIapfhSoILXgRSazGJNpDPTeoeZ/i/DcazZHEZQ=;
        b=oWgP0Sxk4Ul/m6mNTkBSY3y+Uszf781rASsvGSuQnANHCNdGA41a4x+A44aDGegmIc
         wJAnJ5BmrgBTTLbJSNUSUlN13G7xiLJkFJVTf7xqbprhN12HKxLUmYqFPyCP4+LjMKyy
         CIwUP7lRODqik6uURERoFJ3qKfWryeb2dApA7ty4BiO7UEDGynneeZKYxYJESmyB+ji0
         c6vdg61ZJxII30syw3dOaqt9qE3yK3ygt9TjfqVYus0AYUbqj9FKwEVhV41Efg8nZSKA
         DN2IgLLd4dBq/8wvC/UB7+q0VhfXg/0O5g5mNBb7jLdJMaLeCbMxVjqwhs3BfDJ/xoIf
         OXfA==
X-Gm-Message-State: AOAM532WRmQoObvnEJ1qwmIOI1zbBFXOxUKr8xHsmqIW84aTXLlllXgZ
        eY1U4pDuksE6b1apRup+8qs=
X-Google-Smtp-Source: ABdhPJxUDlk3kbTFRN1X2D1q1vvW3bPqNNYNXQ7eHBEpgoyEe35FHldqGH1tFKFmx0FwRPQczX4rgA==
X-Received: by 2002:a5d:5749:0:b0:20a:ce36:b29 with SMTP id q9-20020a5d5749000000b0020ace360b29mr9849647wrw.559.1651509464807;
        Mon, 02 May 2022 09:37:44 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:44 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 12/15] drm: add user fence support to drm_gem_plane_helper_prepare_fb
Date:   Mon,  2 May 2022 18:37:19 +0200
Message-Id: <20220502163722.3957-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just handle them the same way as fences with the DMA_RESV_USAGE_WRITE
flag when the DRIVER_USER_FENCE flag is set.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 68 ++++++++++++++++---------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index a5026f617739..75d04333ff2e 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -121,6 +122,40 @@
  * Plane Helpers
  */
 
+static int chain_fb_fences(struct drm_framebuffer *fb,
+			   enum dma_resv_usage usage,
+			   struct dma_fence **fence)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct drm_gem_object *obj = drm_gem_fb_get_obj(fb, i);
+		struct dma_fence *new;
+
+		if (WARN_ON_ONCE(!obj))
+			continue;
+
+		ret = dma_resv_get_singleton(obj->resv, usage, &new);
+		if (ret)
+			return ret;
+
+		if (new && *fence) {
+			struct dma_fence_chain *chain = dma_fence_chain_alloc();
+
+			if (!chain)
+				return -ENOMEM;
+
+			dma_fence_chain_init(chain, *fence, new, 1);
+			*fence = &chain->base;
+
+		} else if (new) {
+			*fence = new;
+		}
+	}
+	return 0;
+}
+
 /**
  * drm_gem_plane_helper_prepare_fb() - Prepare a GEM backed framebuffer
  * @plane: Plane
@@ -143,8 +178,6 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct dma_fence *fence = dma_fence_get(state->fence);
-	enum dma_resv_usage usage;
-	size_t i;
 	int ret;
 
 	if (!state->fb)
@@ -163,32 +196,21 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 	 * obeys both implicit and explicit fences for plane updates, then it
 	 * will break all the benefits of explicit fencing.
 	 */
-	usage = fence ? DMA_RESV_USAGE_KERNEL : DMA_RESV_USAGE_WRITE;
-
-	for (i = 0; i < state->fb->format->num_planes; ++i) {
-		struct drm_gem_object *obj = drm_gem_fb_get_obj(state->fb, i);
-		struct dma_fence *new;
-
-		if (WARN_ON_ONCE(!obj))
-			continue;
-
-		ret = dma_resv_get_singleton(obj->resv, usage, &new);
+	if (fence) {
+		ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_KERNEL, &fence);
 		if (ret)
 			goto error;
 
-		if (new && fence) {
-			struct dma_fence_chain *chain = dma_fence_chain_alloc();
+	} else {
+		ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_WRITE, &fence);
+		if (ret)
+			goto error;
 
-			if (!chain) {
-				ret = -ENOMEM;
+		if (drm_core_check_feature(plane->dev, DRIVER_USER_FENCE)) {
+			ret = chain_fb_fences(state->fb, DMA_RESV_USAGE_USER,
+					      &fence);
+			if (ret)
 				goto error;
-			}
-
-			dma_fence_chain_init(chain, fence, new, 1);
-			fence = &chain->base;
-
-		} else if (new) {
-			fence = new;
 		}
 	}
 
-- 
2.25.1

