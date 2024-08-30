Return-Path: <linux-media+bounces-17245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56E966AAB
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51D3F1C22239
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1B51BF802;
	Fri, 30 Aug 2024 20:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cavgjqLx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QRoy+vMe"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6561C173B;
	Fri, 30 Aug 2024 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050109; cv=none; b=uIvRYgJsvlE22NP9ysPSrjzsfVWWJRhJ7XS2DJ20t0rHWHIxaK1O0jnJxrKa01th20CxJVDuzQCIXB6Xfc5Xis4M8a+ILd8Z9VqvTvrizJe5WGip5qLTR62Dv9nJPS8UzUfvhuk74WeM8AsWztupXLes/cnWidT8yInPvUOtEz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050109; c=relaxed/simple;
	bh=/n5UkoeE/vp7MTk2uKXXS64C5AW9fa/pnkY1YfYJs+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qfw690VxTGwVKGzhwdawD/bf+nEuc8lBKXrpjVkraAVr3zZ7g2Z0ltdazZBtIoa41xYMZmtkyAWYlugifiN4QQvEAE9fPZTsBdRa0GZXxoJxYBH2YhUG8xQbK8BnPRrdLNY2njDcsWH/8+6jDDrLHSJbFhYlpADHA8QvjmnNNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cavgjqLx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QRoy+vMe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A408F114017B;
	Fri, 30 Aug 2024 16:35:06 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 30 Aug 2024 16:35:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050106;
	 x=1725136506; bh=tkfYQwWrFOZJjVqUVb3P3b9wwFzVkThikFf2mLvjjrs=; b=
	cavgjqLxJFoJ6/n7GL+Dz9AJNlDGKADjSqGwcO+H11TA/G8W6LiQz3PKVCj87e84
	5MTOHvViEftpvlLv2dMAOdiDN1M9qHeTSxvzqL921zlcpgd3PgSp0/Gw1f3QLE/g
	dITK4DUByp+snyHGAx2Rw+OPP+iF5Ts4cArBvHOMGsnvEYWaec83Q6YQFjKQPLG0
	qB+0NAKpEpsoA7ys1fQfG2oTEfwypxi3rBuDGdZpHIefCmJ0O0MYvCflZ1W3uL2c
	AD8iMjmVi5sZs63luZjN6xfsf0ZDu+dHoPMqkZAwJeyQ2/XKGmSe5D4kFGReXC2+
	5bNPb2D7g9CBWYgln61YRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050106; x=
	1725136506; bh=tkfYQwWrFOZJjVqUVb3P3b9wwFzVkThikFf2mLvjjrs=; b=Q
	Roy+vMe2P1DmDdDVVuNFIzA0v0nTMVPUUpX1iMAqK3S/HJPUcQcSbSAUi7Gj6D/o
	H9AWifP0jg8pvR3T/cNyHzoP+QaV/Hasc8Hq6CIbbGm5S/wtbjpHswhmjhM53gPH
	I4KRHfe/uPzJxjCJPJz0Vyq+V4Jnd3hhI9WGH/DVvck14UnTFhxUB/bkiR4DM8fd
	59Te51kEkIb6tvTJuYseleYusykUkvRSdkwmVZC9lCo2MdEgg10K/4nipdbJaDCW
	S2TsDGKqiqHliChAEYPsLzQdRQdkxwiOJy2ih3TjzQYEY2jHOKlLXyhXrAjQvaKC
	cLs5kME6+I0BmlAhhmDbA==
X-ME-Sender: <xms:-izSZrUtrOL1SdFondc5kA7YimQwIMexwkAzmB-YNi2W8wItvovQog>
    <xme:-izSZjkwMpWsqmCDgigjZ0zOeG1FMC8tFyJyAuw7Fm_E9eY1goHNS6rGSV7929ioH
    _Q1bvfOdVKxy4XQLwA>
X-ME-Received: <xmr:-izSZnYWnnc-WW7OXVo0WQmRXM1iVOzHdcpnPsukg3uYGrraR29JTSnelob9XGWh82nPajD5XKaaUOPZxJ9jK8N-nA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgu
    theslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-izSZmUAKUQm-qWbHnRP0WZyKe4BMsCGreeW4Ep-hLthjo9uk_957Q>
    <xmx:-izSZlmtLwsi3J0maFVFqABm16nC3tV_DlISUyYm3SUtiRiVsQpWng>
    <xmx:-izSZjdh_RX2ucfRE48pl0WGJ_ecfE9twHq9LGzZEK9Aoljr_A_enA>
    <xmx:-izSZvFfi8UxVqE8yCBA9j7wtTQhzrueBk0DK3e0RmA4bHJtaqpk4g>
    <xmx:-izSZrcvmnsx8Ot1tyXlySdbK8OCIcZHLlzt21VDt1Rx5rsvlyPZ0oNw>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 5/8] media: rcar-csi2: Add helper to lookup mbps settings
Date: Fri, 30 Aug 2024 22:31:01 +0200
Message-ID: <20240830203104.3479124-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The structure mapping a configuration information to a particular mpbs
setting needs to be extended with more information to support future
SoCs. Before it is extended reduce code duplication by creating a helper
to lookup information from an array of mbps setting, the lookup code
has already been copied to two speared locations.

While at it rename the structure to make it clear it contains
information related to a mbps setting, not just a single register value.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 90 +++++++++++-----------
 1 file changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 4e85c47817a1..0c65c6aa7260 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -242,12 +242,12 @@ struct phtw_value {
 	u8 code;
 };
 
