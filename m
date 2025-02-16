Return-Path: <linux-media+bounces-26195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DFA376F4
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 19:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A948116BB8C
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 18:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93AF1A3140;
	Sun, 16 Feb 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsQshWDa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92519C54C;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731622; cv=none; b=UzdiuBvuWqVf3cIRzJ4FZ1mdvn8A2cEKeibQkYEB4fxfvwcASNfSUdSfc0iVGgVNC5T1rq0nzLLgNiL9HLQFEXQYJF51qCarBKTJJ4Sprvli4yzOCRxYEsWIUexcGFYLNgQIaA/tyqC6NnyeQBu8xx1EbUe3FLyS9Zs5egSgi1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731622; c=relaxed/simple;
	bh=47xG7Y+lb+4ABdnenz4kurDLlo2rPsaUAq/8f0C92aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qv7bqq79Ga2i019RmZnQMwc/wmXlo8uTpTg2pApZ3+cFFciAcYUWxgXqiVWzZNKoAAhhNQJlu2YiLPxdKWGB5CrmPIW1AE0qVJJ763Nyku+HtmqeNBCe5VTixGeN4HFP+vjnhxkV6l7ABMggtDhBFTBGT9GJnNdY6q8JPZObsXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsQshWDa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0941C4CEE4;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739731621;
	bh=47xG7Y+lb+4ABdnenz4kurDLlo2rPsaUAq/8f0C92aA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PsQshWDaLcGm0YcNRbN23LA+OscfibU9CaZg4eVti0L/K9HNevwmi2K+vOlZ6cLrT
	 KmxLXM1A8gRat7do7kb7N9cl9wwEjW+TP/u2CTncUfGT5jgYmy5eg2WfUwat5t7whE
	 bRw0fG4RRS871F3OwadgZYaIazyoYZWnHcEt4lO5+HJs8aO+ykjhzeFXUi1xF3yufF
	 vQGvpWC+ztr+NO1gnBZ7I4dql08VeUp3PtSZ8Mo8sWlTZLDP5zlVb31G6k23rORv9W
	 PV12nbSJ0RXFcwhCYd/43LlkrAzikKsAfaW4wArkkS9SpY97FRfBns6vpilRQ38BYO
	 xqSX2LHmJE7GQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D52C021A7;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 16 Feb 2025 19:46:45 +0100
Subject: [PATCH 2/4] media: i2c: imx214: Prepare for variable clock
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250216-imx214_clk_freq-v1-2-812f40f07db3@apitzsch.eu>
References: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
In-Reply-To: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739731620; l=4555;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=0VLQFdt57U21JoCzJC3hL0IqNVqlpzlXR87qVLWi7UY=;
 b=63DWIVZfaVclDY5K3AXOrJFf7zKhJf6liaucDA/x6JsA2NA0e9aRLM3s69jE95V605Ia21zrs
 8KVZF+yClr6BZKQaqBNbKY+kqoq7sHQ6KOpfNce+jdopoKikQd7ynuF
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Move clock frequency related parameters out of the constant register
sequences, such that the hard coded external clock frequency can be
replaced by a variable in the next commit.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 64 ++++++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 14a4c5094799014da38ab1beec401f0d923c2152..53b6b427f263a8ad7e3a0d1f711ece234601100e 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -320,17 +320,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
-	{ IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
-	{ IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
-	{ IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
-	{ IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
-	{ IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
-	{ IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE,
-		IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ)) },
-
 	{ CCI_REG8(0x3A03), 0x09 },
 	{ CCI_REG8(0x3A04), 0x50 },
 	{ CCI_REG8(0x3A05), 0x01 },
@@ -384,17 +373,6 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
-	{ IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
-	{ IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
-	{ IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
-	{ IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
-	{ IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
-	{ IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
-	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
-
-	{ IMX214_REG_REQ_LINK_BIT_RATE,
-		IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ)) },
-
 	{ CCI_REG8(0x3A03), 0x04 },
 	{ CCI_REG8(0x3A04), 0xF8 },
 	{ CCI_REG8(0x3A05), 0x02 },
@@ -428,9 +406,6 @@ static const struct cci_reg_sequence mode_table_common[] = {
 	/* ATR setting */
 	{ IMX214_REG_ATR_FAST_MOVE, 2 },
 
-	/* external clock setting */
-	{ IMX214_REG_EXCK_FREQ, IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ / 1000000) },
-
 	/* global setting */
 	/* basic config */
 	{ IMX214_REG_MASK_CORR_FRAMES, IMX214_CORR_FRAMES_MASK },
@@ -800,6 +775,30 @@ static int imx214_entity_init_state(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int imx214_set_clock(struct imx214 *imx214)
+{
+	int ret = 0;
+
+	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
+		  IMX214_DEFAULT_VTPXCK_DIV, &ret);
+	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
+		  IMX214_DEFAULT_VTSYCK_DIV, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
+		  IMX214_DEFAULT_PREPLLCK_VT_DIV, &ret);
+	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
+		  IMX214_DEFAULT_PLL_VT_MPY, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
+		  IMX214_DEFAULT_OPPXCK_DIV, &ret);
+	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
+		  IMX214_DEFAULT_OPSYCK_DIV, &ret);
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
@@ -1032,6 +1031,7 @@ static int imx214_start_streaming(struct imx214 *imx214)
 	const struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_state *state;
 	const struct imx214_mode *mode;
+	int link_bit_rate;
 	int ret;
 
 	ret = cci_multi_reg_write(imx214->regmap, mode_table_common,
@@ -1041,6 +1041,20 @@ static int imx214_start_streaming(struct imx214 *imx214)
 		return ret;
 	}
 
+	ret = imx214_set_clock(imx214);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure clock %d\n", ret);
+		return ret;
+	}
+
+	link_bit_rate = IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ);
+	ret = cci_write(imx214->regmap, IMX214_REG_REQ_LINK_BIT_RATE,
+			IMX214_LINK_BIT_RATE_MBPS(link_bit_rate), NULL);
+	if (ret) {
+		dev_err(imx214->dev, "failed to configure link bit rate\n");
+		return ret;
+	}
+
 	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
 			IMX214_CSI_4_LANE_MODE, NULL);
 	if (ret) {

-- 
2.48.1



