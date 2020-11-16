Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618822B4D7A
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387529AbgKPRiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387523AbgKPRiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:38:00 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A27C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:59 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b6so19646454wrt.4
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TL/uaiVIiwl4wzWU7OYi0ACx3zRr3WVOJb9wsR2ot/U=;
        b=dr2bVIZxUH94BJWmoSkzDF3XGSLOpfJ1EqQiSFAWRLHQcBgTbLh3kaFJpwd82QBuYd
         q5eD0fCw2PytG7MrtaZuQrihHCtR0/ffC0/76z0ydHogAVnjYYwV4D/gmAmE2dg6/Kia
         SFmzCCdsLEa3IZQkGULmy3XV4x03kvLJNoqsO7C27vFIuD7C1U8VT6+X72NBPGil9DGm
         0uuDUiU3czjeC+0sJvqiH3OcOej+u/yTQ5FJf+u3dNsfJW8435CYA8Hk4iRmAynz6eE+
         KDlU21i/5Ln/UvT1YMpF6klItjrO7hXaIrgKevH2UKz09pVQf2x0HkrAkg43R9D6wq1n
         DHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TL/uaiVIiwl4wzWU7OYi0ACx3zRr3WVOJb9wsR2ot/U=;
        b=uEaHC/oLc5T8/oGOmCoeDbSnAphnMzoEZ0rJNNclzoI6UuHkKEoWWrJeAv+WwmDsXH
         3E5DAiw0Oeix9d8xmFijK3JNv3E5Hx/qYe/xQIKBHvqV2wHNLV+fqkIVIATFiL/dm00p
         keDhDpobmBI60X+pTdNxWnL/tlygyhrgjB8Of63p4Ck6CgRSRmip98v+RyLJfza2vibv
         Sp2I0wJLzTRztgUH3ll0bLHnxplPwW9oG1m2dQOqlcsSOs60A2/9Ew22BHvFEkVtHkJL
         0lY9XuQ/ppicE5OdyEOepE8It8S3MDQB8g4kp2a5kfKT33xJUtkFegHa+1HsiKgl0E8K
         46ow==
X-Gm-Message-State: AOAM5336tFlvn2V0T9eJaQ9W9by5awRVhIVKRsJ59vWVQgCjh/OaFQei
        eoEnKVfzFaDmNrpRu+0diL9GIg==
X-Google-Smtp-Source: ABdhPJx+b4Ft/SDd+UqL/cZrV5C8FQkrs6vyGPH8CJVoRuoiWseV/LhptsVy4YAmxH9L0GMIyxyJew==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr21750649wra.247.1605548278544;
        Mon, 16 Nov 2020 09:37:58 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:57 -0800 (PST)
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
Subject: [PATCH 40/43] drm/radeon/cik: Move 'vce_v2_0_enable_mgcg()'s prototype to shared header
Date:   Mon, 16 Nov 2020 17:36:57 +0000
Message-Id: <20201116173700.1830487-41-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/vce_v2_0.c:111:6: warning: no previous prototype for ‘vce_v2_0_enable_mgcg’ [-Wmissing-prototypes]
 111 | void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable)
 | ^~~~~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/cik.c      | 2 +-
 drivers/gpu/drm/radeon/vce.h      | 1 +
 drivers/gpu/drm/radeon/vce_v2_0.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 2af76463906ad..8b7a4f7b75766 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -41,6 +41,7 @@
 #include "radeon_audio.h"
 #include "radeon_ucode.h"
 #include "si.h"
+#include "vce.h"
 
 #define SH_MEM_CONFIG_GFX_DEFAULT \
 	ALIGNMENT_MODE(SH_MEM_ALIGNMENT_MODE_UNALIGNED)
@@ -129,7 +130,6 @@ MODULE_FIRMWARE("radeon/mullins_rlc.bin");
 MODULE_FIRMWARE("radeon/mullins_sdma.bin");
 
 static u32 cik_get_cu_active_bitmap(struct radeon_device *rdev, u32 se, u32 sh);
-extern void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable);
 static void cik_rlc_stop(struct radeon_device *rdev);
 static void cik_pcie_gen3_enable(struct radeon_device *rdev);
 static void cik_program_aspm(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/vce.h b/drivers/gpu/drm/radeon/vce.h
index 1eb4f5715202e..ccc9c00f0d02c 100644
--- a/drivers/gpu/drm/radeon/vce.h
+++ b/drivers/gpu/drm/radeon/vce.h
@@ -30,5 +30,6 @@
 struct radeon_device;
 
 void vce_v1_0_enable_mgcg(struct radeon_device *rdev, bool enable);
+void vce_v2_0_enable_mgcg(struct radeon_device *rdev, bool enable);
 
 #endif                         /* __VCE_H__ */
diff --git a/drivers/gpu/drm/radeon/vce_v2_0.c b/drivers/gpu/drm/radeon/vce_v2_0.c
index d6fde3659e65f..163c9bfc03da8 100644
--- a/drivers/gpu/drm/radeon/vce_v2_0.c
+++ b/drivers/gpu/drm/radeon/vce_v2_0.c
@@ -30,6 +30,7 @@
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "cikd.h"
+#include "vce.h"
 
 #define VCE_V2_0_FW_SIZE	(256 * 1024)
 #define VCE_V2_0_STACK_SIZE	(64 * 1024)
-- 
2.25.1

