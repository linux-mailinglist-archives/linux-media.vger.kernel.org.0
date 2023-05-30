Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F42A716B10
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbjE3RbE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbjE3Ra5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2241E5
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:42 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30aea656e36so1863672f8f.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467841; x=1688059841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZSyDMKbn7895XHyKFyQxSeXVFo2FOQ8DM2PUTA4yfA=;
        b=oQiBQGeEz7NaiYO6TxKMla9Q/9kAAjBklvopZ4r8D138guGbFy7dxocYIJbWr31AGA
         2vxk0d4aw6E4xPbNJRIcrIU3xOS+W3sTNVzbCWuPMFqPSJgCUUzNf06f05DcOO7bd/q+
         UYH3wLg4/nm8M3SBP5Y3ZE4c5paLPIkY2MyiI+6ocA3zrp8GmZhMTQwpVcjjsHADk3vg
         YpJLNohpjS+dbcmmUD19DrG1ZEe3WhmI1KfCrHhHMgqT32W5TF/VfCiwhhX45CCLSTtp
         9iHzHbAGcTdraLanhFN9pTb3ni8A0PPV7Ag3P7E6CKR+t9C/ysnzlwWXxRmpdnMaBLTi
         v6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467841; x=1688059841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZSyDMKbn7895XHyKFyQxSeXVFo2FOQ8DM2PUTA4yfA=;
        b=AVWySQfuwD1pMO9U5G61kcs+0N/VrmBFmFGIILfTONrVFli9CiemHGyjbCFcCMf1wR
         pBYA6JH8TmedBNQzmZnpYRCpUe17lsqD/6eKKAad8lg6EWayPfUilUmDvv5p46zXUwKi
         54VTU5CwKEZDeLQiCG5JQG4HL55+KBFVKwKUtmDeFK/Mmz7T1VfDZc78u7V3i5AfPNTE
         bD8yBRGFxQE497ZRrtZwmPp/rd0ulUEpAQ0+NbB2h0hUA0yBHFoD9UdIP/LPAoIqg6a3
         nEu1y/AEE0vxXwHFwu6XU5NjeKmUc9eXghn2GQf5MGxiunzaM90em0/2YpOxpT2glxnC
         40ew==
X-Gm-Message-State: AC+VfDz+l6Talg4j6iGao9/h7iQKrggJQTHCaov7O8qrZyH6Yb3esIwl
        5nTOMF5XRdw/5hspHLvel/6Vhw==
X-Google-Smtp-Source: ACHHUZ7+Fxn6Adgaa/yNZ6eLBb/jzjH0VNbcLe8swDCYEwt7d/vm0UaQ44rTFvbYvpDSeovgUWrD7A==
X-Received: by 2002:a5d:408e:0:b0:2ef:ba4f:c821 with SMTP id o14-20020a5d408e000000b002efba4fc821mr2034857wrp.36.1685467841154;
        Tue, 30 May 2023 10:30:41 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:40 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 09/21] media: i2c: imx258: Add support for running on 2 CSI data lanes
Date:   Tue, 30 May 2023 18:29:48 +0100
Message-Id: <20230530173000.3060865-10-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
References: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extends the driver to also support 2 data lanes.
Frame rates are obviously more restricted on 2 lanes, but some
hardware simply hasn't wired more up.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx258.c | 211 ++++++++++++++++++++++++++++++++-----
 1 file changed, 187 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index d40521f9a3c6..433dff7f1fa0 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -86,13 +86,17 @@ struct imx258_reg_list {
 	const struct imx258_reg *regs;
 };
 
+#define IMX258_LANE_CONFIGS	2
+#define IMX258_2_LANE_MODE	0
+#define IMX258_4_LANE_MODE	1
+
 /* Link frequency config */
 struct imx258_link_freq_config {
 	u64 link_frequency;
 	u32 pixels_per_line;
 
 	/* PLL registers for this link frequency */
-	struct imx258_reg_list reg_list;
+	struct imx258_reg_list reg_list[IMX258_LANE_CONFIGS];
 };
 
 /* Mode : resolution and related config&values */
