Return-Path: <linux-media+bounces-11948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA2D8D01B0
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9E462910AA
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F45C15FCE2;
	Mon, 27 May 2024 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YqWvDbyN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mco0WyHH"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5FC15FA80;
	Mon, 27 May 2024 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816773; cv=none; b=c5b5+QmRVo/07hzLf98+YsffIDSZVPd7YXPN37wnyiU/plhLD6ccAmf0QYiXjWQ5SrDuHj/TaqSyTeX61zlBdOqXo0iPGNPiRFJuIakG9pvLXHEGIv03O4hujGRAoAbXJrKWX0/G532Lnl541aUKZDHEqtKmxeYkzRs5brSV0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816773; c=relaxed/simple;
	bh=PAW9mgmspKJQEZ+qZqVy1177rq/cNKXbamFC4i0f608=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QD/8mAHpG7QgrRF04FH/3nYpzkhCiMgH4CRsYO6AjLXLPcP9JhtUP6NeMO+helvkOZb53WH819NBxy8++1kc+DD//wG/zGdJCZnZ3JEM+5ssWcl/3IMKnd0tR7YfMV5xoFlrGTwFgi1GauyZVz4srU9zKtDdYbZL5OQkJCg3Oz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YqWvDbyN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mco0WyHH; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id B6F741C000B1;
	Mon, 27 May 2024 09:32:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 May 2024 09:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716816770;
	 x=1716903170; bh=bjohrM42H1IeIdHkoL8B4sKVf6G7m3eMMzNI/4iea9Y=; b=
	YqWvDbyN4zgxT20xP6kBTJP2zAvo3e7ewoTVQqbtt5vfHTs9jDCuPBuXjzG9mrLm
	jKoS0W1GGszb3ZAtpayEblyUnf5kbKvQfDaUDi+TswBXE5I26huvExAw35SanDEx
	3He+GuhL2xfmZVQTBYWUyBHKH4Mx85cDfqqCMDUDA01OhbTQF+3le0kjp9p90lbl
	fLWd6eHv3WnIr6BVtQSzJx+47gZyLk0llKUL7L83DhA2hWTfB6ZUh6rkSPNFLFga
	yLX4N0u77CbmT/ow1bEnEOOQYmg1bqsT5smh6t3OlxZRB7NZFuEZuhTjs4zfREjU
	2y6ITixFaKM2vtFgf4Xx5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716816770; x=
	1716903170; bh=bjohrM42H1IeIdHkoL8B4sKVf6G7m3eMMzNI/4iea9Y=; b=M
	co0WyHH/kqkBDuiWE0y/W6UxlWZCep15SVioT07t5NTE56oUqumznhoLVxIJxRWs
	VRq7Y7LyCwnmJB7NkKFtaOGmKuN5n16nuzT5qmB7q3u0hcEJp3ITbkb/XoWXyQED
	aRmaHZPjk/ds7CRJx+8UDofVjW4q/rqSQTzRNJxqs1pTyu/VA5dU6igi2HhyxQ8B
	N9I3uxGGZyymYa+kfXiMNc8f4LRFW946sUmBJkp7ktsP8TG9qvFq6B8eDZZLh40l
	uv1dnv+RwtVYZdvXnXaJ4CQBD7YlqAYMpRtnyeH5A0O/Hj73Z9t1CmFCTXxOURZa
	xzuBmKi7/SQj+iFJbXO2Q==
X-ME-Sender: <xms:gotUZiX7S7BonvNmQ94hTsz9ewwKGltstklc9PSW5_gHBa0xbGx4qg>
    <xme:gotUZulIDzixZqJR2Mkhk6iReg6VDl5o0JU-trdmsCYlmYfFpckqmVRW3Mp8RjEZI
    nj5ucAbZOCka7VPmf8>
