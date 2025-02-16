Return-Path: <linux-media+bounces-26192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C0A376F3
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 19:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A5FB3AF3BC
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 18:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67981A2C3A;
	Sun, 16 Feb 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q675W2uW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C86E1624E7;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731622; cv=none; b=k9rMTpCdgjD9VbOSW+8iz6DM4cJb3mBakz24wQIN0mcAJqM7IzrZvh7csZCIj7nvfRZyyW2V/cO026Ld1fqxnMcooef6lN4+A+bE7mBMQMiRswHCtvci/tMn2i5kp9nC4r7jSBLb9ghFUWmuIo5bnfqkZSaTis8iT53VPuZyjM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731622; c=relaxed/simple;
	bh=tAV0H/YfQkrwePED/61Mj0lYo/eE2jYkmketuS26SII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nmLGTgMSuqtiilL67We+swu6O54rRjlfmfkuk4ArcPzLrtKorNGMKxEuTSfWGmxbnCTBAFapBNtZ3pGAeDQrI4YW6gpKk2IZWRGI/xFhA1ozDdaDt8tbhh7MJFnGSPLXWQ7TwfLrNazE2Ya7cdzc/7zZNUgs5FN2ee1OheqJ/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q675W2uW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBFC3C4CEEB;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739731621;
	bh=tAV0H/YfQkrwePED/61Mj0lYo/eE2jYkmketuS26SII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=q675W2uW04UISF1jdMv8NhutvzYlkujBDoetd8qDZo5eGe5Fhy9oElOY+2eCXR4DZ
	 uXKKMSEVm4Bl3KLyfm+LwGnDNAmsmRAsAPj2ELzX3+1dp1OwanL7gOVhhpOCJSaCAb
	 C8yFQ75SrZZMeEUuI5TF8+JtoSm4lHdmcMx+WU56yMnJ5SH2iD4kQh7GHsg4u7DBOQ
	 LQycVG2Sc+FwQDzRz13Uwxi49oTbIdjC/+1LU85qHBTUfDShuA1Ku4dTbunztTAXHA
	 IQ2dh9f0QvrZnTzZH4lUQSqWVkryOKsj+LhN78lGG3oqDQudZVaHFaZp1YHgOBFtCp
	 l+kK/2hs+DiZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8ACC021A4;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 16 Feb 2025 19:46:46 +0100
Subject: [PATCH 3/4] media: i2c: imx214: Read clock frequency from device
 tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250216-imx214_clk_freq-v1-3-812f40f07db3@apitzsch.eu>
References: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
In-Reply-To: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739731620; l=7210;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=grVCuiPNEUTKhmrGuULv55LCFhY0R7bLn+Lg7E4eRXU=;
 b=Euvh4M4uJ5TN0bhzzwbMTN2ocemsb7KjzTp0n3Z1oA4yR7qszwDPyRaAKebtMl7IbkhJL8tI7
 eLGZzLrX3cCAFvTEC718Ac6n4wvBZKiooAb8FgN69QZUoVra3Rbc4Ss
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Replace the hard coded external clock frequency by the one read from
device tree.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 99 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 53b6b427f263a8ad7e3a0d1f711ece234601100e..c3d55259d6fd1c4ca96f52833864bdfe6bedf13a 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -30,11 +30,10 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
-#define IMX214_DEFAULT_CLK_FREQ	24000000
-#define IMX214_DEFAULT_LINK_FREQ	600000000
+#define IMX214_CLK_FREQ_24000KHZ	24000000
+#define IMX214_LINK_FREQ_600MHZ		600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
-#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
 #define IMX214_FPS 30
 
 /* V-TIMING internal */