@@ -112,8 +116,30 @@ struct imx258_mode {
 	struct imx258_reg_list reg_list;
 };
 
-/* 4208x3120 needs 1267Mbps/lane, 4 lanes */
-static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
+/* 4208x3120 needs 1267Mbps/lane, 4 lanes. Use that rate on 2 lanes as well */
+static const struct imx258_reg mipi_1267mbps_19_2mhz_2l[] = {
+	{ 0x0136, 0x13 },
+	{ 0x0137, 0x33 },
+	{ 0x0301, 0x0A },
+	{ 0x0303, 0x02 },
+	{ 0x0305, 0x03 },
+	{ 0x0306, 0x00 },
+	{ 0x0307, 0xC6 },
+	{ 0x0309, 0x0A },
+	{ 0x030B, 0x01 },
+	{ 0x030D, 0x02 },
+	{ 0x030E, 0x00 },
+	{ 0x030F, 0xD8 },
+	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x01 },
+	{ 0x0820, 0x09 },
+	{ 0x0821, 0xa6 },
+	{ 0x0822, 0x66 },
+	{ 0x0823, 0x66 },
+};
+
+static const struct imx258_reg mipi_1267mbps_19_2mhz_4l[] = {
 	{ 0x0136, 0x13 },
 	{ 0x0137, 0x33 },
 	{ 0x0301, 0x05 },
@@ -127,16 +153,18 @@ static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
 	{ 0x030E, 0x00 },
 	{ 0x030F, 0xD8 },
 	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x03 },
 	{ 0x0820, 0x13 },
 	{ 0x0821, 0x4C },
 	{ 0x0822, 0xCC },
 	{ 0x0823, 0xCC },
 };
 
-static const struct imx258_reg mipi_1272mbps_24mhz[] = {
+static const struct imx258_reg mipi_1272mbps_24mhz_2l[] = {
 	{ 0x0136, 0x18 },
 	{ 0x0137, 0x00 },
-	{ 0x0301, 0x05 },
+	{ 0x0301, 0x0a },
 	{ 0x0303, 0x02 },
 	{ 0x0305, 0x04 },
 	{ 0x0306, 0x00 },
@@ -147,13 +175,59 @@ static const struct imx258_reg mipi_1272mbps_24mhz[] = {
 	{ 0x030E, 0x00 },
 	{ 0x030F, 0xD8 },
 	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x01 },
 	{ 0x0820, 0x13 },
 	{ 0x0821, 0x4C },
 	{ 0x0822, 0xCC },
 	{ 0x0823, 0xCC },
 };
 
-static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
+static const struct imx258_reg mipi_1272mbps_24mhz_4l[] = {
+	{ 0x0136, 0x18 },
+	{ 0x0137, 0x00 },
+	{ 0x0301, 0x05 },
+	{ 0x0303, 0x02 },
+	{ 0x0305, 0x04 },
+	{ 0x0306, 0x00 },
+	{ 0x0307, 0xD4 },
+	{ 0x0309, 0x0A },
+	{ 0x030B, 0x01 },
+	{ 0x030D, 0x02 },
+	{ 0x030E, 0x00 },
+	{ 0x030F, 0xD8 },
+	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x03 },
+	{ 0x0820, 0x13 },
+	{ 0x0821, 0xE0 },
+	{ 0x0822, 0x00 },
+	{ 0x0823, 0x00 },
+};
+
+static const struct imx258_reg mipi_640mbps_19_2mhz_2l[] = {
+	{ 0x0136, 0x13 },
+	{ 0x0137, 0x33 },
+	{ 0x0301, 0x05 },
+	{ 0x0303, 0x02 },
+	{ 0x0305, 0x03 },
+	{ 0x0306, 0x00 },
+	{ 0x0307, 0x64 },
+	{ 0x0309, 0x0A },
+	{ 0x030B, 0x01 },
+	{ 0x030D, 0x02 },
+	{ 0x030E, 0x00 },
+	{ 0x030F, 0xD8 },
+	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x01 },
+	{ 0x0820, 0x05 },
+	{ 0x0821, 0x00 },
+	{ 0x0822, 0x00 },
+	{ 0x0823, 0x00 },
+};
+
+static const struct imx258_reg mipi_640mbps_19_2mhz_4l[] = {
 	{ 0x0136, 0x13 },
 	{ 0x0137, 0x33 },
 	{ 0x0301, 0x05 },
@@ -167,13 +241,37 @@ static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
 	{ 0x030E, 0x00 },
 	{ 0x030F, 0xD8 },
 	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x03 },
 	{ 0x0820, 0x0A },
 	{ 0x0821, 0x00 },
 	{ 0x0822, 0x00 },
 	{ 0x0823, 0x00 },
 };
 
