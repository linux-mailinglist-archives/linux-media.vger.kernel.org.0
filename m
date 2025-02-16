Return-Path: <linux-media+bounces-26193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC10A376F2
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 19:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1F00188B99D
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 18:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67ED1A3029;
	Sun, 16 Feb 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7up8pTg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BC18A6AB;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731622; cv=none; b=eImnHLGCuwf7peaU9PmNH+MWsx0uGmXHAlaeQ6+36pCicWHH0nr+gNY6gXjkyZ/hfIhbfEWQXxI0LTOiDn+dKdJVWyvvSCgkprfjK4GqYS36KJspk2e4i95JsWzvnzyiM6muLll/LnNot2XpP9c8JC9MzeFLvRECyoQKVEgi1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731622; c=relaxed/simple;
	bh=jPv0Cs97xsT0crtZmnsVyj4K8wdMsbE9n67dgBc3bu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UbQ3ct4c7oAodJ6aeV5zncOiFHa3Aju8o0H3JqDTuegMXaFDSRkMPvrx1dIzw30dZkA3rR5KPAEDY21neY2yOZvA/YVc1xJF4GYFCgzW4VdQ83yhGwxQtl8g4FAejPK5hd83NocS8wr8lciuNK9odKmPZ56/2X9AwWe6LL2yIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7up8pTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DF4EC4CEE8;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739731621;
	bh=jPv0Cs97xsT0crtZmnsVyj4K8wdMsbE9n67dgBc3bu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=T7up8pTgqkg1ksVfgHgfeWOi2/LLQ95vzRLs8Vzqkw7WcfgK6XTIJV4ng7tOCBZHa
	 y4vaPfNSzjLHPUaiy9ngWmPT6ozFXygVxKdFYV07pXDIEmt4EjbazuBHGAXSb7ywDT
	 jBiReDJqRZZcHt1Ofe40SKuPqyPIMfENxo3ce+GS7UNJIC3z8Mr+jcGJ//UTZ9d55e
	 D2QXPBZv16Bum5oMNpA3u+dO39MMMN33DBAVbRavj6xt6OigU+5o/mpOoQxbb3MRvP
	 2xTrwQr6Jfiefdb2lwYqmNlf7ToH5EX+Wqm0/YajfwsQfmeMkoa03Mi+O2GZdKtoUm
	 pTkmhkN6/WqTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88ABAC021A6;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sun, 16 Feb 2025 19:46:44 +0100
Subject: [PATCH 1/4] media: i2c: imx214: Calculate link bit rate from clock
 frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250216-imx214_clk_freq-v1-1-812f40f07db3@apitzsch.eu>
References: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
In-Reply-To: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739731620; l=4568;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CrC/VI4OhUDXF04VluXMQqpjXLZSHaubF6hdre/ipkc=;
 b=E4YknhTo8FWC7oNLZ4uXVZOBCREQJafUXAYwpqgv62Mw+jMOtN5x7ZexV4KBzjo38RNNyB41N
 HXqL8kWTQ6PCiOZuZmNn7cPOmHuoP8J4RfzL/UQB68E7g6g8zlN4FnI
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Replace the magic link bit rate number (4800) by its calculation based
on the used parameters and the provided external clock frequency.

The link bit rate is output bitrate multiplied by the number lanes. The
output bitrate is the OPPXCK clock frequency multiplied by the number of
bits per pixel. The OPPXCK clock frequency is OPCK multiplied by the
OPPXCK clock division ratio. And OPCK is the external clock frequency
multiplied by the PreDivider setting and the PLL multiple setting.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/media/i2c/imx214.c | 51 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 6c3f6f3c8b1f7724110dc55fead0f8a168edf35b..14a4c5094799014da38ab1beec401f0d923c2152 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -84,6 +84,7 @@
 #define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
 #define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
 #define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
+#define IMX214_BITS_PER_PIXEL_MASK	0xFF
 
 #define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
 #define IMX214_CSI_2_LANE_MODE		1
@@ -104,11 +105,23 @@
 
 /* PLL settings */
 #define IMX214_REG_VTPXCK_DIV		CCI_REG8(0x0301)
