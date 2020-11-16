Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158212B4DF3
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733168AbgKPRjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733175AbgKPRhJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:09 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDF6C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:07 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id b6so19641535wrt.4
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o9jTMX+lMkxyW4xpU+ilcx7gbWHjRBMJqKFY5D9XSUE=;
        b=YrJA3W0C9dsPwTP/yfNgQAL9bO2bgqXFQArq4CGYlu7c0P+DN7wbawX9LjnxuhvONe
         0quf3FrequM/kbem6PqJGbgOqmH4dK8JhvnywHvc14Exnz7jAqeyyf9bwYRWCxcSlbb8
         e0VPOgEpGP757EDJ9zmk04yi14jhswRxOecc+Zamzk/uCgzYjg0t91Xi3v1zoTRpV08E
         BlFq71iMwA3q6+kZpJPWrij4diWJje6TGuw8ZGjP5wrEK3YP7LRRiRJCo8uPb4D4CRiT
         pScKHrntlfXnHZ75BhMpZ4l7sodrF3bTTSW32JnIQt/VeI5R4A36DnCBBPiSRCPhEmJY
         219w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o9jTMX+lMkxyW4xpU+ilcx7gbWHjRBMJqKFY5D9XSUE=;
        b=t+b62KlSKL+np5L0BJiyxakmHvpJq1vsUjFZIYLHn/2ZHeBEgw43OQ5bRbIjJWI/KL
         75KcziPH+FNf9yark6BBkM9iyQmkTvC/BsHeE52dBYbgAnobhk7voIbKoj+P73niK/PA
         qEuo7gGgB5R8lhFFOWOrjLH97k7MoKNUcW56Jeyt/e+U6W0tOu0p6f1A9J+F78SH8yJO
         n8kKdil8/NKfuHh6j4aW2cB2t7opvK9cuMPyICkA6xtBiWdR6GsPL0BBRERJ6KXWobia
         QPfMaxKdL2dqahhXgcp3ixDEqQLrKaOyrZhfOpC3641ywWScAsX8C5s90GEgAUx4oXt8
         fdTg==
X-Gm-Message-State: AOAM533PIdageXqy9MuUSlht43BNZ/M19JWT35KrN5te9KR3fIAwO9Kp
        iL2+tn/IZpSi8luy1/EyupCuHw==
X-Google-Smtp-Source: ABdhPJwtiOEPOPwzQ5wAnO/EE8bSERvaF1LOYYr8RASu/2/tCRMZhqvPm8IGTArHT7ORS2Ednp76Fg==
X-Received: by 2002:adf:c547:: with SMTP id s7mr20526713wrf.222.1605548226270;
        Mon, 16 Nov 2020 09:37:06 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:05 -0800 (PST)
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
Subject: [PATCH 02/43] drm/radeon/radeon: Move prototype into shared header
Date:   Mon, 16 Nov 2020 17:36:19 +0000
Message-Id: <20201116173700.1830487-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Unfortunately, a suitable one didn't already exist.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_device.c:637:6: warning: no previous prototype for ‘radeon_device_is_virtual’ [-Wmissing-prototypes]
 637 | bool radeon_device_is_virtual(void)
 | ^~~~~~~~~~~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/radeon_device.c |  1 +
 drivers/gpu/drm/radeon/radeon_device.h | 32 ++++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_drv.c    |  3 +--
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/radeon_device.h

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 7f384ffe848a7..ad572f965190b 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -42,6 +42,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/radeon_drm.h>
 
+#include "radeon_device.h"
 #include "radeon_reg.h"
 #include "radeon.h"
 #include "atom.h"
diff --git a/drivers/gpu/drm/radeon/radeon_device.h b/drivers/gpu/drm/radeon/radeon_device.h
new file mode 100644
index 0000000000000..3112b99ae36f1
--- /dev/null
+++ b/drivers/gpu/drm/radeon/radeon_device.h
@@ -0,0 +1,32 @@
+/* radeon_device.h -- Private header for radeon device -*- linux-c -*-
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
+ */
+
+#ifndef __RADEON_DEVICE_H__
+#define __RADEON_DEVICE_H__
+
+bool radeon_device_is_virtual(void);
+
+#endif				/* __RADEON_DEVICE_H__ */
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index f813eb5e140dd..536b246b9a6aa 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -52,6 +52,7 @@
 
 #include "radeon_drv.h"
 #include "radeon.h"
+#include "radeon_device.h"
 
 /*
  * KMS wrapper.
@@ -293,8 +294,6 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static const struct drm_driver kms_driver;
 
-bool radeon_device_is_virtual(void);
-
 static int radeon_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
-- 
2.25.1

