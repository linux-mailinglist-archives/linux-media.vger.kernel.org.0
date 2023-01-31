Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043CB683614
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjAaTHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbjAaTHw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:07:52 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358BD53E4E
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:07:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a3so8491696wrt.6
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIkoBOHa0/7Lq3dzgpK9/gsvjnDUjdw9EDj4wB8CYfQ=;
        b=t4RxzP4jE8IwhmfRr1D+vHSPq1ACw016Fn+++RbpgkXPeOQXHRO+WUKGt4zWqt7g6O
         YCNRK2dX081dZSzSUVUSwhtSxfL+9s9K9cXBC21rQpUkprvr+97g+HRTlt0cyql5A4IM
         n/RVLD0uzGA1O1f9KKwAXOyn7VQYAbKklgrDZsWU1Hn+xyoOlrFU5ep8j4qRyhK7FQ3H
         6UyrtbZBFY2ExYKoAoCoMKTfcBXgudZ2Krb12wJ7ynfTpZKPfAkyd/187AGo7/sRcvoi
         XMMRuXftEwY5G8v3TieeG+MFUbMGlv+3rBRltltQdctP3hjv2Awod9ScONcg/9F5PbPK
         lG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIkoBOHa0/7Lq3dzgpK9/gsvjnDUjdw9EDj4wB8CYfQ=;
        b=fC/ipuVfqXsK9Ehhv8IrceDkQhgOyWXutjujHjtPTqNvQBk+Ye7Lsg0rdltwum/f7c
         cbY9UlypRr8T/tyBsQZZFCrBQpyTt7zUxj0tZd5TbFQ7ndEcPrSLT6RvImfSbDD5vqxO
         upPJMRKNhMbCxmu/QUFqUNHlrHjDf7x36Mtycs/OwnbFlkdc/eLYs0B5DuAHha3ndYXT
         vMhnxGneK3nG6Apt5BW/mvvglqxozaKmqb4KJUwoB3ctB9+f0wVX9ohUtFRarDANA3J/
         OHJanY4HSMTYml4ZuhEOKeyNfjCqT9QyoRhPW//f9l+jP1XfQCun0BY5+q6kRzJ6V73g
         DarA==
X-Gm-Message-State: AO0yUKVWUYTl/C4o4jo97vwhbxJkP17XJW5T5GOgygTKMBm+o1GGTUBK
        AEC7V1RcV2+kj/tUJneVneEq1w==
X-Google-Smtp-Source: AK7set/OI4smZ1T29rKNpg90nI7SDIpej/2N0JE0qBMF/SJ8Tbh1QS4alZddMWLbIxLdNxDIqFSgGQ==
X-Received: by 2002:a5d:64a9:0:b0:2bf:cbf5:ac10 with SMTP id m9-20020a5d64a9000000b002bfcbf5ac10mr5467931wrp.11.1675192069776;
        Tue, 31 Jan 2023 11:07:49 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id c17-20020adffb11000000b002bc8130cca7sm15574989wrr.23.2023.01.31.11.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:07:49 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 2/2] media: i2c: imx290: Add support for the mono sensor variant.
Date:   Tue, 31 Jan 2023 19:07:00 +0000
Message-Id: <20230131190700.3476796-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
References: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX290 module is available as either mono or colour (Bayer).

