Return-Path: <linux-media+bounces-41000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE0B33C55
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15CB81894685
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2652D9786;
	Mon, 25 Aug 2025 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Io85h911"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F62C1597
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116931; cv=none; b=QHT2SjqsDSpeVQ0coQpYgHs03Ux39fdcyIacAYKVyBbVAGtcxySD2JTUa8KgJhor0sXmIY1+X+7taT97iZwyLng2GlCuKGLiTEmMFmxFK0x4GveWdWJkkeFadnfvIYkJEdnFBsh9SElRL959gqCjbsUg5kMFcJvL7p/910VeuL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116931; c=relaxed/simple;
	bh=MfxlT6HHPLQ0+q+ChRWLyrMPR9Pk4NLHBouZRnY/i8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9BwE/QNpUoAu4IWRfEb1S8zGJNv0YBQjfjwlm2xfKIGteLvaCVOddQ15A4Y9rVPeddMeQRY0KS/bUNoACS8yjLI6Gza/6VxjK0Zl2gBFJPSTsYyK58wNHsHaZCzH10O9D++K3i9I1aeSASUw8X9UdIEolvr4EpV+2uVTPEN/IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Io85h911; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b0faa6601cso68386491cf.1
        for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756116925; x=1756721725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFt0F6s62CwKTaaArfzgIuwwDW3kJdXGRmblHfk+gSs=;
        b=Io85h911/A4cmg3LXleGO45/P+epKAej4L+UOPgBaQoFnneRBsRPbNcU68zfQ4fTD/
         lSToSBqhLZmZYtxs5MgpvL5LiQZ8EEEC9qn0tx2cZi4YEmmJr+hp6AxmzBH62DSLEcvh
         Mc6cvk5VkbbEWvNg9JowF8ym/BHzowAMcuv/RBGcoS3zeNubctRVI+T5Vjft3ufswJyt
         5sJD1pMIuaNvO+AUwECR+kux/INhqq/no28mc7RsoRHApLHQls4pfbNHkZMJj/35c6j0
         ikpsCjPOyqAhwOJWnAO015Cyn3zocW0e6H1EO8YEq6xVOfAxTko/RA3nOSj0gM9j8yaA
         pO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116925; x=1756721725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFt0F6s62CwKTaaArfzgIuwwDW3kJdXGRmblHfk+gSs=;
        b=S2WbBc3zDJXZ/TJNYw2BbupcwpQHNdcQ0GW+0Ix6YjV3uiPhujnVJqwt5rTouaxuom
         lYZmpCtbGXMgYprdM0zOlSlSUclFLjRKcumgC8Pmoseq/6lPX12keFEnoWcpPsxbqtsC
         BoSEn2DxOTySacrh+o9VkcTlbUYn8H6aCAyd+GAPIHDnGxCSdjFNdoEHBeSgVlUtyb//
         SqclWohWVhx7svm8C0xF7DpigHF/IZxe+UYXcCioEbLyCzSnShZumRvMfRnsZ/GdkzsV
         88JGDw5YWbcZRyUL8uLvKHhbbMHyivTeS8CJ484o2SC7jkyKquihuStMUeXdtuGQes9H
         IQfA==
X-Forwarded-Encrypted: i=1; AJvYcCXa4GWn0yixsEdKnfRzIyclnQb/hgYl3G3WtJkK6SbEnIWXPJpF/sYhFnKy/dpSyRWDm48i0eZzY5MQ5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEx/axsyIxveq9KfVHhIK42tLIV98rbGvI1aa312sm66AMptFX
	HgECnpdfCPoipkuqVE+NtI9G5dedUlNt8hWBy7NBqLz4DDKMIi9jXXH9
X-Gm-Gg: ASbGncuHYM19/ofjjJN/8mA7Ho72mhkLprhsOtJ+f5byjTwLdDUTCZ9JR+0DN/EBOWi
	ie8rCnELg3VB8A4p1BuNlRwoNQesJOKjkVtvX/5tGcdFCPhAY7BgOTwozwaHaNzkh3eNq0iZACB
	Ly13BXwLaFtVDxUcW7KDkMo6lYXExC2jEZ/MpgYbjpPaGbySmasEzN72HmyWWv1EY75+5DC6AXH
	h6puMx6AYYDIfGuatPTG93le5WbuyqSZieycLi0sNvwcIyQJwHVs/lObs83k7SyVMjpjII/+PWu
	bNtL0d9ZssXjPgcVWiBKbyhIkHygz0ZT9Ika4veChA11BQQSBYiAvBtADMJj3hsL/v/1PM94ljw
	WawUAKriRPtAOLtaInX6yIqVOEEKXgdX5obg+iPqlmo2ZYWg07RtbEx5IWLRc5PE/pfhq
