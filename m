Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8262B4CF7
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732867AbgKPRak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732958AbgKPRaU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:30:20 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59EEC0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:19 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so19608176wru.6
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
        b=qfvsLkNfBDVcez+mP8sjEQQ2PAy0RRLcrkAePUGE8FPOg5SROKwYV7r3WaEAHsSl8q
         82z1+lEhHRxnJWYkIyDvOV/SBBEbIZ5LXw4FQCkFeL6yTqDc0iJ7p3uHVcgvkWj/1K3p
         llSlffDSlSjk49XcQEMEPFfawSiO6P0lomMGwzZcl6YyrchqtiH15P9BE1jRABqhPS94
         2oJz4PH9Vn3t5KP+9FtHMqRMCa1vPMBe5ituVb9WjxKv4gixjTE4YNYnMDSgRXv5ryhX
         bInIpfnWVcgCL0dV3+zAS9swCq7gx/SrASVAc85BqnKz23zIrOuI4k5cV7JITZ5yyeTo
         +FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
        b=KWe+e6r7O2wEoexb+1M+IjgIrDgR7r5aRfp5ArkqOS+DXsktfhTS3o2sjJcJDoGccS
         bDg1lep71Zi1UIGqHlrB2vknCkl0zKd/fMVVFkiawpIYw0sYpxxOzE9Jpc9I+HD9JM0d
         sS0gS1XpTd1GdkjOqjmpTeIVYaOrKSvWBm/tk1O5xtw+rU0uQecJ2Di31ZZxQTp0tmEP
         h/7Yq13gy+XDkJngMMVGpJ2tJObQyz60QnFyhut/g31jKu09eS+Kdj3AwgkO4JzvvSZ9
         3O7wD7/N3ase3IPm5uIf5/K5lCVGPQJ2tZEPBEhxX6wfPkmRXDzj9Vf+/6512Z1XRwFn
         q+tQ==
X-Gm-Message-State: AOAM531zRo5XFf7KeOdsco3pvgSA8oqC8jRcYy/V/WGQzGGRsk+n8Ff1
        VSRBABzRKzTaxdL8O9P/5DRDaw==
X-Google-Smtp-Source: ABdhPJx67FcvrUuJao/V/YluYnVebJQCRA/5ZbDROAXO4liKX3AvUnuGTXJX2Cwa9GTXjayZxyA4Sw==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr3868933wrt.308.1605547818474;
        Mon, 16 Nov 2020 09:30:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:30:17 -0800 (PST)
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
Date:   Mon, 16 Nov 2020 17:29:29 +0000
Message-Id: <20201116173005.1825880-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173005.1825880-1-lee.jones@linaro.org>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
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

