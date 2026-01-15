Return-Path: <linux-media+bounces-50813-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39AD28170
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 20:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68C2B3069508
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 19:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484D93A35AE;
	Thu, 15 Jan 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjJrfle3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3FF2E7F1D
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768504269; cv=none; b=VWdN4VIDfj1M/6WBPsdgofR1nv33lFN7TiHANsDP9BhuEH0+SAvY//ETH1RqgwvoXG6kf299AWVsZs/QaLRc2htq0Fo2Z9htm0pHYrAEm7+hrBK4tPSpSt+CpMuhrHG1OspLij0S7Asp/+s6xApU5TY9sASJdaIUe4XlfgvjywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768504269; c=relaxed/simple;
	bh=MaDjMIeO7MyXeuDI+i7LD8C4+RH5zTa5Ah2roiigBvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yv0MuPxi9KsHVajVoYio/EvWkAjaVk7iMmGxKy26gHbvPg6i1/SVcV5N3abNoG8E1SgyEIByKyNEM2/Pp42+oDvERhcnUsslU20w5ul6RN4X2wO9qvJFRp/t7OtERRnm1SFAYQMhuPtgsgNUpFT5lrIAOa1YolUURqTB2MS8AYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjJrfle3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f39693db5so31266b3a.2
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 11:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504266; x=1769109066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9+AbYmqN0Gm2UlhXQKlAxUTXBLfjXpN3n8OLtCejns=;
        b=VjJrfle35wrWIVJIjZj0+cGCDa55lV0NxZWYFkg2gnOm/B7s2IPfO1qs3EXwPfD7mR
         DtdyGm8LjWiD1T3DFDWL09IgfTQHHi9IiaZHLnomrxjwjU99VMI7GPv66hTsbNmEvLov
         Pj5LshhxNs8FHBSSpZ+yuIaQDNYDPMnagwYKcYyGjBFH6LsdakB4PIQQR4EGjB1ruQMI
         UjSTHpNA7QatffEFrf40tYc8JYp5SSM0Yt+6zwUgAh1WVis786G9ZGJZ5GEi3qZO5LJG
         DsZ3YdvJSWy9j5HSj2yXVtc95IM74uzBJwOWjLFD96fjPM1CljfJV/5uTXJatEtPdf23
         qKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504266; x=1769109066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L9+AbYmqN0Gm2UlhXQKlAxUTXBLfjXpN3n8OLtCejns=;
        b=j5PnuC5aTpVKBS7P6xIGHKdx4Vw6stVKMjmBdmEkKvWcVbIP2rzeijMeZ2o6tBGHIh
         MisdoUwzaSZ8UOsjPSJ8yKQMMi31QqfjR/N5QOoIrcsIJbtsg/ca1JP/M06Y/kiAGPAJ
         k5T0MN9sTlYahQZoLygh6Y5OMbxjOdDebntruycpOoxx0pT4PNMh7Wflk3mhZSRKATYF
         9vn2DuygaMHfOO9/QLJmR2PZRS+NS+V69MfHKjWhvaKj+tNSKaYMRfmP/mMfMsxuMXGI
         kuXQg+JpCQp0Rwjvi8rpIVfJIdEfZDtZ+gQ0SVWsgIXE+BkcdywJpBQBJZWwdKZ7nzM3
         punw==
X-Forwarded-Encrypted: i=1; AJvYcCWeLZUtAI3cfxyC8ERiIC2Rhp5snTdDzPFw/C3gvnPvd6COPbRdEJwjXwfzzcOzNA7t+rP/WMgHJdHgqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ku81mB8GeTuAdGiWI4FZhwYDAunlAflWJQnI0R8D0fheNvbQ
	8AapeiP7pN9Afe/d2jQrxHA63zKC1Cvua7OeWFVZmHKqGZxJGkwoEiFY
X-Gm-Gg: AY/fxX4Y9Qn+Hxy+SbFbyj9KAFAk9X66DMjNek2NNKNRdJfuIdSTMnSsdUN9Ip3pRcM
	XOo2DXsYHFc5+GQ3CGMO5DhkFVkN+m8/2nTKF3WRMfQdfhhvnNIkwHmjH9cuRNNm7dlvjaPYtnj
	3Ih6uSMoWVMHbjBvUAE5a7e7drcKaVLXMDXXsUnu52OvVC+kI/W14YtXN7RIaLNy9UByG8pFx7L
	BrZaJQSlyzNIPmmqKO5dRw2jyo+qYhzXvj2WIlxwrf8r19M29thydjoTmUnHIpM38erfJeY9Ur4
	5JlQ8pgK1vRieC67gEP1UQL4izmn3vbMu0MzD3zyvO41wkzavUImR3ofy5Lmk9Se2LgXZADhCko
	1VtBavc9igpbsb3m9VUmcdIO3Xjn30zNelxwx/72aA8OGoVSOebKDLNdFCFAu17yYjc7eyCeUL0
	teVDihsOCfJ53tCBouvChfilufYBcQGQ==
