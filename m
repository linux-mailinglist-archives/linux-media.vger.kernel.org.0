Return-Path: <linux-media+bounces-27893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D027A57EFC
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 22:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEDAD7A47FA
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 21:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2377212F9D;
	Sat,  8 Mar 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMA1pecq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976F49620;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470491; cv=none; b=IFrkdbmqA8qs6XnNO4ULlL+xQvTF1GOBbqurmK8SgnveKWbgOWHURKMIfJPFOO+8DdHR+9RuSm9viODLTArQ6cDNZFnnqraXBasl4q7BKPZXWZf4s4+T7nk2rW/DFljDw9yPp1b68PaCQIv37zQJYqaI4I9Wd9ou6qIZiRJFS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470491; c=relaxed/simple;
	bh=jPv0Cs97xsT0crtZmnsVyj4K8wdMsbE9n67dgBc3bu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8DBQKHgl5879hJsWgMd8JI7DgBJKE6FHHtVlI+hxXngw+A9xyE0m8lm4vwweDQWisEKT8tx+szUF84MlXZMRxOf8zu+vKCKejTla0mcNKzLKHWCMXScA/sDLOOQP3ZvoKpjSl1XvlMornaXwlPAqe+PaiiC5wF9pVFJPZk9OCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMA1pecq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B78B4C4CEE5;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741470490;
	bh=jPv0Cs97xsT0crtZmnsVyj4K8wdMsbE9n67dgBc3bu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lMA1pecqa/8bbdzlquURJlJANcmeIc+jSBnJIZY105YarIqyKWh6z8fC62+UfIQ84
	 dAdp9Ocr8jesKIZbIKYi9ZRADjFVpct8jH/FIuKySgH7cB8t7EB7L6qciOcA3fgWjM
	 RBYSgTG7vrPvWP8gMnMKkFGslrpWpeyjG04dQefWKziA5hA3VpFbkIcxI6J8xH9qG5
	 7sg9kZSWZc/LuVp+1Hn3clsYGwjeP2pBfqn/FwUGVdxpiwYFOBWzMgaFMA8SQgFMZD
	 M/1rDxwDj8XeAjmdWO7qiCvyBJUkIkHfTV/bh5onOI07sc4wPfcvBqlOGs5DYGi5vJ
	 B7wG42FJC8eeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07D0C28B2F;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Sat, 08 Mar 2025 22:47:55 +0100
Subject: [PATCH RESEND 1/4] media: i2c: imx214: Calculate link bit rate
 from clock frequency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250308-imx214_clk_freq-v1-1-467a4c083c35@apitzsch.eu>
References: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
In-Reply-To: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741470489; l=4568;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=CrC/VI4OhUDXF04VluXMQqpjXLZSHaubF6hdre/ipkc=;
 b=ksDPMha74CZMFyaDj4yUSyZBJaSp6hfVgMvVji3dqL0Gj4mol1Tl5l4xGSDPeEiX3uA2G7jYl
 g1BwA3iZzyHAP5OVlKICfa2jVm2qSjaXy/B9Y2M6PuxIr13wmNPw6fr
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



