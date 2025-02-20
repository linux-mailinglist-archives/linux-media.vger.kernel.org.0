Return-Path: <linux-media+bounces-26526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A7A3E809
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 00:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CA683BF63C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 23:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F83B26563A;
	Thu, 20 Feb 2025 23:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXWPrRNV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29263265627;
	Thu, 20 Feb 2025 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740092928; cv=none; b=bLGXuhzeEg8Fh7B2IrGljAfACkG4kSDZqZrCNwOm61gPk86vH0A4FtORXkP+3Y5SaxttANyX8ELk3yG/MWL+E9H3Ae3w0ixNQhC0zlqGuJsqq8TdMsamQT1KM9J3N5kpchjvIhtZR9B8s+JjAPRfjdyTyjtkKYDbvkXVJRPPyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740092928; c=relaxed/simple;
	bh=CWodvW4NCBIlUv6/PqgOLyTNVvQ6Z0Bh5b4w0MpQRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fP3Gd5e+9pQGaBIIugrFQQ+YPqgNEwcp+P8bm4Labm4z5ezPOs1W3Ag20kcX6ZtD1/4mpr6cCoE+unNwJ2iCyiZ/e+zDxCGNOxyiWryx300KlGF/7jRKhWeR+TezjUYUOWPZ+LpabXrdvGUwNMJTC7ufSNJ2yOaqcIFrFYlpTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXWPrRNV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb892fe379so258865466b.0;
        Thu, 20 Feb 2025 15:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092924; x=1740697724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=RXWPrRNVbjkaE7btJpvzR5Ifsjwudb3mrAZkQj6/o81J25VFg7xKynl0/jdG8bWQEE
         Cx1YXuXn+NLuD6QNZERbYeAIhYG8W96NGwRsBkE+BTSNMeq5tblQ0SIFUCJVe+m5XryP
         yK7qHelT4jClnbvNKBfaLKWplA523ckjgwaIewOlhdnkGpXMsytq6LQ+0iDcnolVYO6i
         17kxSqcnOodmmlDTeGG0L6XI1gBhLdsUxrRnY5K/Q0F+WfaVbUEhVGnmG0mKMwLCCegN
         8tFAAuw7QX97MkW8yPEL+BJdaf0LcrOUY0bulZVAC92+BNrX+YjY0Kg3tYl8K5VE/491
         A2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092924; x=1740697724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku1J4a4L44q8po1KQAtOYx7Ff0tpcPyGvZxYWms+JUM=;
        b=RMpdmbRprva6F+ej2D8vwwB5C1aK5WytZ8rhFkgIkR3UaASS5YScN+0OTpWHZW2/Fn
         V49PHHKb40hlN95GICB7F0o0MIVSIsMfSAbNOn2Zw0CMb4OUwR7Vg01iFGaUibzi7cfj
         E+q6oMc4PM0HMLpc4K5p9fdzFYwPOdmpDc8aR7S8SHDTLxY+AD0MDuXmISOi+EvzZDRL
         5FaffHAYvNYaIumBP/v6/qx7vjr6ZbP3eAZ0Z8uRsbDQhdXJPAtz3KHwcLPuxEqW7zmN
         HlVYH7ebMLP3fO+SwdE0JH8oc2W3dt+CjbL96cm9J8xoK12/2fe0RZaLLqWXpd1wqdtk
         Tcuw==
X-Forwarded-Encrypted: i=1; AJvYcCVIKN5mjxWQfNOxfB9f1kPvwrKg0ZRrnDLDvdK8cI9SGpuQ9MMVrTDNRaBmqabzyBVYccRErrtf0JOQ@vger.kernel.org, AJvYcCVK7gVFKZBON8dwbOArIH5CiuPqswK5IEzV2cJBJ0aFAuXnZQubtjSOWqMWSh0GYq1FGYgU0PWOcezUI0I=@vger.kernel.org, AJvYcCX7MzE2Uzr5Yf0H4VmAlZvA+3lXws/lkTHqsQ9jQBg/pGNypQIvGxPRKSqjoZ0ZtupX+a9FzDsLEf4M12G5@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOqMTCyhTEaGPtJ+OgUbnY4jFsMs1ByxS0koNW6XYfkNnowov
	9qiJakNce5xoI+tRW9oMggOsCBTdUBoMxBB2bivpJDGFn8tqH/cU
X-Gm-Gg: ASbGncvShhaytkNRCvCABzSAQciKABGUW0Bkc2KCg21wZ9bQ2auWLn2NmKKbC+B30W1
	Aliz5zHaQxTPvM23erxQhaJV6y+/4sodK51K1nkGTjcIiUxJQuIkjbzELju5E6F1Bm/lu/4qZ2Q
	yqTTcUBWeCG8xDuqoaWoy40fUmaS7//7gl9ybzYEqwsgvJ8bRITrsvRO4ceIuyVvR6AakLXGYhu
	+sD3wJw+xmgV/SE1JAc2PU2nbu/h12h/4n3ffy+A9b4an5MmWVAMtMxB4nCneRNeGhyynkNjoW0
	ZjAbl9RFXbrQ7ogUiXgkYhZm+wI2
X-Google-Smtp-Source: AGHT+IGI84KAeDso59r/glMSFnTqqVRIRbIaVVOma5XZW7x9oyN/znWeSz2Mp+/p5CWLAdYA/aqo1g==
X-Received: by 2002:a05:6402:27d3:b0:5e0:7510:5787 with SMTP id 4fb4d7f45d1cf-5e0b720ae8emr1532105a12.19.1740092924094;
        Thu, 20 Feb 2025 15:08:44 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:43 -0800 (PST)
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
Subject: [PATCH v2 2/6] media: v4l: fwnode: parse Virtual Channel IDs for CSI2 buses
Date: Fri, 21 Feb 2025 01:08:10 +0200
Message-ID: <20250220230818.275262-3-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
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


