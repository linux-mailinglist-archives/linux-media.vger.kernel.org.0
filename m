Return-Path: <linux-media+bounces-20959-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC99BD71E
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 21:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97CBE1F236FE
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 20:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586101F80C4;
	Tue,  5 Nov 2024 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zaw/YUrH"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0F1FBCA3
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730839029; cv=none; b=cjBHnMYU4UFuUYw5w3Y1+b9Qzy8b7K0KpyFDSniFMzqtg8N+gme2ghwcUthljLacB4m9u6yrgy3V9Ryw7gA5KToA8MNETIH9Olwpt4LIguJT09doZWYtG+Puzz3R+elTA/yO+PWO+kLGNpAPZ6KOpzAZmCFoebPVsr6sacrzKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730839029; c=relaxed/simple;
	bh=KqJ7fd7VWpYVfWo497JQCElWtY9uojXvHS7UrF1a3ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjRQAK1i1P36F1aTRft5Hm4JxdEwAQ7EGRSN+XfqAFEUovWwH/V36rRHDccHfe98+hDPhR+FHcmx78NlndP12w7NGtdl3j3u2ytzsPRtWVZC8AlgmAm21db2diLA0ArzT+VcwtSpeo51mIcQrb+qTRUcXHeMPaEBvK5abwmIUYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zaw/YUrH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730839026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CqoYpo1LPLjeD2Q8+8wMMDCPL+CP6mORS42JgDnSDoU=;
	b=Zaw/YUrHp58/cWQqkqSE9yS3aK54pdIP/UxS4/JxBMvvp7iXFnPfNWurd+3EqxvXs/niIJ
	7++WKAYasWd3BJu1YNhdDi2hJasCxoXc1WJM1KCEoYQTxbN0B28Gs+79lC4xC1/aSF2nyU
	/trhJbIgFFOn4TdnQIhn7bqgDMzW/pQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-nhdHBRlzPwaKlx2MwNKTfw-1; Tue,
 05 Nov 2024 15:37:03 -0500
X-MC-Unique: nhdHBRlzPwaKlx2MwNKTfw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 132EA19560BA;
	Tue,  5 Nov 2024 20:37:02 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.108])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1964E195607C;
	Tue,  5 Nov 2024 20:36:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] media: dw9719: Add DW9761 support
Date: Tue,  5 Nov 2024 21:36:58 +0100
Message-ID: <20241105203658.29737-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add support for the DW9761 VCM controller, which is very similar to
the DW9719.

The new support is based on
drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
from the Xiaomi kernel sources for the Mi Pad 2.

The DW9761 support has been tested on a Xiaomi Mi Pad 2 tablet and
DW9719 support has been tested (to avoid regressions) on a Microsoft
Surface Go tablet.

Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/dw9719.c | 113 +++++++++++++++++++++++--------------
 1 file changed, 71 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index c626ed845928..032fbcb981f2 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -2,8 +2,10 @@
 // Copyright (c) 2012 Intel Corporation
 
 /*
- * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in this repo:
- * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
+ * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c from:
+ * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5 and
+ * latte-l-oss/drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
+ * from: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
  */
 
 #include <linux/delay.h>
@@ -23,26 +25,45 @@
 
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
+#define DW9761_ID			0xF4
 
 #define DW9719_CONTROL			CCI_REG8(2)
+#define DW9719_STANDBY			0x00
+#define DW9719_SHUTDOWN			0x01
 #define DW9719_ENABLE_RINGING		0x02
 
 #define DW9719_VCM_CURRENT		CCI_REG16(3)
 
+#define DW9719_STATUS			CCI_REG16(5)
+#define DW9719_STATUS_BUSY		BIT(0)
+
 #define DW9719_MODE			CCI_REG8(6)
 #define DW9719_MODE_SAC_SHIFT		4
-#define DW9719_MODE_SAC3		4
+#define DW9719_DEFAULT_SAC		4
+#define DW9761_DEFAULT_SAC		6
 
 #define DW9719_VCM_FREQ			CCI_REG8(7)
 #define DW9719_DEFAULT_VCM_FREQ		0x60
+#define DW9761_DEFAULT_VCM_FREQ		0x3E
+
+#define DW9761_VCM_PRELOAD		CCI_REG8(8)
+#define DW9761_DEFAULT_VCM_PRELOAD	0x73
+
 
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
+enum dw9719_model {
+	DW9719,
+	DW9761,
+};
+
 struct dw9719_device {
 	struct v4l2_subdev sd;
 	struct device *dev;
 	struct regmap *regmap;
 	struct regulator *regulator;
+	enum dw9719_model model;
+	u32 mode_low_bits;
 	u32 sac_mode;
 	u32 vcm_freq;
 
@@ -52,30 +73,14 @@ struct dw9719_device {
 	} ctrls;
 };
 
