Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE4E2B4D5F
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733209AbgKPRhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733190AbgKPRhL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:11 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E10FC0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:11 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id k2so19677122wrx.2
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sc1pkIB+FW/k5gLv6YQPQhC4CZ1RwfaoeaGhthq0b4c=;
        b=mPuaAhSddpX0TY3ZOxs/irH2uOKqIchw+XgeJzhGsetdcsBXHVK93VOGNAfvw00h2A
         RXXmy0+ahdAZxG37S0KzyocdNXVyH1e4Luo5P6OGLZUH3UmeHNgJhubVQ0P//WvV23EM
         FlsR3laPq+0oWJlRkbm8x9gXl91boEdF8JdRy9dO8Es04tZC9zAaS//aUF+KveB8SpSk
         uD4Okgb3cB0vsK7Iu6ALQ5nYFNr+Y7gM3OGe4WAz/RiItYAIMlMGMl62RJetUQLtVH85
         FywTI4ViK53ViNmFVMYUo00yJwlS00aQBZ0C+XZ2Grt6XYuogGK9d5W0nlntcX9vOCUs
         6dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sc1pkIB+FW/k5gLv6YQPQhC4CZ1RwfaoeaGhthq0b4c=;
        b=cei8gDVYfHIeDygXZlkqGu4+0tecGIGyxbxnKUlGUFirSRgOH7XZ8REL3nJUF9rjqX
         2Q5Bhjaua1Pa23z1zZSWWDAU+9yBCacK3Z1vgqdRLHVKVz2/IsoFa+OwCIQev3wA2XNk
         RKkIjBl46Rd0QXQATC/lU6M05U0Zg4yZyWT/9B0ziufPNHCJBgMS4zAVR+npvkp1dtl5
         4X558hwbEZqQOOvy575UJx2LTxBmLgAkCglAz2hxtt8HaLKYDdXZeDCppB1xvO7lnqpI
         Yz5qYDVxtEdIN4xo0neDD0U08nSUzpB+0kzlUEtv3LwfFJSvqi41+CXjqeod+5tBId1Z
         Iqrg==
X-Gm-Message-State: AOAM531b/yi6f7rhenSKCQydC1vCPNuAr5rGxoFzZMulOK8Dt9xMoSO4
        ANFkEJbk1ZA+B4zNxof34XGR2g==
X-Google-Smtp-Source: ABdhPJx/CgDQnJgp2vUU18Py1OgzA+nGyj8bmKcejT6CvCOBDYKMmVYShIvkZKlWr78Pq9qiZQ96Zg==
X-Received: by 2002:adf:9e48:: with SMTP id v8mr21993925wre.55.1605548229923;
        Mon, 16 Nov 2020 09:37:09 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:09 -0800 (PST)
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
Subject: [PATCH 05/43] drm/radeon: Move radeon_ttm{init,fini} to shared location
Date:   Mon, 16 Nov 2020 17:36:22 +0000
Message-Id: <20201116173700.1830487-6-lee.jones@linaro.org>
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

 drivers/gpu/drm/radeon/radeon_ttm.c: At top level:
 drivers/gpu/drm/radeon/radeon_ttm.c:817:5: warning: no previous prototype for ‘radeon_ttm_init’ [-Wmissing-prototypes]
 817 | int radeon_ttm_init(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~
 drivers/gpu/drm/radeon/radeon_ttm.c:878:6: warning: no previous prototype for ‘radeon_ttm_fini’ [-Wmissing-prototypes]
 878 | void radeon_ttm_fini(struct radeon_device *rdev)
 | ^~~~~~~~~~~~~~~

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
 drivers/gpu/drm/radeon/radeon_object.c |  3 +--
 drivers/gpu/drm/radeon/radeon_ttm.c    |  1 +
 drivers/gpu/drm/radeon/radeon_ttm.h    | 36 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/radeon_ttm.h

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index ab81e35cb0606..8bc5ad1d65857 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -40,9 +40,8 @@
 
 #include "radeon.h"
 #include "radeon_trace.h"
+#include "radeon_ttm.h"
 
-int radeon_ttm_init(struct radeon_device *rdev);
-void radeon_ttm_fini(struct radeon_device *rdev);
 static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
 
 /*
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2939e71ceb700..28b300ed200ea 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -51,6 +51,7 @@
 
 #include "radeon_reg.h"
 #include "radeon.h"
+#include "radeon_ttm.h"
 
 static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
 static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.h b/drivers/gpu/drm/radeon/radeon_ttm.h
new file mode 100644
index 0000000000000..91ea7141bc812
--- /dev/null
+++ b/drivers/gpu/drm/radeon/radeon_ttm.h
@@ -0,0 +1,36 @@
+/* radeon_ttm.h -- Private header for radeon driver -*- linux-c -*-
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
+#ifndef __RADEON_TTM_H__
+#define __RADEON_TTM_H__
+
+struct radeon_device;
+
+int radeon_ttm_init(struct radeon_device *rdev);
+void radeon_ttm_fini(struct radeon_device *rdev);
+
+#endif				/* __RADEON_TTM_H__ */
-- 
2.25.1