X-ME-Received: <xmr:gotUZma5L9bU2jA2Wkk2WLZJnBs7wAXVGU1-id7isGtxT92RQkcnSKYnm-sjvhTLFKgefCFW52E4iqmUyLnNcfkjkIvbOAf8rm9n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:gotUZpUAz7WeBTurBucoUYIdntvAgsS17ohfTPEpfuNkoT10fEFP5g>
    <xmx:gotUZsnhSF_XU4Dg_HHyXsZuKduncAYAZtqTM2cgEKRgB2WwFrGBMg>
    <xmx:gotUZudUFQEzSbbuA89mgCLB9C8cLHH0bFgIWoXiOjtJ3nsM6izsfA>
    <xmx:gotUZuFB7qmQE0wfSkp9IApQuogApnsQpWyS8VxUZA-ubB_ZkQJBbA>
    <xmx:gotUZrudR6-jJ8abKwKQO-_4x9nDACpNp2jiv3pHoP8qx1i1hqp8ZrOB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:32:49 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 7/7] media: rcar-csi2: Add support for R-Car V4M
Date: Mon, 27 May 2024 15:32:21 +0200
Message-ID: <20240527133221.1688830-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527133221.1688830-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The V4M is the second Gen4 device that is enabled in the rcar-csi2
driver. There is much overlap with the already supported V4H device. The
registers that where new on Gen4 and where added with the V4H prefix are
retained and only new registers unique to the V4M are added with the new
V4M prefix. This follows the style for when V4H was added which had an
overlap with Gen3 registers.

The V4M CSI-2 receiver supports D-PHY mode only, either in 1-, 2- or
4-lane configuration. The datasheets do not document lane swapping and
is left out for now.

While the V4M only supports D-PHY the configuration for it is added in
such a way that it can be reused for V4H which supports both C-PHY and
D-PHY. No known SoC exists to test the D-PHY configuration on V4H so
it's not wired-up.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 291 +++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 46c4f20cce88..83e0c5b25030 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -247,6 +247,25 @@ static const struct rcsi2_cphy_setting cphy_setting_table_r8a779g0[] = {
 	{ /* sentinel */ },
 };
 
