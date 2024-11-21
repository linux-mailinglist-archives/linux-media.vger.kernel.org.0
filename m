Return-Path: <linux-media+bounces-21764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A728A9D4DEF
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68DCC2819A4
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0247F1D933A;
	Thu, 21 Nov 2024 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mPa/s/NU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qKccxISV"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459211D90A4;
	Thu, 21 Nov 2024 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196508; cv=none; b=Gum7nqwO0yNglyvk5J0dGbLLameCYMjoaz3P+ERNaY8zwz+8VAvFAYHmLRnzwjF6upI7RRBpEW/GJKw5CSdxwEYgroSCdDoxSp8PgmU3qDk8fe6u0SMjx2+DDCqnbOrsGOZKXE8Rky3Jn0GvsbzInexodLy7t3Em7tJcHgejhhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196508; c=relaxed/simple;
	bh=EwVZ5jXqC2Uav7PMaKs+eXJ84v3vhHCSCH8AaUoSf8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shvI+HEuQ3NeNj3GorPuYs6UNdQN+ODgOFPbacqyj6jugTgV7Huv2QpkSQdsUKKMf42lD/Ung5C2/h7tCSK7d7/94Dnxox2bNxBhKHDtvdAgVc2Cp6p6y8/wcQBoWn07P1N8AGcREiVfYxi0LEzJRRGq5zZHcdY6wkmPERJViF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mPa/s/NU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qKccxISV; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 3DEFC1380479;
	Thu, 21 Nov 2024 08:41:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 21 Nov 2024 08:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732196505;
	 x=1732282905; bh=qgfJTYfvGBLzbbhXNUnnhE2CZUTBCUEYuRJg65iHSbs=; b=
	mPa/s/NUyDYeOwHn5zgZAUaxfJwXuhiVDId7qJVh/mq+jmw9Kw43VKK/BoFBc3ze
	RO3Xy7lE+fQblix/r6f7543AZwljahaWquIl/NCd0JJ4dfnAozO7z+TneIDUSOvz
	r4GF6WLB+ydnHieCxrwCewhWdXXBSjLElWw97WkRP1G0IkmfOvSoJWs6896CHV+5
	u4rULGXC8P8Y/uHaHAelKjRwL9J4skjzCrQM1Bu/t+LVeIiRPaOZUrtXKb4qlPsu
	CszDci3v+3cu/6ByUjyalV+RfattTorugCtYNK6mCKDF/76BswaKfaP7D10IM7gO
	SwlaCDAx0gCPeX3jm1Y1mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732196505; x=
	1732282905; bh=qgfJTYfvGBLzbbhXNUnnhE2CZUTBCUEYuRJg65iHSbs=; b=q
	KccxISVyIW57TqZIj/B6yonoUewRJFoggvzRTrXMsRW6e7qV0LPZlOVklMIsm8mB
	H6hkbNpdSxQHck1navVK61aikkBpZk6aqnf2+sPClF68+3WdUBjqpdiUcVYGLUlO
	/TqhxoweZA32mdO3Ol6wsXrZyoXbJbercLaDO8eCUQx8qSlFgVbcsX+U+rNR0JAi
	la6h5vlU9NCbHi42FSMweTXExPv29j3VkXN0yQiuBzzyVUWuSLU4vOIcjCTlSAFo
	ztjem+OjtoBKvjcJSm4QUwoCkDhq4TVqFaLQvNNe/b9JQKCxS++BDbRCSC8q1DIR
	ES1FEPPCL+7tJkRBNrGUA==
X-ME-Sender: <xms:mTg_Z27szyhOq6qZp1eNYVYW9izFWZ8plySixNmkqX9LplLelp9pGw>
    <xme:mTg_Z_6aUNBOhRzOCQK2fE50QPzaGo42mCxP0iD7daIBREkwPQZOOJvg6NyM78W5W
    2rZ3_ACRjXitOYxIm8>