-static const struct imx258_reg mipi_642mbps_24mhz[] = {
+static const struct imx258_reg mipi_642mbps_24mhz_2l[] = {
+	{ 0x0136, 0x18 },
+	{ 0x0137, 0x00 },
+	{ 0x0301, 0x0A },
+	{ 0x0303, 0x02 },
+	{ 0x0305, 0x04 },
+	{ 0x0306, 0x00 },
+	{ 0x0307, 0x6B },
+	{ 0x0309, 0x0A },
+	{ 0x030B, 0x01 },
+	{ 0x030D, 0x02 },
+	{ 0x030E, 0x00 },
+	{ 0x030F, 0xD8 },
+	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x01 },
+	{ 0x0820, 0x0A },
+	{ 0x0821, 0x00 },
+	{ 0x0822, 0x00 },
+	{ 0x0823, 0x00 },
+};
+
+static const struct imx258_reg mipi_642mbps_24mhz_4l[] = {
 	{ 0x0136, 0x18 },
 	{ 0x0137, 0x00 },
 	{ 0x0301, 0x05 },
@@ -187,6 +285,8 @@ static const struct imx258_reg mipi_642mbps_24mhz[] = {
 	{ 0x030E, 0x00 },
 	{ 0x030F, 0xD8 },
 	{ 0x0310, 0x00 },
+
+	{ 0x0114, 0x03 },
 	{ 0x0820, 0x0A },
 	{ 0x0821, 0x00 },
 	{ 0x0822, 0x00 },
@@ -241,7 +341,6 @@ static const struct imx258_reg mode_common_regs[] = {
 	{ 0x5F05, 0xED },
 	{ 0x0112, 0x0A },
 	{ 0x0113, 0x0A },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x14 },
 	{ 0x0343, 0xE8 },
 	{ 0x0344, 0x00 },
@@ -360,11 +459,13 @@ enum {
 
 /*
  * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
- * data rate => double data rate; number of lanes => 4; bits per pixel => 10
+ * data rate => double data rate;
+ * number of lanes => (configurable 2 or 4);
+ * bits per pixel => 10
  */
-static u64 link_freq_to_pixel_rate(u64 f)
+static u64 link_freq_to_pixel_rate(u64 f, unsigned int nlanes)
 {
-	f *= 2 * 4;
+	f *= 2 * nlanes;
 	do_div(f, 10);
 
 	return f;
@@ -394,15 +495,27 @@ static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
 	[IMX258_LINK_FREQ_1267MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz),
-			.regs = mipi_1267mbps_19_2mhz,
+			[IMX258_2_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_2l),
+				.regs = mipi_1267mbps_19_2mhz_2l,
+			},
+			[IMX258_4_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz_4l),
+				.regs = mipi_1267mbps_19_2mhz_4l,
+			},
 		}
 	},
 	[IMX258_LINK_FREQ_640MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz),
-			.regs = mipi_640mbps_19_2mhz,
+			[IMX258_2_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_2l),
+				.regs = mipi_640mbps_19_2mhz_2l,
+			},
+			[IMX258_4_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz_4l),
+				.regs = mipi_640mbps_19_2mhz_4l,
+			},
 		}
 	},
 };
