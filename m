Return-Path: <linux-media+bounces-32229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599CAB254A
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 22:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CA8FA00141
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 20:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E0B2882CF;
	Sat, 10 May 2025 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ki5NbIza";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YLz2yJf6"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B72874E8;
	Sat, 10 May 2025 20:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746910590; cv=none; b=KKc9QhoLTSKokT1Bj9Z0rRONnhK8+mp/T4fbPYMEC9RM6q7qQV4ucmBXv4m3BLpj4tdOv2WukNtDSIVQGamUReeIuIlglE9VzPmx7mOMzxKZ1Gpbuv8D9w/m5OEcbsdnO4UpRDG52czb+Vl8q2/qjYxR5gDv+gSoGULC2T/sXb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746910590; c=relaxed/simple;
	bh=SO2tYSgoQpfAnOxpjqNMQrNy9egqmugwk89GCJ6o1O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=smaDY3U0MS0734U0iXDoy1zAo2foQPFSc/o2+fEb6VDUiOuKBWv1kXTtAQtVt8Iea6Huhzjv1eFXuuhshVz1wrJT4v6pEjSt1l4CYkbQniCAvFLxVNEOTUvuhoeBP1M0c3fO+1iM0HijS62bGg5WzSG4R1ypmLOgUDdKDwtuebE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ki5NbIza; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YLz2yJf6; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 3D46D11400D6;
	Sat, 10 May 2025 16:56:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 10 May 2025 16:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746910587;
	 x=1746996987; bh=8Nne513i2EyXdAQUAfMAipOfHcXxKd0ViL9XhatHuOI=; b=
	ki5NbIzaDiShMThls/wPSA95Q/9iOc4lN2uGzOekfhylZeoVf8AgsrxVs1yy+pN8
	dfttcyGCWVoPRFyTeCCWTh97d2tu8KtBkxuGnvLiTvhO/a05XWsOA/7lIvC/GKYP
	mne9OdeDmjGxlDVcp0j3bCura8Fl8GhufBfPEVjVHKXowzB784gqNdJfMv+rF8SV
	D3Si8n2R+w4x1iyEXfVTH0DsiwiyrU0vuEUZXT6S0Bm0lSRkgwgwhC7KufDp5bnB
	aOPvWZVYebVNIa6UDPujQtQu8IY78+UhWyr0ZVTGSSMARZ7/75zeshMqUPLKLIMy
	38WNpWgdgCxOHKjutEI4LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746910587; x=
	1746996987; bh=8Nne513i2EyXdAQUAfMAipOfHcXxKd0ViL9XhatHuOI=; b=Y
	Lz2yJf6XQ5IuAYsR6IpOeNNazbNfEnaTpKoKeSiRsyOxbSbXKtd7gnxEmlck9rfo
	3ZHoxVGN5cXYJ0Ng73jXvYkKtOfGMsUpD9bc0kFg0l9ZhZFYDa6lzG3fxrf6AMdz
	p4/1C4QyvMTGgJbrKr/cVMXouoPqw/pJdfKkSqvCpFQE7Kxf1g6bRi9MZRG3o/3G
	sFp0vRppjoSc8OPD4lN3V5W7gqPrm+UZnoBM6kundEYuyZAmbmPBjmEHe4TxlUPO
	a5Rk7S0v+DQnw2TjcuUAo7TSrEiELHDCNW1Ifs0Twy/QpkpKaUcxyEZrgFpJUFVw
	Ft0J5TLGvIPaAzY/YOcNg==
X-ME-Sender: <xms:er0faPB6xzmkIrM7ct0NExUmoSTGaUsxfNFDblrw3FL-cFS-wrAdfw>
    <xme:er0faFgUmY8fPy6WJs5rI4q9KrwZsKKXuVSO8XDS0wDpdzxHiPqhowP7SKXRzFe3t
    seOCJ7FvLcdxCPfwRE>
