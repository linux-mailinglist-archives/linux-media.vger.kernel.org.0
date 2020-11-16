Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3A172B4CEE
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 18:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732956AbgKPRaT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 12:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732908AbgKPRaS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 12:30:18 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D87BC0613CF
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:18 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id l1so19595035wrb.9
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2020 09:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYd0yK/RTvMALAHwJymskqLfNpbt6qhOE1pCsWZvd64=;
        b=lDIlK2xaGwnzIz+QADs8o6Bo79L3RZPPz8VoCPoBcfthqdLDQPw8MO6yO/xZJQ+AvN
         U5FYXK1M9NtFYOSvrc03rX/lLJ5sDK8K2tvTxpIGRbO0hU2a7vA9kPMLM2Wx5pa1umgs
         SVQXaFlJd0LOiwLfm6Vd7w0r+4D6UUTOsWPfSwb66utl5bg/Dbb8t6gYcZlS4qt+QdZM
         GlUPfcUz0K3rMn550b76K6Y/hFA/KmzeM+nivd+0YckiZXtpuCvU8l6E333ACnsr7yxq
         Fsv/Ycmpzhi1MzqUT1drTicwjPwiKr9KzQKbIU0nzb4H6Zlxfs7g2AgD2lSQxi1An5vd
         DZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYd0yK/RTvMALAHwJymskqLfNpbt6qhOE1pCsWZvd64=;
        b=Oqqn3vmuKW6874ndSudRwgXRb/SpX2EXvjFDuPithUnEhr9tNJZFuF5ojMNzTYgEv4
         Bf0I/Vcots+v0b1+qoaV/oSvydVPgiulug20AS6WkgHeof+3pjtaxxUYU6rj71A88dgT
         QxiPvt+QNez89SN0AQsk2hHdOl0qVQ+CkvNYGvD06Que0527fkHdOFdxP5laIYBuI6R4
         hpW9IB5W0ttMlzVafkeqnr6lNRaeqDXL1O5kE+IouSxHkieFi+xcRZLFbYp5dxmvm7+o
         DaUTI5VMttXl/RRU+eQ22YSKAoO+bTFjAqUq6dgPbsNB7xAxST1BNDMG86lCrLAs6Rez
         +ceg==
X-Gm-Message-State: AOAM532eF+uE/SW1uZruTkIvwSi9mqm4kyzaKsgH/bWTXTbHBkbUK945
        ZmXr3XxBaswDlZ1j+HPrkSoNNQ==
X-Google-Smtp-Source: ABdhPJxNnwwfVIVFwC1HbJsPcDz90XOXl0PIvrYJDAq7LbMVy0MJs++OUn9XFrPB1hSrWNurrLbtjA==
X-Received: by 2002:a05:6000:1cf:: with SMTP id t15mr20965202wrx.92.1605547817138;
        Mon, 16 Nov 2020 09:30:17 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:30:16 -0800 (PST)
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
Date:   Mon, 16 Nov 2020 17:29:28 +0000
Message-Id: <20201116173005.1825880-7-lee.jones@linaro.org>
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

