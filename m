Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7C52B4D93
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbgKPRir (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:38:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387461AbgKPRhs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:48 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11BDCC0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:48 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id u12so12420325wrt.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a/Zj5V7ntHFWoK7hDL0KY4UUjT17GXd4P0At2oNvDPk=;
        b=TFBPvHxiNg0J66sXloeHlwrOB5eWbndg3GWxnxNUY/l85QSylm74QsaOu6c9V0sLmG
         gsrnImQVGr/vzI1O7BgbeoRNaysARDN0yLvRIL+qaCWtSVIL3Dki7e9FEDW8asTZVwZ6
         +KbfAcOKEr1hxQUuXN22cD2h5KNqAixBIbRYq2Qf8CZUofHYwO2YGcYYuXget9TsJXwS
         sSWUlQBWfMX4tksJumaQpklKT/jTnTL3slInD2HfyyF2gVExiphw0nn20uXiUWBwEc4T
         9naALP835/24p4ry/5XCk+jssfHvQcCihUPctJQpGv51yNSp70AKMXPK/mHf3HRNuU1n
         5s4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a/Zj5V7ntHFWoK7hDL0KY4UUjT17GXd4P0At2oNvDPk=;
        b=QLy1yrJJIEBrSAX3EZB0Ojk+IM5uZRLb1H8lq5c4+LgsqYv4MX09UCsxNwNbxr+ZMY
         JA0zyqZ6H377VU8K9n7/24N6WxxsFgbAkMuImtbxCifVBmgbiAdWQorH8MO98DFLgOZp
         B1cOCsQUw1DTkRfsmQy+ON77UPLnFVzytUmXCf/OYUDE4+absfpgRyu14TRB4RgH393o
         ab8xohRyy940TmekqEqRW6ciWDLxQB4uKV3SZrzYmnLqBim7CdyDrAeyV8HifDHMGiiI
         PmqaqxbgBAbM3JddY4xom6rm7aZiIwkOz2rcJJKVu9WEbQPhcBmeDEbDE7DJs+TQUgwn
         iWKg==
X-Gm-Message-State: AOAM531RcHkC95aFVVJHQyGlhuyFtl6Ud0k1przZxF3Dkyo/Fab5a0u2
        MCOvA+m3L7YOq2HO48XL6wugNsx81+CE6+bM
X-Google-Smtp-Source: ABdhPJyMK0Ji9phYwLd+YAD9fkz+za+2JWzXtRjSfGXUX56GVCuCSEw3Ah5D19tYN5hkRyKDaHQNxA==
X-Received: by 2002:adf:e512:: with SMTP id j18mr21789945wrm.390.1605548266827;
        Mon, 16 Nov 2020 09:37:46 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:46 -0800 (PST)
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
Subject: [PATCH 31/43] drm/radeon/cik: Move 'si_*()'s prototypes to shared header
Date:   Mon, 16 Nov 2020 17:36:48 +0000
Message-Id: <20201116173700.1830487-32-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
index ae020ad7b3185..cef0f3111cd3a 100644
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

