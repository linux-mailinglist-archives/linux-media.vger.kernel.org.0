Return-Path: <linux-media+bounces-26472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66736A3DC7B
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 15:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8384218A6
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219AD206F0C;
	Thu, 20 Feb 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtKKK1Dj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82B7204874;
	Thu, 20 Feb 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740061074; cv=none; b=E4IC6dEovCe52qOVe4rEwSdhk1G2pj6Gs6fOLkRUu0gCOjWUxBrM2MhXecLE2ubHWFvYL8+WQgZibpYKqEmkIEsm+Sd+Q4UBLJDxdKdpnGx36gBWSDELL05tuYnnYlUaG6Hoj1n0hyXz/t9xvajhf/RHorbhM/YPoC67ByNmJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740061074; c=relaxed/simple;
	bh=CWodvW4NCBIlUv6/PqgOLyTNVvQ6Z0Bh5b4w0MpQRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmEbJO6ELEj+5ZtJQrKxF9uenuYuD7DUGHVHHKfxNf8i1goGeCzRHlSRBZkTuKM+n2h4OrTE0doH+UShmtVZVpJ2sE7ymGx8jW1rXkMUg7ovFy+rhoO5kF09bd0+Hd1s9yX/Q8ffz+HlLUdR/xrhgcTZJPnL4N0EdQPAjWzHdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtKKK1Dj; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so1319409a12.0;
        Thu, 20 Feb 2025 06:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061071; x=1740665871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=EtKKK1DjPLxFEBj0SaypSltUTPnGYbR57ROQcrqr8F5X/uyzdUsQzCmK/1QJMPjMra
         AxmgVLoDPDYYus9/uxZPUqALav16u7BoQ73XELtKtQWIrqg1C+ElkU6Veu//TDp/P5l/
         HRNLMkdRTus5Xw/YP3pG32b4irq7tWSSMAYZMU5eI5/XL6DZ3M7vaGE6iU2qh43WuOBt
         zpUrj3KUO1tfTeTOAfSH/kJpSes4yDYCHk2ribQ2VgnOgh6wdO0tDp7luG70FcE0P+oP
         bN/+THVh+6v9y2BDkP65LmZFo0r/rhztH513bl2a3PzhqLdpvDzGUak2bHfE8+dEv/Xp
         CzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061071; x=1740665871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=bpcU4YeWUveVjAw+LSDA3+v71VzLP1GeRNm2IzQRZnCwTyXZYHWB/qNVl5PN3Vg0Kh
         tGAHw0KvhDP+QbNXiEAB97SCUdByO3kS4ND106hCk4O4GCBxprG+hRcpDq6YwNir/VzG
         J1fVM33DTXnkG2I989R+xZs3eSwgFV2lXb9k8HCA5CRA3HYBVcN4/wsTvyQE6BIWKGbv
         GqFGK1jE1n7qrJPY3r71ZVEDXUq77exrThQlQj+R+6LOAFcxdHkHyLkHWINCZTqFu35u
         HY59V2dwcBfrdpoNb10SMDwn73W/NYmSSQ9yps3ALkWzBZNdLN8LOQCJDwYOhQiG7Rea
         ywTA==
X-Forwarded-Encrypted: i=1; AJvYcCV68Ajc7FL0f0OomjPvc/4EliYTpuqE6niAvA3srOjKrV2DFXy/4DO0ev3Z779lJGWu7FM0KU0ElXRwHkw=@vger.kernel.org, AJvYcCVtg8tRChoQixFEYqDNTAkBlt/krcxs3A4JlfsX4CI/wQiVrcQ6m3HeMnRdPG9oflODef6AakUMZES3@vger.kernel.org, AJvYcCXVav0Msi6wCmeHB9QpAB6g15rFSgJ91rOy7OWajVTdMbrqJV1zEcpewzTudSpqigcoB7ZZwlvGWOj/PXSk@vger.kernel.org
X-Gm-Message-State: AOJu0YxyH+KKrXuU0yZgf2d2MWD0ZphIx7aOi+pCIXjGJEr8d6P9acCR
	7eczY/shrbZg+mNgaVvcXSg3c2Efzrw6KoEo/WTkaenYMTSKtsGL
