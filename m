Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D234E2AF836
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 19:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgKKSgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 13:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbgKKSgQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 13:36:16 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8DF6C0613D6
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:15 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id h2so3197815wmm.0
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 10:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tediDzLC047hOPrU32KTbEuOLPsPka6LUr15f9wO3Gk=;
        b=mMr7iJVO6/1xsFbpADaI0KX7kFyobKLggc8W56w7L3MMk2GfW4ljqeSfLeXhfyLEyj
         XjcdV/fGWT4uj/ehcXbaUUedrwdLzRksO/j39a1M/QzL8AVDA8lY6o8ZYh2yf6BNOu3e
         DokwqqpsUUt6tr8S1Kux1Dxrv2cbPTLIvSVIdfRuMbKgQ7Ptr3ZS/s4jeJ8fljJD6sYb
         v9NXlilvlnlZ68adPseWU4ZZM6H2kZQV/8utnv1rtWscJNiwN2k51ux+q5NmB5aAlXKc
         ZmV8EL5mCTwd7VfZihKfsERIoxLWBGqCUVn8V9w6s6As362FXbEMbtxmVL7KIepHs4eL
         rpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tediDzLC047hOPrU32KTbEuOLPsPka6LUr15f9wO3Gk=;
        b=eBsU5rTqDNFhrj/cI1H3Le+TSz6acd4P0YDP+q8qZBFL52XDYKLvTGMaiYAG1Qzgo0
         RhNmPPApY+Cq3HtH4VKJNnJ6RmWghjs1NXnFeFO42XzQ6dyS9pneHRdHQwJf02hLJnf+
         7hb6zbozIFkOz1v2ItH7TFdJN67etdqLaGB08+2AymR9cOODFchnwiRGiUKC9pWIrzcI
         9oQjnl/V+O1Azjf5MmclgdnnP4S7ZSLMdifvmggBtwFPLpI9kfd0H6n4XiioWZKLVKiq
         IIezpIOzUdFp9R1LWBQ5uuesnvRhz2uodbiBYq3Gz3veEisoQJvgtCuZHI1bVQ1SE1bZ
         IfGw==
X-Gm-Message-State: AOAM533ZzJtLQg4D0tbjS9OIQxrvS9z9jEDVqM3SLn3hw6t4xk/LnAY4
        ADDKjj2V8KBgoVDW0nVL8XRIsw==
X-Google-Smtp-Source: ABdhPJyn7zxm7zhP+Z5GtcjvgBa5Dzioyj+ILoping9J7cC5ythGDHHgVffVn5idPPNFm6Tk3Kb7kA==
X-Received: by 2002:a1c:20d0:: with SMTP id g199mr5981271wmg.68.1605119774423;
        Wed, 11 Nov 2020 10:36:14 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id k84sm3558311wmf.42.2020.11.11.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 10:36:13 -0800 (PST)
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
Subject: [PATCH 18/19] drm/radeon/cik: Move 'vce_v2_0_enable_mgcg()'s prototype to shared header
Date:   Wed, 11 Nov 2020 18:35:44 +0000
Message-Id: <20201111183545.1756994-19-lee.jones@linaro.org>
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
index 4520ec4c7b2e2..ae2a507d13bb7 100644
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

