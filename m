Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA41F2AF843
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 19:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgKKSh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 13:37:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727767AbgKKSgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 13:36:04 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988D7C0617A6
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:03 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 19so3188858wmf.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qh+SB3F0wBSwPJdxJvDqep6O/eLLWzPpPvay6C9QqmM=;
        b=Z3euSqifNwhu6ebXW5Gn4HJE9Yrd49M2yyiJejyPG3OBZSHtj/wbH/SAXvd9F/iwBQ
         8FDI9vSOlm7tmv2uIeobzdDRXa9KBXZnAGQQ8LCyZsMtyagmQRTmyRw6G1pyBIJfj4sT
         LZ5qoVGnqhXDxbs0M9QvOx6n4nolTJmxEXKS9nFIJ3MbERYVarJ1SrfEnjbYy08ct8v+
         hNdwbpEouUdQK5qYj5eOLFjoupuVUuETdzgN8bKKbT0Pxw1LCqh7g3+BTFeoov1iiTWO
         IsdNw7GqJvo3N1osqhhyB3/R6T1BA8EdglHEtkCt1UNLq15nd6wAASH4X8ieuXoVFVZ8
         rwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qh+SB3F0wBSwPJdxJvDqep6O/eLLWzPpPvay6C9QqmM=;
        b=sgl/2RaaWMCTR5cV6+qoqkMrpLenR3qYFXw8JRRaRjwFddztw9eKWruFyFF/QRCllK
         kfpOiSlTi6Rrme2ReEBJRL+zbqIW4ZL6xEx+8coZLE0e7erdMas/IV2vO7kpqyDFwwHH
         ZhbsPBShXIvWtZpH6AfAN5YZwMsyKNE0RXi6yTdyZRio4NUvs/rDjj0PJlgzWaQAFUcx
         byLRLYefzUCu+MYsoHsiTact2WwKuc0LRRp24dgIwhUqbB3KbF85tZAfcW1GMlFgIKIa
         jglyufzGF8bM8jjXCWajBNqmzmKdQcgI0Pc7mybrC6FocVdlvhWVC9zLuVvxN/7Owjqg
         ER8g==
X-Gm-Message-State: AOAM531mmHheMmuJo+ww95qIz3VmTJww0n2V3Mvqr4V+WrI7ptx9vy79
        ZtIQzjL6c2gxW+OHvhbU63Gtzw==
X-Google-Smtp-Source: ABdhPJyfo7uTY2z4gmHdm1uuxT1G2gAONrvqZZUGMNaI7L96tmelOOFAX8Hqqy4Wnne45p+mgl5f0A==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr5463021wmi.2.1605119762301;
        Wed, 11 Nov 2020 10:36:02 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:36:01 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/19] drm/radeon/cik: Move 'si_*()'s prototypes to shared header
Date:   Wed, 11 Nov 2020 18:35:35 +0000
Message-Id: <20201111183545.1756994-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111183545.1756994-1-lee.jones@linaro.org>
References: <20201111183545.1756994-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/si.c:4186:6: warning: no previous prototype for ‘si_vram_gtt_location’ [-Wmissing-prototypes]
 4186 | void si_vram_gtt_location(struct radeon_device *rdev,
 | ^~~~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/si.c:5186:6: warning: no previous prototype for ‘si_init_uvd_internal_cg’ [-Wmissing-prototypes]
 5186 | void si_init_uvd_internal_cg(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/si.c:5801:6: warning: no previous prototype for ‘si_rlc_reset’ [-Wmissing-prototypes]
 5801 | void si_rlc_reset(struct radeon_device *rdev)
 | ^~~~~~~~~~~~

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/cik.c | 4 +---
 drivers/gpu/drm/radeon/si.h  | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index af08d6f1be53e..0330ee86a372b 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -40,6 +40,7 @@
 #include "radeon_asic.h"
 #include "radeon_audio.h"
 #include "radeon_ucode.h"
+#include "si.h"
 
 #define SH_MEM_CONFIG_GFX_DEFAULT \
 	ALIGNMENT_MODE(SH_MEM_ALIGNMENT_MODE_UNALIGNED)
@@ -127,9 +128,6 @@ MODULE_FIRMWARE("radeon/mullins_mec.bin");
 MODULE_FIRMWARE("radeon/mullins_rlc.bin");
 MODULE_FIRMWARE("radeon/mullins_sdma.bin");
 
-extern void si_vram_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
-extern void si_rlc_reset(struct radeon_device *rdev);
-extern void si_init_uvd_internal_cg(struct radeon_device *rdev);
 static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, u32 sh);
 extern int cik_sdma_resume(struct radeon_device *rdev);
 extern void cik_sdma_enable(struct radeon_device *rdev, bool enable);
diff --git a/drivers/gpu/drm/radeon/si.h b/drivers/gpu/drm/radeon/si.h
index a1751ae560f02..f483a64d17050 100644
--- a/drivers/gpu/drm/radeon/si.h
+++ b/drivers/gpu/drm/radeon/si.h
@@ -25,8 +25,12 @@
 #define __SI_H__
 
 struct radeon_device;
+struct radeon_mc;
 
 int si_mc_load_microcode(struct radeon_device *rdev);
 u32 si_gpu_check_soft_reset(struct radeon_device *rdev);
+void si_vram_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
+void si_rlc_reset(struct radeon_device *rdev);
+void si_init_uvd_internal_cg(struct radeon_device *rdev);
 
 #endif                         /* __SI_H__ */
-- 
2.25.1

