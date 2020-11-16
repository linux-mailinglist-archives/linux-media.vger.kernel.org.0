Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9D52B4DEF
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387622AbgKPRji (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733216AbgKPRhP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:15 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16A6C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:14 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r17so19661971wrw.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
        b=Vc5GZewOWwNVlQxibWBU3viESAoqgPega2X6NU2xDrzPEahsS9QUDJyPFhPBGFxdC7
         HBykf6FEj3VInb3HC2V6P17mmyOfqFSHC5kzDIQ8keYwRRL+9LrGlFxItlQxe7LbDUgS
         LvE8HF7vZOo6iSgSePndqpGMp3P+yqXd28lpYJEDSCVc082lkOLc+G3gnEmolCbEa894
         QD/47FaLCwFsP5QUfCCyofyVYQkoOV6DyHCYDTFnyF6pxQF1iMWWrePksIFBvIVqxZFF
         WCeD2yvs8YItRj9sXCz0v5tGaQqPL9HrZnmh7TOfWG5b/iViPG4YuTZeBPSFhxFB7ae2
         Nzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
        b=LQ+ovhFt1YrtpHDHETg6LnsCjUUxyCcrh9L4rMf3JumGtNgmruJgus7Opu9M+RDgui
         M4Qk90UcCP8ZeKb/VOn2BHS+B7fkcBLCCPbeOT2IEkcsQoGDFDUCbtf2BUnh7gqbvdDP
         LG1INDgewPjOm/czAsPqi97SDeO9YImb1gbzozJMlBbDp7PswT6RWUEzMix+r9Eb10O0
         vQbeqRHJ/m0pGvDAzSpmwpawfoxi/9CdbwqzxUlAwPExQHjpz0oIHeIEg1tbTlxMerYt
         DrgkIjYu0SurWdFGcYWMvX2M2K1SR9T/d+KzTdc0S1pWGI9ou9lhFuSaAfjHWEvyGUbF
         0k9Q==
X-Gm-Message-State: AOAM5305r0q80Zhznutv+HIaoBxVIimsGPOVCqbnzowGV5Q3lw9hmHHK
        qR/i090XU0AIXN2ZRkzVMw7x/w==
X-Google-Smtp-Source: ABdhPJzyMT4+odwIPp9VPe5j6JTcciaX+poblLtpI5iFjA5SyWdLDWAzEN7gzzZBk12h4g2H4yez3A==
X-Received: by 2002:adf:f881:: with SMTP id u1mr21824326wrp.103.1605548233683;
        Mon, 16 Nov 2020 09:37:13 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:12 -0800 (PST)
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
Subject: [PATCH 07/43] drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder's prototype to shared location
Date:   Mon, 16 Nov 2020 17:36:24 +0000
Message-Id: <20201116173700.1830487-8-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/radeon_legacy_encoders.c:1746:1: warning: no previous prototype for ‘radeon_add_legacy_encoder’ [-Wmissing-prototypes]
 1746 | radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_t supported_device)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/radeon_atombios.c        | 6 +-----
 drivers/gpu/drm/radeon/radeon_combios.c         | 6 +-----
 drivers/gpu/drm/radeon/radeon_legacy_encoders.h | 2 ++
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 71bf2ed172697..cc80651b25773 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -35,16 +35,12 @@
 #include "atom-bits.h"
 #include "radeon_asic.h"
 #include "radeon_atombios.h"
+#include "radeon_legacy_encoders.h"
 
 extern void
 radeon_add_atom_encoder(struct drm_device *dev, uint32_t encoder_enum,
 			uint32_t supported_device, u16 caps);
 
-/* from radeon_legacy_encoder.c */
-extern void
-radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
-			  uint32_t supported_device);
-
 union atom_supported_devices {
 	struct _ATOM_SUPPORTED_DEVICES_INFO info;
 	struct _ATOM_SUPPORTED_DEVICES_INFO_2 info_2;
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index d3c04df7e75d7..ff2135059c071 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -31,6 +31,7 @@
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
+#include "radeon_legacy_encoders.h"
 #include "atom.h"
 
 #ifdef CONFIG_PPC_PMAC
@@ -40,11 +41,6 @@
 #include <asm/prom.h>
 #endif /* CONFIG_PPC_PMAC */
 
-/* from radeon_legacy_encoder.c */
-extern void
-radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
-			  uint32_t supported_device);
-
 /* old legacy ATI BIOS routines */
 
 /* COMBIOS table offsets */
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
index a80b387559d4d..f4c7432267e67 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
@@ -30,5 +30,7 @@
 
 void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
 				  struct drm_connector *drm_connector);
+void radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum,
+			       uint32_t supported_device);
 
 #endif				/* __RADEON_LEGACY_ENCODERS_H__ */
-- 
2.25.1