X-Received: by 2002:a05:6a20:9389:b0:334:8d22:f95d with SMTP id adf61e73a8af0-38dfe5b88a2mr531295637.2.1768504266356;
        Thu, 15 Jan 2026 11:11:06 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:5999:dc00:538a:c0c9:9ac1:2b99])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-81fa12b51d9sm121409b3a.65.2026.01.15.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:11:05 -0800 (PST)
From: faizel.kb@gmail.com
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH 1/3] media: vimc: sensor: Move vimc_sensor_device to common header
Date: Thu, 15 Jan 2026 11:10:48 -0800
Message-ID: <20260115191050.1370387-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115191050.1370387-1-faizel.kb@gmail.com>
References: <20260115191050.1370387-1-faizel.kb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Faizel K B <faizel.kb@gmail.com>

Move the vimc_sensor_device structure from vimc-sensor.c to
vimc-common.h to make it accessible to the vimc-streamer component.

The streamer needs access to the sensor structure to read the
configured frame rate interval for timing control.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 drivers/media/test-drivers/vimc/vimc-common.h | 29 +++++++++++++++++++
 drivers/media/test-drivers/vimc/vimc-sensor.c | 26 -----------------
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
index 7a45a2117748..7f5f008e407b 100644
--- a/drivers/media/test-drivers/vimc/vimc-common.h
+++ b/drivers/media/test-drivers/vimc/vimc-common.h
@@ -12,6 +12,8 @@
 #include <linux/slab.h>
 #include <media/media-device.h>
 #include <media/v4l2-device.h>
+#include <media/tpg/v4l2-tpg.h>
+#include <media/v4l2-ctrls.h>
 
 #define VIMC_PDEV_NAME "vimc"
 
@@ -159,6 +161,33 @@ struct vimc_ent_config {
 	const struct vimc_ent_type *type;
 };
 
+enum vimc_sensor_osd_mode {
+	VIMC_SENSOR_OSD_SHOW_ALL = 0,
+	VIMC_SENSOR_OSD_SHOW_COUNTERS = 1,
+	VIMC_SENSOR_OSD_SHOW_NONE = 2
+};
+
+struct vimc_sensor_device {
+	struct vimc_ent_device ved;
+	struct v4l2_subdev sd;
+	struct tpg_data tpg;
+	struct v4l2_ctrl_handler hdl;
+	struct media_pad pad;
+
+	u8 *frame;
+
+	/*
+	 * Virtual "hardware" configuration, filled when the stream starts or
+	 * when controls are set.
+	 */
+	struct {
+		struct v4l2_area size;
+		enum vimc_sensor_osd_mode osd_value;
+		u64 start_stream_ts;
+	} hw;
+};
+
+
 /**
  * vimc_is_source - returns true if the entity has only source pads
  *
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 027767777763..2b07dc1f1278 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -14,32 +14,6 @@
 
 #include "vimc-common.h"
 
-enum vimc_sensor_osd_mode {
-	VIMC_SENSOR_OSD_SHOW_ALL = 0,
-	VIMC_SENSOR_OSD_SHOW_COUNTERS = 1,
-	VIMC_SENSOR_OSD_SHOW_NONE = 2
-};
-
-struct vimc_sensor_device {
-	struct vimc_ent_device ved;
-	struct v4l2_subdev sd;
-	struct tpg_data tpg;
-	struct v4l2_ctrl_handler hdl;
-	struct media_pad pad;
-
-	u8 *frame;
-
-	/*
-	 * Virtual "hardware" configuration, filled when the stream starts or
-	 * when controls are set.
-	 */
-	struct {
-		struct v4l2_area size;
-		enum vimc_sensor_osd_mode osd_value;
-		u64 start_stream_ts;
-	} hw;
-};
-
 static const struct v4l2_mbus_framefmt fmt_default = {
 	.width = 640,
 	.height = 480,
-- 
2.43.0


