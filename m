Return-Path: <linux-media+bounces-25875-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF0AA2E64F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 09:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99857167778
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 08:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBF91C5F1A;
	Mon, 10 Feb 2025 08:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="wrvWp65k"
X-Original-To: linux-media@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662601BD4E4
	for <linux-media@vger.kernel.org>; Mon, 10 Feb 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175711; cv=none; b=BWW6xTKA3SDDQ24Q71bHNkymFKiVmZgifmR2dgHhN126Te6UHsH5wQ2F14WKjyl98qhK5Y6/d+lMRHgKG4nl1IJ0mvo3zg/+BKCDapN+syCY+N/gLEEeIGzResKCXayW2rVWr1sXNimy7ZobEo1nykfm5ca0KYfNHvPJ3eFI0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175711; c=relaxed/simple;
	bh=mMYOsNnWbT8DnH83HSNKLNG8UmCTA4XmU454SsOoLJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG7h440HYhkVkAXqbgZjNcC5fhF8ukMUgDIMiRfsDrX8gZotp/Ti5aBBZe1GMjCef767Y5fr4lmtY6QpxCK8lwuV1zdQFFlwe+2nJl6hQ4is1s5xIt5a6kad051eXvEV+3zuI6iT0OHwT5QX4SpDDURwW42DY+qf2TiSNpWErHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=wrvWp65k; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1739175707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6owXxJrOUwngLDg4I3rLqCGx4W0Djeg4pCidwLLEZT4=;
	b=wrvWp65kn45e5bVSANPVol7sSzX3inaJAR7WyWPjVYVMu4vi/rRIX6r0g5H1BWc7uZPg5L
	BwPFBe3VrLR9bb9ewsSx7R6B7oSShOU70NxHvwV14vw3NYq0W6ZOGCTWfvzvCh95ocosik
	gqnMyqjQZbwzcOuD9u+Q1V1c8FNJMR1vdUWGCE+VjV5CB5JJoOUu/3Z1tRA4TZbOo37sv4
	5r8zwE3+uyAYZMA7EgY18qaMnTHiepImNKWJ0wv9vrA8LfjAvBVNmW1i0r3HafIFrqALsE
	PtAsPBI/AmwHyg/rk4vZBVnWnEDGNb83M+dvBfe1qgIBOc28pKv/tNTQVrfAQA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Daniel Scally <djrscally@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] media: i2c: dw9719: add support for dw9718s
Date: Mon, 10 Feb 2025 05:19:20 -0300
Message-ID: <20250210082035.8670-6-val@packett.cool>
In-Reply-To: <20250210082035.8670-1-val@packett.cool>
References: <20250210082035.8670-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The DW9718S is a similar part that uses a different register set but
follows the same method of operation otherwise. Add support for it
to the existing dw9719 driver. While here, ensure suspend-resume works.

Tested on the Moto E5 (motorola-nora) smartphone.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/media/i2c/dw9719.c | 104 ++++++++++++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 74a57c2f59ae..4a07684af52e 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -23,6 +23,22 @@
 /* 100 us is not enough on resume */
 #define DW9719_T_OPR_US				200
 
+#define DW9718_CONTROL			CCI_REG8(1)
+#define DW9718_CONTROL_SW_LINEAR	BIT(0)
+#define DW9718_CONTROL_SAC_SHIFT		1
+#define DW9718_CONTROL_SAC_MASK		0x7
+#define DW9718_CONTROL_OCP_DISABLE	BIT(4)
+#define DW9718_CONTROL_UVLO_DISABLE	BIT(5)
+
+#define DW9718_VCM_CURRENT		CCI_REG16(2)
+
+#define DW9718_SW			CCI_REG8(4)
+#define DW9718_SW_VCM_FREQ_MASK	0xF
+#define DW9718_DEFAULT_VCM_FREQ	0
+
+#define DW9718_SACT			CCI_REG8(5)
+#define DW9718_SACT_PERIOD_8_8MS	0x19
+
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
 
@@ -48,12 +64,25 @@ struct dw9719_device {
 	u32 sac_mode;
 	u32 vcm_freq;
 
+	const struct dw9719_cfg {
+		int reg_current;
+		int default_vcm_freq;
+		int (*power_up)(struct dw9719_device *dw9719);
+		int (*detect)(struct dw9719_device *dw9719);
+	} *cfg;
+
 	struct dw9719_v4l2_ctrls {
 		struct v4l2_ctrl_handler handler;
 		struct v4l2_ctrl *focus;
 	} ctrls;
 };
 
