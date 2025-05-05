Return-Path: <linux-media+bounces-31737-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67126AA9DCD
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCAA3B2808
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5F9274667;
	Mon,  5 May 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWozyQP8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F1A450F2;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479181; cv=none; b=LT26yWC8lYfHhcPt95wklVnw5bO+C7R/Ngt86+vjOOOEI9KyzayoOfMVPz1OrEp50Sk22cl4RmEVFeIMW4EmwiUxzQvgCowIUw8up95wVQNEj2Mha3NgwMezapXagqMFWoDd5RCM03mz5SAWJkc6IKFiGQU63RzVJeHM7Xr7wW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479181; c=relaxed/simple;
	bh=L2WGN7X2JUviaBc60J76R20EMSD9EzQJaZPVXw+rN/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyxk/rv8OzPZmMDET8UKtCE3ocZJFZ+I0st+qc8SWT205MhFfw5j0FqbvQadABj/nV43RnYz+6gRlt7d3aIp+roAeF3NV+MpF/8lcNBizIZv6BPMmt/9ajG5m+sce+AKWMiMG5YpB5NbBI3ZxjmMydeckVgyy24QT64QJ6+w9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWozyQP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C656C4CEED;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479181;
	bh=L2WGN7X2JUviaBc60J76R20EMSD9EzQJaZPVXw+rN/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BWozyQP8O4UqTA9SvaW7TjuBaG1JFZVKtlDfsE4QDTy4RLAY+y7CxhBYMu/WB188a
	 1iOyjnqhFs9xGyJbrhgbscdH93Wd8rc3WdF32rlhPwPhv1SSvcNjLeFeen06MTqr0i
	 MpSRHV7o9uSiYW8BIejAYy/jt87ff05vHu9MC85ntCGqAl4dWdPGZYDHxuSQO+/BRN
	 Ao/iBNaWHLESSDOvn7SJ4Ul8CMmYGA9WGxDybwqo9KvbSlnUNabILsbwzgiCODQ/B5
	 dGvBr7TDQipXTGBKrpXKu0oq/b8GJx1zg2AyP4xY/NPG+SzHd6kifCkTUdDMxi3Zt9
	 keBXf9AsawNxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F149CC3ABC0;
	Mon,  5 May 2025 21:06:20 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 05 May 2025 23:05:54 +0200
Subject: [PATCH v2 2/4] media: i2c: imx214: Prepare for variable clock
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250505-imx214_ccs_pll-v2-2-f50452061ff1@apitzsch.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746479179; l=3684;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=ddkeGCuuPcPPzIbz+qwlV4L+uKUvrwzDr+fPplJy9lU=;
 b=OZexZU10Fpuk6/yCi9TMiqXMeogRkhDf/yVivEiwsqbERO1japjtgJ1EsaXXSQTmXuil0LMYX
 +pZKyaXaJAkCJl26yQ/gRrDCd/aItFjFY4ugUR/GywhQH2ANUyMd4dR
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
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 54 ++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 0199195dcb7d12dc2ff253fe3eb77ddbcd0812a9..3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951 100644
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
+		dev_err(imx214->dev, "failed to configure PLL %d\n", ret);
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
2.49.0



