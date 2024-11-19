Return-Path: <linux-media+bounces-21604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B309D304A
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8911F2349A
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 22:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CBF1D4333;
	Tue, 19 Nov 2024 22:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kNt+nITR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MWUxHf+R"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C59A1D363A;
	Tue, 19 Nov 2024 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054430; cv=none; b=biY8H49HfrKz2JzoTWDYbK1xKmXsVdY4wklHli4mLX19Cw1sNLPY6ce5Nxv12ZR+bk2+YNHVy/vzpXemR2NK4dhucQcZxRYxqYdU2pmbj5H3VSKI8xRiQvGNmW1RnYQTXg5QlDjX3uJRGRdzth752DF58DULOd1yEyQgKkUOskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054430; c=relaxed/simple;
	bh=SpGuvPR5gFXb42HEE897WTNx+u0llYuVQsTbuHRxATo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1zALpDjEWlvfl1nOJWcQYhz5Q6At9XaWlLan5n/ZCqoLcs6sqViHIGmRHlXsV1dTXSNdhFEi0i4heBw07+sKUHj6kt9aTRUkRhhNPwjVvXFIcQjfr7q+JRIGfvhUE3eA51gedqAzwCZJvYjfvZyeL17jxvaf8//j5ShkyvKlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kNt+nITR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MWUxHf+R; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8CD541140105;
	Tue, 19 Nov 2024 17:13:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 19 Nov 2024 17:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732054427;
	 x=1732140827; bh=7MeofqWzIEj5y+Ns9slaJqHZlxP93a/Bw0I2Wl3Rt6M=; b=
	kNt+nITRxBvtD5cTJXQrKZcChnfQDgVPrtwE7izioO3rJmUmxClibj7m4o4MCoIL
	LAy5Xktd7aKYI7/3wbzrbfU1ki6Iy4Mjnn4/NmXc6IbugsD2nudWbo8sJlIkgmM6
	xMvll1OvP1OH+9a38rJxqcYpu4IY74utIeHk31W+UNhlkmeIG9tnlmup9FHMwHqA
	39OUHwxS6O+JiMvb+kKtWmn9v4ys4pmU0rtbR9VOF3bq2YPbsSNOVKL+B9ux/krP
	wjbKIYDdpcE8OYtcko2ZzBAgDc79MIu+P/6Xs4YlMd/CivhUs5ENea3EHEjAfTve
	SgV8gXSSfWCVTk2/nZz8AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1732054427; x=
	1732140827; bh=7MeofqWzIEj5y+Ns9slaJqHZlxP93a/Bw0I2Wl3Rt6M=; b=M
	WUxHf+R/cvFsEwlDwbp0RJZyiSNsN+lYAqGIxFU7mbUnb6JkLUJk8Cz8JFs5nImH
	zsVZkP999iXAuUJx1fxFvE0eNR0D60/aAwUfYQkkQU0KruZedlb+GWkJVe0xmEGI
	lJ7kbz5CV+zIt1CNwYJSI/YKrPBdGhpwByjXzIK4Wxibqkn06V/YjAvcZiHAbtMX
	Ocfg4mLYYhPwvynOS1+Q5Q7zlhclqwap8OaOxND1cSITGFnV7uXKefoVPObJBAvS
	0U+Hupbw/x5XBqxlIp8hgx7EiICErVU+FyIB3fVfufiqW6uCyXzpgHK2XQCh4bQ/
	OUWsHD4daRgETvI4hvklg==
X-ME-Sender: <xms:mw09Z_UKPmp9HsLYcBq0JodsCdbRxHm_WxtJN55zW37JSxADd1cxaQ>
    <xme:mw09Z3nkFNJFmO-18sxWQFrPrHAj4WUl0PToBp0skFP5klZK3-C04BioLSzmadUCs
    BP73wsbxS1WSNhTtvk>
X-ME-Received: <xmr:mw09Z7ZVFr0SyJFtWgKbjL911NYu9_WT96WPVgEs5wsZlSnJDbdbpfMFTk-6ZmHdpI_M3zM0DDF_0o7lON1hJQN6MA>
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
X-ME-Proxy: <xmx:mw09Z6VuL7B14DiTR1bfEyX3mzEcuidZvTql7pVKWbNww_k2pmLAzw>
    <xmx:mw09Z5ke-vOUT9-OkkFz5JiVy2OGfLtR2PrYloT4AInzKj9FERMR9Q>
    <xmx:mw09Z3cZ7_xWbBii8H6FmHN4NYcJoB3vh0PbE-EyRRkiW8B4RbtHhQ>
    <xmx:mw09ZzFTAKHHWWqL5XgUgeinaLIMblfgjFJB7Hvuj2OalyXhMarOOw>
    <xmx:mw09Z_d3an9TkzVxeFoAIenvjl5UMKKy29sPDoyGf8dDkZfR-WG15gGF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 17:13:46 -0500 (EST)
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
Subject: [PATCH 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY line-orders
Date: Tue, 19 Nov 2024 23:12:47 +0100
Message-ID: <20241119221249.539610-3-niklas.soderlund+renesas@ragnatech.se>
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

Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
line-orders order properties as defined in MIPI Discovery and
Configuration (DisCo) Specification for Imaging.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 56 ++++++++++++++++++++++++++-
 include/media/v4l2-mediabus.h         | 21 ++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index f19c8adf2c61..b8b2b7fb685e 100644
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
@@ -250,6 +261,49 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
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
+				const char *order;
+
+				switch (array[i]) {
+				case 0:
+					order = "ABC";
+					break;
+				case 1:
+					order = "ACB";
+					break;
+				case 2:
+					order = "BAC";
+					break;
+				case 3:
+					order = "BCA";
+					break;
+				case 4:
+					order = "CAB";
+					break;
+				case 5:
+					order = "CBA";
+					break;
+				default:
+					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
+						i, array[i]);
+					bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
+					continue;
+				}
+				bus->line_orders[i] = array[i];
+				pr_debug("lane %u line order %s", i, order);
+			}
+		} else {
+			for (i = 0; i < num_data_lanes; i++)
+				bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
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


