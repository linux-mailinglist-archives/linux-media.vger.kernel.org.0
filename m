Return-Path: <linux-media+bounces-12402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E78D77EC
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 22:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678FD282A53
	for <lists+linux-media@lfdr.de>; Sun,  2 Jun 2024 20:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651DF839F7;
	Sun,  2 Jun 2024 20:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="Rhmw0bcU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta253.mxroute.com (mail-108-mta253.mxroute.com [136.175.108.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC807D3E8
	for <linux-media@vger.kernel.org>; Sun,  2 Jun 2024 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717359600; cv=none; b=FOVWUf1kRlcPjhgFrDYOb8vR43bAtunlV6xTZeaEkQndjnVfI8lRG6/raMsJo2vj9tlQBxGxI2HLOYivPg1p6Fry4ve9xUicB+tsMCUomnmyrJ5OAWH1f599A+kxT9/dR5E2puhznTCktcn9nqQd8cS8CWFjS3ht98NZp7udjDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717359600; c=relaxed/simple;
	bh=jyWrtrkRdIwLv8vFyOZgGaDw3f1409gIT2RgcJyPZ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u47pmcK/xyuGRObdzvwQlmywfFIne6wBCb4wneoKz0EkLLqV1buIoR3e2NorUlO1gxptz0XviQFa2dU15OqGqDmsbsN87R4MeoORsNzOWUNRhO9KE6mxo5NxsVzh59DBIflbiUUwRQ8k+syGKcpDkqwGGviusw7BTjeV0x+kOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=Rhmw0bcU; arc=none smtp.client-ip=136.175.108.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.3] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta253.mxroute.com (ZoneMTA) with ESMTPSA id 18fda9689c1000e2b6.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 02 Jun 2024 20:14:09 +0000
X-Zone-Loop: 65fb5c009d49d4de1bfdb43693af53bd7794458430f3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Z4CkPGkAS954uRQNPQhsFU7twZudFZFCOHeX0C/iOk=; b=Rhmw0bcUARM+rrchfN8PfF5Vf7
	YVlD/SSQLyhJQtYoJ1ZvwxtLPKBugcuZrhphNSm7ufH7YybXphrDHhit6TP7Xl3n8V6uEYCN0cLQy
	ee8TMqtQ94jvUNumkavQFbPVASyYf+Bh5JhIzS4Po5pGcRhiAVIbWQBBFkIIZORHFKyuJNZEdIVt/
	5yvrazsEKM/exiZzURy2NpBhpTzF68E0BNiIj2KJUW8/4CK2hittGQXm6uW3ttcBbEdBSWkmMLcyP
	/s7b7hZwrzeZQF7jj/Fkysfwnw96eURZIof+6tXDZwHd/68uOJRbHzVcORREVpUQqwQfsiDDTmWZA
	Y8p9prDw==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v6 08/23] media: i2c: imx258: Add support for 24MHz clock
Date: Sun,  2 Jun 2024 14:13:30 -0600
Message-ID: <20240602201345.328737-9-git@luigi311.com>
In-Reply-To: <20240602201345.328737-1-git@luigi311.com>
References: <20240602201345.328737-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

There's no reason why only a clock of 19.2MHz is supported.
Indeed this isn't even a frequency listed in the datasheet.

Add support for 24MHz as well.
The PLL settings result in slightly different link frequencies,
so parameterise those.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/media/i2c/imx258.c | 130 +++++++++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 351add1bc5d5..e4b1b3cbbde5 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -76,9 +76,6 @@
 #define REG_CONFIG_MIRROR_FLIP		0x03
 #define REG_CONFIG_FLIP_TEST_PATTERN	0x02
 
