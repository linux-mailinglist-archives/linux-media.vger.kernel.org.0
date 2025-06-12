Return-Path: <linux-media+bounces-34647-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F7AD798A
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 20:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6A1C7B0B1B
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 18:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239DD2D1F64;
	Thu, 12 Jun 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KSXdLL7Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N1H99MRn"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793602D1911;
	Thu, 12 Jun 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749751350; cv=none; b=ejqfX6+HYkD3e5Ws4tbMbEH9rDdWelmIaarPXdKENRga+CmWwihZbdP2I8tEfw2JPbbkVXatWSvwPJvwaAwqz/UsuU2AiC/alKI+wAlZlz5X57CXEMOMTDu6Q5v3b5n9cJ+R5juFYEJA8KM9MniP72pMNd4zqbmdSYNhvEgPBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749751350; c=relaxed/simple;
	bh=qcH4u2dK8NZcb9BSXPnwsMRusSCLYvoGG3rEI4enl7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7T3E3xqAJmqDtF0B+51lrjGz3vQbblKPu1PWCgOUtU2lRRsacbGQNWAzB16a3yjnUZOdXsv3Cq6pdmRoe/o7VU6fpvOftB5lfSURnAQZ8hccKt6WNPbzW1QWJsrGK8gs3Ij8onHpQfaYUNQPhrrn5aEYUklRA4vV3GPSm+xrzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KSXdLL7Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=N1H99MRn; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AA0DD114015F;
	Thu, 12 Jun 2025 14:02:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 12 Jun 2025 14:02:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749751347;
	 x=1749837747; bh=ESc39m4SqE/KumECm594NnUAI8wChNaLLgysfdqI7ao=; b=
	KSXdLL7Q2pLTUhNMQigf0SG6nocMIqg6YmwqmQj9WqiJgo/tUcJhlRcyfGIasa3P
	tuqN6sxVcTTHi4nj3lHheiKeP1qYXl10uFsGcJQby47t9oNVNGWuhtcskOJzg7H1
	6nCtk8sK4fs2vlojl9b5loONxrR92e4mPYE+JBwbKj+z9B5pRBNchpjK49GqYqUu
	2YKfd/+vZ2vH0W8HRdUTe5dRG6AZI2HYAzofma8gQN+1S5cwMJo96P4KKIjPaDpV
	4Kdh/YDhHwC5PLYXW+eeD0k6uOuuXMGU5o2ogWKO04DIrIO/o3EsSdvsPD437RAP
	t1B/k7Pb/OVfVYVsZ7X5fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749751347; x=
	1749837747; bh=ESc39m4SqE/KumECm594NnUAI8wChNaLLgysfdqI7ao=; b=N
	1H99MRnCGKzUZJU3z91UB1jsIiFT4Ijk8YPaZdwczj+cwWpgyv/M+pinYxIjnu+z
	krsiSA5/zoSdxMji3MJfkawBDOAHti3wSGb5UPAMomjlekDo8uQz2yP4rXfY9XQE
	YAlVMeEttr2UocyYPpsBWEe111lhogF4w7TRTbFZiJxo61E5SV8PVF88yMOZK7Q6
	WFqb9FcNDpFAGGoC2grINqbt1m5Oytqx6NDqCQ3qAUq1LzKPF007IPuxA0aSjvL6
	m22jsmHL7QuIGjL0L0gqqEhKc1ZjEmKJH/uJTvHZie/ph15Cga+V7RjOFFmBq4ZU
	jyjXo/PVQWM6VamjgQ8sQ==
X-ME-Sender: <xms:MhZLaLBhM3E7239QIwyyST_ubLey4BT0VcpVN5U8VgTP1Cvi3i3dxA>
    <xme:MhZLaBjU2lJ_FgR19VSv7jC-hlrhPfmK-PUhn8Qg0HfgTrwZrLSsdQ9gIvFRuE-Wi
    Nv9MB5GsaeK8eJNbLE>
X-ME-Received: <xmr:MhZLaGk2Oi8en3bUemyP03VIH7L8ovGdy0u5mLq9KM_EJYlozLV55E_7Esm-XdGmsjiq3mTcSKK-0KBG9HevK-sn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
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
X-ME-Proxy: <xmx:MhZLaNzsWuQLDLT9P4LkPNIaDBqZRWh1W9whriZTfwpAR0uHaakL3A>
    <xmx:MhZLaARGmEpGMGpebof8kRpBNNk571PQDSoHwGaKptjmbSHEhKAgYA>
    <xmx:MhZLaAYEVBYDNZm0lggwzo863-tP57kI8tQtDFsDIXq49omreS-kKw>
    <xmx:MhZLaBSsiFkJeo-ZR1DovhLwp8Yz_IsboKEXXutYpcemTUyyTKgwgQ>
    <xmx:MxZLaAKXrPeVpUBg2ffNvMANe4YKpFO9_Q1P0TEC_w58Izg3Nmvc9Cq2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jun 2025 14:02:26 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 2/4] media: rcar-csi2: Rework macros to access AFE lanes
Date: Thu, 12 Jun 2025 19:59:02 +0200
Message-ID: <20250612175904.1126717-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each AFE lane has a set of control and offset registers. The registers
themself are undocumented but later datasheets program more of them with
magic values. Before exploding the driver with more defines to name them
all rework the AFE ones to be able to address all controls and offsets.

Also move a stray define that is out of sequence.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Improve spelling in commit message.

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