-static int dw9719_detect(struct dw9719_device *dw9719)
-{
-	int ret;
-	u64 val;
-
-	ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
-	if (ret < 0)
-		return ret;
-
-	if (val != DW9719_ID) {
-		dev_err(dw9719->dev, "Failed to detect correct id\n");
-		return -ENXIO;
-	}
-
-	return 0;
-}
-
 static int dw9719_power_down(struct dw9719_device *dw9719)
 {
 	return regulator_disable(dw9719->regulator);
 }
 
-static int dw9719_power_up(struct dw9719_device *dw9719)
+static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 {
+	u64 val;
 	int ret;
 
 	ret = regulator_enable(dw9719->regulator);
@@ -83,16 +88,54 @@ static int dw9719_power_up(struct dw9719_device *dw9719)
 		return ret;
 
 	/* Jiggle SCL pin to wake up device */
-	cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
-
+	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_SHUTDOWN, &ret);
+	fsleep(100);
+	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_STANDBY, &ret);
 	/* Need 100us to transit from SHUTDOWN to STANDBY */
 	fsleep(100);
 
+	if (detect) {
+		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
+		if (ret < 0)
+			return ret;
+
+		switch (val) {
+		case DW9719_ID:
+			dw9719->model = DW9719;
+			dw9719->mode_low_bits = 0x00;
+			dw9719->sac_mode = DW9719_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+			break;
+		case DW9761_ID:
+			dw9719->model = DW9761;
+			dw9719->mode_low_bits = 0x01;
+			dw9719->sac_mode = DW9761_DEFAULT_SAC;
+			dw9719->vcm_freq = DW9761_DEFAULT_VCM_FREQ;
+			break;
+		default:
+			dev_err(dw9719->dev,
+				"Error unknown device id 0x%02llx\n", val);
+			return -ENXIO;
+		}
+
+		/* Optional indication of SAC mode select */
+		device_property_read_u32(dw9719->dev, "dongwoon,sac-mode",
+					 &dw9719->sac_mode);
+
+		/* Optional indication of VCM frequency */
+		device_property_read_u32(dw9719->dev, "dongwoon,vcm-freq",
+					 &dw9719->vcm_freq);
+	}
+
 	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
-	cci_write(dw9719->regmap, DW9719_MODE,
-		  dw9719->sac_mode << DW9719_MODE_SAC_SHIFT, &ret);
+	cci_write(dw9719->regmap, DW9719_MODE, dw9719->mode_low_bits |
+			  (dw9719->sac_mode << DW9719_MODE_SAC_SHIFT), &ret);
 	cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
 
+	if (dw9719->model == DW9761)
+		cci_write(dw9719->regmap, DW9761_VCM_PRELOAD,
+			  DW9761_DEFAULT_VCM_PRELOAD, &ret);
+
 	if (ret)
 		dw9719_power_down(dw9719);
 
@@ -159,7 +202,7 @@ static int dw9719_resume(struct device *dev)
 	int ret;
 	int val;
 
-	ret = dw9719_power_up(dw9719);
+	ret = dw9719_power_up(dw9719, false);
 	if (ret)
 		return ret;
 
@@ -237,16 +280,6 @@ static int dw9719_probe(struct i2c_client *client)
 		return PTR_ERR(dw9719->regmap);
 
 	dw9719->dev = &client->dev;
-	dw9719->sac_mode = DW9719_MODE_SAC3;
-	dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
-
-	/* Optional indication of SAC mode select */
-	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
-				 &dw9719->sac_mode);
-
-	/* Optional indication of VCM frequency */
-	device_property_read_u32(&client->dev, "dongwoon,vcm-freq",
-				 &dw9719->vcm_freq);
 
 	dw9719->regulator = devm_regulator_get(&client->dev, "vdd");
 	if (IS_ERR(dw9719->regulator))
@@ -274,14 +307,10 @@ static int dw9719_probe(struct i2c_client *client)
 	 * will work.
 	 */
 
-	ret = dw9719_power_up(dw9719);
+	ret = dw9719_power_up(dw9719, true);
 	if (ret)
 		goto err_cleanup_media;
 
-	ret = dw9719_detect(dw9719);
-	if (ret)
-		goto err_powerdown;
-
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_get_noresume(&client->dev);
 	pm_runtime_enable(&client->dev);
@@ -299,7 +328,6 @@ static int dw9719_probe(struct i2c_client *client)
 err_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_put_noidle(&client->dev);
-err_powerdown:
 	dw9719_power_down(dw9719);
 err_cleanup_media:
 	media_entity_cleanup(&dw9719->sd.entity);
@@ -327,6 +355,7 @@ static void dw9719_remove(struct i2c_client *client)
 
 static const struct i2c_device_id dw9719_id_table[] = {
 	{ "dw9719" },
+	{ "dw9761" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
-- 
2.47.0


