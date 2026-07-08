Return-Path: <linux-media+bounces-67009-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XuwDFe5jTmowLwIAu9opvQ
	(envelope-from <linux-media+bounces-67009-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:51:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385D7279A1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=czqY0tQL;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67009-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67009-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DAF9C300C025
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943A93DD521;
	Wed,  8 Jul 2026 14:49:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF003B19D6
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522153; cv=none; b=kT0Xv7Qq6fc0b3EJwafKJ1cuVkpvkEg/ylSZbPxKmkNMTuYNzFt35s5KAO3YJU8+DZiLiee9Nrt7d6w/IZT+07+lTG4dtJEM7Hw+lW4F2duGcMUp1UDP1Dtk/I1soUVjwsP2ULNM3sHatq3FPUwSayJ9f2Y3taKD3XDfZkAy/BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522153; c=relaxed/simple;
	bh=FZflqWVIXRCruuWP6g2ExyXMwReUCGhn7A4b9MiKxTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iz/8u0YYNQZbyEnX920cHl9J0EjJw/IzsWKPSIpWYLV51PZmFuLZQP5grqcY0bHQwGh9RkUhzjsL1NylncN06LFJppYYfwl3FOiqZ8dW+HKIVOgrBSl2ipqbj0mtZ4OdRtpdSw9Wx5XmXW6KI8x0kVPyo/qynBHXxp8+81kppCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=czqY0tQL; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso499260f8f.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522150; x=1784126950; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAB/TZ4h8IUmeg+tgDmUhADP6t4/HyOBMb86upV86GM=;
        b=czqY0tQLN+TVyk7+ipF0m2et96XejWjE1/rHWDa+sK/rUkuExppYwzLigE626HendF
         3Nu9igwVeY6f5fz7z66kzLlYcHXmAHx14GgwQhpVhUf/srL87ukQH731UZKr1sEpnVfC
         OrWRq+ClfRJejK7njCX0N9wlC6cksotMpYdgMtdqCw3487mtLbpN2NoagmtS9lWYBqAr
         npNLLpSM90/cbFKKnAwG63SMFBnYmRqHhh9PzupGk0eZRfHfAUJS1Eq/ZdYSRqRN35oi
         3KRWpZCXoAFudq6NH6d2kniivSADfdR0iKgcdv3kCyHAYf7Sxfp8qoc/PTHu6FSetrAs
         fBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522150; x=1784126950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAB/TZ4h8IUmeg+tgDmUhADP6t4/HyOBMb86upV86GM=;
        b=dJvPBgQRcHafl0U+4sGJ+GG3I+4haLL3i/8K5wK27fHzeSH9LCwtdDjZtYX6ZwkmMZ
         YyO3MaMwm0NOCDSoEjFWIFZtwGn/WGP+suQsSnOExwv8LojVaC5dMKzjUaltgFBkAfqj
         tHs0zWEjl9uytSVkzo447TBicJy9//0qF2N4MlGTicbm+Fx5yetUbdyr9oHywWjO5am3
         ck1tsD92GsQEUqNUWprRfEFGRXxDkCdNjq5afNn2uOXlwY3gnwHuGjPi/bfZgq8fgMw/
         BRv8UUwMjzDPWeloyU1iUkEPvlFiasnIP/A7ZZBRdaPO5lcG3BPU/l8uLP+OX756w0iU
         qXFg==
X-Gm-Message-State: AOJu0YyR/fu1Yr3YIiYJLvfJtJY4sS3UJ2SZPTkoE/jy2RR4YdxhhNM0
	yvMitTi2ADpxDAtKrSrHpcPxnx7EkMhykEeFhyMPEA27al3dTTuE/ZgBeSHFix1rS7A=
X-Gm-Gg: AfdE7cm9JQIvp1gY58QI79qDrLqqXrty6b+TIRvjbl3zEPPzm+wuhAHD457XSaEnkTc
	NvDQqSmpmCCqDG6b/rOJzKFKUjE0mXEQHuahrrj5yCNKC6xD31bJ3M9ygyLzM94HuaQJo/D45ml
	5OOhAu6lNl3WXu4WUNVYW8LraQF4+OVmsoPkckBvntTvDypi9isSGyHlN5AaJzFyBtLNdp3ibPJ
	R6RK1K/ahRvrPcZK3vBxOnDYWvF4E2LKJ1JBduu3pVypg7EOKb68B5jw57aItZXjYRlAbLuJMP6
	YPz690cUCV6dEbuKQ0Jf8QGlaE+ycMztQGe1rgbe8Lq78ucnzAOYLq9bbOT4wCeqQ+VS7LEGj2P
	qbIDVSGZ4uNzndry+qaKHQ+lkHMc24wPOkLw5A+VMaxZxJT416gc9HCXDSKKCLcjwZ+6at68JXO
	RH/h2esG8KDOrRC/VIlqgXxz43qanQLjWyXEe56EGmyyIKdleEK+LbJ+JD6ks7HWIU
X-Received: by 2002:a05:600c:354e:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-493e683ab6bmr31834115e9.11.1783522150060;
        Wed, 08 Jul 2026 07:49:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:09 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:37 +0100
Subject: [PATCH v3 01/20] media: i2c: imx355: Add support for 24 MHz
 external clock
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-1-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67009-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3385D7279A1

From: David Heidelberg <david@ixit.cz>

The IMX355 sensor supports multiple external clock frequencies,
including 19.2 MHz and 24 MHz. The driver currently supports only
fixed 19.2 MHz input clock.

Refactor the clock handling to make the PLL configuration dependent
on the external clock frequency and add support for 24 MHz. Introduce
a table of clock parameter sets and program the corresponding EXTCLK
frequency and PLL multipliers to maintain consistent internal VCO
frequencies across supported inputs.

The PLL settings are adjusted so that OP VCO remains at 720 MHz

This preserves existing timing characteristics while allowing systems
using a 24 MHz clock to operate correctly.

No functional change for existing 19.2 MHz users.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 27a5c212a527..ad9a9464175b 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -25,6 +25,10 @@
 #define IMX355_REG_CHIP_ID		0x0016
 #define IMX355_CHIP_ID			0x0355
 
+/* PLL registers that depend on the external clock frequency */
+#define IMX355_REG_EXTCLK_FREQ		0x0136
+#define IMX355_REG_PLL_OP_MUL		0x030e
+
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
@@ -63,7 +67,6 @@
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
@@ -100,6 +103,29 @@ struct imx355_mode {
 	struct imx355_reg_list reg_list;
 };
 
+struct imx355_clk_params {
+	u32 ext_clk;
+	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_op_mpy;	/* OP system PLL multiplier */
+};
+
+/*
+ * The clock tree is in single PLL mode, so PREDIV_VT and MPY_IVT do nothing.
+ * All modes use the same PLL setup for OP, with IOPCK being 720MHz.
+ */
+static const struct imx355_clk_params imx355_clk_params[] = {
+	{
+		.ext_clk = 19200000,
+		.extclk_freq = 0x1333,	/* 19.2 MHz */
+		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+	},
+	{
+		.ext_clk = 24000000,
+		.extclk_freq = 0x1800,	/* 24.0 MHz */
+		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+	},
+};
+
 struct imx355_hwcfg {
 	unsigned long link_freq_bitmap;
 };
@@ -125,6 +151,7 @@ struct imx355 {
 	const struct imx355_mode *cur_mode;
 
 	struct imx355_hwcfg *hwcfg;
+	const struct imx355_clk_params *clk_params;
 
 	/*
 	 * Mutex for serialized access:
@@ -144,8 +171,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
 	{ 0x304e, 0x03 },
 	{ 0x4348, 0x16 },
 	{ 0x4350, 0x19 },
@@ -235,8 +260,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -284,8 +307,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -333,8 +354,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -382,8 +401,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -431,8 +448,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -480,8 +495,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -529,8 +542,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -578,8 +589,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -627,8 +636,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -676,8 +683,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -725,8 +730,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -774,8 +777,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -823,8 +824,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -872,8 +871,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
@@ -1422,6 +1419,16 @@ static int imx355_start_streaming(struct imx355 *imx355)
 		return ret;
 	}
 
+	/* Set PLL registers for the external clock frequency */
+	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
+			       imx355->clk_params->extclk_freq);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
+			       imx355->clk_params->pll_op_mpy);
+	if (ret)
+		return ret;
+
 	/* set digital gain control to all color mode */
 	ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
 	if (ret)
@@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
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

-- 
2.34.1


