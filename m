Return-Path: <linux-media+bounces-60152-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PVEDJjK9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60152-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:45:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BA4ADB23
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E82A308587D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C903D091E;
	Fri,  1 May 2026 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nxafne+c"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649B33D331C;
	Fri,  1 May 2026 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649992; cv=none; b=hksBgKk6itNFY4l3xomXwCZMM/VmrnmiyhFbMNKzyXUUApWSyS2XUlotrSBCaGelPUhm4lBLMGc8mTiER0/NxhHnMYS8/WsfeukuMhF/2E0XWdUWu2RRcKDvoosj/OEnkfEPWFj1OSldhTafIPEo5/2TOJ6OHYy9ph0J88RT5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649992; c=relaxed/simple;
	bh=6VgTwInBWVrzLLsEb7C28IGZSXo4bBF+2sNl5yXZVcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aha46fVzPS5xHjCDZlch4A5xXl7e1NwhQ5T5OLrMcrRVnJoVRPyorWltzjGsr+OLZbhYARHbG9kX7Vb4IhizKLYUUc0G5UrCk2XWJ0imVuMfrzU5o3yWMp5tlluHztNC/01VwXb41rouuE2AG6743Cqi3yudekuwGlDqRTIeDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nxafne+c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72DFB13CA;
	Fri,  1 May 2026 17:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649857;
	bh=6VgTwInBWVrzLLsEb7C28IGZSXo4bBF+2sNl5yXZVcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nxafne+cPN7hZylWKMhnV134eXYD/H82zZouqeDBmwaJmqZ2U0j5jTPHJTyBY/QhY
	 13Eu4zvvuLKVu0IpvA8An3zbtouLrODmrgQTJwKjmKgI/aMhVpMrvHuOKmsb9+vohu
	 zJBQj9YboB18C7Q+PtD8wXrXwtzt436Syw2yZ4M0=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:10 +0100
Subject: [PATCH 08/11] media: i2c: ov5640: Document AWB control registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-8-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=4678;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=6VgTwInBWVrzLLsEb7C28IGZSXo4bBF+2sNl5yXZVcE=;
 b=8UvS0f1C9X9dyALzP1GlfNVsTPuhzfzi4VEXuobddAV9FcyhRicGYVmLNcsEtEX+kqbik67Xt
 FZTWBw7w8soBAMFTQT5nI5U/tHdRlYKiEm990f4ZMjO4BYIJq3wRurQ
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: 840BA4ADB23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60152-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

Identify and map the registers that are controlling the AWB and
document their current impact inline in the register set.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 61 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 4b6804fc47e1..34fe7f51e17b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -112,6 +112,34 @@
 #define OV5640_REG_PCLK_PERIOD		0x4837
 #define OV5640_REG_ISP_FORMAT_MUX_CTRL	0x501f
 #define OV5640_REG_PRE_ISP_TEST_SET1	0x503d
+
+#define OV5640_REG_AWB_CONTROL_00	0x5180 /* AWB B block */
+#define OV5640_REG_AWB_CONTROL_01	0x5181 /* AWB Step and Slope control */
+#define OV5640_REG_AWB_CONTROL_02	0x5182 /* 7:4 Max local counter 3:0 mas fast counter */
+#define OV5640_REG_AWB_CONTROL_03	0x5183 /* AWB Simple/Advanced control */
+#define OV5640_REG_AWB_CONTROL_04	0x5184 /* Count and G enable */
+#define OV5640_REG_AWB_CONTROL_05	0x5185 /* Stable Range Thresholds */
+
+#define OV5640_REG_AWB_CONTROL_17	0x5191 /* AWB Top limit */
+#define OV5640_REG_AWB_CONTROL_18	0x5192 /* AWB Bottom limit */
+#define OV5640_REG_AWB_CONTROL_19	0x5193 /* Red limit */
+#define OV5640_REG_AWB_CONTROL_20	0x5194 /* Green limit */
+#define OV5640_REG_AWB_CONTROL_21	0x5195 /* Blue limit */
+
+#define OV5640_REG_AWB_CONTROL_22	0x5196 /* AWB Freeze and Simple Selection */
+#define OV5640_AWB_FREEZE		BIT(5) /* AWB freeze */
+#define OV5640_AWB_SIMPLE_SELECT_MASK	GENMASK(3, 2)
+#define OV5640_AWB_SIMPLE_AFTER_AWB_0	0 /* AWB simple from after AWB gain */
+#define OV5640_AWB_SIMPLE_AFTER_GMA_0	1 /* AWB simple from after RAW GMA */
+#define OV5640_AWB_SIMPLE_AFTER_GMA_1	2 /* AWB simple from after RAW GMA */
+#define OV5640_AWB_SIMPLE_AFTER_AWB_1	3 /* AWB simple from after AWB gain */
+#define OV5640_AWB_FAST_ENABLE		BIT(1) /* AWB fast enable */
+#define OV5640_AWB_BIAS_STAT		BIT(0)
+
+#define OV5640_REG_AWB_CONTROL_23	0x5197 /* Local Limit */
+
+#define OV5640_REG_AWB_CONTROL_30	0x519e /* Local limit and Stable Select */
+
 #define OV5640_REG_SDE_CTRL0		0x5580
 #define OV5640_REG_SDE_CTRL1		0x5581
 #define OV5640_REG_SDE_CTRL3		0x5583
