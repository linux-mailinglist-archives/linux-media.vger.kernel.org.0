Return-Path: <linux-media+bounces-21606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C50949D3050
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39DC4B235DE
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 22:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69A51D5171;
	Tue, 19 Nov 2024 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="S1egyeew";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QLvZT0hL"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E51D363A;
	Tue, 19 Nov 2024 22:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054434; cv=none; b=AoNG43qxGU0K3BN4ZoXQA3Gi176dc7GekSut6o5Qrwm676q+qHONV7L6NTbYFCwYbop/JEstX6IUCjddOcSCOeNlRCBlO+/3Fa7CDYbknYqSz8rDLfEAgN1kh0Dfw3VG5oRkjXMXt3ooJbh+LYTBow+FTHRcxqeLWjabs0bDtyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054434; c=relaxed/simple;
	bh=SAh5j4sQm3/rxfJOnu1J5G2uBjs1g8Fmz2NZQB9Nb/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAj/ehaGycti7EhaLi55jsH7RigVwvC6oJbXfF2Cu9BK7BXTpsZgk57a4apnauMvvtgdRfEq+9ZCvdAz3OUkHgDjb5bB5jHQqIrE8bitVOxwFbY3bnXCjwn6+Bx/YHzFrzYolag6IcFgT1M19BDHDTfXVkMrTfEG5AKVxjnGX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=S1egyeew; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QLvZT0hL; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 947931380501;
	Tue, 19 Nov 2024 17:13:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 19 Nov 2024 17:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732054431;
	 x=1732140831; bh=BteyqdTqeFE45omOjvPvOTy8X+JhDJuyouFhWjaJcBg=; b=
	S1egyeewXoRvrc7jfrAeCxbmJLq49cUDdc45trCBITD4m0lG/QSKOIbu8lp8dllN
	zsEgDhyMrAEBpdqGKSG44kp9DLKlfm2ekh/d2tvKI8DYshFcAMBZ/3VrKCf6c7kE
	AzDDaeigjhgvUdGUyMycKDtADy7tdpqy4+cKcaSFJk4Pe3Yf0XFhm4eKbsOIgk5N
	o+myx6vxCcaUtj6CpggMbF3HsSaLWx4ZiCRXXxenSoM38WdZfVe+0yChkGoAHgrZ
	qjbBoAgmxSRqHi18DiWdsTR7Ws9FZFkv42ox3i/uW5xPKwv3t1SfkIzM/KM3Dfje
	MeCtv3Z4qbjO6VSK8RgwLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1732054431; x=
	1732140831; bh=BteyqdTqeFE45omOjvPvOTy8X+JhDJuyouFhWjaJcBg=; b=Q
	LvZT0hLjjgd99BGxkEBbLRzQqBTDzuxyKUGBF9O3oYBwIvjmUwPgf7ENF3FUQBzS
	APSGuOsP5WmuNRfWujzpIuOudjg/QWxlMLx1nLM75ShGMw+hQ1XVHkOUG7kpaxm4
	GZ5mrKOEDI95J5G6ktJhsrgrBAUeb9hyKoVgNQxJ21TwwCN2bB52ivEKxBrUX1IT
	cqxG6o7SsVTyXlnouvI3YPOE0N97c8t2Mwfq4uxmE39qT1nqCFdoTpSZUT1G6V3+
	xObLLWasZR39oXgiTtjmorWjJ7B8Yd7IULXS64HYTuEv7ohrOR9q33lftnG9Zs5l
	4M/2c6uj8sBUJ1JCyB1/g==
X-ME-Sender: <xms:nw09Z8pJjS0n-Ocv4kEmwErcJl0Clx-ChDr-4qfaYT2jQpM8rsG8LQ>
    <xme:nw09ZyoDos8XVNo-72xhyz4Ki95JNfo0DF4p5BoWfI0NKOQSYAbudODy9kwAQm1va
    eA4JMuknAJ-93huZZU>
X-ME-Received: <xmr:nw09ZxNt60Qn3ZFitdgHuhHNfZ6bQF3JOydy--oK-PS5e0Ld6YMZxM64sXVsx1CnVlaZN8jaPxS6dDNmPzbKxvm1yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedvgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrg
    hrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrh
    gvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nw09Zz7voyh0RWIjTzMaC2-EuaHFUBiC_btv_EazCZeiWf1b_2ddrg>
    <xmx:nw09Z75VKiQhiez9y6DRabd-VDFrQayLa6bLSajd4XQswGQRvCqbqg>
    <xmx:nw09ZzjSHb8uWLRVBYL_QL5VQPBqzQGiYOzRg6FVdfebGw95y3r3fw>
    <xmx:nw09Z15jzvhK02-srN-WjPyaMX7RoknZHvJBAi71dQrG__drg0DO7Q>
    <xmx:nw09Z_jiLEJ7dEhO8HckeDJOkdsCFw2fUA2vVCu-7NzZOsnTa1p34JZE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 17:13:50 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] media: rcar-csi2: Allow specifying C-PHY line order
