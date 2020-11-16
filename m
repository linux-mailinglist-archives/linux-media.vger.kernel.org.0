Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FFC2B4CE9
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732907AbgKPRaO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732909AbgKPRaN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:30:13 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24145C0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:13 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id u12so12391444wrt.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o9jTMX+lMkxyW4xpU+ilcx7gbWHjRBMJqKFY5D9XSUE=;
        b=cVJh/Ke+OD3Oll6rBgHwkuRb+Nz6wo5pKXlIS2z7NkqcZeSlGdbl1LW03toVNELEle
         LB9raRwisH2MTIhDMoAq6JwKRfx6IpDTYKgM1JwYpOtE82ZmIIXVjcsRCCY3EVqVwYgA
         1IdOzo7dyBuR/SyeCiFrCs9DOxgyv4VbvC7PJ62Gq9ymaVUBVuPyvlhwxd1ywS70eaQg
         9NtGYiwVYJ3135AaW2b8kuQ93Fg0M+ZZ89cYlkYsqlUqnZnLZPULjeVzLuH9CxQBZNwJ
         Ax0EseW8X5M3aMygECFAh6szNkJH5IZSQqJkTJLvffdI2+VLjE+ITqmAzQwVp5Lp++Us
         Kb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o9jTMX+lMkxyW4xpU+ilcx7gbWHjRBMJqKFY5D9XSUE=;
        b=WMj+Hkh1WvoVvY6oeb5NFvZZ3cCRWRUojOGIvhDrjC9oP59HXOi6kMJoO8H+KmDSRv
         VeRAOVk5piAcSWmyM9uekdPMOkYK+eizF4N8F/WXgujtvR6CUPJn1S2TmA8GpCsr1U2X
         1l4nwbcOXx8QavjcyOqDgO6NJUsrvkv9xfHW0yt2epf8CoGLdv70WITJX8cDJgioZ3G/
         z5U07CJ/VgvUOEDSmlzGzSl+eX2eUg4PPq/TlYH23yXk040MzHydOw6RFMUllHyJ/y6/
         Xc544KvPkuHRDXKuYb5XRqy+UcIuatYB6xp5HMzUuctspJ0W9fyqZGrN5LkGujG2Gm7T
         jhyg==
X-Gm-Message-State: AOAM533Ur4Cve15+MpqOWNhwUnep7FziOuVHcGG9rSy6NFF/P7OhBAzX
        uuk6UMr7bORKX3CT1x7bGIJBbw==
X-Google-Smtp-Source: ABdhPJztg/GMLQiJsp56ZgQw+18EozlHIZfdrJ3OccOyQp9MQYy9FV43/uUUpAIaYwVj4+6W27OXmQ==
X-Received: by 2002:adf:b78b:: with SMTP id s11mr20356134wre.42.1605547811771;
        Mon, 16 Nov 2020 09:30:11 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:30:11 -0800 (PST)
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
Date:   Mon, 16 Nov 2020 17:29:24 +0000
Message-Id: <20201116173005.1825880-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173005.1825880-1-lee.jones@linaro.org>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
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