@@ -576,12 +604,14 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0},
 
 	/* AWB Control */
-	{0x5180, 0xff, 0, 0},
-	{0x5181, 0xf2, 0, 0},
-	{0x5182, 0x00, 0, 0},
-	{0x5183, 0x14, 0, 0},
-	{0x5184, 0x25, 0, 0},
-	{0x5185, 0x24, 0, 0},
+	{OV5640_REG_AWB_CONTROL_00, 0xff, 0, 0}, /* AWB B Block */
+	{OV5640_REG_AWB_CONTROL_01, 0xf2, 0, 0}, /* Step and Slope  - one zone, 0 slope, step fast=step local = 3 */
+	{OV5640_REG_AWB_CONTROL_02, 0x00, 0, 0}, /* Local/Fast counters @ 0 */
+	{OV5640_REG_AWB_CONTROL_03, 0x14, 0, 0}, /* Advanced AWB: AWB SIMF, AWB Win = 1 */
+	{OV5640_REG_AWB_CONTROL_04, 0x25, 0, 0}, /* G-Enable, Count-limit=1, count threshold=1 */
+	{OV5640_REG_AWB_CONTROL_05, 0x24, 0, 0}, /* Stable Ranges: Threshold for [7:4] unstable to stable [3:0] stable to unstable */
+
+	/* AWB Advanced Control - Undocumented */
 	{0x5186, 0x09, 0, 0},
 	{0x5187, 0x09, 0, 0},
 	{0x5188, 0x09, 0, 0},
@@ -593,20 +623,23 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x518e, 0x34, 0, 0},
 	{0x518f, 0x6b, 0, 0},
 	{0x5190, 0x46, 0, 0},
-	{0x5191, 0xf8, 0, 0},
-	{0x5192, 0x04, 0, 0},
-	{0x5193, 0x70, 0, 0},
-	{0x5194, 0xf0, 0, 0},
-	{0x5195, 0xf0, 0, 0},
-	{0x5196, 0x03, 0, 0},
-	{0x5197, 0x01, 0, 0},
+
+	{OV5640_REG_AWB_CONTROL_17, 0xf8, 0, 0}, /* AWB Top limit (Default 0xff)*/
+	{OV5640_REG_AWB_CONTROL_18, 0x04, 0, 0}, /* AWB Bottom limit (Default 0x00) */
+	{OV5640_REG_AWB_CONTROL_19, 0x70, 0, 0}, /* Red limit (Default 0xf0) */
+	{OV5640_REG_AWB_CONTROL_20, 0xf0, 0, 0}, /* Green Limit (Default 0xf0) */
+	{OV5640_REG_AWB_CONTROL_21, 0xf0, 0, 0}, /* Blue limit (Default 0xf0) */
+	{OV5640_REG_AWB_CONTROL_22, 0x03, 0, 0}, /* AWB after AWB gain; Fast enable; Bias stat; */
+	{OV5640_REG_AWB_CONTROL_23, 0x01, 0, 0}, /* Local limit (Default 0x02) */
+
+	/* Debug mode - Undocumented */
 	{0x5198, 0x04, 0, 0},
 	{0x5199, 0x6c, 0, 0},
 	{0x519a, 0x04, 0, 0},
 	{0x519b, 0x00, 0, 0},
 	{0x519c, 0x09, 0, 0},
 	{0x519d, 0x2b, 0, 0},
-	{0x519e, 0x38, 0, 0},
+	{OV5640_REG_AWB_CONTROL_30, 0x38, 0, 0}, /* [7:4] Debug = 3; [3] Local Limit Select = 1; [2] Simple stable select=0; [1:0] Debug=0 */
 
 	{0x5381, 0x1e, 0, 0}, {0x5382, 0x5b, 0, 0}, {0x5383, 0x08, 0, 0},
 	{0x5384, 0x0a, 0, 0}, {0x5385, 0x7e, 0, 0}, {0x5386, 0x88, 0, 0},

-- 
2.52.0


