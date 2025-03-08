Return-Path: <linux-media+bounces-27895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C68A57EF9
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 22:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E13B1892E27
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 21:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC39212FB2;
	Sat,  8 Mar 2025 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlH/w/dW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D288187FEC;
	Sat,  8 Mar 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470491; cv=none; b=W2nE8LyRgy7j6DXiv+WHXiiDYKqipuQR4P2EAfA5V8sXL9fEYy1r5go0xBozMSQrM9UyAcm2PNwYxbUHQ/eDdcZho8mw5Pk2CLzrOtbUBccUOWsq9EnjqqnCgDSY/XxMzRarJEAhvYF1RhoktQQiY8RfXxVJIuzpH1cnhch+8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470491; c=relaxed/simple;
	bh=NBkyLSUP9n9Ax4+7aC60v72hjL1RvF641HX71E/k+i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaO4Q1m0nCl3tI6Cd7qmFzZGsjT8F/qd4hUu0bwRiABnCNajlQK32Qa4jXFZDBOGN6lOj0NKKiJ7xXJgQOGJ8J+jxkN+Zjp9c5JteYGKdf7Eyga9O+vBBXZOibink3oYFF7f88PWLbwNSQIVxdQZqU+YY950xdiVvSGlio1xYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlH/w/dW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7F4DC4CEED;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741470491;
	bh=NBkyLSUP9n9Ax4+7aC60v72hjL1RvF641HX71E/k+i8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IlH/w/dW52z87757vTdf4M7w9gn7K6w+DE1iPANxiGTm7AidiByDUeN45c5keAROM
	 3AaBW152441T2oqK0nERdZLc7rxY/4ugVU4MB7uJBYqtJ0qb8oF7f/9ucQjLSVURlw
	 284o0HlUqfEiL7A20n0CFtYdgWa4mgHAih1HdOfzfKHbAo9d24r9olu2ATIE7xI1X3
	 nzSeb+WfKpkCriACuXRELkR14clF9WeAoF0h6QESrl9vXZ76v/dv9CGwBOTkxHal66
	 yBG0gM0QFujIW2Phjp71GY3+ztqbqhGnv7F0F4/KGazC0EfO8S4J6zVwJ6/17b63I+
	 eHCL58Vnl5eJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87C0C282EC;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 08 Mar 2025 22:47:58 +0100
Subject: [PATCH RESEND 4/4] media: i2c: imx214: Add support for 23.88MHz
 clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250308-imx214_clk_freq-v1-4-467a4c083c35@apitzsch.eu>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741470489; l=2166;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=WazSPfo9iHxmaDrm3SErM4Vh2VDI2d/EHPhwKDpeOK0=;
 b=9FuClyeXyAMC4vqo/KrMlBMy2FxYhXKiRyuEQ6X/GiABtnb+qz4HmAW41Ze4+ALTYE+RYFYIb
 0X6ehEiIaHLA+5xaZx9Q4/kdKFKhktKqdBC4tX/ATg7SW6jee3qkgXG
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



