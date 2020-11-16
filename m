Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130F32B4DE7
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbgKPRhO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733199AbgKPRhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:12 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EF6C0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:12 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b6so19641978wrt.4
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYd0yK/RTvMALAHwJymskqLfNpbt6qhOE1pCsWZvd64=;
        b=WEr8pecmVcQpaa9qceSySCD2vox/S8lGFDWchqRJOaIQXEFSmatxKOyeMN6ZCx5CYN
         bxACTDZJiWuve0C2b771BjAYvKJB5gfVCyzLruL3v+xGiCEd/C2jj3Ja6PlrY/zVXHMX
         ZuTtUfjgNIWmZ6XXlDN33ZnpA9eZKUMXSC+Itq8OKilmIzjeiBPPESRSQncbt6mVyu3+
         LMyc1xo2uNcIShlOfOnSgrNEQXZzIygifCFX/MuZX0WGSuCS5+zeWIMCA5E4EvYZ6E/K
         NFIuCIGVfnUqL3dY178Nuxa6qiktAgWEKc9YuOWvnYVt+AEEPVfUt9e3JTQ4Glut5Ax5
         A8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYd0yK/RTvMALAHwJymskqLfNpbt6qhOE1pCsWZvd64=;
        b=Z6dbix0TkmFosMenqSFuWyENhTHWBMb3Hvg9HA07A1BPGtHYg9OfitORY0uV1GBZzw
         N7XKkS1aVPWmUBHVuYScob4zeUGBZYrN0lv6aagfxnZmFxIkRj0MqE8n/JlbEHfzAvSR
         veBnxXiGOhH5196D547UXr3LtuNCRQTskL33PY/k7HYP7zCpA+BUc7pUJLL0zMNj3Bcc
         c+x+R1KRziUrBJ5LPLBQHRHbcx5Wb7u/pm1GKePwyhFv7TwHzfFLle+X8TwtShPYWTSG
         BjNlBE9J/Tl1mHdR/LP7AQXElsuzdyOkduudB+H6h/+xiyQye/SMaCTUxHrPWBQzI3HB
         d/kQ==
X-Gm-Message-State: AOAM532P/40f1FlQzWy3FzQ6DjXvodikVSyV18Cu0ybI4zcGzLbYVz69
        MToSAxosYsour+VlTCFYrrjhUQ==
X-Google-Smtp-Source: ABdhPJzyeZ8kfZiEmWikGIJGFTK6fzLxVdMV1OPwIVROqpKkbsKMU1vU555y2ryEySckR8rcxiB2dA==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr20138778wrv.243.1605548231323;
        Mon, 16 Nov 2020 09:37:11 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:10 -0800 (PST)
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
Subject: [PATCH 06/43] drm/radeon/radeon_legacy_encoders: Move 'radeon_add_legacy_encoder' prototype to shared header
Date:   Mon, 16 Nov 2020 17:36:23 +0000
Message-Id: <20201116173700.1830487-7-lee.jones@linaro.org>
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

  drivers/gpu/drm/radeon/radeon_legacy_encoders.c:1745:1: warning: no previous prototype for ‘radeon_add_legacy_encoder’ [-Wmissing-prototypes]
 1745 | radeon_add_legacy_encoder(struct drm_device *dev, uint32_t encoder_enum, uint32_t supported_device)
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
 drivers/gpu/drm/radeon/radeon_encoders.c      |  4 +--
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  1 +
 .../gpu/drm/radeon/radeon_legacy_encoders.h   | 34 +++++++++++++++++++
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/radeon_legacy_encoders.h

diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index ced022fae19d7..b60a373d3ead3 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -31,11 +31,9 @@
 #include <drm/radeon_drm.h>
 
 #include "radeon.h"
+#include "radeon_legacy_encoders.h"
 #include "atom.h"
 
-extern void
-radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
-			     struct drm_connector *drm_connector);
 extern void
 radeon_atom_backlight_init(struct radeon_encoder *radeon_encoder,
 			   struct drm_connector *drm_connector);
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
index 44d060f75318e..e64fd0ce67070 100644
--- a/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.c
@@ -35,6 +35,7 @@
 
 #include "radeon.h"
 #include "radeon_asic.h"
+#include "radeon_legacy_encoders.h"
 #include "atom.h"
 #ifdef CONFIG_PMAC_BACKLIGHT
 #include <asm/backlight.h>
diff --git a/drivers/gpu/drm/radeon/radeon_legacy_encoders.h b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
new file mode 100644
index 0000000000000..a80b387559d4d
--- /dev/null
+++ b/drivers/gpu/drm/radeon/radeon_legacy_encoders.h
@@ -0,0 +1,34 @@
+/* radeon_legacy_encoders.h -- Private header for radeon driver -*- linux-c -*-
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
+#ifndef __RADEON_LEGACY_ENCODERS_H__
+#define __RADEON_LEGACY_ENCODERS_H__
+
+void radeon_legacy_backlight_init(struct radeon_encoder *radeon_encoder,
+				  struct drm_connector *drm_connector);
+
+#endif				/* __RADEON_LEGACY_ENCODERS_H__ */
-- 
2.25.1

