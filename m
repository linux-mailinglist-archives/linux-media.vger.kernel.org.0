Return-Path: <linux-media+bounces-31663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02154AA85D4
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF53BC99D
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA91A0BF3;
	Sun,  4 May 2025 10:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jvm3aVJp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF92F19924D
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353636; cv=none; b=Ndxq/oIXR9P4yQSv4EgJaVk7G6OXoIDcbrjetTphzAy0kUuokrRQVPWx7uTgxcHg5TuyiOfJx+6NdAqsrD4sUUKkvezMsI/K28wOtQU5VSh3Y7uhplrnbtgWO+1aYqMrAjHdmfiHci9ajmKYybHYhaPGACWHHqdITez4dQeiziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353636; c=relaxed/simple;
	bh=QMwwgh6lMDudQ70Bx/sTxnNZsGWQ/QMuZJTuMxI2iJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfoyzUqapVjo2nvwsEiyU6gUYILB0QagWx1wFMdfEXd6gQ15UXDHC424PI+tVfLDxyv1d22Q9OnbgdXbIRIGBY3/kQuq1nTCxiDDhoZr5aceBQMv6+L0XLrrIrKIyp9q22B1Jt9sLT+OoiVkqGwR/DGo2BaXpoUCin3TccslGaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jvm3aVJp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrUSoJ+McBYzMSdMox9EdVOPfwm6QUHx/EAVxAnyM9E=;
	b=Jvm3aVJp9PaN1H+rxMS4zVGeIQdg+fDECyr0NYbHp6nbYVxHjC8AI+2enE3taRcNu4niJr
	S+Hxm1TeHMbz6cqy733YDkdnVBONsq5KlI6kCv9ta6i+wjIYJRl4VhuBbSYJN1x9TQJrRc
	U/o7MlHAMBAtbLu1Q2sAVpQX6UyAdRA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-muOsK9LJN-eJ8tlHQfQAag-1; Sun,
 04 May 2025 06:13:50 -0400
X-MC-Unique: muOsK9LJN-eJ8tlHQfQAag-1
X-Mimecast-MFC-AGG-ID: muOsK9LJN-eJ8tlHQfQAag_1746353629
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46AA4180048E;
	Sun,  4 May 2025 10:13:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 10DAE18001D5;
	Sun,  4 May 2025 10:13:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 03/13] media: mt9m114: Use aptina-PLL helper to get PLL values
Date: Sun,  4 May 2025 12:13:24 +0200
Message-ID: <20250504101336.18748-4-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Before this change the driver used hardcoded PLL m, n and p values to
achieve a 48MHz pixclock when used with an external clock with a frequency
of 24 MHz.

Use aptina_pll_calculate() to allow the driver to work with different
external clock frequencies. The m, n, and p values will be unchanged
with a 24 MHz extclk and this has also been tested with a 19.2 MHz
clock where m gets increased from 32 to 40.

Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/mt9m114.c | 53 +++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index be1d2ec64b89..9fdfd90afc22 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -31,6 +31,8 @@
 #include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
+#include "aptina-pll.h"
+
 /* Sysctl registers */
 #define MT9M114_CHIP_ID					CCI_REG16(0x0000)
 #define MT9M114_COMMAND_REGISTER			CCI_REG16(0x0080)
@@ -262,9 +264,9 @@
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE			CCI_REG8(0xc97e)
 #define MT9M114_CAM_SYSCTL_PLL_ENABLE_VALUE			BIT(0)
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_M_N		CCI_REG16(0xc980)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		(((n) << 8) | (m))
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_VALUE(m, n)		((((n) - 1) << 8) | (m))
 #define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P		CCI_REG16(0xc982)
-#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		((p) << 8)
+#define MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(p)		(((p) - 1) << 8)
 #define MT9M114_CAM_PORT_OUTPUT_CONTROL			CCI_REG16(0xc984)
 #define MT9M114_CAM_PORT_PORT_SELECT_PARALLEL			(0 << 0)
 #define MT9M114_CAM_PORT_PORT_SELECT_MIPI			(1 << 0)
@@ -325,7 +327,7 @@
  * minimum values that have been seen in register lists are 303 and 38, use
  * them.
  *
- * Set the default to achieve 1280x960 at 30fps.
+ * Set the default to achieve 1280x960 at 30fps with a 48 MHz pixclock.
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				38
@@ -335,6 +337,8 @@
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
 
+#define MT9M114_DEF_PIXCLOCK				48000000
+
 #define MT9M114_PIXEL_ARRAY_WIDTH			1296U
 #define MT9M114_PIXEL_ARRAY_HEIGHT			976U
 
@@ -379,11 +383,7 @@ struct mt9m114 {
 	struct v4l2_fwnode_endpoint bus_cfg;
 	u32 clk_freq;
 
-	struct {
-		unsigned int m;
-		unsigned int n;
-		unsigned int p;
-	} pll;
+	struct aptina_pll pll;
 
 	unsigned int pixrate;
 	bool streaming;
@@ -751,7 +751,7 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 						       sensor->pll.n),
 		  &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SYSCTL_PLL_DIVIDER_P,
-		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p), &ret);
+		  MT9M114_CAM_SYSCTL_PLL_DIVIDER_P_VALUE(sensor->pll.p1), &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_PIXCLK,
 		  sensor->pixrate, &ret);
 
@@ -2238,11 +2238,36 @@ static const struct dev_pm_ops mt9m114_pm_ops = {
 static int mt9m114_clk_init(struct mt9m114 *sensor)
 {
 	unsigned int link_freq;
+	/*
+	 * TODO these limits have been copied from mt9p031.c, with out_clock_max
+	 * increased from 360000000 to 400000000 to get the same PLL settings as
+	 * in the static register lists for 24 MHz and 19.2 MHz ext clock freq.
+	 * These should be verified / adjusted by someone with access to
+	 * the full MT9M114 datasheet.
+	 */
+	static const struct aptina_pll_limits limits = {
+		.ext_clock_min = 6000000,
+		.ext_clock_max = 27000000,
+		.int_clock_min = 2000000,
+		.int_clock_max = 13500000,
+		.out_clock_min = 180000000,
+		.out_clock_max = 400000000,
+		.pix_clock_max = 96000000,
+		.n_min = 1,
+		.n_max = 64,
+		.m_min = 16,
+		.m_max = 255,
+		.p1_min = 1,
+		.p1_max = 128,
+	};
+	int ret;
 
-	/* Hardcode the PLL multiplier and dividers to default settings. */
-	sensor->pll.m = 32;
-	sensor->pll.n = 1;
-	sensor->pll.p = 7;
+	sensor->pll.ext_clock = sensor->clk_freq;
+	sensor->pll.pix_clock = MT9M114_DEF_PIXCLOCK;
+
+	ret = aptina_pll_calculate(&sensor->client->dev, &limits, &sensor->pll);
+	if (ret)
+		return ret;
 
 	/*
 	 * Calculate the pixel rate and link frequency. The CSI-2 bus is clocked
@@ -2250,7 +2275,7 @@ static int mt9m114_clk_init(struct mt9m114 *sensor)
 	 * parallel mode, the sensor ouputs one pixel in two PIXCLK cycles.
 	 */
 	sensor->pixrate = sensor->clk_freq * sensor->pll.m
-			/ ((sensor->pll.n + 1) * (sensor->pll.p + 1));
+			/ (sensor->pll.n * sensor->pll.p1);
 
 	link_freq = sensor->bus_cfg.bus_type == V4L2_MBUS_CSI2_DPHY
 		  ? sensor->pixrate * 8 : sensor->pixrate * 2;
-- 
2.49.0