X-ME-Received: <xmr:er0faKkR9bSwnneAPIyrA4feKScfnjovHmgj26CcEtSFwl75MOkbQDFw6pmSo7yOzhgoIwgA1Yn8gQCqM8Po6riN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiheduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:er0faBzH5VQlefWexAdw36Z_Q8FNtjTPzaqmkT7phI0nsOQHxry8_A>
    <xmx:er0faESzzKhiV8evZXxxxpMIs1c69PbZYPOV_q3tc-0s2zQPESZ1fg>
    <xmx:er0faEYIzoMPWA0RdVVrA_17F3hADmO9FAH9t_V1rTHxPIjnWgHIbg>
    <xmx:er0faFT7TQFb9sJM9iszrpMFjcMjlcQt0Bnhv363YawL6wuOD23f9w>
    <xmx:e70faPsuivaI3VF15vZggsAXMv9f5oky3_taK0DiCUdab7UwMGvalEah>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 May 2025 16:56:26 -0400 (EDT)
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
Subject: [PATCH 2/4] media: rcar-csi2: Rework macros to access AFE lanes
Date: Sat, 10 May 2025 22:55:32 +0200
Message-ID: <20250510205534.4163066-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/media/platform/renesas/rcar-csi2.c | 33 +++++++++++-----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 358e7470befc..d7f8b10cd215 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -177,15 +177,15 @@ struct rcar_csi2;
 #define V4H_PPI_RW_OFFSETCAL_CFG_0_REG			0x21ca0
 
 /* V4H CORE registers */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE0_CTRL_2_REG(n)	(0x22040 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE1_CTRL_2_REG(n)	(0x22440 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE2_CTRL_2_REG(n)	(0x22840 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE3_CTRL_2_REG(n)	(0x22c40 + ((n) * 2)) /* n = 0 - 15 */
-#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANE4_CTRL_2_REG(n)	(0x23040 + ((n) * 2)) /* n = 0 - 15 */
+
+/* l = 0 - 4 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_2_REG(l, n) (0x22040 + ((l) * 0x400) + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_3_REG(l, n) (0x22060 + ((l) * 0x400) + ((n) * 2)) /* n = 0 - 15 */
+#define V4H_CORE_DIG_IOCTRL_RW_AFE_LANEl_CTRL_4_REG(l, n) (0x22080 + ((l) * 0x400) + ((n) * 2)) /* n = 0 - 4 */
+
 #define V4H_CORE_DIG_IOCTRL_RW_AFE_CB_CTRL_2_REG(n)	(0x23840 + ((n) * 2)) /* n = 0 - 11 */
 #define V4H_CORE_DIG_RW_COMMON_REG(n)			(0x23880 + ((n) * 2)) /* n = 0 - 15 */
 #define V4H_CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_REG(n)	(0x239e0 + ((n) * 2)) /* n = 0 - 3 */
-#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 
 /* V4H C-PHY */
 #define V4H_CORE_DIG_RW_TRIO0_REG(n)			(0x22100 + ((n) * 2)) /* n = 0 - 3 */
@@ -197,6 +197,7 @@ struct rcar_csi2;
 #define V4H_CORE_DIG_CLANE_1_RW_CFG_0_REG		0x2a400
 #define V4H_CORE_DIG_CLANE_1_RW_LP_0_REG		0x2a480
 #define V4H_CORE_DIG_CLANE_1_RW_HS_RX_REG(n)		(0x2a500 + ((n) * 2)) /* n = 0 - 6 */
+#define V4H_CORE_DIG_CLANE_1_RW_HS_TX_6_REG		0x2a60c
 #define V4H_CORE_DIG_CLANE_2_RW_CFG_0_REG		0x2a800
 #define V4H_CORE_DIG_CLANE_2_RW_LP_0_REG		0x2a880
 #define V4H_CORE_DIG_CLANE_2_RW_HS_RX_REG(n)		(0x2a900 + ((n) * 2)) /* n = 0 - 6 */
@@ -1246,11 +1247,11 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
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
@@ -1267,13 +1268,13 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
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
@@ -1289,8 +1290,8 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
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


