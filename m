Return-Path: <linux-media+bounces-21766-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C2D9D4DF5
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85593B237CB
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150591D7E52;
	Thu, 21 Nov 2024 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="IS9fSqTl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="3aeivZ6h"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD131D9592;
	Thu, 21 Nov 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196512; cv=none; b=n2uwPdNGKVAXmPK6EclVNy6SGLm9XkIgdvfFBnse1y647G8A/vz3GKwuJRrsgHchryoLYHUHpVW7EcCsvO2F+Hd4WbSmbJpGa2I/DSzoCUtjYTYXu+lTsGv14GzXa/gI6inyvZSxa68qfVj6jVNDDWwCxTJKs10v89HCYgT8QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196512; c=relaxed/simple;
	bh=SAh5j4sQm3/rxfJOnu1J5G2uBjs1g8Fmz2NZQB9Nb/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbBTWQPH3owxobLFWaZwCqqLX5j10jaLddlMSXvJd7R0GUR3qlnhLergdoFS/4IjbSWdazATtWxFpU1UbrvxtpsrEPa+4nePqN4+XO/QdXQlvURpz1YJHvJRsiWSRrVvDhPqg5jF1nQwPnHdujkZwyFZmWdi2Ng/S4kFxXA1PpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=IS9fSqTl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=3aeivZ6h; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C2D1213801B5;
	Thu, 21 Nov 2024 08:41:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 21 Nov 2024 08:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732196509;
	 x=1732282909; bh=BteyqdTqeFE45omOjvPvOTy8X+JhDJuyouFhWjaJcBg=; b=
	IS9fSqTlLd6VZ7Ttihd0llqhbgTiAoMLV82IaioWEhaYNBxRBL3CxzaxJvRUXJ4W
	9oUrqqdSsl4HPQquskHMAQpaDpzmFSJTI+K7EpPohn/jMjtNLGzFiLikLWEm2z0x
	XbbIvMNjXhsacxax3ZjFd7ysq/vW6wZvljaImu1ySBD3IRry1lNRjshuwnOkA4Pb
	QVkW7hmHdQkz2FmYQbb139AnVfcrqViC4YcL3WbsAJztL6gwQKDEhP/em5FUmCSc
	O7uYmLAIUgDq+H5bXh41Om9NPNs9a1oOq+V2bgvuGeA1vQ/DKOZWpLYdAXSYAAGO
	vywCDb7lUbqc5DOHti2IBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732196509; x=
	1732282909; bh=BteyqdTqeFE45omOjvPvOTy8X+JhDJuyouFhWjaJcBg=; b=3
	aeivZ6h4pOmgRzxgqbuGu+a0Vh4wSoElwAQFSD2d7xIbrx1vJjUvGdqSAbkRZGQP
	RB+W8O5Vouzslx+v0qNXH8cAfNu/h1Aj9a2vPqMPP7uZFNRV3lwSzGbVDEz5gO+J
	KOa5Q8Ijzx6ELSV35iJ2fcN65B085B+S0SPREiRfEykphNQdkaELOovKxWqXzMpe
	f+2ZM06WqeTKviy9jp71bxnJCgwF/Hdfmvzj0JxKDBkL44NWL8mWcCjdJXzYBsv0
	1o3wAl6fsklfjTQkurKUxX9M/aHXUYhEtp7OUlUtjmPAAweVFm4l615L8eqGl0vv
	+ROLF7dxcn5KfYtnjNy7g==
X-ME-Sender: <xms:nTg_Z1q_m1tebtRXxGvJJ93QN1ipceGYrvIfS4aoYGfuRmriVz6jJw>
    <xme:nTg_Z3pxKarWYkowBYgTSsKqJS1ZFu-HnL9P2JheVOhECg6DAe9ZmL_w_gKY_nZd5
    UbfYE_jxlZtHJr0JIw>
X-ME-Received: <xmr:nTg_ZyNFcQ8ibkiL4wFO0M2HQ3I-0DdRaRmhKghWgiyMa47Ig_Li_DXuaGAjxq2EDCyzkXVJ1HA2_1RGy4o6Dm72xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfe
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrh
    htsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvggu
    ihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvg
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nTg_Zw5Of7LobEZt6id9cpAFcfet4EjaVwBbUpxo8lxwONmm_OY4QA>
    <xmx:nTg_Z06UgLWmh62AAlCVQh13a-nkPXotazH0cEWwZTRIdWz-Q6J5hw>
    <xmx:nTg_Z4jVy6lgk8tDoUr16sWKsNSqd8nyIVit4hytzj81D7yBHtbNxg>
    <xmx:nTg_Z26sn6nP-NQPny1kRcVpNyjuvE6IwjJNecISIFEl0M1X1B48jg>
    <xmx:nTg_Z0haorSfuiEJnWzAoSatejCZ77MCzBk6y1IhdX2etil3SLe-0vC9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:41:48 -0500 (EST)
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
Subject: [PATCH v2 4/4] media: rcar-csi2: Allow specifying C-PHY line order
Date: Thu, 21 Nov 2024 14:41:08 +0100
Message-ID: <20241121134108.2029925-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
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