-/* Input clock frequency in Hz */
-#define IMX258_INPUT_CLOCK_FREQ		19200000
-
 struct imx258_reg {
 	u16 address;
 	u8 val;
@@ -115,7 +112,9 @@ struct imx258_mode {
 };
 
 /* 4208x3120 needs 1267Mbps/lane, 4 lanes */
-static const struct imx258_reg mipi_data_rate_1267mbps[] = {
+static const struct imx258_reg mipi_1267mbps_19_2mhz[] = {
+	{ 0x0136, 0x13 },
+	{ 0x0137, 0x33 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x02 },
 	{ 0x0305, 0x03 },
@@ -133,7 +132,29 @@ static const struct imx258_reg mipi_data_rate_1267mbps[] = {
 	{ 0x0823, 0xCC },
 };
 
-static const struct imx258_reg mipi_data_rate_640mbps[] = {
+static const struct imx258_reg mipi_1272mbps_24mhz[] = {
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
+	{ 0x0820, 0x13 },
+	{ 0x0821, 0x4C },
+	{ 0x0822, 0xCC },
+	{ 0x0823, 0xCC },
+};
+
+static const struct imx258_reg mipi_640mbps_19_2mhz[] = {
+	{ 0x0136, 0x13 },
+	{ 0x0137, 0x33 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x02 },
 	{ 0x0305, 0x03 },
@@ -151,9 +172,27 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
 	{ 0x0823, 0x00 },
 };
 
+static const struct imx258_reg mipi_642mbps_24mhz[] = {
+	{ 0x0136, 0x18 },
+	{ 0x0137, 0x00 },
+	{ 0x0301, 0x05 },
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
+	{ 0x0820, 0x0A },
+	{ 0x0821, 0x00 },
+	{ 0x0822, 0x00 },
+	{ 0x0823, 0x00 },
+};
+
 static const struct imx258_reg mode_common_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
 	{ 0x3051, 0x00 },
 	{ 0x3052, 0x00 },
 	{ 0x4E21, 0x14 },
@@ -313,10 +352,6 @@ static const char * const imx258_supply_name[] = {
 
 #define IMX258_NUM_SUPPLIES ARRAY_SIZE(imx258_supply_name)
 
-/* Configurations for supported link frequencies */
-#define IMX258_LINK_FREQ_634MHZ	633600000ULL
-#define IMX258_LINK_FREQ_320MHZ	320000000ULL
-
 enum {
 	IMX258_LINK_FREQ_1267MBPS,
 	IMX258_LINK_FREQ_640MBPS,
@@ -335,25 +370,48 @@ static u64 link_freq_to_pixel_rate(u64 f)
 }
 
 /* Menu items for LINK_FREQ V4L2 control */
-static const s64 link_freq_menu_items[] = {
-	IMX258_LINK_FREQ_634MHZ,
-	IMX258_LINK_FREQ_320MHZ,
+/* Configurations for supported link frequencies */
+static const s64 link_freq_menu_items_19_2[] = {
+	633600000ULL,
+	320000000ULL,
+};
+
+static const s64 link_freq_menu_items_24[] = {
+	636000000ULL,
+	321000000ULL,
 };
 
 /* Link frequency configs */
-static const struct imx258_link_freq_config link_freq_configs[] = {
+static const struct imx258_link_freq_config link_freq_configs_19_2[] = {
 	[IMX258_LINK_FREQ_1267MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_data_rate_1267mbps),
-			.regs = mipi_data_rate_1267mbps,
+			.num_of_regs = ARRAY_SIZE(mipi_1267mbps_19_2mhz),
+			.regs = mipi_1267mbps_19_2mhz,
 		}
 	},
 	[IMX258_LINK_FREQ_640MBPS] = {
 		.pixels_per_line = IMX258_PPL_DEFAULT,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mipi_data_rate_640mbps),
-			.regs = mipi_data_rate_640mbps,
+			.num_of_regs = ARRAY_SIZE(mipi_640mbps_19_2mhz),
+			.regs = mipi_640mbps_19_2mhz,
+		}
+	},
+};
+
+static const struct imx258_link_freq_config link_freq_configs_24[] = {
+	[IMX258_LINK_FREQ_1267MBPS] = {
+		.pixels_per_line = IMX258_PPL_DEFAULT,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_1272mbps_24mhz),
+			.regs = mipi_1272mbps_24mhz,
+		}
+	},
+	[IMX258_LINK_FREQ_640MBPS] = {
+		.pixels_per_line = IMX258_PPL_DEFAULT,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_642mbps_24mhz),
+			.regs = mipi_642mbps_24mhz,
 		}
 	},
 };
