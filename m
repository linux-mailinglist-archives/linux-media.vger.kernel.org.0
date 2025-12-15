Return-Path: <linux-media+bounces-48764-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DCCBCCD9
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CFC0E300D3F6
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DBE331201;
	Mon, 15 Dec 2025 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="olPnYGzD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D38330D32;
	Mon, 15 Dec 2025 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765784034; cv=none; b=JOv54vkzwlZGxLg0kNJ/dw3sVJUoiCEPRGOcZRFQs+frxTHq1DvPnbzix4NwJMbCMiq4foorBGs56KU9eB5r2oThxogM44a6Gtj6Z7Cz6w85kLiPsZV9hmpoCbZ+3Qdj+FOS/MKdEFs90yoUZ9Jkns5TzkIGFkkB13j0q/MJ2EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765784034; c=relaxed/simple;
	bh=jleOSP7Tgn+ABBAUO5yDEWHMZfB1w2yN56IEROvhqXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbqyJGeUQ9AeWfAW+/e8SGUgaL3J3jRfSlHcEEGBG1CRLVVPe5Xc9j8nxDUAeXAXM92GQD4AAFk0ZnUr9Di2oPgzcrA94bOliuhxPREutuAy3wTOUW4JHgYCqz/jeAan2HRD9O+fOwwBN/8sTDHjkLrp+ca0u7lsfh5tRzrAlUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=olPnYGzD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80783581;
	Mon, 15 Dec 2025 08:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765784027;
	bh=jleOSP7Tgn+ABBAUO5yDEWHMZfB1w2yN56IEROvhqXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=olPnYGzDTuzmLpHhWgJHuNtcWU8TeGYUcM+eXhCBEt/NP5Eet++EKU1GQfwVhDcq0
	 QPBBef+BIjOlOZQx8pCz+zNwSaycJ6n0NmPzqD62RaZzd16KfNuM/Y7fhgh+JAAJPI
	 M4EcWT8s/uBVNeh6pIOoB0wcc0+s0/HglrbOjs14=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:12 +0530
Subject: [PATCH v3 16/16] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-16-4c25e3c883b2@ideasonboard.com>
References: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
In-Reply-To: <20251215-b4-rpi-ov5647-v3-0-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3722;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=2m5uFJslIvUHVycELyZ6k66Dl7YGPmVx+HUrjjEpWJg=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jmbCCsTLxJ2HbG6Ze4aezrBB0RDqUh22sU2
 5RhD/EAMdmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+45gAKCRBD3pH5JJpx
 Ra7dEACusKi7XrNPehosGzHDbFO/gMRgTXXNA0+z4nZMf1OQ6KZCYlYVLbvjDmYYkPAELsQzewg
 0M9PPdwdrW2q03UhyBXjv4QGfeHc2xR9s7eSg532IJ04k1tgrkmCqkOXnp7bdGUtMLm8iCNXUae
 29pWEc6KiqhNTtMPMOy9i3vdHzSvDw9GAvQJJq+SDfGiIfU/IsaFgpkHUjgx/E25LOPhjp9iDif
 CMcUAkXM8B29YyVcq36vOJmrHlf7RQ5J6xlwnOjK360mSqwR+Z+XFuwPaurdKNhG7yGbxGpcfDl
 VKcmmVEEMX3jwC88qU36f94sI67AE4CvllZfDBANEOfe5H0YwA00FhYFMhUFgtqiqC8fMLFJQup
 XC6f28RDu9uR9JWBc8PCmAzUuCkU5AZP/rNtdy5QXnOeodOn4Rsjqu4AZTEFlxKg9rLZrfd+F66
 dazM3kO+IEcebuePDi67jI4yIeguK958WVtky+lLFpsreH9NTDVsKFWsl6jvvZys3ClnHo9t/Vu
 m+8V1I692UOBIsqP8+sjQz5tnK8iE2VmHLwk/N2WyNi9vzut8ihtJArM3jQExsOp8ekcrZT116V
 wCBeXfxbZQtEl9eUvDlBQpXj64rr1zNbyaLbIB8sGm6maG/R8nirqw6YmJbTqyeZDerUR3Ho51p
 mH++yjlvegsprcg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The link frequency can vary between modes, so add it as a
control.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 02d751967ab2c4a8dbe4a504738c2c0b36b6cb68..761eb22f53244b6883439f1eda7940b30bed1146 100644
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
@@ -438,7 +450,8 @@ static const struct ov5647_mode ov5647_modes[] = {
 			.width		= 2560,
 			.height		= 1920,
 		},
-		.pixel_rate	= 55000000,
+		.pixel_rate	= 58333000,
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


