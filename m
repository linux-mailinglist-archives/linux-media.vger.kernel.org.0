Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 652E9716B20
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbjE3RbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbjE3RbD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:31:03 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1BB185
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30aa76048fbso3235177f8f.2
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467847; x=1688059847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnWY7OTC78+bqFCEFt1iBTNvVK0nkspVbxS6HHLxTBw=;
        b=jVGfs046dCFefrTKca4lLHASiUFjo83tZ9XRKITF1Pzv20fgvULT8BKQL3ygFC/tY6
         PklFwZrB9LAzkY7QkYgbOTf/pRDmglOSoXXsLELgBlcNshkPh0MsPopE3Ux8TQtaCNgn
         n8ttUmiJ7Gvhk5eheTZsdAl0JjKjSnZAY2BbEXXvKUPBlXKg29oy5XNqbi46eDAogxxR
         f9ZrjBu3k9kiRmT4A8kI6cPUNBTyiqC550GX8HOSesP9iYWU5xBNUiD0hXSpIzGEDMHB
         Yb0FxeKpDKwtYZ33ESeQGern5AfEGyAOArq6UCfH9+2jnH9A4k1ZpXdqZkaBsg+Pf0r+
         61pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467847; x=1688059847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnWY7OTC78+bqFCEFt1iBTNvVK0nkspVbxS6HHLxTBw=;
        b=kvmfK9niWt1BC3FriVPDNhTeqVnMmhGObnq3s2+rTwugb7xjC6Kowd/zze29fkRWHM
         5vlh147FlrXD23f9myv4YSWvbKsOMU/+Qbn5eufKAhqdwc9Kylc/M3P9edh+uSvxl0rY
         o0qqFQFZwlx+XWfjzd5jbUZ6kPtFlfb++ftE0NbG02U9OttwN1XoHcn5hoHflKhwFXkx
         zakrpNeQyiQnZZSZcpQeYHaUnFGVWrlgGthlvsDIEPBI7kxretDOsaWBhLbOS2OvUGs9
         05J3Zx0kZ+SliMR7Zq3mHIKe1l2r4dSFz/UjLHjnwjGjADPog1frZpmTp2lAQch3C+dx
         8PaQ==
X-Gm-Message-State: AC+VfDzCdOzZ84t/wT9dMjuKGrPV26iusIXZ/+/J3lNG5XKDFuOwrbet
        9sgJS90rrH8BRV95O2wRZEY4FQ==
X-Google-Smtp-Source: ACHHUZ40lW60nbY8Y/M4PKGKr3nMy/UnHyiZSUEW0ViFeGk/4T8j3O3pNZ0BY8Tv/ZTuYxO+O3Krkg==
X-Received: by 2002:a05:6000:12c8:b0:309:48eb:cdf9 with SMTP id l8-20020a05600012c800b0030948ebcdf9mr2215743wrx.38.1685467847261;
        Tue, 30 May 2023 10:30:47 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:46 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 17/21] media: i2c: imx258: Support faster pixel rate on binned modes
Date:   Tue, 30 May 2023 18:29:56 +0100
Message-Id: <20230530173000.3060865-18-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the binned modes, there is little point in faithfully
reproducing the horizontal line length of 5352 pixels on the CSI2
bus, and the FIFO between the pixel array and MIPI serialiser
allows us to remove that dependency.

Allow the pixel array to run with the normal settings, with the MIPI
serialiser at half the rate. This requires some additional
information for the link frequency to pixel rate function that
needs to be added to the configuration tables.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 109 ++++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 38 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index b9b650d40365..986757650378 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -103,6 +103,11 @@ struct imx258_reg_list {
 	const struct imx258_reg *regs;
 };
 
+struct imx258_link_cfg {
+	unsigned int lf_to_pix_rate_factor;
+	struct imx258_reg_list reg_list;
+};
+
 #define IMX258_LANE_CONFIGS	2
 #define IMX258_2_LANE_MODE	0
 #define IMX258_4_LANE_MODE	1
