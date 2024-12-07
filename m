Return-Path: <linux-media+bounces-22830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8C9E8212
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 21:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F385166282
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2024 20:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AA7198A08;
	Sat,  7 Dec 2024 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtKVTZtk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340115A863;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604507; cv=none; b=FPfjGrsL7zm8s93FWl4rM3O8hZlljfXVQE0OVuJEUEQvTmD9qKQMOPI4Ng0Ya/LKpqA06jV59PxXkcHc1ikkqzuYODk/uy4h//NmmCbtT1b+X0tflI1onnLOJgIef14mSvbLNnwCPyvcvoBZ4UxIrqGmEP3WZrDEx5SYBKFfxkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604507; c=relaxed/simple;
	bh=Ui+5hYNv2BAzYXeEy6Nbqwxz7ajppthVoNCTh4ERAKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1CKSPmyuZHYBZCMPqlHT+zN2dcRHDB+BEtCx+cSZHS9DVnYTTSFkc94EMHkbzWJyyzaK2DxYmMiEYyrPlnIMiYqs2KBCrJ1uAOHvkxrubvwO7R2mC7qaGE5W+J5xdtvmPGpeX4BpBHtdO+ZE71OjfzzCQf1G68DH4anoIseO88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtKVTZtk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74EC0C4CEEB;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733604506;
	bh=Ui+5hYNv2BAzYXeEy6Nbqwxz7ajppthVoNCTh4ERAKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AtKVTZtk/YeUbAk0b9wTmLhNfq/zbxAmkxq9+RakwUgbaGRhu0n/rYzwjzBg8VfB2
	 DachadeNVvb6OtLj1VWFxRaQsva5+WNSUu/PTb7v0sHlHy1DwumIGdf6d8cXp6qvBu
	 FjNmm+X7b7wiLcAwOFBiQC+3VkqFHELYgEXV1hXNioLULZnSN6Kpp7o3iP8m48d+YU
	 VOU4eTeUUSCpyaSvkpq0NsUs44gtQpAzeueVqVF0kVvE9f8Dfns2RuZ/pciTkv9HZs
	 DPlg50o7hb3LZjzZ3fNd64YKLshVcdDxQ3/hQ54OmlwoaX5bSQBIEkdPwhRkhG7IOY
	 swm4T4QOnlf1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE43E77180;
	Sat,  7 Dec 2024 20:48:26 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 07 Dec 2024 21:47:55 +0100
Subject: [PATCH v3 06/12] media: i2c: imx214: Check number of lanes from
 device tree
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241207-imx214-v3-6-ab60af7ee915@apitzsch.eu>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
In-Reply-To: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733604504; l=2204;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=weqeUMKe5uTQdP5hFWSGU8a0VftNGSL8fbygsOgcwtY=;
 b=qNhFiB/DINxdKCO0xPKRF66ZWxbzd3JCRVetLAw37s2c/XeNWeFjHhFt0wLFSzU9PLhBH+F+V
 u4B+E882FSyDVA+qJO+TpC3jf0pVHHiRrGerMpuhIVpcjSLRHsdgpBX
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
 drivers/media/i2c/imx214.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 07926f7257877155548f7bcf0e7ee80037b4ce6c..f1c72db0775eaf4810f762e8798d301c5ad9923c 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -199,7 +199,6 @@ struct imx214 {
 
 /*From imx214_mode_tbls.h*/
 static const struct cci_reg_sequence mode_4096x2304[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -272,7 +271,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 };
 
 static const struct cci_reg_sequence mode_1920x1080[] = {
-	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
 	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
 	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
 	{ IMX214_REG_EXPOSURE_RATIO, 1 },
@@ -788,6 +786,13 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
+			IMX214_CSI_4_LANE_MODE, NULL);
+	if (ret) {
+		dev_err(imx214->dev, "%s failed to configure lanes\n", __func__);
+		return ret;
+	}
+
 	ret = cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg_table,
 				  imx214->cur_mode->num_of_regs, NULL);
 	if (ret < 0) {
@@ -948,6 +953,13 @@ static int imx214_parse_fwnode(struct device *dev)
 		goto done;
 	}
 
+	/* Check the number of MIPI CSI2 data lanes */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "only 4 data lanes are currently supported\n");
+		goto done;
+	}
+
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
 		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
 			break;

-- 
2.47.1