Date: Tue, 19 Nov 2024 23:12:49 +0100
Message-ID: <20241119221249.539610-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Later versions of the V4H datasheet adds documentation for the line
order register needed to support all possible configurations. Extend the
driver to take the line order for each data line into account when
configuring the device.

Unfortunately not all registers initially thought to be involved in line
order configuration where directly related. One magic value is still in
the driver and left as-is, but it is not related to line order as that
procedure have now been documented.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 74 ++++++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 27ffdd28cbf7..8a0b6a68e194 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -183,17 +183,19 @@ struct rcar_csi2;
 #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
 #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
 #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
-#define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
 #define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 
 /* V4H C-PHY */
 #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
 #define V4H_CORE_DIG_RW_TRIO1_REG(n)			(0x22500 + ((n) * 2)) /* n = 0 - 3 */
 #define V4H_CORE_DIG_RW_TRIO2_REG(n)			(0x22900 + ((n) * 2)) /* n = 0 - 3 */
+#define V4H_CORE_DIG_CLANE_0_RW_CFG_0_REG		0x2a000
 #define V4H_CORE_DIG_CLANE_0_RW_LP_0_REG		0x2a080
 #define V4H_CORE_DIG_CLANE_0_RW_HS_RX_REG(n)		(0x2a100 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
 #define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
 #define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG		0x2a800
 #define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
 #define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
 
@@ -672,6 +674,21 @@ static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 	return NULL;
 }
 
+struct rcsi2_cphy_line_order {
+	enum v4l2_mbus_csi2_cphy_line_orders_type order;
+	u16 cfg;
+	u16 ctrl29;
+};
+
+static const struct rcsi2_cphy_line_order rcsi2_cphy_line_orders[] = {
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC, .cfg = 0x0, .ctrl29 = 0x0 },
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB, .cfg = 0xa, .ctrl29 = 0x1 },
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC, .cfg = 0xc, .ctrl29 = 0x1 },
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA, .cfg = 0x5, .ctrl29 = 0x0 },
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB, .cfg = 0x3, .ctrl29 = 0x0 },
+	{ .order = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA, .cfg = 0x9, .ctrl29 = 0x1 }
+};
+
 enum rcar_csi2_pads {
 	RCAR_CSI2_SINK,
 	RCAR_CSI2_SOURCE_VC0,
@@ -722,6 +739,7 @@ struct rcar_csi2 {
 	bool cphy;
 	unsigned short lanes;
 	unsigned char lane_swap[4];
+	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[3];
 };
 
 static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
@@ -754,11 +772,24 @@ static void rcsi2_write(struct rcar_csi2 *priv, unsigned int reg, u32 data)
 	iowrite32(data, priv->base + reg);
 }
 
+static u16 rcsi2_read16(struct rcar_csi2 *priv, unsigned int reg)
+{
+	return ioread16(priv->base + reg);
+}
+
 static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
 {
 	iowrite16(data, priv->base + reg);
 }
 
+static void rcsi2_modify16(struct rcar_csi2 *priv, unsigned int reg, u16 data, u16 mask)
+{
+	u16 val;
+
+	val = rcsi2_read16(priv, reg) & ~mask;
+	rcsi2_write16(priv, reg, val | data);
+}
+
 static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 {
 	unsigned int timeout;
@@ -1112,6 +1143,26 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 	return 0;
 }
 
+static void rsci2_set_line_order(struct rcar_csi2 *priv,
+				 enum v4l2_mbus_csi2_cphy_line_orders_type order,
+				 unsigned int cfgreg, unsigned int ctrlreg)
+{
+	const struct rcsi2_cphy_line_order *info = NULL;
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rcsi2_cphy_line_orders); i++) {
+		if (rcsi2_cphy_line_orders[i].order == order) {
+			info = &rcsi2_cphy_line_orders[i];
+			break;
+		}
+	}
+
+	if (!info)
+		return;
+
+	rcsi2_modify16(priv, cfgreg, info->cfg, 0x000f);
+	rcsi2_modify16(priv, ctrlreg, info->ctrl29, 0x0100);
+}
+
 static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
 {
 	unsigned int timeout;
@@ -1189,12 +1240,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(1), conf->trio1);
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO2_REG(1), conf->trio1);
 
-	/*
-	 * Configure pin-swap.
-	 * TODO: This registers is not documented yet, the values should depend
-	 * on the 'clock-lanes' and 'data-lanes' devicetree properties.
-	 */
-	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG, 0xf5);
+	/* Configure data line order. */
+	rsci2_set_line_order(priv, priv->line_orders[0],
+			     V4H_CORE_DIG_CLANE_0_RW_CFG_0_REG,
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9));
+	rsci2_set_line_order(priv, priv->line_orders[1],
+			     V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG,
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(9));
+	rsci2_set_line_order(priv, priv->line_orders[2],
+			     V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG,
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(9));
+
+	/* TODO: This registers is not documented. */
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
 
 	/* Leave Shutdown mode */
@@ -1732,6 +1789,9 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(priv->line_orders); i++)
+		priv->line_orders[i] = vep->bus.mipi_csi2.line_orders[i];
+
 	return 0;
 }
 
-- 
2.47.0