X-ME-Received: <xmr:mTg_Z1eKGjtmFShc1dCKDKh8QS_UjCGSuLD7EPawF9gBn_RFWuWSdcvR94tkJUoC9xxA0PzNCM4S2Y3dVSsAohvGPQ>
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
X-ME-Proxy: <xmx:mTg_ZzJ9rkF4I8PaYfyyHzaU58c8Uk_r7mZRbldz-h1Gm2hTHQrQog>
    <xmx:mTg_Z6L-Ib43tc7usNtKx0zq9zK1plC_I1kqgGlWoasFsL5S9k7zDQ>
    <xmx:mTg_Z0yTfTn5PesRzFVjnWWHcktR8y1HOvr8X9vWrHeN-y4RV73AAw>
    <xmx:mTg_Z-KQe3FBUFSJnWYv4HFnkCNZQAzKLP7uK7tLezfD-BxXmWyd2g>
    <xmx:mTg_ZwwRDxE8zrYIUCgHmDNyoYrtKfR1rIogScM-6l6NB95V0aB7ugb->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:41:44 -0500 (EST)
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
Subject: [PATCH v2 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
Date: Thu, 21 Nov 2024 14:41:06 +0100
Message-ID: <20241121134108.2029925-3-niklas.soderlund+renesas@ragnatech.se>
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

Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
line-orders order properties as defined in MIPI Discovery and
Configuration (DisCo) Specification for Imaging.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use array instead of switch to get printable line order string for
  debug output.
- Wrap lines harder for 80 chars instead of 100, but keep string formats
  on same line even if they break the 80 chars.
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 43 ++++++++++++++++++++++++++-
 include/media/v4l2-mediabus.h         | 21 +++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index f19c8adf2c61..bb5ea3e00414 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -127,7 +127,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 {
 	struct v4l2_mbus_config_mipi_csi2 *bus = &vep->bus.mipi_csi2;
 	bool have_clk_lane = false, have_data_lanes = false,
-		have_lane_polarities = false;
+		have_lane_polarities = false, have_line_orders = false;
 	unsigned int flags = 0, lanes_used = 0;
 	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	u32 clock_lane = 0;
@@ -197,6 +197,17 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		have_lane_polarities = true;
 	}
 
+	rval = fwnode_property_count_u32(fwnode, "line-orders");
+	if (rval > 0) {
+		if (rval != num_data_lanes) {
+			pr_warn("invalid number of line-orders entries (need %u, got %u)\n",
+				num_data_lanes, rval);
+			return -EINVAL;
+		}
+
+		have_line_orders = true;
+	}
+
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		clock_lane = v;
 		pr_debug("clock lane position %u\n", v);
@@ -250,6 +261,36 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		} else {
 			pr_debug("no lane polarities defined, assuming not inverted\n");
 		}
+
+		if (have_line_orders) {
+			fwnode_property_read_u32_array(fwnode,
+						       "line-orders", array,
+						       num_data_lanes);
+
+			for (i = 0; i < num_data_lanes; i++) {
+				static const char * const orders[] = {
+					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
+				};
+
+				if (array[i] > 5) {
+					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
+						i, array[i]);
+					bus->line_orders[i] =
+						V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
+					continue;
+				}
+
+				bus->line_orders[i] = array[i];
+				pr_debug("lane %u line order %s", i,
+					 orders[array[i]]);
+			}
+		} else {
+			for (i = 0; i < num_data_lanes; i++)
+				bus->line_orders[i] =
+					V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
+
+			pr_debug("no line orders defined, assuming ABC\n");
+		}
 	}
 
 	return 0;
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 5bce6e423e94..e7f019f68c8d 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -73,6 +73,24 @@
 
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
 
+/**
+ * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC: C-PHY line order ABC (default)
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB: C-PHY line order ACB
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC: C-PHY line order BAC
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA: C-PHY line order BCA
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB: C-PHY line order CAB
+ * @V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA: C-PHY line order CBA
+ */
+enum v4l2_mbus_csi2_cphy_line_orders_type {
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
+	V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
+};
+
 /**
  * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
  * @flags: media bus (V4L2_MBUS_*) flags
@@ -81,6 +99,8 @@
  * @num_data_lanes: number of data lanes
  * @lane_polarities: polarity of the lanes. The order is the same of
  *		   the physical lanes.
+ * @line_orders: line order of the data lanes. The order is the same of the
+ *		   physical lanes.
  */
 struct v4l2_mbus_config_mipi_csi2 {
 	unsigned int flags;
@@ -88,6 +108,7 @@ struct v4l2_mbus_config_mipi_csi2 {
 	unsigned char clock_lane;
 	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
+	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
 };
 
 /**
-- 
2.47.0


