Return-Path: <linux-media+bounces-27894-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688B7A57EFD
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 22:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5360816AAAF
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2425212FA9;
	Sat,  8 Mar 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lj+Gt8Dq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1F839F4;
	Sat,  8 Mar 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470491; cv=none; b=pXfrJIWD+xbqSamKlhAmrathJYobgHnlVKL+UgW7S3USYUvnCGl/LsbGI6+xwPAuyPPxbb55N8F5yGi7HBAKmKftIFwKJzTgy4p6jo9KLU2NiIJwUxMprf7RHWxgJsthmHeCzXpWTQGejIozsjvwxQUFFWwqOHStEUXT7u4Pw5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470491; c=relaxed/simple;
	bh=tAV0H/YfQkrwePED/61Mj0lYo/eE2jYkmketuS26SII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LsbB6sAwum6Ll4C+hSJMP9f7UC5swiYIii/njJxHexlQYoVs3cfSit4pCE5MVKBO3NNus1rg/W+TWQ79HgSK3tMKBE3RDvDMg50LcCV6abSLve8I2fm7VdIdruWQrikXYtIFnh6GkjIjThucIiAyJQT5YX9A73fzKgPz+xfNK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lj+Gt8Dq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5D89C4CEE8;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741470490;
	bh=tAV0H/YfQkrwePED/61Mj0lYo/eE2jYkmketuS26SII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lj+Gt8DqGYHi9ltDSEcvyY1i7i4BAKP9Uj0qRVDt0Za3nUdnbNQsJP9uLbAv0syuC
	 IZINimG5NFdbGutchVYuBXSvLWPZSMimZ2Nw2XRt9l/XffHC8xndhDm1NW4gz+Mq2j
	 JJOjfRHVUD7jFPP1m3yhUPBjHZ3LNo9WD6Kvw87y4+z/GZEUmn2YoL4/AHBMYre8w7
	 L9uWepoA9YPbODZDybvd2VHqbz8zO7P+OYprfoWOkeaypJmcD/Xl+OdqEG7WJXKoOd
	 NpeZ9KCmSX05P5TWmIwq2eD7Cma6FiMLdrzFMUdqKrqGEziocaEXMYSudIwfxPhWYM
	 vW91KPfqlI7nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8058C2BA1B;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 08 Mar 2025 22:47:57 +0100
Subject: [PATCH RESEND 3/4] media: i2c: imx214: Read clock frequency from
 device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250308-imx214_clk_freq-v1-3-467a4c083c35@apitzsch.eu>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741470489; l=7210;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=grVCuiPNEUTKhmrGuULv55LCFhY0R7bLn+Lg7E4eRXU=;
 b=LleC4WQlJ2hxM+YCXfQFQiMc1+Bd9NJvXPoxyd2tW4KY3bCL2NmNG/quUC1BMsZ2i5bUjHnAC
 /qpb88TzSeQDBElyCdZOg17nzPmEUl1tt95DPQcRLJC3h1Rgyjn7pPB
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



