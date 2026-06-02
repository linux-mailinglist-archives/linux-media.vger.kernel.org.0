Return-Path: <linux-media+bounces-63437-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ia5rMfhDH2p/jQAAu9opvQ
	(envelope-from <linux-media+bounces-63437-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:58:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22155631F2C
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 22:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=HALPzLJk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63437-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63437-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D4443049734
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 20:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D48FC3955DC;
	Tue,  2 Jun 2026 20:54:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F0334BA20;
	Tue,  2 Jun 2026 20:54:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433685; cv=none; b=gI6SuC7CAwYaaTizWz5ih5Iu1JKZ0ll9Wv9X/cuTtAPzqt/WvrL/qp11TjWhR5WoIwqqgSoL+5+8ziMUi0o7xPtNJLAET2KhWg9nm4vQNc6otXINU+/gALOWaQVhoXsaL3ISXhlfGd1kxcT0GMPy4PT5biBFp8MyTV7Yu15J20U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433685; c=relaxed/simple;
	bh=LVUJkyU/1MPU8xYxuX/1+UNFLQcQQpsO1vx7R4XdzsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MfHdip5cxCKX0IBB0pdH/C4vjPCUFbrCXWYb81qsl4P0BC63tSThC1Xe2BmnAWfjVkIhfwo2ayn8yWJwJFUubKZWVDbB9jfddg7XM3GSIp/RDKDtnGC/xzqbixk9nloJO+APERlcyK9JiNf+k3dBzwUveS0S9wdlaNUWH87aX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HALPzLJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8183C2BCB4;
	Tue,  2 Jun 2026 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780433684;
	bh=LVUJkyU/1MPU8xYxuX/1+UNFLQcQQpsO1vx7R4XdzsI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HALPzLJkmC1kRcOYUkI3IvUdMuVN0wuK/1vFADWsG9OKdc0AaUcdlhlMd2cZrNh/w
	 uJ0BwhK8KMvy9ybSi2KFPVPDzjq5gSdBZ2cFKu8HoIFqmllNVpfgGyCfSZIKGE6MSH
	 LsbGBbZ1Q18cRElcNn1/xQwarY10sEy0QaKXAJJ2UFgMLsqtMNpPBAGg3fYm7X5N0h
	 3Rui7v1Mghwv3/O6aQABjC5ONC0HxpVCdg1rGoBtjOE/JJactimCORzla8joeGjnhZ
	 DHuAt6FUBbB6NI8YAJxXVzWq3D55+m2xFUbczTAXWTRD9Nx4/06fvBM9hBPSCL2YzX
	 JVhCIpGCa2H1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE934CD5BD1;
	Tue,  2 Jun 2026 20:54:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 02 Jun 2026 22:54:43 +0200
Subject: [PATCH v2] media: i2c: imx355: Add support for 24 MHz external
 clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx355-24mhz-v2-1-73cf448dad08@ixit.cz>
X-B4-Tracking: v=1; b=H4sIABJDH2oC/3XMSw6DIBSF4a2YOy6NIErbUffROAC81DvwETCEa
 th7qfMO/5Oc74CAnjDAozrAY6RAy1xCXCqwo57fyGgoDaIWXS25ZDSlpm2ZkNO4M3Oz1mnT6ME
 ZKJfVo6N0cq++9EhhW/zn1CP/rX+gyBlnd41KGduhQvukRNvV7tDnnL9G/HoppgAAAA==
X-Change-ID: 20260414-imx355-24mhz-b8ccfab3adfb
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14475; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2Z/ynP0sOsIe0cM5rkyEasesKKOl8HcRqSdg9iSYhDU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqH0MTl1P+uO0go+2lyn/vD5AvUPb2xb3y2ZIbb
 UNo8YImySyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCah9DEwAKCRBgAj/E00kg
 crKiD/oClY9HYwTamRcn3Df9ZkP5H6vXnYRa4php9bBmQkZtjhjW0TsiZ9jBiKzczJNvp2E3xxx
 9K8ErgKBhubF7MR0osdc6tKnzcgjUkLue4KjigGClmjL0/BP7ZgBg5alwLwWcUIlwS7Q1fmdwHy
 YX4APCZ90TJjs8Xf6YQUORipBAV0fdXphq6s2GzZqFyEiGAu624NMY3KTP75/vmobP7+Nkpvfkx
 dFLHW2bDbEs+4DdMk8wgCZ//SLj9E87ErtICMZiuBFuaYklcxrUCzifDyBjJq8ZoOOhKf7tqBtT
 x9CEcGaZ1yquuqWiqLTEe6FuHxsDet+LzU3YUWZxyBeINjQApj8te9bQlZK+bGu9Ax8cUYcFDMH
 u+PZf94uRLbJcDnQvT1q0bMa/8fZefQGc8MtmdeL2EPiHaLoet87f4YZHNGaBQxINXf3FBmUrWA
 E2bXJiaDoO0nJTB4R0v0W9K5q14I35t2kpBtA0QOheTxDa85kl5PTcoWKDL4olvw1UWCR3bmLSh
 loL7qmAJbFiuNib6iG9jdE/0/BOF3uAMlQP9TzTAUsbChD4/eGuzOnIVeESUAFKVyZ3i3tp5IHE
 PZlUpBrX2gtNKTbB3c1SmzUi1r58JAFiDK3B3/Q1x1yq6ADJtqrSic0xrJoIUmi9tpJUNu6DQTK
 mV4tecpTq9ydAiA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63437-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:david@ixit.cz,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22155631F2C

From: David Heidelberg <david@ixit.cz>

The IMX355 sensor supports multiple external clock frequencies,
including 19.2 MHz and 24 MHz. The driver currently supports only
fixed 19.2 MHz input clock.

Refactor the clock handling to make the PLL configuration dependent
on the external clock frequency and add support for 24 MHz. Introduce
a table of clock parameter sets and program the corresponding EXTCLK
frequency and PLL multipliers to maintain consistent internal VCO
frequencies across supported inputs.

The PLL settings are adjusted so that:
  - VT VCO remains at 1152 MHz
  - OP VCO remains at 720 MHz

This preserves existing timing characteristics while allowing systems
using a 24 MHz clock to operate correctly.

No functional change for existing 19.2 MHz users.

Assisted-by: Claude:claude-opus-4-6
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Tested-by: Richard Acayan <mailingradian@gmail.com> # Pixel 3a
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Known users: Pixel 3 and 3a.
---
Changes in v2:
- Adapt to follow the naming used in ccs-regs.h.
- Gathered R-b/T-bs.
- Link to v1: https://lore.kernel.org/r/20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz
---
 drivers/media/i2c/imx355.c | 114 +++++++++++++++++++++------------------------
 1 file changed, 54 insertions(+), 60 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 27a5c212a527f..48300804f53ee 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -20,16 +20,21 @@
 #define IMX355_REG_MODE_SELECT		0x0100
 #define IMX355_MODE_STANDBY		0x00
 #define IMX355_MODE_STREAMING		0x01
 
 /* Chip ID */
 #define IMX355_REG_CHIP_ID		0x0016
 #define IMX355_CHIP_ID			0x0355
 
+/* PLL registers that depend on the external clock frequency */
+#define IMX355_R_EXTCLK_FREQUENCY_MHZ	0x0136
+#define IMX355_R_PLL_MULTIPLIER		0x0306
+#define IMX355_R_OP_PLL_MULTIPLIER	0x030e
+
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
 /* Exposure control */
 #define IMX355_REG_EXPOSURE		0x0202
 #define IMX355_EXPOSURE_MIN		1
 #define IMX355_EXPOSURE_STEP		1
@@ -58,17 +63,16 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		0x0101
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
 struct imx355_reg {
 	u16 address;
 	u8 val;
@@ -95,16 +99,43 @@ struct imx355_mode {
 
 	/* index of link frequency */
 	u32 link_freq_index;
 
 	/* Default register values */
 	struct imx355_reg_list reg_list;
 };
 
+struct imx355_clk_params {
+	u32 ext_clk;
+	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_vt_mpy;	/* VT system PLL multiplier */
+	u16 pll_op_mpy;	/* OP system PLL multiplier */
+};
+
+/*
+ * All modes use the same PLL dividers (PREPLLCK_VT_DIV=2, PREPLLCK_OP_DIV=2),
+ * so the multipliers are adjusted to produce the same VCO frequencies:
+ *   VT VCO = 1152 MHz, OP VCO = 720 MHz
+ */
+static const struct imx355_clk_params imx355_clk_params[] = {
+	{
+		.ext_clk = 19200000,
+		.extclk_freq = 0x1333,	/* 19.2 MHz */
+		.pll_vt_mpy = 120,	/* 19.2 / 2 * 120 = 1152 MHz */
+		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+	},
+	{
+		.ext_clk = 24000000,
+		.extclk_freq = 0x1800,	/* 24.0 MHz */
+		.pll_vt_mpy = 96,	/* 24.0 / 2 * 96  = 1152 MHz */
+		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+	},
+};
+
 struct imx355_hwcfg {
 	unsigned long link_freq_bitmap;
 };
 
 struct imx355 {
 	struct device *dev;
 	struct clk *clk;
 
@@ -120,16 +151,17 @@ struct imx355 {
 	struct v4l2_ctrl *exposure;
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
 	/* Current mode */
 	const struct imx355_mode *cur_mode;
 
 	struct imx355_hwcfg *hwcfg;
+	const struct imx355_clk_params *clk_params;
 
 	/*
 	 * Mutex for serialized access:
 	 * Protect sensor set pad format and start/stop streaming safely.
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
 
@@ -139,18 +171,16 @@ struct imx355 {
 
 static const struct regulator_bulk_data imx355_supplies[] = {
 	{ .supply = "avdd" },
 	{ .supply = "dvdd" },
 	{ .supply = "dovdd" },
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
 	{ 0x304e, 0x03 },
 	{ 0x4348, 0x16 },
 	{ 0x4350, 0x19 },
 	{ 0x4408, 0x0a },
 	{ 0x440c, 0x0b },
 	{ 0x4411, 0x5f },
 	{ 0x4412, 0x2c },
 	{ 0x4623, 0x00 },
@@ -226,22 +256,18 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x0c },
 	{ 0x034d, 0xc4 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -275,22 +301,18 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x0c },
 	{ 0x034d, 0xc0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -324,22 +346,18 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x0c },
 	{ 0x034d, 0xd0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0xa0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -373,22 +391,18 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x07 },
 	{ 0x034d, 0x94 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -422,22 +436,18 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x07 },
 	{ 0x034d, 0x90 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -471,22 +481,18 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x07 },
 	{ 0x034d, 0x84 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -520,22 +526,18 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x07 },
 	{ 0x034d, 0x80 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -569,22 +571,18 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x06 },
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0xd0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -618,22 +616,18 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x06 },
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x03 },
 	{ 0x034f, 0x9a },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -667,22 +661,18 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x05 },
 	{ 0x034d, 0x14 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -716,22 +706,18 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x05 },
 	{ 0x034d, 0x10 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -765,22 +751,18 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x05 },
 	{ 0x034d, 0x04 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -814,22 +796,18 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x05 },
 	{ 0x034d, 0x00 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -863,22 +841,18 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0902, 0x00 },
 	{ 0x034c, 0x03 },
 	{ 0x034d, 0x34 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0x68 },
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x01 },
 	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 	{ 0x0820, 0x0b },
 	{ 0x0821, 0x40 },
 	{ 0x3088, 0x04 },
 	{ 0x6813, 0x02 },
 	{ 0x6835, 0x07 },
@@ -1417,16 +1391,30 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	/* Apply default values of current mode */
 	reg_list = &imx355->cur_mode->reg_list;
 	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(imx355->dev, "failed to set mode");
 		return ret;
 	}
 
+	/* Set PLL registers for the external clock frequency */
+	ret = imx355_write_reg(imx355, IMX355_R_EXTCLK_FREQUENCY_MHZ, 2,
+			       imx355->clk_params->extclk_freq);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_R_PLL_MULTIPLIER, 2,
+			       imx355->clk_params->pll_vt_mpy);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_R_OP_PLL_MULTIPLIER, 2,
+			       imx355->clk_params->pll_op_mpy);
+	if (ret)
+		return ret;
+
 	/* set digital gain control to all color mode */
 	ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
 	if (ret)
 		return ret;
 
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 	if (ret)
@@ -1744,17 +1732,23 @@ static int imx355_probe(struct i2c_client *client)
 	mutex_init(&imx355->mutex);
 
 	imx355->clk = devm_v4l2_sensor_clk_get(imx355->dev, NULL);
 	if (IS_ERR(imx355->clk))
 		return dev_err_probe(imx355->dev, PTR_ERR(imx355->clk),
 				     "failed to get clock\n");
 
 	freq = clk_get_rate(imx355->clk);
-	if (freq != IMX355_EXT_CLK)
+	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
+		if (freq == imx355_clk_params[i].ext_clk) {
+			imx355->clk_params = &imx355_clk_params[i];
+			break;
+		}
+	}
+	if (!imx355->clk_params)
 		return dev_err_probe(imx355->dev, -EINVAL,
 				     "external clock %lu is not supported\n",
 				     freq);
 
 	ret = devm_regulator_bulk_get_const(imx355->dev,
 					    ARRAY_SIZE(imx355_supplies),
 					    imx355_supplies,
 					    &imx355->supplies);

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260414-imx355-24mhz-b8ccfab3adfb

Best regards,
-- 
David Heidelberg <david@ixit.cz>



