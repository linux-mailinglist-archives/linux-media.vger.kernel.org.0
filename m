Return-Path: <linux-media+bounces-31738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC9FAA9DCA
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C26037A8DCD
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F563274661;
	Mon,  5 May 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWcDw1/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904B1EFF93;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479181; cv=none; b=ewT5DAuKHgED02JLar1KpAhhVKnFpbfHKxq9Wr4lcktNr4B/lTSjndgQjYo/Rw4sfWVsSNbQti/+tz3MV7RiZ9eEnUrMd4gF0DR2ZRNjx45c0RnIEXn/B0Mzk0M2Sxb7v5knbVfOcd+71nHqwehvqSGDnd5sg+YNU6YGO2r11vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479181; c=relaxed/simple;
	bh=zf4+GahcGCP05De4YqXTJDg59FcbikVU7RlqqKH9cSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JumHP/ngKEdm9mv026xfnAaS1szj0KW+KiN+MxMRTidULTmJd9pqgNLJchKuwg8DYcpaz0BORhfq55Lz4XqpHRemieVTJJQKqARyeIoJ/ggKvr9Drjv9mVyRvRLsZyHsO7mU6GIggGTOqt0h+mxr+9bURR9SmYn01fdet7KSISU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWcDw1/Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 167B7C4CEF1;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479181;
	bh=zf4+GahcGCP05De4YqXTJDg59FcbikVU7RlqqKH9cSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GWcDw1/ZNmcSxu0f3S6JxeZAjCJNwEZJ1ULcntllYcPEPGZs7IOkzxPianlWFkY+/
	 LYN/ptrGDAVq+ioM5tUBsO8bE+eb3In/NPU1FIex+n5mCsMli1vbxkP4DSwCtpCw/5
	 vXo5yXPBiNwlvQsFzfy7St/T0CF/XCoo5Z8wG/ebVW6mBOvCw26toqLyzYu5l3ohdi
	 S3Q+IFb0+2G0iv1nMV9ZgLOgAe6xZWkzj6iYGNT+/HMd4X3lQda+U174pdTzcoe2WJ
	 MWGSKzEWZCeCTd4tXuFkq0evUBQIKjnMUONuaWHHhCaeUqGiXjIf7VRf00LAfWjLeH
	 96ZJGQ4O1dSiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09395C3ABB9;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 05 May 2025 23:05:55 +0200
Subject: [PATCH v2 3/4] media: i2c: imx214: Make use of CCS PLL calculator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-imx214_ccs_pll-v2-3-f50452061ff1@apitzsch.eu>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
In-Reply-To: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746479179; l=13307;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=lRnvM9ovlLU9yRH50RpRp0NCi55W4Gtog/Nbf1nNTiY=;
 b=AGw7o2fNWb1FeYX8NdpNzA6zj7XO6uERXh/C/IOPOyz2Os4pKUB4YxpXlLiFqRzqw4PBDsttF
 uQJjO1R4BAgBLp7lkXmHtaCfgGRxwP4wRp/8RoA11HerwOvMCRSQUUG
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Calculate PLL parameters based on clock frequency and link frequency.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx214.c | 216 +++++++++++++++++++++++++++++++++++++--------
 2 files changed, 178 insertions(+), 39 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e576b213084d232e90b7e556a7a855a3bb95544c..c8e24c42e0c4ea169f1b6cdc4f2631234a51c7d9 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -141,6 +141,7 @@ config VIDEO_IMX214
 	depends on GPIOLIB
 	select REGMAP_I2C
 	select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX214 camera.
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951..9e9be47394ec768a5b34d44b06b5bbb0988da5a1 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -20,6 +20,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#include "ccs-pll.h"
+
 /* Chip ID */
 #define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX214_CHIP_ID			0x0214
@@ -34,7 +36,6 @@
 #define IMX214_DEFAULT_LINK_FREQ	600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
-#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
 
 /* V-TIMING internal */
@@ -84,6 +85,7 @@
 #define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
 #define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
 #define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