+static int dw9718_detect(struct dw9719_device *dw9719)
+{
+	/* Unfortunately, there is no ID register */
+	return 0;
+}
+
 static int dw9719_detect(struct dw9719_device *dw9719)
 {
 	int ret;
@@ -73,9 +102,50 @@ static int dw9719_detect(struct dw9719_device *dw9719)
 
 static int dw9719_power_down(struct dw9719_device *dw9719)
 {
+	int ret;
+
+	cci_write(dw9719->regmap, DW9718_CONTROL, 1, &ret);
+	if (ret)
+		return ret;
+
+	/* Need tOPR to transition from STANDBY to SHUTDOWN */
+	usleep_range(DW9719_T_OPR_US, DW9719_T_OPR_US + 10);
+
 	return regulator_disable(dw9719->regulator);
 }
 
+static int dw9718_power_up(struct dw9719_device *dw9719)
+{
+	int ret;
+
+	ret = regulator_enable(dw9719->regulator);
+	if (ret)
+		return ret;
+
+	/* Need tOPR to transition from SHUTDOWN to STANDBY */
+	usleep_range(DW9719_T_OPR_US, DW9719_T_OPR_US + 10);
+
+	/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
+	cci_write(dw9719->regmap, DW9718_CONTROL,
+			     DW9718_CONTROL_SW_LINEAR |
+			     ((dw9719->sac_mode & DW9718_CONTROL_SAC_MASK)
+			      << DW9718_CONTROL_SAC_SHIFT) |
+			     DW9718_CONTROL_OCP_DISABLE |
+			     DW9718_CONTROL_UVLO_DISABLE,
+			     &ret);
+	cci_write(dw9719->regmap, DW9718_SACT,
+			     DW9718_SACT_PERIOD_8_8MS,
+			     &ret);
+	cci_write(dw9719->regmap, DW9718_SW,
+			     dw9719->vcm_freq & DW9718_SW_VCM_FREQ_MASK,
+			     &ret);
+
+	if (ret)
+		dw9719_power_down(dw9719);
+
+	return ret;
+}
+
 static int dw9719_power_up(struct dw9719_device *dw9719)
 {
 	int ret;
@@ -103,7 +173,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719)
 
 static int dw9719_t_focus_abs(struct dw9719_device *dw9719, s32 value)
 {
-	return cci_write(dw9719->regmap, DW9719_VCM_CURRENT, value, NULL);
+	return cci_write(dw9719->regmap, dw9719->cfg->reg_current, value, NULL);
 }
 
 static int dw9719_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -161,7 +231,7 @@ static int dw9719_resume(struct device *dev)
 	int ret;
 	int val;
 
-	ret = dw9719_power_up(dw9719);
+	ret = dw9719->cfg->power_up(dw9719);
 	if (ret)
 		return ret;
 
@@ -235,13 +305,17 @@ static int dw9719_probe(struct i2c_client *client)
 	if (!dw9719)
 		return -ENOMEM;
 
+	dw9719->cfg = i2c_get_match_data(client);
+	if (!dw9719->cfg)
+		return -ENODEV;
+
 	dw9719->regmap = devm_cci_regmap_init_i2c(client, 8);
 	if (IS_ERR(dw9719->regmap))
 		return PTR_ERR(dw9719->regmap);
 
 	dw9719->dev = &client->dev;
 	dw9719->sac_mode = DW9719_MODE_SAC3;
-	dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
+	dw9719->vcm_freq = dw9719->cfg->default_vcm_freq;
 
 	/* Optional indication of SAC mode select */
 	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
@@ -277,11 +351,11 @@ static int dw9719_probe(struct i2c_client *client)
 	 * will work.
 	 */
 
-	ret = dw9719_power_up(dw9719);
+	ret = dw9719->cfg->power_up(dw9719);
 	if (ret)
 		goto err_cleanup_media;
 
-	ret = dw9719_detect(dw9719);
+	ret = dw9719->cfg->detect(dw9719);
 	if (ret)
 		goto err_powerdown;
 
@@ -328,14 +402,30 @@ static void dw9719_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct dw9719_cfg dw9718_cfg = {
+	.reg_current = DW9718_VCM_CURRENT,
+	.default_vcm_freq = DW9718_DEFAULT_VCM_FREQ,
+	.power_up = dw9718_power_up,
+	.detect = dw9718_detect,
+};
+
+static const struct dw9719_cfg dw9719_cfg = {
+	.reg_current = DW9719_VCM_CURRENT,
+	.default_vcm_freq = DW9719_DEFAULT_VCM_FREQ,
+	.power_up = dw9719_power_up,
+	.detect = dw9719_detect,
+};
+
 static const struct i2c_device_id dw9719_id_table[] = {
-	{ "dw9719" },
+	{ "dw9718s", .driver_data = (kernel_ulong_t)&dw9718_cfg, },
+	{ "dw9719",  .driver_data = (kernel_ulong_t)&dw9719_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dw9719_id_table);
 
 static const struct of_device_id dw9719_of_table[] = {
-	{ .compatible = "dongwoon,dw9719" },
+	{ .compatible = "dongwoon,dw9718s", .data = &dw9718_cfg },
+	{ .compatible = "dongwoon,dw9719",  .data = &dw9719_cfg },
 	{ { 0 } }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);
-- 
2.48.1