@@ -411,15 +524,27 @@ static const struct imx258_link_freq_config link_freq_configs_24[] = {
 	[IMX258_LINK_FREQ_1267MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz),
-			.regs = mipi_1272mbps_24mhz,
+			[IMX258_2_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_2l),
+				.regs = mipi_1272mbps_24mhz_2l,
+			},
+			[IMX258_4_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz_4l),
+				.regs = mipi_1272mbps_24mhz_4l,
+			},
 		}
 	},
 	[IMX258_LINK_FREQ_640MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz),
-			.regs = mipi_642mbps_24mhz,
+			[IMX258_2_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_2l),
+				.regs = mipi_642mbps_24mhz_2l,
+			},
+			[IMX258_4_LANE_MODE] = {
+				.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz_4l),
+				.regs = mipi_642mbps_24mhz_4l,
+			},
 		}
 	},
 };
@@ -478,6 +603,7 @@ struct imx258 {
 
 	const struct imx258_link_freq_config *link_freq_configs;
 	const s64 *link_freq_menu_items;
+	unsigned int nlanes;
 
 	/*
 	 * Mutex for serialized access:
@@ -787,7 +913,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
 
 		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
-		pixel_rate = link_freq_to_pixel_rate(link_freq);
+		pixel_rate = link_freq_to_pixel_rate(link_freq, imx258->nlanes);
 		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
 		vblank_def = imx258->cur_mode->vts_def -
@@ -816,11 +942,13 @@ static int imx258_start_streaming(struct imx258 *imx258)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	const struct imx258_reg_list *reg_list;
+	const struct imx258_link_freq_config *link_freq_cfg;
 	int ret, link_freq_index;
 
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
-	reg_list = &imx258->link_freq_configs[link_freq_index].reg_list;
+	link_freq_cfg = &imx258->link_freq_configs[link_freq_index];
+	reg_list = &link_freq_cfg->reg_list[imx258->nlanes == 2 ? 0 : 1];
 	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set plls\n", __func__);
@@ -1074,9 +1202,11 @@ static int imx258_init_controls(struct imx258 *imx258)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	pixel_rate_max =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0]);
+		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0],
+					imx258->nlanes);
 	pixel_rate_min =
-		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1]);
+		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1],
+					imx258->nlanes);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
@@ -1174,6 +1304,10 @@ static int imx258_get_regulators(struct imx258 *imx258,
 static int imx258_probe(struct i2c_client *client)
 {
 	struct imx258 *imx258;
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
 	int ret;
 	u32 val = 0;
 
@@ -1216,13 +1350,38 @@ static int imx258_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev), NULL);
+	if (!endpoint) {
+		dev_err(&client->dev, "Endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
+	fwnode_handle_put(endpoint);
+	if (ret == -ENXIO) {
+		dev_err(&client->dev, "Unsupported bus type, should be CSI2\n");
+		goto error_endpoint_poweron;
+	} else if (ret) {
+		dev_err(&client->dev, "Parsing endpoint node failed\n");
+		goto error_endpoint_poweron;
+	}
+
+	/* Get number of data lanes */
+	imx258->nlanes = ep.bus.mipi_csi2.num_data_lanes;
+	if (imx258->nlanes != 2 && imx258->nlanes != 4) {
+		dev_err(&client->dev, "Invalid data lanes: %u\n",
+			imx258->nlanes);
+		ret = -EINVAL;
+		goto error_endpoint_poweron;
+	}
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx258->sd, client, &imx258_subdev_ops);
 
 	/* Will be powered off via pm_runtime_idle */
 	ret = imx258_power_on(&client->dev);
 	if (ret)
-		return ret;
+		goto error_endpoint_poweron;
 
 	/* Check module identity */
 	ret = imx258_identify_module(imx258);
@@ -1255,6 +1414,7 @@ static int imx258_probe(struct i2c_client *client)
 	pm_runtime_set_active(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_idle(&client->dev);
+	v4l2_fwnode_endpoint_free(&endpoint);
 
 	return 0;
 
@@ -1267,6 +1427,9 @@ static int imx258_probe(struct i2c_client *client)
 error_identify:
 	imx258_power_off(&client->dev);
 
+error_endpoint_poweron:
+	v4l2_fwnode_endpoint_free(&ep);
+
 	return ret;
 }
 
-- 
2.25.1

