Return-Path: <linux-media+bounces-17408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE625968F45
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 23:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CA11C22391
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 21:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B232188933;
	Mon,  2 Sep 2024 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vz4ua+Ah"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8218734F;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725314032; cv=none; b=dhsB4E//1e2mhZT1phxiswHUU2kncCAFICYryoTvSC0+Nnol6gHxUjsTi8A0x5W+a99Bdy8BWJ/C/cwCN9RR9qmvOy8la0LHuHfGg5ZzpWuhXm9AHoxyVoaN+Fr7Nk0qzLLeXIdKBuzaS8MmnyOEo3KGBbb+RNwT59V//yAF5Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725314032; c=relaxed/simple;
	bh=u4k//ftranAyHfaWRFE94pp5dKlYztg9mRoWGurHKIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRltZp6nu+nJNUy86FyDzTMozx91i1LwGFdsQhJs9IYDNKd5Zo0TTw3j7AR8hNirNBVNfgxjTSgVY3WkBa4yQZmzPeeBdCVOlQMSN6SZSme8TXRdlovLtuunpwzAM8gaj960/PbB0NlIwQNkCCh3zP/W+UwR1HpXzXQ4RxLOZgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vz4ua+Ah; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3A33C4CED8;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725314031;
	bh=u4k//ftranAyHfaWRFE94pp5dKlYztg9mRoWGurHKIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vz4ua+AhIn5ZkrtoQjzsMqBzBJjwE5bs0oGwuVm4jfCEU6cVaLMV4ZzY2xQmYDcSN
	 KpleNfuF1amL5F5B/2s6WljJZzcTDRwrlCBJ0MfxmO8AkdCiFZpWDenGW4IDZJabwt
	 AdTVoFx/7849d7eZeuHMS8bxuJVyIS3L1P6KQttSiSiO6TwBrY4ZI+AmgqScWHlrH1
	 lsga7Q7bdOhORj6OePEzSgi7NUAihe68yqvPGM7rErn955aGP2q0jVwyzdzE03UH/1
	 xu1+wxy56+nLIsC64L+TutN/lo+Hs7dXdg9NdLjeWRwrEudvOxu8iowND6l3QNKEjo
	 WqNltoPYStDhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1E3CA0ED3;
	Mon,  2 Sep 2024 21:53:51 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 02 Sep 2024 23:54:34 +0200
Subject: [PATCH 07/13] media: i2c: imx214: Use number of lanes from device
 tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240902-imx214-v1-7-c96cba989315@apitzsch.eu>
References: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
In-Reply-To: <20240902-imx214-v1-0-c96cba989315@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725314079; l=3540;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=m5goLAFXtgpfapHH2PqZgsTZuL4USkSmaYIJRA7+tqE=;
 b=yB16JPOVVPecOms6nMVAbj2oyasPNB8xbbuFc5PRcx9HjWiX+d89BaNPgSRpo6+nOquEZt4M/
 acrqCJzVzlkD8KyDtz+5C8rlG1o2y4CoqI5Ch9iYmvzbMD0OWX0V1U8
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

The imx214 camera is capable of either two-lane or four-lane operation.

Currently only the four-lane mode is supported, as proper pixel rates
and link frequences for the two-lane mode are unknown.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4507e12dd4cd..3b422cddbdce 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -195,11 +195,13 @@ struct imx214 {
 	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
 
 	struct gpio_desc *enable_gpio;
+
+	/* Two or Four lanes */
+	u8 lanes;
 };
 
 /*From imx214_mode_tbls.h*/
 static const struct cci_reg_sequence mode_4096x2304[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -272,7 +274,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 };
 
 static const struct cci_reg_sequence mode_1920x1080[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -774,6 +775,13 @@ static int imx214_ctrls_init(struct imx214 *imx214)
 	return 0;
 };
 
+static int imx214_configure_lanes(struct imx214 *imx214)
+{
+	return cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
+			 imx214->lanes == 2 ? IMX214_CSI_2_LANE_MODE :
+			 IMX214_CSI_4_LANE_MODE, NULL);
+};
+
 static int imx214_start_streaming(struct imx214 *imx214)
 {
 	const struct imx214_mode *mode;
@@ -786,6 +794,13 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	/* Configure two or four Lane mode */
+	ret = imx214_configure_lanes(imx214);
+	if (ret) {
+		dev_err(imx214->dev, "%s failed to configure lanes\n", __func__);
+		return ret;
+	}
+
 	mode = v4l2_find_nearest_size(imx214_modes,
 				ARRAY_SIZE(imx214_modes), width, height,
 				imx214->fmt.width, imx214->fmt.height);
@@ -930,7 +945,7 @@ static int imx214_get_regulators(struct device *dev, struct imx214 *imx214)
 				       imx214->supplies);
 }
 
-static int imx214_parse_fwnode(struct device *dev)
+static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 {
 	struct fwnode_handle *endpoint;
 	struct v4l2_fwnode_endpoint bus_cfg = {
@@ -949,6 +964,14 @@ static int imx214_parse_fwnode(struct device *dev)
 		goto done;
 	}
 
+	/* Check the number of MIPI CSI2 data lanes */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		dev_err_probe(dev, -EINVAL,
+			      "only 4 data lanes are currently supported\n");
+		goto done;
+	}
+	imx214->lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
 			break;
@@ -973,14 +996,14 @@ static int imx214_probe(struct i2c_client *client)
 	struct imx214 *imx214;
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

-- 
2.46.0



