Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35442ADF79
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 20:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732039AbgKJTbz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 14:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731666AbgKJTby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 14:31:54 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F182BC0613D3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:53 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so4342886wml.5
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2020 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yZG8b3VSvYC13jIZxtAzuDvkZe5JEeqWAbsGA92XYsQ=;
        b=PlTwq3M/AnxqB4it2zELA31g8xTkrmipGiAiUpyRoXp86grITjzcET7M5mbdvGW3lq
         jBzstjuCKRAiKDf6MGVtBf4Xv+PCU+UJEhTiD+NT0f64OnFgVJ1dIsoIkAE+ujw1/U42
         Vu3uVodNEJupMp4SunieavkN3LdV3WeqTT8tvtpi/j0hQ5UkUWPa+ISjf0hCOrSELHvY
         5VohlWvYGlOkiJZX8Kux1RkuyzKXIDRA9kJ8cgPdhefeGBUCsl6nAO3ky7vxw5QPp1ky
         IUHYfN7JQbqmXt7dh0KWpIWhreJbKnNZ/BJSzNKn3qA5jiqvTdkIsTO2vv9kHexAoB94
         ptWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yZG8b3VSvYC13jIZxtAzuDvkZe5JEeqWAbsGA92XYsQ=;
        b=T3QU1p7XHvZrATkI2sH4oYx0CLlrQecf/+m7cxrRG3Bn6eyOGn7Cx3Fj8/3VENxs8E
         GGUb+dQvGkAvH28CqWG5guIcuo8nr6zUSwN/AlDRmtLww32aWQYDdctN0i04d080HJtS
         ejZ8avvqQdRqnCPj/E0f5mATrb0ppcI+/qnJ6Wp4oxKVuzHlkze/RIljHi72gPLnPvd2
         Z7m423E9ZX/KqnzzAQhae7kKrqdHz9zBkDcPFakVig0oPcJkkNg9lB8KVikFznFzrFSr
         fOgOOr2nsidoTv0xFMUV2OslstuMs0STzihhu0D0cxGJ7kGLnBZlalp3ulwSe+HaFfeb
         Rmfw==
X-Gm-Message-State: AOAM53171zPwOL7qhg/XvA2undxV9iUncRoKWJJkZQGobX4UrbE9DJIN
        U0Oyamw0vqfvJfAILbiVh7b7Ew==
X-Google-Smtp-Source: ABdhPJyFX4EIySZjnq8I6WF/JdNy53Tt+dwFFrIcPtMzg1PSx9VchypF3YcPFlJNIm11CfwAdPrzZg==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr766401wme.0.1605036712676;
        Tue, 10 Nov 2020 11:31:52 -0800 (PST)
Received: from dell.default ([91.110.221.139])
        by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:31:52 -0800 (PST)
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
Subject: [PATCH 29/30] drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s prototype to shared location
Date:   Tue, 10 Nov 2020 19:31:11 +0000
Message-Id: <20201110193112.988999-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/r600.c:1615:5: warning: no previous prototype for ‘r600_gpu_check_soft_reset’ [-Wmissing-prototypes]
 1615 | u32 r600_gpu_check_soft_reset(struct radeon_device *rdev)
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
 drivers/gpu/drm/radeon/r600.c     |  1 +
 drivers/gpu/drm/radeon/r600.h     | 33 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/radeon/r600_dma.c |  3 +--
 3 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/radeon/r600.h

diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index f09b6dc5cbeb3..94e8815e5067d 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -39,6 +39,7 @@
 
 #include "atom.h"
 #include "avivod.h"
+#include "r600.h"
 #include "r600d.h"
 #include "rv770.h"
 #include "radeon.h"
diff --git a/drivers/gpu/drm/radeon/r600.h b/drivers/gpu/drm/radeon/r600.h
new file mode 100644
index 0000000000000..1bf2d0572f047
--- /dev/null
+++ b/drivers/gpu/drm/radeon/r600.h
@@ -0,0 +1,33 @@
+/* r600.h -- Private header for radeon driver -*- linux-c -*-
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
+#ifndef __R600_H__
+#define __R600_H__
+
+u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
+
+#endif				/* __R600_H__ */
diff --git a/drivers/gpu/drm/radeon/r600_dma.c b/drivers/gpu/drm/radeon/r600_dma.c
index af6c0da45f28a..89ca2738c5d4c 100644
--- a/drivers/gpu/drm/radeon/r600_dma.c
+++ b/drivers/gpu/drm/radeon/r600_dma.c
@@ -24,10 +24,9 @@
 
 #include "radeon.h"
 #include "radeon_asic.h"
+#include "r600.h"
 #include "r600d.h"
 
-u32 r600_gpu_check_soft_reset(struct radeon_device *rdev);
-
 /*
  * DMA
  * Starting with R600, the GPU has an asynchronous
-- 
2.25.1