-struct rcsi2_mbps_reg {
+struct rcsi2_mbps_info {
 	u16 mbps;
 	u8 reg;
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
+static const struct rcsi2_mbps_info phtw_mbps_v3u[] = {
 	{ .mbps = 1500, .reg = 0xcc },
 	{ .mbps = 1550, .reg = 0x1d },
 	{ .mbps = 1600, .reg = 0x27 },
@@ -272,7 +272,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
+static const struct rcsi2_mbps_info phtw_mbps_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x86 },
 	{ .mbps =   90, .reg = 0x86 },
 	{ .mbps =  100, .reg = 0x87 },
@@ -292,7 +292,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
+static const struct rcsi2_mbps_info phtw_mbps_v3m_e3[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x20 },
 	{ .mbps =  100, .reg = 0x40 },
@@ -336,7 +336,7 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
 #define PHYPLL_REG			0x68
 #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
 
-static const struct rcsi2_mbps_reg hsfreqrange_v3u[] = {
+static const struct rcsi2_mbps_info hsfreqrange_v3u[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x10 },
 	{ .mbps =  100, .reg = 0x20 },
@@ -402,7 +402,7 @@ static const struct rcsi2_mbps_reg hsfreqrange_v3u[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
+static const struct rcsi2_mbps_info hsfreqrange_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x10 },
 	{ .mbps =  100, .reg = 0x20 },
@@ -449,7 +449,7 @@ static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
 	{ /* sentinel */ },
 };
 
-static const struct rcsi2_mbps_reg hsfreqrange_m3w[] = {
+static const struct rcsi2_mbps_info hsfreqrange_m3w[] = {
 	{ .mbps =   80,	.reg = 0x00 },
 	{ .mbps =   90,	.reg = 0x10 },
 	{ .mbps =  100,	.reg = 0x20 },
@@ -596,7 +596,7 @@ struct rcar_csi2_info {
 	int (*start_receiver)(struct rcar_csi2 *priv,
 			      struct v4l2_subdev_state *state);
 	void (*enter_standby)(struct rcar_csi2 *priv);
-	const struct rcsi2_mbps_reg *hsfreqrange;
+	const struct rcsi2_mbps_info *hsfreqrange;
 	unsigned int csi0clkfreqrange;
 	unsigned int num_channels;
 	bool clear_ulps;
@@ -662,6 +662,34 @@ static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
 	iowrite16(data, priv->base + reg);
 }
 
+static const struct rcsi2_mbps_info *
+rcsi2_mbps_to_info(struct rcar_csi2 *priv,
+		   const struct rcsi2_mbps_info *infotable, unsigned int mbps)
+{
+	const struct rcsi2_mbps_info *info;
+	const struct rcsi2_mbps_info *prev = NULL;
+
+	if (mbps < infotable->mbps)
+		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
+			 mbps, infotable->mbps);
+
+	for (info = infotable; info->mbps != 0; info++) {
+		if (info->mbps >= mbps)
+			break;
+		prev = info;
+	}
+
+	if (!info->mbps) {
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+		return NULL;
+	}
+
+	if (prev && ((mbps - prev->mbps) <= (info->mbps - mbps)))
+		info = prev;
+
+	return info;
+}
+
 static void rcsi2_enter_standby_gen3(struct rcar_csi2 *priv)
 {
 	rcsi2_write(priv, PHYCNT_REG, 0);
@@ -714,29 +742,13 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 
 static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 {
-	const struct rcsi2_mbps_reg *hsfreq;
-	const struct rcsi2_mbps_reg *hsfreq_prev = NULL;
+	const struct rcsi2_mbps_info *info;
 
-	if (mbps < priv->info->hsfreqrange->mbps)
-		dev_warn(priv->dev, "%u Mbps less than min PHY speed %u Mbps",
-			 mbps, priv->info->hsfreqrange->mbps);
-
-	for (hsfreq = priv->info->hsfreqrange; hsfreq->mbps != 0; hsfreq++) {
-		if (hsfreq->mbps >= mbps)
-			break;
-		hsfreq_prev = hsfreq;
-	}
-
-	if (!hsfreq->mbps) {
-		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+	info = rcsi2_mbps_to_info(priv, priv->info->hsfreqrange, mbps);
+	if (!info)
 		return -ERANGE;
-	}
 
-	if (hsfreq_prev &&
-	    ((mbps - hsfreq_prev->mbps) <= (hsfreq->mbps - mbps)))
-		hsfreq = hsfreq_prev;
-
-	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(hsfreq->reg));
+	rcsi2_write(priv, priv->info->regs->phypll, PHYPLL_HSFREQRANGE(info->reg));
 
 	return 0;
 }
@@ -1494,27 +1506,15 @@ static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
 }
 
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
-				 const struct rcsi2_mbps_reg *values, u8 code)
+				 const struct rcsi2_mbps_info *values, u8 code)
 {
-	const struct rcsi2_mbps_reg *value;
-	const struct rcsi2_mbps_reg *prev_value = NULL;
+	const struct rcsi2_mbps_info *info;
 
-	for (value = values; value->mbps; value++) {
-		if (value->mbps >= mbps)
-			break;
-		prev_value = value;
-	}
-
-	if (prev_value &&
-	    ((mbps - prev_value->mbps) <= (value->mbps - mbps)))
-		value = prev_value;
-
-	if (!value->mbps) {
-		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", mbps);
+	info = rcsi2_mbps_to_info(priv, values, mbps);
+	if (!info)
 		return -ERANGE;
-	}
 
-	return rcsi2_phtw_write(priv, value->reg, code);
+	return rcsi2_phtw_write(priv, info->reg, code);
 }
 
 static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
-- 
2.46.0


