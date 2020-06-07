Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639C11F0D1B
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2020 18:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgFGQa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 12:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgFGQa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jun 2020 12:30:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8731C08C5C3
        for <linux-media@vger.kernel.org>; Sun,  7 Jun 2020 09:30:57 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x18so1022824lji.1
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2020 09:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gKPskW6+VadYDY7Xc9bQAKR0XT5AIKa1wPS7cKR7Irw=;
        b=GbTJWU8IGz9DZFllLhpVRWrR2x8gF3BigpYI2CTgrV73PUG72m/OuYbHPG10PK6fcx
         1TlJMhT72jrxckUd5Ra8+EYgO3vw34ZIDOoGgxp32ARsw0qJi3+FH5c4jJl/meg9jy4m
         6RFQRs8bA14hi+yxjG9A3oQuULiIkWqiR9UX8GV0Ikrfi7ApcwK4jCcXRoPvYBETJP/z
         I3BF9MEnq+Ak4voQl8S4E9uchsBBdhX2R+1xHuKKN3H+Os/fIHn1UPomaPn9GgX5Kije
         ax0QXhVOG93MmIuyhHV7yMO1jYYLvSvNXGQuzwPC5/SFMDZu0iBZcoIxvtIO014ezn0K
         SxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gKPskW6+VadYDY7Xc9bQAKR0XT5AIKa1wPS7cKR7Irw=;
        b=QeY7Xo8gEQpdD/4REg7PRRFQJtQmkJQKXdFK8SapDHZLrMlwfphKvd599WT7NFHPKY
         JgOiG7CKZDKwak74XZ7h8jgpIZXPS5BvNk09EmG5RbxGyOe9szpH//RWswJGNPHJOjvP
         nObPafOrXNq0NNOoolBLcmaBg/ki6hSHgWzMPNRLwlSpD87RWNh7KZ3N5CeDDajQwCYV
         HIswhK5BkTGUl+TBxFrvpJzwMYG8CZ+7+QsB3SzQ2HDyp1Xl52ThiD4MALxvA3L94Kx0
         lR2lZvhGy2e20Zl9wQTLzrUMjuKHqT5tpRBQHP0+LUes+8Q01rOgyTjbextwO4E1LVG2
         tZnw==
X-Gm-Message-State: AOAM533KJw4LKD8vOOMRzF9jJDSr/vRhqsrlBuCEDA6aJ6qTrifcK6kR
        f0icEaMVTLVqV8wz/Wi4d+zsdw==
X-Google-Smtp-Source: ABdhPJw82cUQk2imfSWe3BjkRz6vPuBVuxABoZH1Q0U3yFqr4TbQrURz0Em1N2ZhzBFHNZRH74q2lA==
X-Received: by 2002:a2e:8490:: with SMTP id b16mr9771867ljh.325.1591547456098;
        Sun, 07 Jun 2020 09:30:56 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:55 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 05/10] media: i2c: imx290: Add configurable link frequency and pixel rate
Date:   Sun,  7 Jun 2020 19:30:20 +0300
Message-Id: <20200607163025.8409-6-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

IMX290 operates with multiple link frequency and pixel rate combinations.
The initial driver used a single setting for both but since we now have
the lane count support in place, let's add configurable link frequency
and pixel rate.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 148 +++++++++++++++++++++++++++----------
 1 file changed, 109 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ffb393962ffc..152b65cb7cbc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -32,8 +32,6 @@
 #define IMX290_PHY_LANE_NUM 0x3407
 #define IMX290_CSI_LANE_MODE 0x3443
 