+/* V4M registers */
+#define V4M_OVR1_REG					0x0848
+#define V4M_OVR1_FORCERXMODE_3				BIT(12)
+#define V4M_OVR1_FORCERXMODE_2				BIT(11)
+#define V4M_OVR1_FORCERXMODE_1				BIT(10)
+#define V4M_OVR1_FORCERXMODE_0				BIT(9)
+
+#define V4M_FRXM_REG					0x2004
+#define V4M_FRXM_FORCERXMODE_3				BIT(3)
+#define V4M_FRXM_FORCERXMODE_2				BIT(2)
+#define V4M_FRXM_FORCERXMODE_1				BIT(1)
+#define V4M_FRXM_FORCERXMODE_0				BIT(0)
+
+#define V4M_PHYPLL_REG					0x02050
+#define V4M_CSI0CLKFCPR_REG				0x02054
+#define V4M_PHTW_REG					0x02060
+#define V4M_PHTR_REG					0x02064
+#define V4M_PHTC_REG					0x02068
+
 struct phtw_value {
 	u8 data;
 	u8 code;
@@ -255,6 +274,7 @@ struct phtw_value {
 struct rcsi2_mbps_info {
 	u16 mbps;
 	u8 reg;
+	u16 osc_freq; /* V4M */
 };
 
 static const struct rcsi2_mbps_info phtw_mbps_v3u[] = {
@@ -506,6 +526,73 @@ static const struct rcsi2_mbps_info hsfreqrange_m3w[] = {
 	{ /* sentinel */ },
 };
 
+static const struct rcsi2_mbps_info hsfreqrange_v4m[] = {
+	{ .mbps =   80, .reg = 0x00, .osc_freq = 0x01a9 },
+	{ .mbps =   90, .reg = 0x10, .osc_freq = 0x01a9 },
+	{ .mbps =  100, .reg = 0x20, .osc_freq = 0x01a9 },
+	{ .mbps =  110, .reg = 0x30, .osc_freq = 0x01a9 },
+	{ .mbps =  120, .reg = 0x01, .osc_freq = 0x01a9 },
+	{ .mbps =  130, .reg = 0x11, .osc_freq = 0x01a9 },
+	{ .mbps =  140, .reg = 0x21, .osc_freq = 0x01a9 },
+	{ .mbps =  150, .reg = 0x31, .osc_freq = 0x01a9 },
+	{ .mbps =  160, .reg = 0x02, .osc_freq = 0x01a9 },
+	{ .mbps =  170, .reg = 0x12, .osc_freq = 0x01a9 },
+	{ .mbps =  180, .reg = 0x22, .osc_freq = 0x01a9 },
+	{ .mbps =  190, .reg = 0x32, .osc_freq = 0x01a9 },
+	{ .mbps =  205, .reg = 0x03, .osc_freq = 0x01a9 },
+	{ .mbps =  220, .reg = 0x13, .osc_freq = 0x01a9 },
+	{ .mbps =  235, .reg = 0x23, .osc_freq = 0x01a9 },
+	{ .mbps =  250, .reg = 0x33, .osc_freq = 0x01a9 },
+	{ .mbps =  275, .reg = 0x04, .osc_freq = 0x01a9 },
+	{ .mbps =  300, .reg = 0x14, .osc_freq = 0x01a9 },
+	{ .mbps =  325, .reg = 0x25, .osc_freq = 0x01a9 },
+	{ .mbps =  350, .reg = 0x35, .osc_freq = 0x01a9 },
+	{ .mbps =  400, .reg = 0x05, .osc_freq = 0x01a9 },
+	{ .mbps =  450, .reg = 0x16, .osc_freq = 0x01a9 },
+	{ .mbps =  500, .reg = 0x26, .osc_freq = 0x01a9 },
+	{ .mbps =  550, .reg = 0x37, .osc_freq = 0x01a9 },
+	{ .mbps =  600, .reg = 0x07, .osc_freq = 0x01a9 },
+	{ .mbps =  650, .reg = 0x18, .osc_freq = 0x01a9 },
+	{ .mbps =  700, .reg = 0x28, .osc_freq = 0x01a9 },
+	{ .mbps =  750, .reg = 0x39, .osc_freq = 0x01a9 },
+	{ .mbps =  800, .reg = 0x09, .osc_freq = 0x01a9 },
+	{ .mbps =  850, .reg = 0x19, .osc_freq = 0x01a9 },
+	{ .mbps =  900, .reg = 0x29, .osc_freq = 0x01a9 },
+	{ .mbps =  950, .reg = 0x3a, .osc_freq = 0x01a9 },
+	{ .mbps = 1000, .reg = 0x0a, .osc_freq = 0x01a9 },
+	{ .mbps = 1050, .reg = 0x1a, .osc_freq = 0x01a9 },
+	{ .mbps = 1100, .reg = 0x2a, .osc_freq = 0x01a9 },
+	{ .mbps = 1150, .reg = 0x3b, .osc_freq = 0x01a9 },
+	{ .mbps = 1200, .reg = 0x0b, .osc_freq = 0x01a9 },
+	{ .mbps = 1250, .reg = 0x1b, .osc_freq = 0x01a9 },
+	{ .mbps = 1300, .reg = 0x2b, .osc_freq = 0x01a9 },
+	{ .mbps = 1350, .reg = 0x3c, .osc_freq = 0x01a9 },
+	{ .mbps = 1400, .reg = 0x0c, .osc_freq = 0x01a9 },
+	{ .mbps = 1450, .reg = 0x1c, .osc_freq = 0x01a9 },
+	{ .mbps = 1500, .reg = 0x2c, .osc_freq = 0x01a9 },
+	{ .mbps = 1550, .reg = 0x3d, .osc_freq = 0x0108 },
+	{ .mbps = 1600, .reg = 0x0d, .osc_freq = 0x0110 },
+	{ .mbps = 1650, .reg = 0x1d, .osc_freq = 0x0119 },
+	{ .mbps = 1700, .reg = 0x2e, .osc_freq = 0x0121 },
+	{ .mbps = 1750, .reg = 0x3e, .osc_freq = 0x012a },
+	{ .mbps = 1800, .reg = 0x0e, .osc_freq = 0x0132 },
+	{ .mbps = 1850, .reg = 0x1e, .osc_freq = 0x013b },
+	{ .mbps = 1900, .reg = 0x2f, .osc_freq = 0x0143 },
+	{ .mbps = 1950, .reg = 0x3f, .osc_freq = 0x014c },
+	{ .mbps = 2000, .reg = 0x0f, .osc_freq = 0x0154 },
+	{ .mbps = 2050, .reg = 0x40, .osc_freq = 0x015d },
+	{ .mbps = 2100, .reg = 0x41, .osc_freq = 0x0165 },
+	{ .mbps = 2150, .reg = 0x42, .osc_freq = 0x016e },
+	{ .mbps = 2200, .reg = 0x43, .osc_freq = 0x0176 },
+	{ .mbps = 2250, .reg = 0x44, .osc_freq = 0x017f },
+	{ .mbps = 2300, .reg = 0x45, .osc_freq = 0x0187 },
+	{ .mbps = 2350, .reg = 0x46, .osc_freq = 0x0190 },
+	{ .mbps = 2400, .reg = 0x47, .osc_freq = 0x0198 },
+	{ .mbps = 2450, .reg = 0x48, .osc_freq = 0x01a1 },
+	{ .mbps = 2500, .reg = 0x49, .osc_freq = 0x01a9 },
+	{ /* sentinel */ },
+};
+
 /* PHY ESC Error Monitor */
 #define PHEERM_REG			0x74
 
@@ -1178,6 +1265,192 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
 	return 0;
 }
 
+static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int data_rate)
+{
+	unsigned int timeout;
+	int ret;
+
+	static const struct phtw_value step1[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x00, .code = 0x1e },
+	};
+
+	/* Shutdown and reset PHY. */
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, BIT(0));
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, BIT(0));
+
+	/* Start internal calibration (POR). */
+	ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
+	if (ret)
+		return ret;
+
+	/* Wait for POR to complete. */
+	for (timeout = 10; timeout > 0; timeout--) {
+		if ((rcsi2_read(priv, V4M_PHTR_REG) & 0xf0000) == 0x70000)
+			break;
+		usleep_range(1000, 2000);
+	}
+
+	if (!timeout) {
+		dev_err(priv->dev, "D-PHY calibration failed\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int rcsi2_set_osc_freq(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	const struct rcsi2_mbps_info *info;
+	struct phtw_value steps[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .code = 0xe2 }, /* Data filled in below. */
+		{ .code = 0xe3 }, /* Data filled in below. */
+		{ .data = 0x01, .code = 0xe4 },
+	};
+
+	info = rcsi2_mbps_to_info(priv, priv->info->hsfreqrange, mbps);
+	if (!info)
+		return -ERANGE;
+
+	/* Fill in data for command. */
+	steps[1].data = (info->osc_freq & 0x00ff) >> 0;
+	steps[2].data = (info->osc_freq & 0x0f00) >> 8;
+
+	return rcsi2_phtw_write_array(priv, steps, ARRAY_SIZE(steps));
+}
+
+static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
+{
+	int ret;
+
+	static const struct phtw_value step1[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x3c, .code = 0x08 },
+	};
+
+	static const struct phtw_value step2[] = {
+		{ .data = 0x00, .code = 0x00 },
+		{ .data = 0x80, .code = 0xe0 },
+		{ .data = 0x01, .code = 0xe1 },
+		{ .data = 0x06, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x08, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x0a, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x0c, .code = 0x00 },
+		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x01, .code = 0x00 },
+		{ .data = 0x31, .code = 0xaa },
+		{ .data = 0x05, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x07, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x09, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+		{ .data = 0x0b, .code = 0x00 },
+		{ .data = 0x05, .code = 0x09 },
+	};
+
+	if (priv->info->hsfreqrange) {
+		ret = rcsi2_set_phypll(priv, mbps);
+		if (ret)
+			return ret;
+
+		ret = rcsi2_set_osc_freq(priv, mbps);
+		if (ret)
+			return ret;
+	}
+
+	if (mbps <= 1500) {
+		ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
+		if (ret)
+			return ret;
+	}
+
+	if (priv->info->csi0clkfreqrange)
+		rcsi2_write(priv, V4M_CSI0CLKFCPR_REG,
+			    CSI0CLKFREQRANGE(priv->info->csi0clkfreqrange));
+
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK |
+		    V4H_PHY_EN_ENABLE_0 | V4H_PHY_EN_ENABLE_1 |
+		    V4H_PHY_EN_ENABLE_2 | V4H_PHY_EN_ENABLE_3);
+
+	if (mbps > 1500) {
+		ret = rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv)
+{
+	const struct rcar_csi2_format *format;
+	unsigned int lanes;
+	int mbps;
+	int ret;
+
+	/* Calculate parameters */
+	format = rcsi2_code_to_fmt(priv->mf.code);
+	if (!format)
+		return -EINVAL;
+
+	ret = rcsi2_get_active_lanes(priv, &lanes);
+	if (ret)
+		return ret;
+
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (mbps < 0)
+		return mbps;
+
+	/* Reset LINK and PHY */
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
+	rcsi2_write(priv, V4H_DPHY_RSTZ_REG, 0);
+	rcsi2_write(priv, V4H_PHY_SHUTDOWNZ_REG, 0);
+	rcsi2_write(priv, V4M_PHTC_REG, PHTC_TESTCLR);
+
+	/* PHY static setting */
+	rcsi2_write(priv, V4H_PHY_EN_REG, V4H_PHY_EN_ENABLE_CLK);
+	rcsi2_write(priv, V4H_FLDC_REG, 0);
+	rcsi2_write(priv, V4H_FLDD_REG, 0);
+	rcsi2_write(priv, V4H_IDIC_REG, 0);
+	rcsi2_write(priv, V4H_PHY_MODE_REG, V4H_PHY_MODE_DPHY);
+	rcsi2_write(priv, V4H_N_LANES_REG, lanes - 1);
+
+	rcsi2_write(priv, V4M_FRXM_REG,
+		    V4M_FRXM_FORCERXMODE_0 | V4M_FRXM_FORCERXMODE_1 |
+		    V4M_FRXM_FORCERXMODE_2 | V4M_FRXM_FORCERXMODE_3);
+	rcsi2_write(priv, V4M_OVR1_REG,
+		    V4M_OVR1_FORCERXMODE_0 | V4M_OVR1_FORCERXMODE_1 |
+		    V4M_OVR1_FORCERXMODE_2 | V4M_OVR1_FORCERXMODE_3);
+
+	/* Reset CSI2 */
+	rcsi2_write(priv, V4M_PHTC_REG, 0);
+	rcsi2_write(priv, V4H_CSI2_RESETN_REG, BIT(0));
+
+	/* Common settings */
+	ret = rcsi2_init_common_v4m(priv, mbps);
+	if (ret)
+		return ret;
+
+	/* D-PHY settings */
+	ret = rcsi2_d_phy_setting_v4m(priv, mbps);
+	if (ret)
+		return ret;
+
+	rcsi2_wait_phy_start_v4h(priv, V4H_ST_PHYST_ST_STOPSTATE_0 |
+				 V4H_ST_PHYST_ST_STOPSTATE_1 |
+				 V4H_ST_PHYST_ST_STOPSTATE_2 |
+				 V4H_ST_PHYST_ST_STOPSTATE_3);
+
+	rcsi2_write(priv, V4M_FRXM_REG, 0);
+
+	return 0;
+}
+
 static int rcsi2_start(struct rcar_csi2 *priv)
 {
 	int ret;
@@ -1806,6 +2079,20 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
 	.support_cphy = true,
 };
 
+static const struct rcsi2_register_layout rcsi2_registers_v4m = {
+	.phtw = V4M_PHTW_REG,
+	.phypll = V4M_PHYPLL_REG,
+};
+
+static const struct rcar_csi2_info rcar_csi2_info_r8a779h0 = {
+	.regs = &rcsi2_registers_v4m,
+	.start_receiver = rcsi2_start_receiver_v4m,
+	.hsfreqrange = hsfreqrange_v4m,
+	.csi0clkfreqrange = 0x0c,
+	.use_isp = true,
+	.support_dphy = true,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a774a1-csi2",
@@ -1859,6 +2146,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a779g0-csi2",
 		.data = &rcar_csi2_info_r8a779g0,
 	},
+	{
+		.compatible = "renesas,r8a779h0-csi2",
+		.data = &rcar_csi2_info_r8a779h0,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
-- 
2.45.1


