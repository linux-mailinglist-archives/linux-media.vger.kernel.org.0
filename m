Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805291F0D19
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgFGQa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgFGQa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:30:57 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A888C08C5C5
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:30:55 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so17532122ljn.4
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7kqfMUc+k2k/CiQ8rg2p7L02Gn6NnHmpWC1JYpqHUwA=;
        b=omgM/Kc2yHrHifw8kRkCLjDuRQvVAWXR5wp3gJgXHpRmHOtKB0RARH1osY+atuAKjS
         5NbT3IGFSCf6LFL/LZ/gTSkhen0D/SVyshSjcW2DuChRakv9nT5TmdsacwLMzPVq7Rke
         oZc1UR2ONaW0w/iC9Ivh4ybGSIhK7s3fuau40vMjj/Hli2Tnvqtx8H4K1LegoCLFlZ6G
         Vc2Hr5CSaK3sA3qclH29X9LROrrexHIrYJ91YW87qzmgi008MNwii2Wk3fErqWnsnufB
         ge0jEZNcWVPYyFbSRphdMtqtq2JPDpYmwBI9ioOh5s03m7grV7QnTO+f/TR6QB52Pbn3
         JN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7kqfMUc+k2k/CiQ8rg2p7L02Gn6NnHmpWC1JYpqHUwA=;
        b=frazKJuc6ApX1ovnakHKvce6chZlyHbPPVn9U0KX+NStzN2Vk6KRxSi2vk4JyoPg2G
         Od8a8UskzUZq3t9ZOLjZ9wnqyIY/KclGSrbXd7qzc/hz6USwJBe5/QFPNj0MR+o3RQGZ
         pY9pW3PTRn2jhLhGw0z6bKYJesZMX6gs4VfoFf1AgE7uUIjCp3aAw+gXCQCSlElxw261
         9zBHTdnRP2tnXIIPd52Zc4VX0tSgn3iD8Y6YdgbS5y3Txuu1mx5f9Mw5m2fpPgteH2fF
         fWRAdWltE6CBjeBevFJNKbAja9/3QekeNCLIZpUDLjUXehiwOGkp766m7yspKgCsGgbn
         Dttg==
X-Gm-Message-State: AOAM533AQ05OR54dvYaaq75BUStZdntCQJIrULCuj56A6eUiaobuHlIr
        G0DGgzWzJ30jDamJxUrS6CVkRA==
X-Google-Smtp-Source: ABdhPJzlY3tdDqx5R1qGCOZXiiU09uptgJtj3cJWOxvYqtDZ6w27dgV/aJA9ILk5CNv/XVS32pOubA==
X-Received: by 2002:a2e:974a:: with SMTP id f10mr9538019ljj.283.1591547453837;
        Sun, 07 Jun 2020 09:30:53 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:53 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 04/10] media: i2c: imx290: Add support for 2 data lanes
Date:   Sun,  7 Jun 2020 19:30:19 +0300
Message-Id: <20200607163025.8409-5-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
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
 drivers/media/i2c/imx290.c | 147 +++++++++++++++++++++++++++++++++----
 1 file changed, 133 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7b1de1f0c8b7..ffb393962ffc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -25,7 +25,12 @@
 #define IMX290_STANDBY 0x3000
 #define IMX290_REGHOLD 0x3001
 #define IMX290_XMSTA 0x3002
+#define IMX290_FR_FDG_SEL 0x3009
 #define IMX290_GAIN 0x3014
+#define IMX290_HMAX_LOW 0x301c
+#define IMX290_HMAX_HIGH 0x301d
+#define IMX290_PHY_LANE_NUM 0x3407
+#define IMX290_CSI_LANE_MODE 0x3443
 
 #define IMX290_DEFAULT_LINK_FREQ 445500000
 
