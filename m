Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1002B4D6F
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733312AbgKPRhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733296AbgKPRhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:37 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B444C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:37 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id p22so24744wmg.3
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NqivdSoS8aJrg9SJeB6kGm72B7/tU0UIKTvRD3ut9A=;
        b=C1Q+CHNZ+SnTO8vHJOinWbhc3vH3s30mod5pEkymEsYScz0GtjCroxKRsb7NQwoWde
         KV66Y0C0gQr6Krra8A9aDTX9GBdHGPWgrxfye5m2RGA5tOY5LqLYrKaX7x0Rb/gvR7hV
         zW1d6+ZnhsrFZ7oo1nbFKaf0UMMviNLMMDvZse1OretnkhtHys6LnzODOQNxHPpIoQG9
         KBOzzhpsuSNKHFAT5JxEjV6Jwd5h4xxOa5XhZKacJ43uzU9jnNQ9BVIxwGC6oh2JnwKN
         GLMxyUrLpqisq/HpJFKXLMi6C9Dgt5GcOrNkfmuxtlX1EEGwqudN1Lm+qCs+1pukF8XV
         niXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NqivdSoS8aJrg9SJeB6kGm72B7/tU0UIKTvRD3ut9A=;
        b=Qla9ZRRfWvwfP7tUCDXSufevaE5nliuUty1pRzWzoFF63vRu/gdotYzhJuRRcJN8Im
         g/czDeRzNOS4ceqgCacwK+R2cvgCzuLIhG0mdDTu5qC/zuWHSWpFdAv//3yWDCb2bima
         lRNotT5JdKKtZov8Dj6iANvZidKjDC8YZB62iuoVcZkl8qh21c+ofNyGkQqXR2OmjyOA
         IdV2u/yovaaoXe4oK91yxertz5YXaFRFMz8LUvhmhMoDSkFVvmmc+WhnquR1XwYUOewb
         fj9DPZiCUYuS1chch7TUrf6GVyRxVLxB9w4MqEWhH/IRJ7YEpbM+met5utIBlJByVks5
         krRQ==
X-Gm-Message-State: AOAM531uyCLZisFj8aSlap7yjR7zYCfgrCrx9sSpsf6vl0iFTUgXQmPS
        LOJcaTo2tGF6WMbNCza0EUoP8A==
X-Google-Smtp-Source: ABdhPJwMJtLAFYyr97EyAPYpJ7qyi5IqvZswjgm4XdVLqLLHFtaXQNWZ3VEoGPX14yGcY/n1XEUokg==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr16024wmh.88.1605548255825;
        Mon, 16 Nov 2020 09:37:35 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:35 -0800 (PST)
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
Subject: [PATCH 22/43] drm/radeon/cik: Move 'r600_ih_ring_{alloc,fini}()'s prototypes to shared header
Date:   Mon, 16 Nov 2020 17:36:39 +0000
Message-Id: <20201116173700.1830487-23-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/r600.c:3480:5: warning: no previous prototype for ‘r600_ih_ring_alloc’ [-Wmissing-prototypes]
 3480 | int r600_ih_ring_alloc(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/r600.c:3516:6: warning: no previous prototype for ‘r600_ih_ring_fini’ [-Wmissing-prototypes]
 3516 | void r600_ih_ring_fini(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/cik.c  | 3 +--
 drivers/gpu/drm/radeon/r600.h | 2 ++
 drivers/gpu/drm/radeon/si.c   | 3 +--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 315c4f3df3656..980b50d046cbc 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -34,6 +34,7 @@
 #include "cik_blit_shaders.h"
 #include "cikd.h"
 #include "clearstate_ci.h"
+#include "r600.h"
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "radeon_audio.h"
@@ -125,8 +126,6 @@ MODULE_FIRMWARE("radeon/mullins_mec.bin");
 MODULE_FIRMWARE("radeon/mullins_rlc.bin");
 MODULE_FIRMWARE("radeon/mullins_sdma.bin");
 
-extern int r600_ih_ring_alloc(struct radeon_device *rdev);
-extern void r600_ih_ring_fini(struct radeon_device *rdev);
 extern void si_vram_gtt_location(struct radeon_device *rdev, struct radeon_mc *mc);
 extern void si_rlc_reset(struct radeon_device *rdev);
 extern void si_init_uvd_internal_cg(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/r600.h b/drivers/gpu/drm/radeon/r600.h
index 2a3915f0039e4..e66ef58706cd8 100644
--- a/drivers/gpu/drm/radeon/r600.h
+++ b/drivers/gpu/drm/radeon/r600.h
@@ -31,5 +31,7 @@
 struct radeon_device;
 
 u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
+int r600_ih_ring_alloc(struct radeon_device *rdev);
+void r600_ih_ring_fini(struct radeon_device *rdev);
 
 #endif				/* __R600_H__ */
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 45076c27d7ded..d0407145c07b5 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -33,6 +33,7 @@
 #include "atom.h"
 #include "clearstate_si.h"
 #include "evergreen.h"
+#include "r600.h"
 #include "radeon.h"
 #include "radeon_asic.h"
 #include "radeon_audio.h"
@@ -128,8 +129,6 @@ static void si_pcie_gen3_enable(struct radeon_device *rdev);
 static void si_program_aspm(struct radeon_device *rdev);
 extern void sumo_rlc_fini(struct radeon_device *rdev);
 extern int sumo_rlc_init(struct radeon_device *rdev);
-extern int r600_ih_ring_alloc(struct radeon_device *rdev);
-extern void r600_ih_ring_fini(struct radeon_device *rdev);
 static void si_enable_gui_idle_interrupt(struct radeon_device *rdev,
 					 bool enable);
 static void si_init_pg(struct radeon_device *rdev);
-- 
2.25.1