+#define IMX214_BITS_PER_PIXEL_MASK	0xFF
 
 #define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX214_CSI_2_LANE_MODE		1
@@ -249,6 +251,10 @@ struct imx214 {
 	struct clk *xclk;
 	struct regmap *regmap;
 
+	struct ccs_pll pll;
+
+	struct v4l2_fwnode_endpoint bus_cfg;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -758,16 +764,22 @@ static int imx214_configure_pll(struct imx214 *imx214)
 {
 	int ret = 0;
 
-	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
-	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
-	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
-	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
-	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
-	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
+		  imx214->pll.vt_bk.pix_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
+		  imx214->pll.vt_bk.sys_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
+		  imx214->pll.vt_fr.pre_pll_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
+		  imx214->pll.vt_fr.pll_multiplier, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
+		  imx214->pll.op_bk.pix_clk_div, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
+		  imx214->pll.op_bk.sys_clk_div, &ret);
 	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
 		  IMX214_PLL_SINGLE, &ret);
 	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
-		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
+		  IMX214_EXCK_FREQ(imx214->pll.ext_clk_freq_hz / 1000000), &ret);
 
 	return ret;
 }
@@ -872,9 +884,6 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
 
 static int imx214_ctrls_init(struct imx214 *imx214)
 {
-	static const s64 link_freq[] = {
-		IMX214_DEFAULT_LINK_FREQ
-	};
 	static const struct v4l2_area unit_size = {
 		.width = 1120,
 		.height = 1120,
@@ -895,15 +904,14 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	if (ret)
 		return ret;
 
-	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
-					       V4L2_CID_PIXEL_RATE, 0,
-					       IMX214_DEFAULT_PIXEL_RATE, 1,
-					       IMX214_DEFAULT_PIXEL_RATE);
+	imx214->pixel_rate =
+		v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE, 1,
+				  INT_MAX, 1, 1);
 
 	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
 						   V4L2_CID_LINK_FREQ,
-						   ARRAY_SIZE(link_freq) - 1,
-						   0, link_freq);
+						   imx214->bus_cfg.nr_of_link_frequencies - 1,
+						   0, imx214->bus_cfg.link_frequencies);
 	if (imx214->link_freq)
 		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -1006,6 +1014,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
 	const struct imx214_mode *mode;
+	int bit_rate_mbps;
 	int ret;
 
 	ret = cci_multi_reg_write(imx214->regmap, mode_table_common,
@@ -1021,8 +1030,10 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	bit_rate_mbps = (imx214->pll.pixel_rate_pixel_array / 1000000)
+			* imx214->pll.bits_per_pixel;
 	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
-			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
+			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps), NULL);
 	if (ret) {
 		dev_err(imx214->dev, "failed to configure link bit rate\n");
 		return ret;
@@ -1105,6 +1116,112 @@ static int imx214_s_stream(struct v4l2_subdev *subdev, int enable)
 	return ret;
 }
 
