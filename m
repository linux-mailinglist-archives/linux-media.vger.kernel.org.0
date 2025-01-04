Return-Path: <linux-media+bounces-24251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C221A01693
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 20:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4E13A2742
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2025 19:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95CE1D5CD1;
	Sat,  4 Jan 2025 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JJR2OSsp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ipCSNoz8"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB664C9D;
	Sat,  4 Jan 2025 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736020632; cv=none; b=PW8ocbLb0TB8o6BjoCD6oMbXV12ua7WKffLEn3JlsaDp+ZNZl1qN88IazpOAmYel0H8ey49cC7PxTR8Jo+Pav8fcYNdih3unct5t3okqxr18ZmPHvr1yecXxqEPHTJAQECNGnyjKbEnoSITloDCyYXIKdm1t0lmPJYrjyknMO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736020632; c=relaxed/simple;
	bh=GIqFPcIPDL8N3uqaFtGti7ZmkCBgON6sP2qJSYccXJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4Q7k5ySrWV6CLJZp0ymzdqiKEB72tsUdJ3Jq6M53jugWhVxWaELrIXBLl1RwkrQGUHqLb+dRcRNXfgJGbny0RSLJ9XSpCLgIBDskFH6HG5w/U2y6BhS47LmywY58czHkGA7xi0CzoWyUd+hHogIrMhi2mog/WVITBlRJZw7VRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JJR2OSsp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ipCSNoz8; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 50A71114010E;
	Sat,  4 Jan 2025 14:57:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 04 Jan 2025 14:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736020629;
	 x=1736107029; bh=r837jh24yXoA8gp2+I/Dys+rd+1nDgZ5PuemLQfc7f0=; b=
	JJR2OSspiV7Uh3CfpvEQGLYI6G/P15isaOgDsSp3Bj8D42/oG7mzVz9wZ5ShtzOo
	ZiicvMaF9dW7jdTG4p5oZVoAMeMN8U6nQp1mO62ET/zy7dy6ix63XrTHgtdytchE
	UbO/XnGeaY4e/9yXN4RzEs1FFLGSrVIq11hwsFzOwLrHbtB0qj+vthU2kePzPNpi
	FgiT1feG9mkry1nS7zWWmZ4SMKxMv98kwEtu6RDqMfkIT1bTJyobWsAv0Ojo5F4K
	nMCmH4ulVaHK+tVujqGhqg/bXR2wG6qI075AOO52vMJVnVWqzmZCqPkyt25Acgmn
	rJ0mlG4X00FKyjtdtlfXKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736020629; x=
	1736107029; bh=r837jh24yXoA8gp2+I/Dys+rd+1nDgZ5PuemLQfc7f0=; b=i
	pCSNoz8nv1EpDeuUpQSdpd4CABlowm0k7/lOj9l9GiZyhSsbVCqqV2Sn7dJh66oU
	a9KOfxUei3mqQ55yXiwbzqiBC5UT9wdwwqUGZ0ucAgFcAAiin68WmyIY8DpVy3uU
	Cld6oUjOFZ5IEXSIqZPj0R1OrybA5wmhG1DctcUrvuH+l0WKd9HGsPcHnnIOdETk
	LrbF4lpv7N1VdIQ1R/jeDpm1D1b1oVJ+5aJWTdSqqK1JysxXpksnHNAseZADdDeW
	brtd83ADEQeLzU3TggkJw6T7eg80cZ+XF7B0VILt7O9A+Lvt8JMBvW7f37mJxc8l
	00xqwxNdBkHv9Q9Geke4g==
X-ME-Sender: <xms:lJJ5ZxjCHB5F4cuKCtbVrCr-kjCE5CpzVNOK9Ey2N-qMS0DH7xSckg>
    <xme:lJJ5Z2BQtq6P9hefINHHsySfoXXc2zoZr5QwIjGqMOoQsnP8iyWOHfXh6tXyW7-5t
    J959EgQVZilp0uLEeg>
X-ME-Received: <xmr:lJJ5ZxHRtn-LKO8VVka8mcmu5opv2vD5j0LomWSJGu_p0NNtdYNDvq6cnkHBePLObARo7GkLUmwXwQXf04B1KdknFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefiedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepghgvvghrtheslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguod
    hrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:lJJ5Z2S2O18EewF_q0_6aeLcdZ3fGkl5IyUMMyL2KnE9pHW7aFlFng>
    <xmx:lJJ5Z-xEvkoPIrDOpdpAbGU77Gnu5aCicjGGekxN9Z4nfvECmEBRDA>
    <xmx:lJJ5Z878ZXeOUjXoZnb6biKsSY6v5agfpMRdqu0rCS8xKmZnI5y2eQ>
    <xmx:lJJ5ZzxJE5yTTp1g0Td3v3BAt0kmPdstZPiPlmuSHVhYhXMb5RCRxw>
    <xmx:lZJ5Z1ndHn2XbfBdLKYvivcN7uuw7UK1OQmdmsUwjNBEVh3eVvi19_If>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Jan 2025 14:57:08 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] media: v4l: fwnode: Parse CSI-2 C-PHY line-orders like bus-type
