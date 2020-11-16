Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6C82B4D66
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733257AbgKPRhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733251AbgKPRhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:21 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F16C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:19 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 23so19605289wrc.8
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUOfHDa8VKjKfvaDOIZ0lG7+TRmewMW6pKq0nq4Yf40=;
        b=ut8jxO1lAmNq7OzJ9R4sz0vJdyrWQMXwL0AD6ih0EUtENjbT02f+txcqG8JOqBTl3G
         y8DyBeyPhhRECA9RCvjs4fvoaJ8rikWI8AKq0WhKNu4bFRC/xeyjdEMsORqjufwFFK82
         O4ZF7LtxJ/AOhxvXXu0e4DCqSSxUbH13n4bil2XlmGi2/fGURIoBCpx4Wbfq0Xh04L3b
         A3xYKjycgkl/XqpmhTHokEo4RtdlampZs0ZzrbVb36g/PSvC5p57RNjdkbjU1+kVsSkY
         yhaEPK+mpcZO8E+qjDbR8BUK3bXeBNtVCXID4/wbENNRoQeZ+MLf06BPQ72PlLc8BSFg
         cQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUOfHDa8VKjKfvaDOIZ0lG7+TRmewMW6pKq0nq4Yf40=;
        b=j7PbHfoh1AV5GTPOxldtjVoXASzDxWJLsKplyXvWTPwmwljPd2fLKWQczMZ+8sUvmb
         JTohwZ8Sm1oIcTi26a/63ecjvfSicJZMWgC+pmYOdxD9c95tGiOPhn0rJAZdbBuqLgIy
         uiaW/OtHAEZQF2T4OdB7TwqAlz1fFXlb2IPrL5bS/1dznl8dO+9ZFaDKSN54XIqooKN5
         5X6zSs68PaEGmfxxfKFWGZsQRQ3wXOC7p9HcKliKAk3j1BZYnQ6WiGmHRYCWnfLBt4rU
         UDVoJFBvUPe2dkaCBYG+6ms/sHxCEyB0ybIM6AKStVS+LWFftcpWyccEvIdA5dR920X+
         RYOg==
X-Gm-Message-State: AOAM5336cLd2SI1KQDZBkOW4Iv18Pn0m+anQWzzT2GoD05kTtG4vVhgc
        6zlcMwE2U6WiivesD7imjE2FtA==
X-Google-Smtp-Source: ABdhPJx2zAlCsh+71uTEhUoKN+Lvzh21s/GlhOo5TSlZcYkH4N2jg/QIQ2KTKWXCwfHDyQEx5HqGaw==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr20432633wrq.52.1605548238161;
        Mon, 16 Nov 2020 09:37:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:17 -0800 (PST)
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
Date:   Mon, 16 Nov 2020 17:36:27 +0000
Message-Id: <20201116173700.1830487-11-lee.jones@linaro.org>
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