-#define IMX290_DEFAULT_LINK_FREQ 445500000
-
 static const char * const imx290_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -51,8 +49,7 @@ struct imx290_mode {
 	u32 width;
 	u32 height;
 	u32 hmax;
-	u32 pixel_rate;
-	u32 link_freq_index;
+	u8 link_freq_index;
 
 	const struct imx290_regval *data;
 	u32 data_size;
@@ -243,29 +240,54 @@ static const struct imx290_regval imx290_10bit_settings[] = {
 };
 
 /* supported link frequencies */
-static const s64 imx290_link_freq[] = {
-	IMX290_DEFAULT_LINK_FREQ,
+#define FREQ_INDEX_1080P	0
+#define FREQ_INDEX_720P		1
+static const s64 imx290_link_freq_2lanes[] = {
+	[FREQ_INDEX_1080P] = 445500000,
+	[FREQ_INDEX_720P] = 297000000,
+};
+static const s64 imx290_link_freq_4lanes[] = {
+	[FREQ_INDEX_1080P] = 222750000,
+	[FREQ_INDEX_720P] = 148500000,
 };
 
+/*
+ * In this function and in the similar ones below We rely on imx290_probe()
+ * to ensure that nlanes is either 2 or 4.
+ */
+static inline const s64 *imx290_link_freqs_ptr(const struct imx290 *imx290)
+{
+	if (imx290->nlanes == 2)
+		return imx290_link_freq_2lanes;
+	else
+		return imx290_link_freq_4lanes;
+}
+
+static inline int imx290_link_freqs_num(const struct imx290 *imx290)
+{
+	if (imx290->nlanes == 2)
+		return ARRAY_SIZE(imx290_link_freq_2lanes);
+	else
+		return ARRAY_SIZE(imx290_link_freq_4lanes);
+}
+
 /* Mode configs */
 static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
 		.hmax = 0x1130,
+		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
-		.pixel_rate = 178200000,
-		.link_freq_index = 0,
 	},
 	{
 		.width = 1280,
 		.height = 720,
 		.hmax = 0x19c8,
+		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
-		.pixel_rate = 178200000,
-		.link_freq_index = 0,
 	},
 };
 
@@ -274,25 +296,22 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 		.width = 1920,
 		.height = 1080,
 		.hmax = 0x0898,
+		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
-		.pixel_rate = 178200000,
-		.link_freq_index = 0,
 	},
 	{
 		.width = 1280,
 		.height = 720,
 		.hmax = 0x0ce4,
+		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
-		.pixel_rate = 178200000,
-		.link_freq_index = 0,
 	},
 };
 
 static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
 {
-	/* We rely on imx290_probe() to ensure that nlanes is either 2 or 4 */
 	if (imx290->nlanes == 2)
 		return imx290_modes_2lanes;
 	else
@@ -477,6 +496,30 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static inline u8 imx290_get_link_freq_index(struct imx290 *imx290)
+{
+	return imx290->current_mode->link_freq_index;
+}
+
+static s64 imx290_get_link_freq(struct imx290 *imx290)
+{
+	u8 index = imx290_get_link_freq_index(imx290);
+
+	return *(imx290_link_freqs_ptr(imx290) + index);
+}
+
+static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
+{
+	s64 link_freq = imx290_get_link_freq(imx290);
+	u8 nlanes = imx290->nlanes;
+	u64 pixel_rate;
+
+	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
+	pixel_rate = link_freq * 2 * nlanes;
+	do_div(pixel_rate, 10);
+	return pixel_rate;
+}
+
 static int imx290_set_fmt(struct v4l2_subdev *sd,
 			  struct v4l2_subdev_pad_config *cfg,
 		      struct v4l2_subdev_format *fmt)
@@ -509,10 +552,14 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		format = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
 	} else {
 		format = &imx290->current_format;
-		__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, mode->pixel_rate);
-
 		imx290->current_mode = mode;
+
+		if (imx290->link_freq)
+			__v4l2_ctrl_s_ctrl(imx290->link_freq,
+					   imx290_get_link_freq_index(imx290));
+		if (imx290->pixel_rate)
+			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
+						 imx290_calc_pixel_rate(imx290));
 	}
 
 	*format = fmt->format;
@@ -536,12 +583,11 @@ static int imx290_entity_init_cfg(struct v4l2_subdev *subdev,
 	return 0;
 }
 