@@ -233,6 +232,22 @@ static const char * const imx214_supply_name[] = {
 
 #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
 
+static const s64 link_freq[] = {
+	IMX214_LINK_FREQ_600MHZ,
+};
+
+struct imx214_clk_params {
+	u32 clk_freq;
+	u64 link_freq;
+};
+
+static const struct imx214_clk_params imx214_clk_params[] = {
+	{
+		.clk_freq = IMX214_CLK_FREQ_24000KHZ,
+		.link_freq = IMX214_LINK_FREQ_600MHZ,
+	},
+};
+
 /*
  * The supported formats.
  * This table MUST contain 4 entries per format, to cover the various flip
@@ -270,6 +285,8 @@ struct imx214 {
 	struct clk *xclk;
 	struct regmap *regmap;
 
+	const struct imx214_clk_params *clk_params;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -794,7 +811,7 @@ static int imx214_set_clock(struct imx214 *imx214)
 	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
 		  IMX214_PLL_SINGLE, &ret);
 	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
-		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
+		  IMX214_EXCK_FREQ(imx214->clk_params->clk_freq / 1000000), &ret);
 
 	return ret;
 }
@@ -899,9 +916,6 @@ static const struct v4l2_ctrl_ops imx214_ctrl_ops = {
 
 static int imx214_ctrls_init(struct imx214 *imx214)
 {
-	static const s64 link_freq[] = {
-		IMX214_DEFAULT_LINK_FREQ
-	};
 	static const struct v4l2_area unit_size = {
 		.width = 1120,
 		.height = 1120,
@@ -910,6 +924,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	int exposure_max, exposure_def;
+	int pixel_rate;
 	int hblank;
 	int i, ret;
 
@@ -922,15 +937,25 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	if (ret)
 		return ret;
 
+	pixel_rate = imx214->clk_params->link_freq * 8 / 10;
 	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
 					       V4L2_CID_PIXEL_RATE, 0,
-					       IMX214_DEFAULT_PIXEL_RATE, 1,
-					       IMX214_DEFAULT_PIXEL_RATE);
+					       pixel_rate, 1, pixel_rate);
+
+	for (i = 0; i < ARRAY_SIZE(link_freq); ++i) {
+		if (imx214->clk_params->link_freq == link_freq[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(link_freq)) {
+		dev_err(imx214->dev, "link frequency %lld not supported\n",
+			imx214->clk_params->link_freq);
+		return -EINVAL;
+	}
 
 	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, NULL,
 						   V4L2_CID_LINK_FREQ,
 						   ARRAY_SIZE(link_freq) - 1,
-						   0, link_freq);
+						   i, link_freq);
 	if (imx214->link_freq)
 		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
@@ -1047,7 +1072,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
-	link_bit_rate = IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ);
+	link_bit_rate = IMX214_LINK_BIT_RATE(imx214->clk_params->clk_freq);
 	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
 			IMX214_LINK_BIT_RATE_MBPS(link_bit_rate), NULL);
 	if (ret) {
@@ -1238,7 +1263,20 @@ static int imx214_identify_module(struct imx214 *imx214)
 	return 0;
 }
 
-static int imx214_parse_fwnode(struct device *dev)
+static int imx214_has_link_freq(struct imx214 *imx214, u64 link_frequency)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx214_clk_params); ++i) {
+		if (imx214_clk_params[i].link_freq == link_frequency) {
+			imx214->clk_params = &imx214_clk_params[i];
+			break;
+		}
+	}
+	return (i < ARRAY_SIZE(imx214_clk_params));
+}
+
+static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
 	struct fwnode_handle *endpoint;
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -1268,13 +1306,14 @@ static int imx214_parse_fwnode(struct device *dev)
 		dev_warn(dev, "Only one link-frequency supported, please review your DT. Continuing anyway\n");
 
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
-		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
+		if (imx214_has_link_freq(imx214, bus_cfg.link_frequencies[i]))
 			break;
 		if (bus_cfg.link_frequencies[i] ==
 		    IMX214_DEFAULT_LINK_FREQ_LEGACY) {
 			dev_warn(dev,
 				 "link-frequencies %d not supported, please review your DT. Continuing anyway\n",
-				 IMX214_DEFAULT_LINK_FREQ);
+				 IMX214_LINK_FREQ_600MHZ);
+			imx214->clk_params = &imx214_clk_params[1];
 			break;
 		}
 	}
@@ -1282,7 +1321,7 @@ static int imx214_parse_fwnode(struct device *dev)
 	if (i == bus_cfg.nr_of_link_frequencies)
 		ret = dev_err_probe(dev, -EINVAL,
 				    "link-frequencies %d not supported, please review your DT\n",
-				    IMX214_DEFAULT_LINK_FREQ);
+				    IMX214_LINK_FREQ_600MHZ);
 
 done:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -1294,16 +1333,17 @@ static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct imx214 *imx214;
+	u32 xclk_freq;
 	int ret;
 
-	ret = imx214_parse_fwnode(dev);
-	if (ret)
-		return ret;
-
 	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
 	if (!imx214)
 		return -ENOMEM;
 
+	ret = imx214_parse_fwnode(dev, imx214);
+	if (ret)
+		return ret;
+
 	imx214->dev = dev;
 
 	imx214->xclk = devm_clk_get(dev, NULL);
@@ -1311,7 +1351,26 @@ static int imx214_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
 				     "failed to get xclk\n");
 
-	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
+	ret = device_property_read_u32(dev, "clock-frequency", &xclk_freq);
+	if (ret) {
+		dev_warn(dev,
+			 "clock-frequency not set, please review your DT. Fallback to default\n");
+		xclk_freq = IMX214_CLK_FREQ_24000KHZ;
+	}
+
+	switch (xclk_freq) {
+	case IMX214_CLK_FREQ_24000KHZ:
+		if (imx214->clk_params->clk_freq != xclk_freq)
+			return dev_err_probe(imx214->dev, -EINVAL,
+					     "combination of clock and link frequency is not supported\n");
+		break;
+	default:
+		return dev_err_probe(imx214->dev, -EINVAL,
+				     "external clock frequency %u is not supported\n",
+				     xclk_freq);
+	}
+
+	ret = clk_set_rate(imx214->xclk, xclk_freq);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to set xclk frequency\n");

-- 
2.48.1