+static int imx214_pll_calculate(struct imx214 *imx214, struct ccs_pll *pll,
+				unsigned int link_freq)
+{
+	struct ccs_pll_limits limits = {
+		.min_ext_clk_freq_hz = 6000000,
+		.max_ext_clk_freq_hz = 27000000,
+
+		.vt_fr = {
+			.min_pre_pll_clk_div = 1,
+			.max_pre_pll_clk_div = 15,
+			/* min_pll_op_clk_freq_hz / max_pll_multiplier */
+			.min_pll_ip_clk_freq_hz = 281667,
+			/* max_pll_op_clk_freq_hz / min_pll_multiplier */
+			.max_pll_ip_clk_freq_hz = 100000000,
+			.min_pll_multiplier = 12,
+			.max_pll_multiplier = 1200,
+			.min_pll_op_clk_freq_hz = 338000000,
+			.max_pll_op_clk_freq_hz = 1200000000,
+		},
+		.vt_bk = {
+			.min_sys_clk_div = 2,
+			.max_sys_clk_div = 4,
+			.min_pix_clk_div = 5,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+		.op_bk = {
+			.min_sys_clk_div = 1,
+			.max_sys_clk_div = 2,
+			.min_pix_clk_div = 6,
+			.max_pix_clk_div = 10,
+			.min_pix_clk_freq_hz = 30000000,
+			.max_pix_clk_freq_hz = 120000000,
+		},
+
+		.min_line_length_pck_bin = IMX214_PPL_DEFAULT,
+		.min_line_length_pck = IMX214_PPL_DEFAULT,
+	};
+	unsigned int num_lanes = imx214->bus_cfg.bus.mipi_csi2.num_data_lanes;
+	int ret;
+
+	/*
+	 * There are no documented constraints on the sys clock frequency, for
+	 * either branch. Recover them based on the PLL output clock frequency
+	 * and sys_clk_div limits on one hand, and the pix clock frequency and
+	 * the pix_clk_div limits on the other hand.
+	 */
+	limits.vt_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.vt_bk.max_sys_clk_div,
+		    limits.vt_bk.min_pix_clk_freq_hz * limits.vt_bk.min_pix_clk_div);
+	limits.vt_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.vt_bk.min_sys_clk_div,
+		    limits.vt_bk.max_pix_clk_freq_hz * limits.vt_bk.max_pix_clk_div);
+
+	limits.op_bk.min_sys_clk_freq_hz =
+		max(limits.vt_fr.min_pll_op_clk_freq_hz / limits.op_bk.max_sys_clk_div,
+		    limits.op_bk.min_pix_clk_freq_hz * limits.op_bk.min_pix_clk_div);
+	limits.op_bk.max_sys_clk_freq_hz =
+		min(limits.vt_fr.max_pll_op_clk_freq_hz / limits.op_bk.min_sys_clk_div,
+		    limits.op_bk.max_pix_clk_freq_hz * limits.op_bk.max_pix_clk_div);
+
+	memset(pll, 0, sizeof(*pll));
+
+	pll->bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	pll->op_lanes = num_lanes;
+	pll->vt_lanes = num_lanes;
+	pll->csi2.lanes = num_lanes;
+
+	pll->binning_horizontal = 1;
+	pll->binning_vertical = 1;
+	pll->scale_m = 1;
+	pll->scale_n = 1;
+	pll->bits_per_pixel =
+		IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK;
+	pll->flags = CCS_PLL_FLAG_LANE_SPEED_MODEL;
+	pll->link_freq = link_freq;
+	pll->ext_clk_freq_hz = clk_get_rate(imx214->xclk);
+
+	ret = ccs_pll_calculate(imx214->dev, &limits, pll);
+
+	return ret;
+}
+
+static int imx214_pll_update(struct imx214 *imx214)
+{
+	u64 link_freq;
+	int ret;
+
+	link_freq = imx214->bus_cfg.link_frequencies[imx214->link_freq->val];
+	ret = imx214_pll_calculate(imx214, &imx214->pll, link_freq);
+	if (ret) {
+		dev_err(imx214->dev, "PLL calculations failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_ctrl_s_ctrl_int64(imx214->pixel_rate,
+				     imx214->pll.pixel_rate_pixel_array);
+	if (ret) {
+		dev_err(imx214->dev, "failed to set pixel rate\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fival)
@@ -1211,12 +1328,10 @@ static int imx214_identify_module(struct imx214 *imx214)
 	return 0;
 }
 
-static int imx214_parse_fwnode(struct device *dev)
+static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
+	struct v4l2_fwnode_endpoint *bus_cfg = &imx214->bus_cfg;
 	struct fwnode_handle *endpoint;
-	struct v4l2_fwnode_endpoint bus_cfg = {
-		.bus_type = V4L2_MBUS_CSI2_DPHY,
-	};
 	unsigned int i;
 	int ret;
 
@@ -1224,42 +1339,52 @@ static int imx214_parse_fwnode(struct device *dev)
 	if (!endpoint)
 		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	bus_cfg->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, bus_cfg);
+	fwnode_handle_put(endpoint);
 	if (ret) {
 		dev_err_probe(dev, ret, "parsing endpoint node failed\n");
-		goto done;
+		goto error;
 	}
 
 	/* Check the number of MIPI CSI2 data lanes */
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	if (bus_cfg->bus.mipi_csi2.num_data_lanes != 4) {
 		ret = dev_err_probe(dev, -EINVAL,
 				    "only 4 data lanes are currently supported\n");
-		goto done;
+		goto error;
 	}
 
-	if (bus_cfg.nr_of_link_frequencies != 1)
+	if (bus_cfg->nr_of_link_frequencies != 1)
 		dev_warn(dev, "Only one link-frequency supported, please review your DT. Continuing anyway\n");
 
-	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
-		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
+	for (i = 0; i < bus_cfg->nr_of_link_frequencies; i++) {
+		u64 freq = bus_cfg->link_frequencies[i];
+		struct ccs_pll pll;
+
+		if (!imx214_pll_calculate(imx214, &pll, freq))
 			break;
-		if (bus_cfg.link_frequencies[i] ==
-		    IMX214_DEFAULT_LINK_FREQ_LEGACY) {
+		if (freq == IMX214_DEFAULT_LINK_FREQ_LEGACY) {
 			dev_warn(dev,
 				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
 				 IMX214_DEFAULT_LINK_FREQ);
+			freq = IMX214_DEFAULT_LINK_FREQ;
+			if (imx214_pll_calculate(imx214, &pll, freq))
+				continue;
+			bus_cfg->link_frequencies[i] = freq;
 			break;
 		}
 	}
 
-	if (i == bus_cfg.nr_of_link_frequencies)
+	if (i == bus_cfg->nr_of_link_frequencies)
 		ret = dev_err_probe(dev, -EINVAL,
-				    "link-frequencies %d not supported, please review your DT\n",
-				    IMX214_DEFAULT_LINK_FREQ);
+				    "link-frequencies %lld not supported, please review your DT\n",
+				    bus_cfg->nr_of_link_frequencies ?
+				    bus_cfg->link_frequencies[0] : 0);
 
-done:
-	v4l2_fwnode_endpoint_free(&bus_cfg);
-	fwnode_handle_put(endpoint);
+	return 0;
+
+error:
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
 	return ret;
 }
 
@@ -1299,7 +1424,7 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->regmap),
 				     "failed to initialize CCI\n");
 