-static int imx290_write_current_format(struct imx290 *imx290,
-				       struct v4l2_mbus_framefmt *format)
+static int imx290_write_current_format(struct imx290 *imx290)
 {
 	int ret;
 
-	switch (format->code) {
+	switch (imx290->current_format.code) {
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
 		ret = imx290_set_register_array(imx290, imx290_10bit_settings,
 						ARRAY_SIZE(
@@ -592,8 +638,8 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		return ret;
 	}
 
-	/* Set current frame format */
-	ret = imx290_write_current_format(imx290, &imx290->current_format);
+	/* Apply the register values related to current frame format */
+	ret = imx290_write_current_format(imx290);
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set frame format\n");
 		return ret;
@@ -776,13 +822,34 @@ static const struct media_entity_operations imx290_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
+/*
+ * Returns 0 if all link frequencies used by the driver for the given number
+ * of MIPI data lanes are mentioned in the device tree, or the value of the
+ * first missing frequency otherwise.
+ */
+static s64 imx290_check_link_freqs(const struct imx290 *imx290)
+{
+	int i, j;
+	const s64 *freqs = imx290_link_freqs_ptr(imx290);
+	int freqs_count = imx290_link_freqs_num(imx290);
+
+	for (i = 0; i < freqs_count; i++) {
+		for (j = 0; j < imx290->ep.nr_of_link_frequencies; j++)
+			if (freqs[i] == imx290->ep.link_frequencies[j])
+				break;
+		if (j == imx290->ep.nr_of_link_frequencies)
+			return freqs[i];
+	}
+	return 0;
+}
+
 static int imx290_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct fwnode_handle *endpoint;
 	struct imx290 *imx290;
 	u32 xclk_freq;
-	u32 default_pixel_rate;
+	s64 fq;
 	int ret;
 
 	imx290 = devm_kzalloc(dev, sizeof(*imx290), GFP_KERNEL);
@@ -825,8 +892,10 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
-	if (imx290->ep.link_frequencies[0] != IMX290_DEFAULT_LINK_FREQ) {
-		dev_err(dev, "Unsupported link frequency\n");
+	/* Check that link frequences for all the modes are in device tree */
+	fq = imx290_check_link_freqs(imx290);
+	if (fq) {
+		dev_err(dev, "Link frequency of %lld is not supported\n", fq);
 		ret = -EINVAL;
 		goto free_err;
 	}
@@ -883,26 +952,30 @@ static int imx290_probe(struct i2c_client *client)
 
 	mutex_init(&imx290->lock);
 
+	/*
+	 * Initialize the frame format. In particular, imx290->current_mode
+	 * and imx290->bpp are set to defaults: imx290_calc_pixel_rate() call
+	 * below relies on these fields.
+	 */
+	imx290_entity_init_cfg(&imx290->sd, NULL);
+
 	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
+
 	imx290->link_freq =
-		v4l2_ctrl_new_int_menu(&imx290->ctrls,
-				       &imx290_ctrl_ops,
+		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
 				       V4L2_CID_LINK_FREQ,
-				       ARRAY_SIZE(imx290_link_freq) - 1,
-				       0, imx290_link_freq);
+				       imx290_link_freqs_num(imx290) - 1, 0,
+				       imx290_link_freqs_ptr(imx290));
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	default_pixel_rate = imx290->nlanes == 2 ?
-			     imx290_modes_2lanes[0].pixel_rate :
-			     imx290_modes_4lanes[0].pixel_rate;
 	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE, 1,
-					       INT_MAX, 1,
-					       default_pixel_rate);
+					       V4L2_CID_PIXEL_RATE,
+					       1, INT_MAX, 1,
+					       imx290_calc_pixel_rate(imx290));
 
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
@@ -926,9 +999,6 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_ctrl;
 	}
 
-	/* Initialize the frame format (this also sets imx290->current_mode) */
-	imx290_entity_init_cfg(&imx290->sd, NULL);
-
 	ret = v4l2_async_register_subdev(&imx290->sd);
 	if (ret < 0) {
 		dev_err(dev, "Could not register v4l2 device\n");
-- 
2.17.1