+#define IMX214_DEFAULT_VTPXCK_DIV	5
+
 #define IMX214_REG_VTSYCK_DIV		CCI_REG8(0x0303)
+#define IMX214_DEFAULT_VTSYCK_DIV	2
+
 #define IMX214_REG_PREPLLCK_VT_DIV	CCI_REG8(0x0305)
+#define IMX214_DEFAULT_PREPLLCK_VT_DIV	3
+
 #define IMX214_REG_PLL_VT_MPY		CCI_REG16(0x0306)
+#define IMX214_DEFAULT_PLL_VT_MPY	150
+
 #define IMX214_REG_OPPXCK_DIV		CCI_REG8(0x0309)
+#define IMX214_DEFAULT_OPPXCK_DIV	10
+
 #define IMX214_REG_OPSYCK_DIV		CCI_REG8(0x030b)
+#define IMX214_DEFAULT_OPSYCK_DIV	1
+
 #define IMX214_REG_PLL_MULT_DRIV	CCI_REG8(0x0310)
 #define IMX214_PLL_SINGLE		0
 #define IMX214_PLL_DUAL			1
@@ -204,6 +217,14 @@
 #define IMX214_PIXEL_ARRAY_WIDTH	4208U
 #define IMX214_PIXEL_ARRAY_HEIGHT	3120U
 
+/* Link bit rate for a given input clock frequency in single PLL mode */
+#define IMX214_LINK_BIT_RATE(clk_freq) \
+	(((clk_freq) / 1000000) / IMX214_DEFAULT_PREPLLCK_VT_DIV \
+	* IMX214_DEFAULT_PLL_VT_MPY \
+	/ (IMX214_DEFAULT_OPSYCK_DIV * IMX214_DEFAULT_OPPXCK_DIV) \
+	* (IMX214_CSI_DATA_FORMAT_RAW10 & IMX214_BITS_PER_PIXEL_MASK) \
+	* (IMX214_CSI_4_LANE_MODE + 1))
+
 static const char * const imx214_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -299,15 +320,16 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
+	{ IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
+	{ IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
+	{ IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
+	{ IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
+	{ IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
+	{ IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
+	{ IMX214_REG_REQ_LINK_BIT_RATE,
+		IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ)) },
 
 	{ CCI_REG8(0x3A03), 0x09 },
 	{ CCI_REG8(0x3A04), 0x50 },
@@ -362,15 +384,16 @@ static const struct cci_reg_sequence mode_1920x1080[] = {
 	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
 	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
 
-	{ IMX214_REG_VTPXCK_DIV, 5 },
-	{ IMX214_REG_VTSYCK_DIV, 2 },
-	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
-	{ IMX214_REG_PLL_VT_MPY, 150 },
-	{ IMX214_REG_OPPXCK_DIV, 10 },
-	{ IMX214_REG_OPSYCK_DIV, 1 },
+	{ IMX214_REG_VTPXCK_DIV, IMX214_DEFAULT_VTPXCK_DIV },
+	{ IMX214_REG_VTSYCK_DIV, IMX214_DEFAULT_VTSYCK_DIV },
+	{ IMX214_REG_PREPLLCK_VT_DIV, IMX214_DEFAULT_PREPLLCK_VT_DIV },
+	{ IMX214_REG_PLL_VT_MPY, IMX214_DEFAULT_PLL_VT_MPY },
+	{ IMX214_REG_OPPXCK_DIV, IMX214_DEFAULT_OPPXCK_DIV },
+	{ IMX214_REG_OPSYCK_DIV, IMX214_DEFAULT_OPSYCK_DIV },
 	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
 
-	{ IMX214_REG_REQ_LINK_BIT_RATE, IMX214_LINK_BIT_RATE_MBPS(4800) },
+	{ IMX214_REG_REQ_LINK_BIT_RATE,
+		IMX214_LINK_BIT_RATE_MBPS(IMX214_LINK_BIT_RATE(IMX214_DEFAULT_CLK_FREQ)) },
 
 	{ CCI_REG8(0x3A03), 0x04 },
 	{ CCI_REG8(0x3A04), 0xF8 },

-- 
2.48.1



