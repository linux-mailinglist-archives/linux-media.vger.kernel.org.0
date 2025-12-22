Return-Path: <linux-media+bounces-49303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A93CD522B
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932FD3022F12
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A03311C1D;
	Mon, 22 Dec 2025 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nvhGdppd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFCA31197C;
	Mon, 22 Dec 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391448; cv=none; b=nnRfyD+aEK/Dq27JdhZz1yC89TwxnelQznxoNJ/m1ATVlOb/LzPN0y+P0iwKPRBQV0HlAZiaBDa9wkHHXP8mOgmS2Pvfsm+A68lx8CGLObYd+0SscFW5rq18D/GLmFvrFuw+gP+NY4BkqHmHX990FVMAjQPSnSI3u1r9g/fhcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391448; c=relaxed/simple;
	bh=/1Sf05E6AWkbd98SGxiS2EzgQgY4oOh0GMC1HcsjuIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OuwxS5V5qITTfmXX+DmDMOPqtcxfnQ993m2KsC4eE9Xc3ypeUg/pJ84UFs/YIh+nFEJ50mY5Fina3coTb5u4ibo8JmDm8upKEV0owAsxG3ginFrN8Ufa/UdrrA1KhfPZEUqLYpHvh9em6HVgnTELmyL0olrtg/dA2HHJ4gBtzhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nvhGdppd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:aa51:d08b:9316:9524:9005])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D5063C8;
	Mon, 22 Dec 2025 09:17:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766391436;
	bh=/1Sf05E6AWkbd98SGxiS2EzgQgY4oOh0GMC1HcsjuIQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nvhGdppd9N4vZ+xM9LS9zEjvB3zgPn39c5/mU7JM6HjRy4kJ7biqoYMI1ou7M1yoF
	 G7dUwBukCE4j7XtRRWip2B5KEjo5aHtxV6K0i9h0tQxyFycMVbJdjgQ96uYgKcI1ub
	 9Ulh86RadRDOCAqxFxz3lsCG6HdNlLquVY/xCM0o=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 22 Dec 2025 13:45:41 +0530
Subject: [PATCH v4 17/17] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-b4-rpi-ov5647-v4-17-b949c7309280@ideasonboard.com>
References: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
In-Reply-To: <20251222-b4-rpi-ov5647-v4-0-b949c7309280@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=elGhO/FSWy0Z+EqaZaFXthXqmSjE0SXrLSyXP41BvUc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpSP4xYQfGEso+zxFzi0F8lM65kuBayeEICMWtL
 dRMq3norr6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaUj+MQAKCRBD3pH5JJpx
 RT3REACNXs23LYVr9m3i0nmyRPupf9U+OdgfBko8D1sVDRhcXh9S/jE9YAnbPGUvIpIVkE84FCT
 jYzfoWtAqYNa7fT/A5ZkMJEMTt2IrRpeELpgMXrqQmKZ2ZbKqheBqq4RRvZP3pNYZQSpHL8rvqs
 yNQjqo0QQtnInB1eEEEhfo/zyKR+3w3snK8hyeiW80dOscL/ghzUfD4YTOSgAJWN4HJkBJqRj5E
 I8Mikq+Ys5lDYctVKNOitNZvHhuagVThv4bNlxllVuHZnxdZ//sib7Gl542j0LKDgS3ZycXG1gA
 1ZeRT9HeTZebaXa7nkqFqzABf70UD/q+4hWLAHdEOqyRejCmR3EPIKTGNcrB1oasyv4LQtQGKq3
 izEgjtxK+ZPln4cXGEjZpXGH5vcofJPXJzNb3SUunQrsWH2v9Ez8fsDvrBd6Zg4rtc5ZFW/Edme
 mLu/2G5vYB4TeFXhWUWW4QIHn8qQDmxfuflumWyEGteP8mBt38bFX/nkAlCQw4c/BvHMWDlwIQ6
 C2nJemFoJ2liKNT9wdO3QCeQyJZIijh4SasroDfvLiEf6TyY9GAFimyS+MRGaH+2buYPQ6VB0WW
 zS9gcSo4TekL/4CkBIB+DLZGP3cNbv7wsE07ANjq6fm+OdqRNF6/WjVwYBu8McoUjgaTIz9kPk2
 HT2BXUw6yHl7j9A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The link frequency can vary between modes, so add it as a control.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 7003c9922c5be666b4322c8d1dd0a2893c86f253..1041732104fa765053ba79889e11dfeb4d2a1d8f 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
 
 #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
 
+#define FREQ_INDEX_FULL		0
+#define FREQ_INDEX_VGA		1
+static const s64 ov5647_link_freqs[] = {
+	[FREQ_INDEX_FULL]	= 218750000,
+	[FREQ_INDEX_VGA]	= 145833300,
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
 		.pixel_rate	= 58333000,
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
@@ -1231,7 +1246,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	int hblank, exposure_max, exposure_def;
 	struct device *dev = &client->dev;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 13);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1287,6 +1302,14 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 	sensor->vflip = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 					  V4L2_CID_VFLIP, 0, 1, 1, 0);
 
+	sensor->link_freq =
+		v4l2_ctrl_new_int_menu(&sensor->ctrls, NULL, V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(ov5647_link_freqs) - 1,
+				       sensor->mode->link_freq_index,
+				       ov5647_link_freqs);
+	if (sensor->link_freq)
+		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,

-- 
2.52.0


