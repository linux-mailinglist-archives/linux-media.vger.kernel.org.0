Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8FA1E0270
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 21:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbgEXTZr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 May 2020 15:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388268AbgEXTZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 May 2020 15:25:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923EDC08C5C0
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q2so18508023ljm.10
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9Efxvd/EUR3wE4cCPNXWTny2PVFvAgo0xZMWtmn1fwY=;
        b=QgFjugucZTEXh2o9KI+dnZgZK/pHusn7YYupiKBti28gtZnwUguHx5BOm+wIyfDfkJ
         jOvXFrdmt7WHljBqxPZFdMjkEMhF9/rhtvbT3rOxnHHXfeqXZSxyuDyFJoCPTvqB3WtJ
         LDNJ4nxF85Q4CuD4sUd2dKY44iiE2/dAu65hYHev67UGxW7sULhLiDleKPCHMrSqg8LE
         4t5vYE4lbhBwMuyqOBqmYUYbi2gxNOKBPR8ov1waycVZrMxWb6Tnypl5+hroNFYyLp2C
         DvH1NIXJZnh5hbcDWT3EVZrq2v1/57C6bAz1yFtlNKsbkcJkp0ZzGjty7F6oSYPnv7ue
         9Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9Efxvd/EUR3wE4cCPNXWTny2PVFvAgo0xZMWtmn1fwY=;
        b=cj0kRTHe+Zzg0sxyYK36xFUZwYWcv3Ix3pd7U62gdPuPEDUCTAtzDDJLfEDN/DAO1w
         kqJB9r1Ujgb2yxt4cwzz6diZXGOnak8futv+qGRE9JstSlCv3/tmW+lTXmxeVcTioOB4
         dw3yGdrsZwkAPXU4s6G3lRO0XHnb50rt2rxzoB0PRtG2aX+o7InfqcEcPeT4hI28GbKy
         W9pyuyonG9P7MK7Fj9kLQN9OkZv2usVmh/IcO58AWKmhQzERcI3OgQffKiwDDbTuONBU
         Nws+GTSO2bOEY9WUKiVtlrNPcqIMi7RhABZdbC5DDCxeWQq8k5FfhZor3ckfXZwg5HFL
         oHjQ==
X-Gm-Message-State: AOAM533ute7QndvbjT7ktRbdDNGgxIRwTHHZQ5jcHUGF1YX0D8mSkCc3
        XFuaD53XUoAEQAYybpYdhUxQpOeU7J5cQA==
X-Google-Smtp-Source: ABdhPJxUZp1MLDUhhdInwZ3VzLZaFXqebJ2uXllkvyfjX7uOpMiHz0VshL9MYv9ETMgVAuCvf5+WzA==
X-Received: by 2002:a2e:7c02:: with SMTP id x2mr10503850ljc.316.1590348344028;
        Sun, 24 May 2020 12:25:44 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id v10sm3878137lja.23.2020.05.24.12.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 12:25:43 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v3 04/10] media: i2c: imx290: Add support for 2 data lanes
Date:   Sun, 24 May 2020 22:24:59 +0300
Message-Id: <20200524192505.20682-5-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200524192505.20682-1-andrey.konovalov@linaro.org>
References: <20200524192505.20682-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

The IMX290 sensor can output frames with 2/4 CSI2 data lanes. This commit
adds support for 2 lane mode in addition to the 4 lane and also
configuring the data lane settings in the driver based on system
configuration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 133 ++++++++++++++++++++++++++++++++++---
 1 file changed, 124 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7b1de1f0c8b7..a361c9ac8bd5 100644
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
+	u8 nlanes;
 
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
@@ -631,6 +730,9 @@ static int imx290_power_on(struct device *dev)
 	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
 	usleep_range(30000, 31000);
 
+	/* Set data lane count */
+	imx290_set_data_lanes(imx290);
+
 	return 0;
 }
 
@@ -703,6 +805,16 @@ static int imx290_probe(struct i2c_client *client)
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
@@ -823,6 +935,9 @@ static int imx290_probe(struct i2c_client *client)
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