Update the driver so that it can advertise the correct mono
formats instead of the colour ones.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 47 ++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..a370f1102334 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -177,6 +178,7 @@ struct imx290 {
 	struct clk *xclk;
 	struct regmap *regmap;
 	u8 nlanes;
+	u8 mono;
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -414,7 +416,8 @@ static inline int imx290_modes_num(const struct imx290 *imx290)
 }
 
 struct imx290_format_info {
-	u32 code;
+	/* Array of codes. [0] is for colour, [1] is for mono. */
+	u32 code[2];
 	u8 bpp;
 	const struct imx290_regval *regs;
 	unsigned int num_regs;
@@ -422,26 +425,27 @@ struct imx290_format_info {
 
 static const struct imx290_format_info imx290_formats[] = {
 	{
-		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.code = { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_Y10_1X10 },
 		.bpp = 10,
 		.regs = imx290_10bit_settings,
 		.num_regs = ARRAY_SIZE(imx290_10bit_settings),
 	}, {
-		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.code = { MEDIA_BUS_FMT_SRGGB12_1X12, MEDIA_BUS_FMT_Y12_1X12 },
 		.bpp = 12,
 		.regs = imx290_12bit_settings,
 		.num_regs = ARRAY_SIZE(imx290_12bit_settings),
 	}
 };
 
-static const struct imx290_format_info *imx290_format_info(u32 code)
+static const struct imx290_format_info *
+imx290_format_info(const struct imx290 *imx290, u32 code)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
 		const struct imx290_format_info *info = &imx290_formats[i];
 
-		if (info->code == code)
+		if (info->code[imx290->mono] == code)
 			return info;
 	}
 
@@ -536,7 +540,7 @@ static int imx290_set_black_level(struct imx290 *imx290,
 				  const struct v4l2_mbus_framefmt *format,
 				  unsigned int black_level, int *err)
 {
-	unsigned int bpp = imx290_format_info(format->code)->bpp;
+	unsigned int bpp = imx290_format_info(imx290, format->code)->bpp;
 
 	return imx290_write(imx290, IMX290_BLKLEVEL,
 			    black_level >> (16 - bpp), err);
@@ -548,7 +552,7 @@ static int imx290_setup_format(struct imx290 *imx290,
 	const struct imx290_format_info *info;
 	int ret;
 
-	info = imx290_format_info(format->code);
+	info = imx290_format_info(imx290, format->code);
 
 	ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
 	if (ret < 0) {
@@ -844,10 +848,12 @@ static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
+	const struct imx290 *imx290 = to_imx290(sd);
+
 	if (code->index >= ARRAY_SIZE(imx290_formats))
 		return -EINVAL;
 
-	code->code = imx290_formats[code->index].code;
+	code->code = imx290_formats[code->index].code[imx290->mono];
 
 	return 0;
 }
@@ -859,7 +865,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev *sd,
 	const struct imx290 *imx290 = to_imx290(sd);
 	const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
 
-	if (!imx290_format_info(fse->code))
+	if (!imx290_format_info(imx290, fse->code))
 		return -EINVAL;
 
 	if (fse->index >= imx290_modes_num(imx290))
@@ -888,8 +894,8 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 
-	if (!imx290_format_info(fmt->format.code))
-		fmt->format.code = imx290_formats[0].code;
+	if (!imx290_format_info(imx290, fmt->format.code))
+		fmt->format.code = imx290_formats[0].code[imx290->mono];
 
 	fmt->format.field = V4L2_FIELD_NONE;
 
@@ -1177,16 +1183,29 @@ static s64 imx290_check_link_freqs(const struct imx290 *imx290,
 	return 0;
 }
 
+static const struct of_device_id imx290_of_match[] = {
+	{ .compatible = "sony,imx290" },
+	{ .compatible = "sony,imx290-mono", .data = (void *)1 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx290_of_match);
+
 static int imx290_parse_dt(struct imx290 *imx290)
 {
+	struct i2c_client *client = to_i2c_client(imx290->dev);
 	/* Only CSI2 is supported for now: */
 	struct v4l2_fwnode_endpoint ep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	const struct of_device_id *match;
 	struct fwnode_handle *endpoint;
 	int ret;
 	s64 fq;
 
+	match = i2c_of_match_device(imx290_of_match, client);
+	if (match)
+		imx290->mono = match->data ? 1 : 0;
+
 	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
 	if (!endpoint) {
 		dev_err(imx290->dev, "Endpoint node not found\n");
@@ -1351,12 +1370,6 @@ static void imx290_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(imx290->dev);
 }
 
-static const struct of_device_id imx290_of_match[] = {
-	{ .compatible = "sony,imx290" },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, imx290_of_match);
-
 static struct i2c_driver imx290_i2c_driver = {
 	.probe_new  = imx290_probe,
 	.remove = imx290_remove,
-- 
2.34.1