@@ -112,8 +117,8 @@ struct imx258_link_freq_config {
 	u64 link_frequency;
 	u32 pixels_per_line;
 
-	/* PLL registers for this link frequency */
-	struct imx258_reg_list reg_list[IMX258_LANE_CONFIGS];
+	/* Configuration for this link frequency / num lanes selection */
+	struct imx258_link_cfg link_cfg[IMX258_LANE_CONFIGS];
 };
 
 /* Mode : resolution and related config&values */
@@ -272,7 +277,7 @@ static const struct imx258_reg mipi_640mbps_19_2mhz_4l[] = {
 static const struct imx258_reg mipi_642mbps_24mhz_2l[] = {
 	{ 0x0136, 0x18 },
 	{ 0x0137, 0x00 },
-	{ 0x0301, 0x0A },
+	{ 0x0301, 0x05 },
 	{ 0x0303, 0x02 },
 	{ 0x0305, 0x04 },
 	{ 0x0306, 0x00 },
@@ -478,14 +483,22 @@ enum {
 };
 
 /*
- * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
- * data rate => double data rate;
- * number of lanes => (configurable 2 or 4);
- * bits per pixel => 10
+ * Pixel rate does not necessarily relate to link frequency on this sensor as
+ * there is a FIFO between the pixel array pipeline and the MIPI serializer.
+ * The recommendation from Sony is that the pixel array is always run with a
+ * line length of 5352 pixels, which means that there is a large amount of
+ * blanking time for the 1048x780 mode. There is no need to replicate this
+ * blanking on the CSI2 bus, and the configuration of register 0x0301 allows the
+ * divider to be altered.
+ *
+ * The actual factor between link frequency and pixel rate is in the
+ * imx258_link_cfg, so use this to convert between the two.
+ * bits per pixel being 10, and D-PHY being DDR is assumed by this function, so
+ * the value is only the combination of number of lanes and pixel clock divider.
  */
-static u64 link_freq_to_pixel_rate(u64 f, unsigned int nlanes)
+static u64 link_freq_to_pixel_rate(u64 f, const struct imx258_link_cfg *link_cfg)
 {
-	f *= 2 * nlanes;
+	f *= 2 * link_cfg->lf_to_pix_rate_factor;
 	do_div(f, 10);
 
 	return f;
@@ -510,31 +523,33 @@ static const s64 link_freq_menu_items_24[] = {
 	IMX258_LINK_FREQ_321MHZ,
 };
 
+#define REGS(_list) { .num_of_regs = ARRAY_SIZE(_list), .regs = _list, }
+
 /* Link frequency configs */
 static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
 	[IMX258_LINK_FREQ_1267MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
-		.reg_list = {
+		.link_cfg = {
 			[IMX258_2_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_2l),
-				.regs = mipi_1267mbps_19_2mhz_2l,
+				.lf_to_pix_rate_factor = 2 * 2,
+				.reg_list = REGS(mipi_1267mbps_19_2mhz_2l),
 			},
 			[IMX258_4_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_4l),
-				.regs = mipi_1267mbps_19_2mhz_4l,
+				.lf_to_pix_rate_factor = 4,
+				.reg_list = REGS(mipi_1267mbps_19_2mhz_4l),
 			},
 		}
 	},
 	[IMX258_LINK_FREQ_640MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
-		.reg_list = {
+		.link_cfg = {
 			[IMX258_2_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_2l),
-				.regs = mipi_640mbps_19_2mhz_2l,
+				.lf_to_pix_rate_factor = 2,
+				.reg_list = REGS(mipi_640mbps_19_2mhz_2l),
 			},
 			[IMX258_4_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_4l),
-				.regs = mipi_640mbps_19_2mhz_4l,
+				.lf_to_pix_rate_factor = 4,
+				.reg_list = REGS(mipi_640mbps_19_2mhz_4l),
 			},
 		}
 	},
@@ -543,27 +558,27 @@ static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
 static const struct imx258_link_freq_config link_freq_configs_24[] = {
 	[IMX258_LINK_FREQ_1267MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
-		.reg_list = {
+		.link_cfg = {
 			[IMX258_2_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_2l),
-				.regs = mipi_1272mbps_24mhz_2l,
+				.lf_to_pix_rate_factor = 2,
+				.reg_list = REGS(mipi_1272mbps_24mhz_2l),
 			},
 			[IMX258_4_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_4l),
-				.regs = mipi_1272mbps_24mhz_4l,
+				.lf_to_pix_rate_factor = 4,
+				.reg_list = REGS(mipi_1272mbps_24mhz_4l),
 			},
 		}
 	},
 	[IMX258_LINK_FREQ_640MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
-		.reg_list = {
+		.link_cfg = {
 			[IMX258_2_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_2l),
-				.regs = mipi_642mbps_24mhz_2l,
+				.lf_to_pix_rate_factor = 2 * 2,
+				.reg_list = REGS(mipi_642mbps_24mhz_2l),
 			},
 			[IMX258_4_LANE_MODE] = {
-				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_4l),
-				.regs = mipi_642mbps_24mhz_4l,
+				.lf_to_pix_rate_factor = 4,
+				.reg_list = REGS(mipi_642mbps_24mhz_4l),
 			},
 		}
 	},