X-Google-Smtp-Source: AGHT+IHlkzDGXGPpU1EkxS+EnYzPt4rNJbW1yGdDiMh8qobFS6uk9AAWfFNiWTDwM+ogqrK8zjcWSQ==
X-Received: by 2002:ad4:5766:0:b0:70d:bec9:4807 with SMTP id 6a1803df08f44-70dbec94a59mr28601966d6.8.1756116924984;
        Mon, 25 Aug 2025 03:15:24 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72c9fcdsm43128106d6.60.2025.08.25.03.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:15:24 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: andy@kernel.org,
	hansg@kernel.or,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH v2] media: atomisp: Use string choices helpers
Date: Mon, 25 Aug 2025 03:15:15 -0700
Message-ID: <20250825101515.953993-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use string_choices.h helpers instead of hard-coded strings.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
Changes in v2:
 - Split the patch into two: one for staging/media/atomisp and one for
   staging/media/ipu3
 - Corrected the order of #include statements

 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c     | 3 ++-
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c    | 5 +++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c             | 5 +++--
 .../staging/media/atomisp/pci/runtime/binary/src/binary.c    | 3 ++-
 drivers/staging/media/atomisp/pci/sh_css.c                   | 3 ++-
 5 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..e5d80611d009 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -27,6 +27,7 @@
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
+#include <linux/string_choices.h>
 
 /* Assume max number of ACC stages */
 #define MAX_ACC_STAGES	20
@@ -841,7 +842,7 @@ int atomisp_css_irq_enable(struct atomisp_device *isp,
 {
 	dev_dbg(isp->dev, "%s: css irq info 0x%08x: %s (%d).\n",
 		__func__, info,
-		enable ? "enable" : "disable", enable);
+		str_enable_disable(enable), enable);
 	if (ia_css_irq_enable(info, enable)) {
 		dev_warn(isp->dev, "%s:Invalid irq info: 0x%08x when %s.\n",
 			 __func__, info,
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 964cc3bcc0ac..8ba53021133d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 900a67552d6a..812230397409 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -16,6 +16,7 @@
 #include <linux/dmi.h>
 #include <linux/interrupt.h>
 #include <linux/bits.h>
+#include <linux/string_choices.h>
 #include <media/v4l2-fwnode.h>
 
 #include <asm/iosf_mbi.h>
@@ -527,7 +528,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	u32 val = enable ? MRFLD_ISPSSPM0_IUNIT_POWER_ON :
 			   MRFLD_ISPSSPM0_IUNIT_POWER_OFF;
 
-	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
+	dev_dbg(isp->dev, "IUNIT power-%s.\n", str_on_off(enable));
 
 	/* WA for P-Unit, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable && !isp->pm_only) {
@@ -569,7 +570,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 		usleep_range(100, 150);
 	} while (1);
 
-	dev_err(isp->dev, "IUNIT power-%s timeout.\n", enable ? "on" : "off");
+	dev_err(isp->dev, "IUNIT power-%s timeout.\n", str_on_off(enable));
 	return -EBUSY;
 }
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2a4db605c126 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/math.h>
+#include <linux/string_choices.h>
 
 #include <math_support.h>
 #include <gdc_device.h>	/* HR_GDC_N */
@@ -1241,7 +1242,7 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
 		dev_dbg(atomisp_dev, "Using binary %s (id %d), type %d, mode %d, continuous %s\n",
 			xcandidate->blob->name, xcandidate->sp.id, xcandidate->type,
 			xcandidate->sp.pipeline.mode,
-			xcandidate->sp.enable.continuous ? "true" : "false");
+			str_true_false(xcandidate->sp.enable.continuous));
 
 	if (err)
 		dev_err(atomisp_dev, "Failed to find a firmware binary matching the pipeline parameters\n");
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..cbade11087d9 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7,6 +7,7 @@
 /*! \file */
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/vmalloc.h>
 
 #include "hmm.h"
@@ -1478,7 +1479,7 @@ map_sp_threads(struct ia_css_stream *stream, bool map)
 	enum ia_css_pipe_id pipe_id;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p, map = %s",
-			     stream, map ? "true" : "false");
+			     stream, str_true_false(map));
 
 	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
-- 
2.47.3


