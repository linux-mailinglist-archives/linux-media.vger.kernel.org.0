Return-Path: <linux-media+bounces-35519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172D8AE2857
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 11:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D9F57A2AA9
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 09:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAEF2040A7;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ3cMKG0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63E1459F6;
	Sat, 21 Jun 2025 09:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750498691; cv=none; b=HIuhKL8M1ipHVGc27UuJyL7EeWghjXN55h/D7o1U5LJ4Yj+oKJlFFeskh4x/xu5mOAPlxfuB+2DGvvxgw6axG+2/f9h0ByIumVaJsDOP2YaEbasEPIP9Qe9HjxJCm4tGQ1aTYbXhPgINUPP4MynhNKPVgCfgFpOrDuMuW35U57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750498691; c=relaxed/simple;
	bh=qcWmP9y2oaDcX0hejMQU1XLtrocO4/dhpgjNfgryp/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Syb2chjDV/WzqJ34vsXtqtFjdcdV7n6iHQQ9Wfe22fOHRubyaQykdG0+O1OzuFpI6yGun4qWSWAZE0Jr1kXgzX27Ml0jxduH62qNq8wu9qZCYadLtj0DZLIE5au/Zi9tYtDq93H0+XDxvWzYDonvtkdwx3pEetUERY84nvsPra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ3cMKG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7767C4CEF1;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750498690;
	bh=qcWmP9y2oaDcX0hejMQU1XLtrocO4/dhpgjNfgryp/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OQ3cMKG0KdyKtXJl5EMaDezn3MNDYM6+SliUjxfELGsZXNylnF8V8zgFbfUnXiamm
	 yhGRwrPTmhpCbqSSHjibkB9JKMZUmJRrRieHm41BNNaVgCa41RkPqaIJ1wUVT8CdpA
	 ccuefinpS+VFrbNqhAd6wVfIhbvzNJ7AbqF7wmpUEzq9qNhrHma+0ocjlr3FgWEjn/
	 HGrR1yw/jgDjkjuSaicvaJKtFRsQ2Sh60iaURVA8e8dA6FcD5hTCtWw1w0h6D0EGhx
	 7SWZbZEwXjMW3QpEVy4vRUAae/Sg99a4xIB/R8bb0x6SiajMmAl0ySwf2LyKDqnAZl
	 kpbiDXlyPDbTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B8FC7115C;
	Sat, 21 Jun 2025 09:38:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 21 Jun 2025 11:37:26 +0200
Subject: [PATCH RESEND v4 2/5] media: i2c: imx214: Prepare for variable
 clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250621-imx214_ccs_pll-v4-2-12178e5eb989@apitzsch.eu>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
In-Reply-To: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750498689; l=3752;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=Kdqt0JW5KAKlP5M0PrifLxHpTT1jIrEYH5jMhF/ZZZU=;
 b=JFrj2VB0N5v95posrBw4+sv+622FBn0TnaONmOdX5+dil3q3E6lj0hNLW/MTe3R+/Gthz8N7l
 S+Dg52NBaScDy8DVFqVA7VRItmmUf/57c2+tzB02pnKrN9AJgpS0WtW
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Move clock frequency related parameters out of the constant register
sequences, such that the hard coded external clock frequency can be
replaced by a variable in the upcoming patches.

Acked-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 54 ++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9..c564c9ca82488dddd6b8f549749042ae44363c0d 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -299,16 +299,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
-
 	{ CCI_REG8(0x3A03), 0x09 },
 	{ CCI_REG8(0x3A04), 0x50 },
 	{ CCI_REG8(0x3A05), 0x01 },
@@ -362,16 +352,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
-
 	{ CCI_REG8(0x3A03), 0x04 },
 	{ CCI_REG8(0x3A04), 0xF8 },
 	{ CCI_REG8(0x3A05), 0x02 },
@@ -405,9 +385,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 	/* ATR setting */
 	{ IMX214_REG_ATR_FAST_MOVE, 2 },
 
-	/* external clock setting */
-	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
-
 	/* global setting */
 	/* basic config */
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
@@ -777,6 +754,24 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int imx214_configure_pll(struct imx214 *imx214)
+{
+	int ret = 0;
+
+	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
+		  IMX214_PLL_SINGLE, &ret);
+	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
+		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000), &ret);
+
+	return ret;
+}
+
 static int imx214_update_digital_gain(struct imx214 *imx214, u32 val)
 {
 	int ret = 0;
@@ -1020,6 +1015,19 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = imx214_configure_pll(imx214);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure PLL: %d\n", ret);
+		return ret;
+	}
+
+	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
+			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure link bit rate\n");
+		return ret;
+	}
+
 	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
 			IMX214_CSI_4_LANE_MODE, NULL);
 	if (ret) {

-- 
2.50.0