@@ -643,7 +658,7 @@ struct imx258 {
 
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
-	unsigned int nlanes;
+	unsigned int lane_mode_idx;
 	unsigned int csi2_flags;
 
 	/*
@@ -976,8 +991,10 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx258 *imx258 = to_imx258(sd);
-	const struct imx258_mode *mode;
+	const struct imx258_link_freq_config *link_freq_cfgs;
+	const struct imx258_link_cfg *link_cfg;
 	struct v4l2_mbus_framefmt *framefmt;
+	const struct imx258_mode *mode;
 	s32 vblank_def;
 	s32 vblank_min;
 	s64 h_blank;
@@ -1001,7 +1018,11 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
-		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
+		link_freq_cfgs =
+			&imx258->link_freq_configs[mode->link_freq_index];
+
+		link_cfg = &link_freq_cfgs->link_cfg[imx258->lane_mode_idx];
+		pixel_rate = link_freq_to_pixel_rate(link_freq, link_cfg);
 		__v4l2_ctrl_modify_range(imx258->pixel_rate, pixel_rate,
 					 pixel_rate, 1, pixel_rate);
 		/* Update limits and set FPS to default */
@@ -1098,7 +1119,8 @@ static int imx258_start_streaming(struct imx258 *imx258)
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
 	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
-	reg_list = &link_freq_cfg->reg_list[imx258->nlanes == 2 ? 0 : 1];
+
+	reg_list = &link_freq_cfg->link_cfg[imx258->lane_mode_idx].reg_list;
 	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set plls\n", __func__);
@@ -1324,9 +1346,11 @@ static const struct v4l2_subdev_internal_ops imx258_internal_ops = {
 static int imx258_init_controls(struct imx258 *imx258)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
+	const struct imx258_link_freq_config *link_freq_cfgs;
 	struct v4l2_fwnode_device_properties props;
-	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_ctrl *vflip, *hflip;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	const struct imx258_link_cfg *link_cfg;
 	s64 vblank_def;
 	s64 vblank_min;
 	s64 pixel_rate;
@@ -1360,8 +1384,11 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	link_freq_cfgs = &imx258->link_freq_configs[0];
+	link_cfg = link_freq_cfgs[imx258->lane_mode_idx].link_cfg;
 	pixel_rate = link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
-					     imx258->nlanes);
+					     link_cfg);
+
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
@@ -1522,10 +1549,16 @@ static int imx258_probe(struct i2c_client *client)
 	}
 
 	/* Get number of data lanes */
-	imx258->nlanes = ep.bus.mipi_csi2.num_data_lanes;
-	if (imx258->nlanes != 2 && imx258->nlanes != 4) {
+	switch (ep.bus.mipi_csi2.num_data_lanes) {
+	case 2:
+		imx258->lane_mode_idx = IMX258_2_LANE_MODE;
+		break;
+	case 4:
+		imx258->lane_mode_idx = IMX258_4_LANE_MODE;
+		break;
+	default:
 		dev_err(&client->dev, "Invalid data lanes: %u\n",
-			imx258->nlanes);
+			ep.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
 		goto error_endpoint_poweron;
 	}
-- 
2.25.1

