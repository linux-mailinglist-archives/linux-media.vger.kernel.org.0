Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4E310D9E8
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 20:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfK2TF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 14:05:59 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46124 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfK2TF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 14:05:59 -0500
Received: by mail-pg1-f196.google.com with SMTP id k1so6417849pga.13
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2019 11:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QXtKRsM6VynlwjQE/FnWYU2XuBlYVR0gGpHghDHCIH8=;
        b=RmDkARxBBTcYThIJI3g+u2wq205gjr1lUn/84Vws2La/pdINoBSMb0o+CvsHOuDWKr
         L1I4cDK+MgUwEAHoDqaeWXZyMGi8/VehvqdmfzSpUPHLtRM7KWzuLP+t5+4UFHV8PpjV
         J4vv8k9V7kB2x4kzso/6j/rtotD26N/zqcFFMN4lB9TcWeTjqUsEPrju1OV2rYaRotwG
         xxp+JRJpge8iTeT5CXlHl2e2qh1Ar+zB8iih19I/rENm4D+HzuRAbPO30ZoVzEOThR+I
         2Dv5r5vDJiETJa8fadSHSZYD2ZFvJDxhPo/X1ahLYeSmlp1w63HH+YLYWTOM7LHWjLTy
         dKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QXtKRsM6VynlwjQE/FnWYU2XuBlYVR0gGpHghDHCIH8=;
        b=iCqY4p7r2pYmexHs61XHcxJIM0L4q872QeqPL4WH1LwWBtOsN+hC7qXyd46uZ5Khob
         FlD1M1H5JVqqU7PvNyYBKPQUWYwYsd/7ufyI0Ba+bE7JKQqJgeiLG9wFudf/Jp6VNvBY
         RtNTsMHQHW9TIUwqnc1iXHmE6EFlRRChpSi6y8L+wEJaTRb9Uh4V1CEW9Ua1KYam0HQ6
         dUmb+M8gYRTXufC7IH/IWeEMPXgmYN7wXyvwWIs52QhnwhJ+XYHKnrDLUcbhoI8As2fw
         D0jFNCq3eItVH1bUZF48KTxJRKl0BI2ftqyGeQK7sT5bWAUXtu12PnO9JEAL7Y9BYwR8
         1SgA==
X-Gm-Message-State: APjAAAU4dAuURe+FN2D7PNVi/sbedNF16arEte88aIxDEGR2SbCA78E9
        mdX/0FRr6V/gN5q68IecU10O
X-Google-Smtp-Source: APXvYqwcwpX46BEhvitkSypP8Oq6n8b3bcaiB3m8pOqa/yBtuq2Gy0nAPwXccr4OYrIEoH1BmyB+HA==
X-Received: by 2002:a63:154d:: with SMTP id 13mr9273440pgv.248.1575054358658;
        Fri, 29 Nov 2019 11:05:58 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:638d:cc55:d006:f721:cde2:1059])
        by smtp.gmail.com with ESMTPSA id h9sm25159974pgk.84.2019.11.29.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 11:05:58 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] media: i2c: imx290: Add support for 2 data lanes
Date:   Sat, 30 Nov 2019 00:35:37 +0530
Message-Id: <20191129190541.30315-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
References: <20191129190541.30315-1-manivannan.sadhasivam@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX290 sensor can output frames with 2/4 CSI2 data lanes. This commit
adds support for 2 lane mode in addition to the 4 lane and also
configuring the data lane settings in the driver based on system
configuration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 130 ++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index f7678e5a5d87..1d49910937fb 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -25,7 +25,18 @@
 #define IMX290_STANDBY 0x3000
 #define IMX290_REGHOLD 0x3001
 #define IMX290_XMSTA 0x3002
+#define IMX290_FR_FDG_SEL 0x3009
 #define IMX290_GAIN 0x3014
+#define IMX290_HMAX_LOW 0x301c
+#define IMX290_HMAX_HIGH 0x301d
+#define IMX290_PHY_LANE_NUM 0x3407
+#define IMX290_CSI_LANE_MODE 0x3443
+
+/* HMAX fields */
+#define IMX290_HMAX_2_1920 0x1130
+#define IMX290_HMAX_4_1920 0x0898
+#define IMX290_HMAX_2_720 0x19C8
+#define IMX290_HMAX_4_720 0x0CE4
 
 #define IMX290_DEFAULT_LINK_FREQ 445500000
 
@@ -56,6 +67,7 @@ struct imx290 {
 	struct device *dev;
 	struct clk *xclk;
 	struct regmap *regmap;
+	int nlanes;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -89,14 +101,11 @@ static const struct regmap_config imx290_regmap_config = {
 
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ 0x3007, 0x00 },
-	{ 0x3009, 0x00 },
 	{ 0x3018, 0x65 },
 	{ 0x3019, 0x04 },
 	{ 0x301a, 0x00 },
-	{ 0x3443, 0x03 },
 	{ 0x3444, 0x20 },
 	{ 0x3445, 0x25 },
-	{ 0x3407, 0x03 },
 	{ 0x303a, 0x0c },
 	{ 0x3040, 0x00 },
 	{ 0x3041, 0x00 },
@@ -169,7 +178,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ 0x3164, 0x1a },
 	{ 0x3480, 0x49 },
 	/* data rate settings */
