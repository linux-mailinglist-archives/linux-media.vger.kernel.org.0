Return-Path: <linux-media+bounces-26196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A91A376F9
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 19:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE0B7188DF08
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 18:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BB41A315D;
	Sun, 16 Feb 2025 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIhZYaZ3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8132C8B;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731622; cv=none; b=UVX5BG6TwXCZryuu+TtXN8Z5xv9haUm4tQwD9HXa58AwW+Jl8Ds4BmoRD+yqSGjVeyEmk1amhQ69mkEtyZJ60vK7Q5IOWzNwqGNOKAYs2FWFauqq3h65vl85C7Y1J63wBY7vtj9SxZ38nUK2nWwITQDeYG2ecYLrBdliOhAXuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731622; c=relaxed/simple;
	bh=NBkyLSUP9n9Ax4+7aC60v72hjL1RvF641HX71E/k+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqdWhBc+MgWkJT6pNNqbKq9Cvgmpr3vQir8k7PoJAd8vs3V4DotOtPD98z+bFAqI52djAacst2q1xoTXIj1svoIEwRelGBLk+gGt3V8CGxy/y8oOkl4i/AV3GKFsWvFD2aJ1oQNwpm5nk6RqC78sSAzOA4WJRm6eXYWmZi2JYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIhZYaZ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAE0EC4CEEE;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739731621;
	bh=NBkyLSUP9n9Ax4+7aC60v72hjL1RvF641HX71E/k+i8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MIhZYaZ3tLTZUlFRLPquLLedClEatwHqI1HH46K4/f6h32get/Uq8jefv/3fRUBYC
	 Tf9xB3ooNSNflo6mJQINlizyaiVc58t2sJs2nb3zNg4TCLpVH8BMiG11xzlwh/bRWm
	 0KHicL3HROtCBTzNMuNKKqo6JVENDwgfJvqteF6H31Owd0mfy/3ZvjZoR/06A5nagJ
	 g2x9GDlN6sYb/uLCyNOB4WijzjPDOEnGyAVRh/y4CxJxP5sA9zvfGWiq0A4Cy/gbi+
	 MD9hy5k8bV94Oy9RtpAeUK9TQo3RuQPanZQiiNmKsddd1HsXHCaPVV6SvpPrti+sMv
	 Yq5XHV46/e0Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0E3C02198;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 16 Feb 2025 19:46:47 +0100
Subject: [PATCH 4/4] media: i2c: imx214: Add support for 23.88MHz clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250216-imx214_clk_freq-v1-4-812f40f07db3@apitzsch.eu>
References: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
In-Reply-To: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739731620; l=2166;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=WazSPfo9iHxmaDrm3SErM4Vh2VDI2d/EHPhwKDpeOK0=;
 b=BoyYCYkxO//ewUb9c7pOCpeeStR0dHu5eekomgEGJ/18Mc+UzekMg0rTJBYYMRtU59/G3WqLu
 dqSnzYLJfqMBpauXbMRRAAdBwHU8X0wquKgiHnzTAYP1sXqeDoc0dSy
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Qualcomm MSM8916 devices only provide an external clock of 23.88MHz.
Make the sensor usable by those devices by adding support for this
frequency.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index c3d55259d6fd1c4ca96f52833864bdfe6bedf13a..e24c76e01ab5070c073d082b1a2969cff3e17f9f 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -30,7 +30,10 @@
 
 #define IMX214_REG_FAST_STANDBY_CTRL	CCI_REG8(0x0106)
 
+#define IMX214_CLK_FREQ_23880KHZ	23880000
 #define IMX214_CLK_FREQ_24000KHZ	24000000
+
+#define IMX214_LINK_FREQ_597MHZ		597000000
 #define IMX214_LINK_FREQ_600MHZ		600000000
 /* Keep wrong link frequency for backward compatibility */
 #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
@@ -233,6 +236,7 @@ static const char * const imx214_supply_name[] = {
 #define IMX214_NUM_SUPPLIES ARRAY_SIZE(imx214_supply_name)
 
 static const s64 link_freq[] = {
+	IMX214_LINK_FREQ_597MHZ,
 	IMX214_LINK_FREQ_600MHZ,
 };
 
@@ -242,6 +246,10 @@ struct imx214_clk_params {
 };
 
 static const struct imx214_clk_params imx214_clk_params[] = {
+	{
+		.clk_freq = IMX214_CLK_FREQ_23880KHZ,
+		.link_freq = IMX214_LINK_FREQ_597MHZ,
+	},
 	{
 		.clk_freq = IMX214_CLK_FREQ_24000KHZ,
 		.link_freq = IMX214_LINK_FREQ_600MHZ,
@@ -1320,8 +1328,7 @@ static int imx214_parse_fwnode(struct device *dev, struct imx214 *imx214)
 
 	if (i == bus_cfg.nr_of_link_frequencies)
 		ret = dev_err_probe(dev, -EINVAL,
-				    "link-frequencies %d not supported, please review your DT\n",
-				    IMX214_LINK_FREQ_600MHZ);
+				    "provided link-frequencies not supported, please review your DT\n");
 
 done:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -1359,6 +1366,7 @@ static int imx214_probe(struct i2c_client *client)
 	}
 
 	switch (xclk_freq) {
+	case IMX214_CLK_FREQ_23880KHZ:
 	case IMX214_CLK_FREQ_24000KHZ:
 		if (imx214->clk_params->clk_freq != xclk_freq)
 			return dev_err_probe(imx214->dev, -EINVAL,

-- 
2.48.1



