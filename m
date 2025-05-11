Return-Path: <linux-media+bounces-32244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F740AB2A21
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 19:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB42E17842F
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE3925DCFC;
	Sun, 11 May 2025 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qdvZjRA5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KBPt6F/n"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3325D918;
	Sun, 11 May 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746985669; cv=none; b=JYpPhJUdcDpVRr7ER49/Zll5nrsDKFELSRmyxN2/6HiJMw9KGs4Z2J1L6WDBii6Gw4OWNasD/5PkeQP270ManZn05Gzr8RFjk4YWW03Kjn9HoRDrKWaVqFA3K78KdMUJKLmdOnZFRmdoZ2QJ5fKGWrYz55gG7YNeF/jj7tIftsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746985669; c=relaxed/simple;
	bh=tWjzf5Af88sJQdFb+L+UB7aG6RgPwTej4r3OFiLNfoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHRmYsLcF9DuOufdp6y3InU03TnFqVgMW7WI0nGbqiB7te7xlWHqpcxUBFrQWm8816pKszcFltYNbOrGPjf+xs+8Yf9BfnTwHzh3TWexlkmY7a2L9Q7jxAGb3yJgH04fUFR3dXTzLOI7U2Ex7jcNsP+si3DKp8YhHFS+A6fNQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qdvZjRA5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KBPt6F/n; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 53E651380169;
	Sun, 11 May 2025 13:47:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 11 May 2025 13:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746985665;
	 x=1747072065; bh=6VHLyenWm86twpprX/FVd3120dOtEwBFc2NKlgBw7J8=; b=
	qdvZjRA5LYBiuy6Z5dnOrdnigw8XWbDV3SA/zav9wrGB9S4bYstK3qaacIBEvcqj
	8E9NYHpSjNewZ93Piz6xdEKZf0dOpRroXYsqshiEkmZ6XfA5jbZv45X14/urjyWA
	piHBz3d3q8dhQRXQvPtCxRqPFtUJX8HAC1IUndw/C31zQybTEhUtpa47aoaiuZEd
	IHh3Ja0HXFQoEsSPKiXa09pzZf53vTZSafudUJJWKO/ORr3SRFh9QKO7Z5qj2dra
	tGB/xFS6zIcyJDZ/uTOZlcMI6OuDoVl7uZUU1Xrv63Pmp+RutGuyzquMwljswWuP
	owVq/HXjnjAqwFefwxkqRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746985665; x=
	1747072065; bh=6VHLyenWm86twpprX/FVd3120dOtEwBFc2NKlgBw7J8=; b=K
	BPt6F/nlMKljLDr2SE+p3eDF5OjwKSPNMIrcnAgpHvi59ViPjY+cvdAOmPdKrxmZ
	D/4ZtBunefibosoCy219GdcMaa/2YgtMiAKOEHAYx15LnNjkQ5H9IeEjQ/9EyVqo
	4RXrBpkNeNIQLO7zaNgf9LKJgx0EgShfCNnFvtnsqMSkjrP8/y4OaGLcvc0fw5Sx
	zGTK2GXpw4CyJ9+fmZilxtEzfJWN4tLA5LdwKDR3H5diVwO8WkPxFWhMgxtRJQwj
	BzGuBpLmmKStZrImotUayDTwIcSwSqRe/mL4f8TWh6nIRV+4y0MOm5L+P9CVgWKX
	RLShSaXJ57FfYkHhKEeng==
X-ME-Sender: <xms:weIgaAZMX1BRJ_rL1AtLK60loloG8FnlNW7abq6Xq6MJ0507JW0HzQ>
    <xme:weIgaLbeXmgLOxqDbgtq4MGlsClHZJxUUODEW_0jkoEomNSgwvUK7zDKI16YvTqZ6
    UpN52yoigKxrYQGh1g>
X-ME-Received: <xmr:weIgaK-vpMcKFaV24wDlAiqksLrEEfPz1m4Vd_MrIzZL-CmRIVEmKQqbH-W-u1DwuJG6lGjtrlrCqH7HyBdrvMl9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeltdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvg
    hsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhht
    rdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:weIgaKpzLfOfRJDk1BP_SAvDW1Y9ZSV77cZ3-0z0oPsioZpBe00pfw>
    <xmx:weIgaLq_QKmO7PplMZRnwnvpUwX9G8dptkd3mEPrEoyC3_rQZagJpg>
    <xmx:weIgaIRaMcluBWCQnzm2jt6wltMv3PcGg7vhTy2Dze7JcGiXMgnphA>
    <xmx:weIgaLqzo121c5wbxngq8EPmtNzcZPtWmcE9v_HpoeDjD2gSvno97Q>
    <xmx:weIgaLl6dSXyOOnzjDKTw-aBr1JIafqAaxdfihEOLBhgflspD02eHbP0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 May 2025 13:47:44 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/4] media: rcar-csi2: Rework macros to access AFE lanes
Date: Sun, 11 May 2025 19:47:28 +0200
Message-ID: <20250511174730.944524-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each AFE lane have a set of control and offset registers. The registers
themself are undocumented but later datasheets program more of them with
magic values. Before exploding the driver with more defines to name them
all rework the AFE ones to be able to address all controls and offsets.

Also move a stray define that is out of sequence.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Adjust line length.
---
 drivers/media/platform/renesas/rcar-csi2.c | 32 +++++++++++-----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 358e7470befc..cdd358b4a973 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -177,15 +177,14 @@ struct rcar_csi2;
 #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
 
 /* V4H CORE registers */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(n)	(0x22040 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(n)	(0x22440 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(n)	(0x22840 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(n)	(0x22c40 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(n)	(0x23040 + ((n) * 2)) /* n = 0 - 15 */
+
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, n) (0x22040 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_3_REG(l, n) (0x22060 + ((l) * 0x400) + ((n) * 2))
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_4_REG(l, n) (0x22080 + ((l) * 0x400) + ((n) * 2))
+
 #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
 #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
 #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
-#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 
 /* V4H C-PHY */
 #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
@@ -197,6 +196,7 @@ struct rcar_csi2;
 #define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
 #define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
 #define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 #define V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG		0x2a800
 #define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
 #define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
@@ -1246,11 +1246,11 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(2), conf->rx2);
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(2), conf->rx2);
 
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(2), 0);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(2), 0x0001);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(2), 0);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 2), 0);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(3, 2), 0x0001);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(4, 2), 0);
 
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO0_REG(0), conf->trio0);
 	rcsi2_write16(priv, V4H_CORE_DIG_RW_TRIO1_REG(0), conf->trio0);
@@ -1267,13 +1267,13 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	/* Configure data line order. */
 	rsci2_set_line_order(priv, priv->line_orders[0],
 			     V4H_CORE_DIG_CLANE_0_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9));
 	rsci2_set_line_order(priv, priv->line_orders[1],
 			     V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(1, 9));
 	rsci2_set_line_order(priv, priv->line_orders[2],
 			     V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG,
-			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(9));
+			     V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(2, 9));
 
 	/* TODO: This registers is not documented. */
 	rcsi2_write16(priv, V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG, 0x5000);
@@ -1289,8 +1289,8 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 	}
 
 	/* C-PHY setting - analog programing*/
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(9), conf->lane29);
-	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(7), conf->lane27);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 9), conf->lane29);
+	rcsi2_write16(priv, V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(0, 7), conf->lane27);
 
 	return 0;
 }
-- 
2.49.0