-	{ 0x3009, 0x01 },
 	{ 0x3405, 0x10 },
 	{ 0x3446, 0x57 },
 	{ 0x3447, 0x00 },
@@ -187,8 +195,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ 0x3453, 0x00 },
 	{ 0x3454, 0x17 },
 	{ 0x3455, 0x00 },
-	{ 0x301c, 0x98 },
-	{ 0x301d, 0x08 },
 };
 
 static const struct imx290_regval imx290_720p_settings[] = {
@@ -210,7 +216,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ 0x3164, 0x1a },
 	{ 0x3480, 0x49 },
 	/* data rate settings */
-	{ 0x3009, 0x01 },
 	{ 0x3405, 0x10 },
 	{ 0x3446, 0x4f },
 	{ 0x3447, 0x00 },
@@ -228,8 +233,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ 0x3453, 0x00 },
 	{ 0x3454, 0x17 },
 	{ 0x3455, 0x00 },
-	{ 0x301c, 0xe4 },
-	{ 0x301d, 0x0c },
 };
 
 static const struct imx290_regval imx290_10bit_settings[] = {
@@ -522,6 +525,25 @@ static int imx290_write_current_format(struct imx290 *imx290,
 	return 0;
 }
 
+static int imx290_set_hmax(struct imx290 *imx290, u32 val)
+{
+	int ret;
+
+	ret = imx290_write_reg(imx290, IMX290_HMAX_LOW, (val & 0xff));
+	if (ret) {
+		dev_err(imx290->dev, "Error setting HMAX register\n");
+		return ret;
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_HMAX_HIGH, ((val >> 8) & 0xff));
+	if (ret) {
+		dev_err(imx290->dev, "Error setting HMAX register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 /* Start streaming */
 static int imx290_start_streaming(struct imx290 *imx290)
 {
@@ -551,6 +573,40 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		return ret;
 	}
 
+	switch (imx290->nlanes) {
+	case 2:
+		if (imx290->current_mode->width == 1920) {
+			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_1920);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = imx290_set_hmax(imx290, IMX290_HMAX_2_720);
+			if (ret < 0)
+				return ret;
+		}
+
+		break;
+	case 4:
+		if (imx290->current_mode->width == 1920) {
+			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_1920);
+			if (ret < 0)
+				return ret;
+		} else {
+			ret = imx290_set_hmax(imx290, IMX290_HMAX_4_720);
+			if (ret < 0)
+				return ret;
+		}
+
+		break;
+	default:
+		/*
+		 * We should never hit this since the data lane count is
+		 * validated in probe itself
+		 */
+		dev_err(imx290->dev, "Lane configuration not supported\n");
+		return -EINVAL;
+	}
+
 	/* Apply customized values from user */
 	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
@@ -607,6 +663,49 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
 				       imx290->supplies);
 }
 
+static int imx290_set_data_lanes(struct imx290 *imx290)
+{
+	int ret = 0, laneval, frsel;
+
+	switch (imx290->nlanes) {
+	case 2:
+		laneval = 0x01;
+		frsel = 0x02;
+		break;
+	case 4:
+		laneval = 0x03;
+		frsel = 0x01;
+		break;
+	default:
+		/*
+		 * We should never hit this since the data lane count is
+		 * validated in probe itself
+		 */
+		dev_err(imx290->dev, "Lane configuration not supported\n");
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_PHY_LANE_NUM, laneval);
+	if (ret) {
+		dev_err(imx290->dev, "Error setting Physical Lane number register\n");
+		goto exit;
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_CSI_LANE_MODE, laneval);
+	if (ret) {
+		dev_err(imx290->dev, "Error setting CSI Lane mode register\n");
+		goto exit;
+	}
+
+	ret = imx290_write_reg(imx290, IMX290_FR_FDG_SEL, frsel);
+	if (ret)
+		dev_err(imx290->dev, "Error setting FR/FDG SEL register\n");
+
+exit:
+	return ret;
+}
+
 static int imx290_power_on(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -703,6 +802,16 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
+	/* Get number of data lanes */
+	imx290->nlanes = imx290->ep.bus.mipi_csi2.num_data_lanes;
+	if (imx290->nlanes != 2 && imx290->nlanes != 4) {
+		dev_err(dev, "Invalid data lanes: %d\n", imx290->nlanes);
+		ret = -EINVAL;
+		goto free_err;
+	}
+
+	dev_dbg(dev, "Using %u data lanes\n", imx290->nlanes);
+
 	if (!imx290->ep.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -822,6 +931,9 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_entity;
 	}
 
+	/* Set data lane count */
+	imx290_set_data_lanes(imx290);
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 	pm_runtime_idle(dev);
-- 
2.17.1