@@ -410,6 +468,9 @@ struct imx258 {
 	/* Current mode */
 	const struct imx258_mode *cur_mode;
 
+	const struct imx258_link_freq_config *link_freq_configs;
+	const s64 *link_freq_menu_items;
+
 	/*
 	 * Mutex for serialized access:
 	 * Protect sensor module set pad format and start/stop streaming safely.
@@ -713,7 +774,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 		imx258->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(imx258->link_freq, mode->link_freq_index);
 
-		link_freq = link_freq_menu_items[mode->link_freq_index];
+		link_freq = imx258->link_freq_menu_items[mode->link_freq_index];
 		pixel_rate = link_freq_to_pixel_rate(link_freq);
 		__v4l2_ctrl_s_ctrl_int64(imx258->pixel_rate, pixel_rate);
 		/* Update limits and set FPS to default */
@@ -727,7 +788,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 			vblank_def);
 		__v4l2_ctrl_s_ctrl(imx258->vblank, vblank_def);
 		h_blank =
-			link_freq_configs[mode->link_freq_index].pixels_per_line
+			imx258->link_freq_configs[mode->link_freq_index].pixels_per_line
 			 - imx258->cur_mode->width;
 		__v4l2_ctrl_modify_range(imx258->hblank, h_blank,
 					 h_blank, 1, h_blank);
@@ -747,7 +808,7 @@ static int imx258_start_streaming(struct imx258 *imx258)
 
 	/* Setup PLL */
 	link_freq_index = imx258->cur_mode->link_freq_index;
-	reg_list = &link_freq_configs[link_freq_index].reg_list;
+	reg_list = &imx258->link_freq_configs[link_freq_index].reg_list;
 	ret = imx258_write_regs(imx258, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set plls\n", __func__);
@@ -946,9 +1007,9 @@ static int imx258_init_controls(struct imx258 *imx258)
 	imx258->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 				&imx258_ctrl_ops,
 				V4L2_CID_LINK_FREQ,
-				ARRAY_SIZE(link_freq_menu_items) - 1,
+				ARRAY_SIZE(link_freq_menu_items_19_2) - 1,
 				0,
-				link_freq_menu_items);
+				imx258->link_freq_menu_items);
 
 	if (imx258->link_freq)
 		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -964,8 +1025,10 @@ static int imx258_init_controls(struct imx258 *imx258)
 	if (vflip)
 		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
-	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[1]);
+	pixel_rate_max =
+		link_freq_to_pixel_rate(imx258->link_freq_menu_items[0]);
+	pixel_rate_min =
+		link_freq_to_pixel_rate(imx258->link_freq_menu_items[1]);
 	/* By default, PIXEL_RATE is read only */
 	imx258->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
 				V4L2_CID_PIXEL_RATE,
@@ -1086,8 +1149,19 @@ static int imx258_probe(struct i2c_client *client)
 	} else {
 		val = clk_get_rate(imx258->clk);
 	}
-	if (val != IMX258_INPUT_CLOCK_FREQ) {
-		dev_err(&client->dev, "input clock frequency not supported\n");
+
+	switch (val) {
+	case 19200000:
+		imx258->link_freq_configs = link_freq_configs_19_2;
+		imx258->link_freq_menu_items = link_freq_menu_items_19_2;
+		break;
+	case 24000000:
+		imx258->link_freq_configs = link_freq_configs_24;
+		imx258->link_freq_menu_items = link_freq_menu_items_24;
+		break;
+	default:
+		dev_err(&client->dev, "input clock frequency of %u not supported\n",
+			val);
 		return -EINVAL;
 	}
 
-- 
2.44.0


