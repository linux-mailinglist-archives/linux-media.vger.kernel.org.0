Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2462B4D6E
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733310AbgKPRhi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733308AbgKPRhh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:37:37 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6F9C0613D1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:35 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a3so10637wmb.5
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bUgD99dAZfuLWNam3kGxkjEykoel9F1pl4Jg76K7MCg=;
        b=A8HzgcFmHJlDoRnxOLVZNJsNZd5RSaDMhSbJjyA6Zsf+uOVZiwxgsrZ3qS/yomov6M
         ImfkYga1c9za82A3rxY+3q1sgd1dKCR4FLFTq54FzNvsOXjP4jT3rk7iNq4V+OfNY1qz
         HA3Guu8rubwWPgTwa96fKsPnDlmxn4lljezuu9Htm+kOdivDmj83mDkrl9I0Lgmt7hAI
         NcjebhEvuNFy98kZ0fjw6avLJaR4r/+QtLJqJbYxr/c1rqXQdoPd7Z2LCUKWcWb219aN
         MtgPdH+xHTSR3WfhZ6yXP6rToCbCsx2/OQ7yUsk6/6IyW62TPiCBhsUK01Z3RQsgytV9
         pl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bUgD99dAZfuLWNam3kGxkjEykoel9F1pl4Jg76K7MCg=;
        b=iaL/maWE4rW1lNBaI7YGFIVmyVpy8IJoGERnOpAoyBGI+npMS/UWMRjP8dZTn2cla9
         jzL6saBm7dT+lbd9YUwm8tpsX4WyEgCzlnZ2ESnBkvc/dyvG9VEUCy8brU8keUz99HOZ
         DNR7vcqzYUHn1nvx0QAj48DqsJyjjTGcHb3hnqGmqhhggX0ZNWD/j7QB+3T4Isq8ooCG
         XLJVlc93in/+ui4Y84Yqa5FgvMStY9z8IIYOqd2J0qqPLNo+uocJqPxoIYs7aU2WcJbY
         p8Xp3y6OzR/N61EPfmUzoaM0Oe4jVdMJkXUSkLKjcE6orFKZGs8N5135eDYkPKYMhaR7
         35Qw==
X-Gm-Message-State: AOAM530DkX8iGwJk7CNBo1qxQGaf3sNHZUvzbiXLP0HiDkVE3pvrdehV
        YQ1hUXPRzRJxPAnZnIqlohsMjg==
X-Google-Smtp-Source: ABdhPJxlyykqsXt354bAFqYf+ZEcs9kf2t4KuZ489r99dtOsPjsfVIxOwBijBEqB1CWFQJ+qtJiSng==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr15910947wml.57.1605548254381;
        Mon, 16 Nov 2020 09:37:34 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:37:33 -0800 (PST)
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
Subject: [PATCH 21/43] drm/radeon/r600_dma: Move 'r600_gpu_check_soft_reset()'s prototype to shared location
Date:   Mon, 16 Nov 2020 17:36:38 +0000
Message-Id: <20201116173700.1830487-22-lee.jones@linaro.org>
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
 drivers/gpu/drm/radeon/r600.h     | 35 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/radeon/r600_dma.c |  3 +--
 3 files changed, 37 insertions(+), 2 deletions(-)
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
index 0000000000000..2a3915f0039e4
--- /dev/null
+++ b/drivers/gpu/drm/radeon/r600.h
@@ -0,0 +1,35 @@
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
+struct radeon_device;
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