@@ -45,6 +50,7 @@ struct imx290_regval {
 struct imx290_mode {
 	u32 width;
 	u32 height;
+	u32 hmax;
 	u32 pixel_rate;
 	u32 link_freq_index;
 
@@ -56,6 +62,7 @@ struct imx290 {
 	struct device *dev;
 	struct clk *xclk;
 	struct regmap *regmap;
+	u8 nlanes;
 
 	struct v4l2_subdev sd;
 	struct v4l2_fwnode_endpoint ep;
@@ -89,14 +96,11 @@ static const struct regmap_config imx290_regmap_config = {
 
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
@@ -169,7 +173,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ 0x3164, 0x1a },
 	{ 0x3480, 0x49 },
 	/* data rate settings */
-	{ 0x3009, 0x01 },
 	{ 0x3405, 0x10 },
 	{ 0x3446, 0x57 },
 	{ 0x3447, 0x00 },
@@ -187,8 +190,6 @@ static const struct imx290_regval imx290_1080p_settings[] = {
 	{ 0x3453, 0x00 },
 	{ 0x3454, 0x17 },
 	{ 0x3455, 0x00 },
-	{ 0x301c, 0x98 },
-	{ 0x301d, 0x08 },
 };
 
 static const struct imx290_regval imx290_720p_settings[] = {
@@ -210,7 +211,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ 0x3164, 0x1a },
 	{ 0x3480, 0x49 },
 	/* data rate settings */
-	{ 0x3009, 0x01 },
 	{ 0x3405, 0x10 },
 	{ 0x3446, 0x4f },
 	{ 0x3447, 0x00 },
@@ -228,8 +228,6 @@ static const struct imx290_regval imx290_720p_settings[] = {
 	{ 0x3453, 0x00 },
 	{ 0x3454, 0x17 },
 	{ 0x3455, 0x00 },
-	{ 0x301c, 0xe4 },
-	{ 0x301d, 0x0c },
 };
 
 static const struct imx290_regval imx290_10bit_settings[] = {
@@ -250,10 +248,11 @@ static const s64 imx290_link_freq[] = {
 };
 
 /* Mode configs */
-static const struct imx290_mode imx290_modes[] = {
+static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
+		.hmax = 0x1130,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
 		.pixel_rate = 178200000,
@@ -262,6 +261,7 @@ static const struct imx290_mode imx290_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
+		.hmax = 0x19c8,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
 		.pixel_rate = 178200000,
@@ -269,6 +269,44 @@ static const struct imx290_mode imx290_modes[] = {
 	},
 };
 
+static const struct imx290_mode imx290_modes_4lanes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+		.hmax = 0x0898,
+		.data = imx290_1080p_settings,
+		.data_size = ARRAY_SIZE(imx290_1080p_settings),
+		.pixel_rate = 178200000,
+		.link_freq_index = 0,
+	},
+	{
+		.width = 1280,
+		.height = 720,
+		.hmax = 0x0ce4,
+		.data = imx290_720p_settings,
+		.data_size = ARRAY_SIZE(imx290_720p_settings),
+		.pixel_rate = 178200000,
+		.link_freq_index = 0,
+	},
+};
+
+static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
+{
+	/* We rely on imx290_probe() to ensure that nlanes is either 2 or 4 */
+	if (imx290->nlanes == 2)
+		return imx290_modes_2lanes;
+	else
+		return imx290_modes_4lanes;
+}
+
+static inline int imx290_modes_num(const struct imx290 *imx290)
+{
+	if (imx290->nlanes == 2)
+		return ARRAY_SIZE(imx290_modes_2lanes);
+	else
+		return ARRAY_SIZE(imx290_modes_4lanes);
+}
+
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
 {
 	return container_of(_sd, struct imx290, sd);
@@ -450,9 +488,8 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&imx290->lock);
 
-	mode = v4l2_find_nearest_size(imx290_modes,
-				      ARRAY_SIZE(imx290_modes),
-				      width, height,
+	mode = v4l2_find_nearest_size(imx290_modes_ptr(imx290),
+				      imx290_modes_num(imx290), width, height,
 				      fmt->format.width, fmt->format.height);
 
 	fmt->format.width = mode->width;
@@ -522,6 +559,25 @@ static int imx290_write_current_format(struct imx290 *imx290,
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
@@ -550,6 +606,9 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		dev_err(imx290->dev, "Could not set current mode\n");
 		return ret;
 	}
+	ret = imx290_set_hmax(imx290, imx290->current_mode->hmax);
+	if (ret < 0)
+		return ret;
 
 	/* Apply customized values from user */
 	ret = v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
@@ -607,6 +666,49 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
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
@@ -631,6 +733,9 @@ static int imx290_power_on(struct device *dev)
 	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
 	usleep_range(30000, 31000);
 
+	/* Set data lane count */
+	imx290_set_data_lanes(imx290);
+
 	return 0;
 }
 
@@ -677,6 +782,7 @@ static int imx290_probe(struct i2c_client *client)
 	struct fwnode_handle *endpoint;
 	struct imx290 *imx290;
 	u32 xclk_freq;
+	u32 default_pixel_rate;
 	int ret;
 
 	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
@@ -703,6 +809,16 @@ static int imx290_probe(struct i2c_client *client)
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
@@ -780,10 +896,13 @@ static int imx290_probe(struct i2c_client *client)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	default_pixel_rate = imx290->nlanes == 2 ?
+			     imx290_modes_2lanes[0].pixel_rate :
+			     imx290_modes_4lanes[0].pixel_rate;
 	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					       V4L2_CID_PIXEL_RATE, 1,
 					       INT_MAX, 1,
-					       imx290_modes[0].pixel_rate);
+					       default_pixel_rate);
 
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
-- 
2.17.1

