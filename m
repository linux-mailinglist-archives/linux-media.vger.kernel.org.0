Return-Path: <linux-media+bounces-47288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F3C6944C
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3C1292B1B8
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270B8359704;
	Tue, 18 Nov 2025 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QwuI/du4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E93559E3;
	Tue, 18 Nov 2025 12:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467495; cv=none; b=BVSG+ig5NcuQxEEU9ISu+HylkWqDaXzekEUpJhA5Hhq2tWsTcewjKalEtiP4A0KH+yEs8orBtVoOtO4/Jb6hnTQspzQQ27lW73kz3NGNBp0jXNDOp6SYXNJuOWWQAhsJjbWNhZd+0qTxPHJhRWSphiQqjpDvZl5N20xBCEuDq5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467495; c=relaxed/simple;
	bh=DpkWuYfncaRWDOJhDgPhlnJ5he9guBR6UviCskUoiR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+Hf+gA3k7DcqOeytCJXmEC35W61tN7Z2wPnanPqdKxTPS3kBs0JyovlBLwcRa4fIF1Yz0vRSS1oQ9/X7XdTkemzJO3rihg/pkFDFbHC+nUh99Yz2ELzEKAzS2lJ5m/nM0d2P756Ig/4FF00x+HdaLoXOon3iQLLsDpevKhEIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QwuI/du4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F21B71FE4;
	Tue, 18 Nov 2025 13:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467364;
	bh=DpkWuYfncaRWDOJhDgPhlnJ5he9guBR6UviCskUoiR4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QwuI/du4Y4KGUJr1AOwwDoDKsDUSEPyAh1EhWqqkOAFUgQ+CWufRO+YHIYQGgmfvL
	 MTwcsV2TAYEWtXR83l8GRRzpjB/amAa9nNfEBV/oj5DDCLZmL6hpMMBq5Acx4cyyPo
	 Yf4ASKXIGWjVjtkJ4B9eaiov0XyAxzy6aUJmLHAE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:09 +0530
Subject: [PATCH v2 16/16] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-16-5e78e7cb7f9b@ideasonboard.com>
References: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
In-Reply-To: <20251118-b4-rpi-ov5647-v2-0-5e78e7cb7f9b@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Naushir Patuck <naush@raspberrypi.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3628;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=T1d9Hy1J4BXcVdPBAf0njg5hJALA68gH9mII9MKw4KY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCJMpN5i9euon65piigJ4n86ZUUGguRBoi0r
 97PVr64yx6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxgiQAKCRBD3pH5JJpx
 RYriD/oCtozvC3aZ94C3UYAo5HMNMiKMABMquC6EyiFQAqBTDdxYoiA0gK9NriiU6iS0aho6B9f
 IzJ2ZtC/CpFdCgJxeiJcb79M8j0nYMe0vfoXxegeorvN5OiA9gB6HRQNGUk6s0R1mW/7kfhmtyq
 BKgBEoajIvoERDrXA2iex8pepcDL2UWeQhBAPZri5tbHeIkPqxal+orP8d3vAce282XjrhzHoen
 mQL/X02RBujXmkIkUIQGteswzTSWPywy0GHN5YuH5Iy57YJkiO39wG/D4DLZV8ggF94dpXXAAp8
 rjVrxHfISnvkUPuwIUbJ1/5yMWJzWFNNXo0cOWE5N9XwE2rveYAzeieT9zYjaZWb+Gh3hDQK9Pm
 XCHboJ3AelAHDProMiyctYRwEyZTrNdd5ZKO7jEAsg/RZkNazYu/SeMRixG8OpWhALr6pB38Cca
 jkvxxPoOZtdxm3N0lQmYfQEseTiiWsP/3rGMPzXuxcDF738sbkbNWHMGHIstUYpgt+0UWwacGx8
 EoZ1XtoA1yfF2mUuzkJfjUENlQ7329b9U9Hjp99jBuBqehMlnaINIUOjP0Oribt7NRtwMtRK+gm
 2OeUT2SbRqTffc8mucPp6YebLgOjGc7y8Buf0Vj1KhebCJMsrQH06IDHUFBH+FOc6RWoq4T59lB
 wbXVWqBKCWDgZqw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The link frequency can vary between modes, so add it as a
control.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 71107d74f2900b39233a52b29a229282bd087963..de27e76b487957bfa0a072359f28194425950eaf 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
 
 #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
 
+#define FREQ_INDEX_FULL		0
+#define FREQ_INDEX_VGA		1
+static const s64 ov5647_link_freqs[] = {
+	[FREQ_INDEX_FULL]	= 218750000,
+	[FREQ_INDEX_VGA]	= 208333000,
+};
+
 struct regval_list {
 	u16 addr;
 	u8 data;
@@ -106,6 +113,7 @@ struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
 	u64				pixel_rate;
+	unsigned int			link_freq_index;
 	int				hts;
 	int				vts;
 	const struct regval_list	*reg_list;
@@ -128,6 +136,7 @@ struct ov5647 {
 	struct v4l2_ctrl		*exposure;
 	struct v4l2_ctrl		*hflip;
 	struct v4l2_ctrl		*vflip;
+	struct v4l2_ctrl		*link_freq;
 };
 
 static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
@@ -376,6 +385,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.height		= 1944
 		},
 		.pixel_rate	= 87500000,
+		.link_freq_index = FREQ_INDEX_FULL,
 		.hts		= 2844,
 		.vts		= 0x7b0,
 		.reg_list	= ov5647_2592x1944_10bpp,
@@ -397,6 +407,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.height		= 1080,
 		},
 		.pixel_rate	= 87500000,
+		.link_freq_index = FREQ_INDEX_FULL,
 		.hts		= 2416,
 		.vts		= 0x450,
 		.reg_list	= ov5647_1080p30_10bpp,
@@ -418,6 +429,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.height		= 1944,
 		},
 		.pixel_rate	= 87500000,
+		.link_freq_index = FREQ_INDEX_FULL,
 		.hts		= 1896,
 		.vts		= 0x59b,
 		.reg_list	= ov5647_2x2binned_10bpp,
@@ -439,6 +451,7 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.height		= 1920,
 		},
 		.pixel_rate	= 55000000,
+		.link_freq_index = FREQ_INDEX_VGA,
 		.hts		= 1852,
 		.vts		= 0x1f8,
 		.reg_list	= ov5647_640x480_10bpp,
@@ -927,6 +940,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 sensor->exposure->minimum,
 					 exposure_max, sensor->exposure->step,
 					 exposure_def);
+
+		__v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_index);
 	}
 	*fmt = mode->format;
 	/* The code we pass back must reflect the current h/vflips. */
@@ -1236,7 +1251,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	int hblank, exposure_max, exposure_def;
 	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1292,6 +1307,13 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	sensor->link_freq =
+		v4l2_ctrl_new_int_menu(&sensor->ctrls, NULL, V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(ov5647_link_freqs) - 1, 0,
+				       ov5647_link_freqs);
+	if (sensor->link_freq)
+		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,

-- 
2.51.1


