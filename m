Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5B22B4CF3
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733001AbgKPRa1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:30:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732995AbgKPRa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:30:26 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C6FC0613D2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:26 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 23so19579640wrc.8
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUOfHDa8VKjKfvaDOIZ0lG7+TRmewMW6pKq0nq4Yf40=;
        b=pUTGCNk+rZ3EaEHQY0/fTUeBO/p7mPxy9f4Bm8jCokpnyeV70DPnNhqKVsLCFt63Qm
         ACU7LOG3ZuIAbTDTAEgErIsdo3n5mMa1TPDxJYMJ0F6LOxLMP08OOvHhECSqSYdR9Q16
         7wp/V6BWIfRWem/StkKdn86uo4VJzwwIF3+AY2zACSZecet+5atiCVlsYMeVayfSUwHW
         YaNFxHSJEsauHgPIhSH/lL8FkB7WTsnOzqFEpStfgZzP3Ux7Awcx6tvKgWEnqfSOsRt8
         LMFGwwktx8/PZXj+AMwtyJWkVXLnsNO+ceVQlcHaii3g4UytHY9EYm/iog5OX/ir7/Fs
         JQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUOfHDa8VKjKfvaDOIZ0lG7+TRmewMW6pKq0nq4Yf40=;
        b=ncc9wTfAyXuaryimgU5m9yfPQWZCiFIjvihsC87U2R71QksX4EF3rUoOenkbFqTFe4
         tu2FulUxoTVak8E/3JI2aWX2x4nTT/qiLuElK8VGQiE9SV+Q5EUVVvV1Y0ofejU2CMXG
         u7vNihci0xxG9jCT32rChalkweHJKRU6Ed9I9QPsC6HK8AzW5Pv2AQ+CxakxLJSV/jep
         uj/VyUOnQb5LvZXvT2xNnUpeVeOAnhap4zUmoolGlOotrikoNPl4v1T96pecm6aofEDl
         TcMrtL0JqeRzIB7WzXwv6VhSkIQ+2Y45o57BBpU5uENESyBT69JmxNKYoXp7foI8ULz6
         aKPQ==
X-Gm-Message-State: AOAM5331pn+cbOq4G21rNWbEO3sBQNh+6Zmg4aKpuAQGLgIaG3e+Q9DB
        sqKQutRvJeFPJHT9leAc5rZs5IKWAoZxJ0s1
X-Google-Smtp-Source: ABdhPJxfdcVDzY6x6i+N4sbcOEu0AotpTw0Mztbru3BGjXnhJy6J89uDtcCOAVrXvDQ6INuK8KWXjA==
X-Received: by 2002:a5d:4588:: with SMTP id p8mr20546018wrq.224.1605547822432;
        Mon, 16 Nov 2020 09:30:22 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:30:21 -0800 (PST)
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
Subject: [PATCH 10/43] drm/radeon/radeon_pm: Move 'radeon_pm_acpi_event_handler' prototype into shared header
Date:   Mon, 16 Nov 2020 17:29:32 +0000
Message-Id: <20201116173005.1825880-11-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/radeon_pm.c:74:6: warning: no previous prototype for ‘radeon_pm_acpi_event_handler’ [-Wmissing-prototypes]
 74 | void radeon_pm_acpi_event_handler(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/radeon_acpi.c |  3 +--
 drivers/gpu/drm/radeon/radeon_pm.c   |  1 +
 drivers/gpu/drm/radeon/radeon_pm.h   | 33 ++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/radeon_pm.h

diff --git a/drivers/gpu/drm/radeon/radeon_acpi.c b/drivers/gpu/drm/radeon/radeon_acpi.c
index 6cf1645e7a1a8..1baef7b493def 100644
--- a/drivers/gpu/drm/radeon/radeon_acpi.c
+++ b/drivers/gpu/drm/radeon/radeon_acpi.c
@@ -36,6 +36,7 @@
 #include "atom.h"
 #include "radeon.h"
 #include "radeon_acpi.h"
+#include "radeon_pm.h"
 
 #if defined(CONFIG_VGA_SWITCHEROO)
 bool radeon_atpx_dgpu_req_power_for_displays(void);
@@ -45,8 +46,6 @@ static inline bool radeon_atpx_dgpu_req_power_for_displays(void) { return false;
 
 #define ACPI_AC_CLASS           "ac_adapter"
 
-extern void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
-
 struct atif_verify_interface {
 	u16 size;		/* structure size in bytes (includes size field) */
 	u16 version;		/* version */
diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index 65d172b13e065..1995dad59dd09 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -33,6 +33,7 @@
 #include "avivod.h"
 #include "r600_dpm.h"
 #include "radeon.h"
+#include "radeon_pm.h"
 
 #define RADEON_IDLE_LOOP_MS 100
 #define RADEON_RECLOCK_DELAY_MS 200
diff --git a/drivers/gpu/drm/radeon/radeon_pm.h b/drivers/gpu/drm/radeon/radeon_pm.h
new file mode 100644
index 0000000000000..5ef147785e815
--- /dev/null
+++ b/drivers/gpu/drm/radeon/radeon_pm.h
@@ -0,0 +1,33 @@
+/* radeon_pm.h -- Private header for radeon driver -*- linux-c -*-
+ *
+ * Copyright 1999 Precision Insight, Inc., Cedar Park, Texas.
+ * Copyright 2000 VA Linux Systems, Inc., Fremont, California.
+ * All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * PRECISION INSIGHT AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __RADEON_PM_H__
+#define __RADEON_PM_H__
+
+void radeon_pm_acpi_event_handler(struct radeon_device *rdev);
+
+#endif				/* __RADEON_PM_H__ */
-- 
2.25.1