-	ret = imx214_parse_fwnode(dev);
+	ret = imx214_parse_fwnode(dev, imx214);
 	if (ret)
 		return ret;
 
@@ -1310,7 +1435,9 @@ static int imx214_probe(struct i2c_client *client)
 	 * Enable power initially, to avoid warnings
 	 * from clk_disable on power_off
 	 */
-	imx214_power_on(imx214->dev);
+	ret = imx214_power_on(imx214->dev);
+	if (ret < 0)
+		goto error_fwnode;
 
 	ret = imx214_identify_module(imx214);
 	if (ret)
@@ -1341,6 +1468,12 @@ static int imx214_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx214->dev);
 	pm_runtime_enable(imx214->dev);
 
+	ret = imx214_pll_update(imx214);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to update PLL\n");
+		goto error_subdev_cleanup;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&imx214->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,
@@ -1366,6 +1499,9 @@ static int imx214_probe(struct i2c_client *client)
 error_power_off:
 	imx214_power_off(imx214->dev);
 
+error_fwnode:
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
+
 	return ret;
 }
 
@@ -1378,6 +1514,8 @@ static void imx214_remove(struct i2c_client *client)
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&imx214->sd.entity);
 	v4l2_ctrl_handler_free(&imx214->ctrls);
+	v4l2_fwnode_endpoint_free(&imx214->bus_cfg);
+
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev)) {
 		imx214_power_off(imx214->dev);

-- 
2.49.0