X-Gm-Gg: ASbGncvhSbBiVi4uwGtTwBpTzz+naBggiWSf+J7WNC3waZLDF0hw1rgOpF8MD3TnqHM
	9EbRPzQLJqm8sv/9OzaDkI8pJtqJiGYqW8lse9UDwJdk//elRdnIv9NKl9m6aa9uxPC5qrYqBee
	MS8eR5DwkGTrtANefga7mMDa/EZ8aQ7AZV/k44+4yGt/hWogaviI/n+A8G2YA6MkH1+Hnp38E6H
	EF15FwNU2j1SBJ/bbgs1/gih7Ayoc+cMtXQkj0mQ3bm0H6L+CUWlMAGKzolUvyEuCtJJnExghYL
	0zrf4DPL08aBq/IGg8orphdWd0i/
X-Google-Smtp-Source: AGHT+IF+XJVyqbiTAhRVT2DX5gAGDj/R1pffrBAQNQzM7DfV9u3X2EU5bwoluW7W/73TKgTxtEDY7Q==
X-Received: by 2002:a05:6402:35c3:b0:5dc:1f35:563 with SMTP id 4fb4d7f45d1cf-5e08950fc04mr7944322a12.7.1740061070649;
        Thu, 20 Feb 2025 06:17:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:49 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 2/6] media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
Date: Thu, 20 Feb 2025 16:17:24 +0200
Message-ID: <20250220141739.228714-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for parsing VC IDs in v4l2_fwnode_endpoint_parse().
This allows us to retrieve the specified VC IDs in camera drivers and
configure the hardware to use them.

The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

The driver must validate the number of VC IDs and the VC IDs
themselves.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 15 +++++++++++++++
 include/media/v4l2-mediabus.h         |  5 +++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d..97ecc01e1e39e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -129,8 +129,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	bool have_clk_lane = false, have_data_lanes = false,
 		have_lane_polarities = false, have_line_orders = false;
 	unsigned int flags = 0, lanes_used = 0;
+	u32 vc_ids_array[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	u32 clock_lane = 0;
+	unsigned int num_vc_ids = 0;
 	unsigned int num_data_lanes = 0;
 	bool use_default_lane_mapping = false;
 	unsigned int i;
@@ -208,6 +210,15 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		have_line_orders = true;
 	}
 
+	rval = fwnode_property_count_u32(fwnode, "vc-ids");
+	if (rval > 0) {
+		num_vc_ids =
+			min_t(unsigned int, V4L2_MBUS_CSI2_MAX_VC_IDS, rval);
+
+		fwnode_property_read_u32_array(fwnode, "vc-ids", vc_ids_array,
+					       num_vc_ids);
+	}
+
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		clock_lane = v;
 		pr_debug("clock lane position %u\n", v);
@@ -248,6 +259,10 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 				bus->data_lanes[i] = array[i];
 		}
 
+		bus->num_vc_ids = num_vc_ids;
+		for (i = 0; i < num_vc_ids; i++)
+			bus->vc_ids[i] = vc_ids_array[i];
+
 		if (have_lane_polarities) {
 			fwnode_property_read_u32_array(fwnode,
 						       "lane-polarities", array,
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 24c738cd78940..291b680d2a845 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -72,6 +72,7 @@
 #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
 
 #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
+#define V4L2_MBUS_CSI2_MAX_VC_IDS		4
 
 /**
  * enum v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
@@ -94,8 +95,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
 /**
  * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
  * @flags: media bus (V4L2_MBUS_*) flags
+ * @vc_ids: an array of Virtual Channel IDs
  * @data_lanes: an array of physical data lane indexes
  * @clock_lane: physical lane index of the clock lane
+ * @num_vc_ids: number of Virtual Channel IDs
  * @num_data_lanes: number of data lanes
  * @lane_polarities: polarity of the lanes. The order is the same of
  *		   the physical lanes.
@@ -104,8 +107,10 @@ enum v4l2_mbus_csi2_cphy_line_orders_type {
  */
 struct v4l2_mbus_config_mipi_csi2 {
 	unsigned int flags;
+	unsigned char vc_ids[V4L2_MBUS_CSI2_MAX_VC_IDS];
 	unsigned char data_lanes[V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	unsigned char clock_lane;
+	unsigned char num_vc_ids;
 	unsigned char num_data_lanes;
 	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	enum v4l2_mbus_csi2_cphy_line_orders_type line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];
-- 
2.48.1