Date: Sat,  4 Jan 2025 20:55:48 +0100
Message-ID: <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Provided a safe-guard from the raw values used in device tree sources
and the in-kernel defines used to describe the different line orders.
This mimics what have been done for the bus-type property to provide the
same safe-guard.

The macros used in device tree sources are defined in video-interfaces.h
(MEDIA_BUS_CSI2_CPHY_LINE_ORDER_*) and are only visible to DTS source
files. These raw values map directly to the in-kernel names by fwnode
defines in v4l2-fwnode.h (V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_*). These
fwnode defines are finally translated to defines which are exposed to
drivers to act on (V4L2_MBUS_CSI2_CPHY_LINE_ORDER_*).

Previously the translation to values provided to drivers have exploited
the fact that the numerical value for each setting are the same for the
defines used in device tree sources. While this is unlikely to change
this harmonises the bus-type and line-orders parsing to work using the
same mechanics, while at the same time make the large CSI-2 parsing
function a little more readable.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 80 ++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45..69f6d1df8c39 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -121,6 +121,70 @@ v4l2_fwnode_mbus_type_to_string(enum v4l2_mbus_type type)
 	return conv ? conv->name : "not found";
 }
 
+static const struct v4l2_fwnode_csi2_cphy_line_orders_conv {
+	enum v4l2_fwnode_csi2_cphy_line_orders_type fwnode_order;
+	enum v4l2_mbus_csi2_cphy_line_orders_type mbus_order;
+	const char *name;
+} csi2_cphy_line_orders[] = {
+	{
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ABC,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC,
+		"ABC",
+	}, {
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_ACB,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB,
+		"ACB",
+	}, {
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BAC,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BAC,
+		"BAC",
+	}, {
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_BCA,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_BCA,
+		"BCA",
+	}, {
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CAB,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CAB,
+		"CAB",
+	}, {
+		V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_CBA,
+		V4L2_MBUS_CSI2_CPHY_LINE_ORDER_CBA,
+		"CBA",
+	}
+};
+
+static const struct v4l2_fwnode_csi2_cphy_line_orders_conv *
+get_v4l2_fwnode_line_order_conv_by_fwnode_order(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(csi2_cphy_line_orders); i++)
+		if (csi2_cphy_line_orders[i].fwnode_order == order)
+			return &csi2_cphy_line_orders[i];
+
+	/* The default line order is ABC */
+	pr_warn("invalid line-order assuming ABC (got %u)\n", order);
+	return &csi2_cphy_line_orders[0];
+}
+
+static enum v4l2_mbus_csi2_cphy_line_orders_type
+v4l2_fwnode_line_order_to_mbus(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
+{
+	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
+		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
+
+	return conv->mbus_order;
+}
+
+static const char *
+v4l2_fwnode_line_order_to_string(enum v4l2_fwnode_csi2_cphy_line_orders_type order)
+{
+	const struct v4l2_fwnode_csi2_cphy_line_orders_conv *conv =
+		get_v4l2_fwnode_line_order_conv_by_fwnode_order(order);
+
+	return conv->name;
+}
+
 static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 					       struct v4l2_fwnode_endpoint *vep,
 					       enum v4l2_mbus_type bus_type)
@@ -268,21 +332,9 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 						       num_data_lanes);
 
 			for (i = 0; i < num_data_lanes; i++) {
-				static const char * const orders[] = {
-					"ABC", "ACB", "BAC", "BCA", "CAB", "CBA"
-				};
-
-				if (array[i] >= ARRAY_SIZE(orders)) {
-					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
-						i, array[i]);
-					bus->line_orders[i] =
-						V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
-					continue;
-				}
-
-				bus->line_orders[i] = array[i];
+				bus->line_orders[i] = v4l2_fwnode_line_order_to_mbus(array[i]);
 				pr_debug("lane %u line order %s", i,
-					 orders[array[i]]);
+					 v4l2_fwnode_line_order_to_string(array[i]));
 			}
 		} else {
 			for (i = 0; i < num_data_lanes; i++)
-- 
2.47.1


