Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2544351749C
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386331AbiEBQle (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386338AbiEBQlS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:18 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515FDDFA6
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:49 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 129so8583527wmz.0
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
        b=VlkS5sgarlYWn0MnwUTY3aeqE4Snozzu8nEzmHLBPm4YKIU7G+YGuHGBpdnwVjenim
         IisHP/2UQFKrjOj9yR1h4U8zH81F6bicVL0O6wZ1Rl+PebVe7A33GUHVGWHfdEt0fGHL
         50SHMe3EyX1yoojUuwDJKaCiAxz6xAL+d4np6qFo0GrAZQB1yRIrmlaEwFAaxc1PdM/w
         O5Jn5KOZeJhmgH6SJPjXshycuGRsZS2IvvtN8/kob74SDdniTfz+W8ix+Tzle84Aonfu
         If2W70R4KzP2rCZrk7cux5qY36dYnqm6OniYOzgEoSNHZPPeyYENMnS8L9lxJ+6LG9EM
         wXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=paocEfPgSqu67n8KLHsQSQJ/DJyKOx4pTU1l0q+u0sU=;
        b=QA/YSsK+QCG6mKSin4FR48n0ZKi/tIy4SPp19p4DI05FzhdazygPlPfBqzZnmtDlPC
         hURMtIlTW9t2hCFqxiKAFANMJoEViUgGM1Ra08uoMpiDNuscgn8/eYoqEDgqc7G8mmGM
         Me9acWOXEys8f37O4XqcQsf2IBquBtrZ1jQBPm1ft97bm5Ji1a2v2XOObxwhIVkhcuDv
         qttFDsBFk/dbRAWMjphqxA9CMbvKbFeNe+il7lf5IuJwgDv6sMtT7Bd5EszvtGqqx/Tj
         QQ0JG53u/vZVDSb9TkMKFEKP25WIQQ3bNayZc5f6MaNvKlCrbEFEjFfJN0h7t10+xzxC
         spzA==
X-Gm-Message-State: AOAM531bShIxIBcXVpQaKb/RkMXebAE66uNHl9T9ZSJonsz1J41e2psT
        hCo6VmM0Z88V6bu24Z1DnDE=
X-Google-Smtp-Source: ABdhPJxl04mnJLBE6tuBmOzv32rWsrcZLRuHOgfEtMeSpdmfs0QlfaGTPzlaUDTFvluVRH+0hWC5CQ==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id z21-20020a1cf415000000b0037fab4d1df2mr15431594wma.75.1651509467952;
        Mon, 02 May 2022 09:37:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:47 -0700 (PDT)
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
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Roman Li <Roman.Li@amd.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Jude Shih <shenshih@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 14/15] drm/amdgpu: switch DM to atomic fence helpers
Date:   Mon,  2 May 2022 18:37:21 +0200
Message-Id: <20220502163722.3957-15-christian.koenig@amd.com>
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

This gives us the standard atomic implicit and explicit fencing rules.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Cc: Jude Shih <shenshih@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ade82cfb1ac..c5b2417adcc6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -83,6 +83,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
@@ -7627,6 +7628,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		goto error_unpin;
 	}
 
+	r = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (unlikely(r != 0))
+		goto error_unpin;
+
 	amdgpu_bo_unreserve(rbo);
 
 	afb->address = amdgpu_bo_gpu_offset(rbo);
@@ -9160,7 +9165,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	struct dm_crtc_state *dm_old_crtc_state =
 			to_dm_crtc_state(drm_atomic_get_old_crtc_state(state, pcrtc));
 	int planes_count = 0, vpos, hpos;
-	long r;
 	unsigned long flags;
 	struct amdgpu_bo *abo;
 	uint32_t target_vblank, last_flip_vblank;
@@ -9173,6 +9177,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dc_flip_addrs flip_addrs[MAX_SURFACES];
 		struct dc_stream_update stream_update;
 	} *bundle;
+	int r;
 
 	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
 
@@ -9181,6 +9186,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		goto cleanup;
 	}
 
+	r = drm_atomic_helper_wait_for_fences(dev, state, false);
+	if (unlikely(r))
+		DRM_ERROR("Waiting for fences timed out!");
+
 	/*
 	 * Disable the cursor first if we're disabling all the planes.
 	 * It'll remain on the screen after the planes are re-enabled
@@ -9235,18 +9244,6 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		}
 
 		abo = gem_to_amdgpu_bo(fb->obj[0]);
-
-		/*
-		 * Wait for all fences on this FB. Do limited wait to avoid
-		 * deadlock during GPU reset when this fence will not signal
-		 * but we hold reservation lock for the BO.
-		 */
-		r = dma_resv_wait_timeout(abo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
-					  msecs_to_jiffies(5000));
-		if (unlikely(r <= 0))
-			DRM_ERROR("Waiting for fences timed out!");
-
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
 			afb->tiling_flags,
-- 
2.25.1

