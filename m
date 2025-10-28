Return-Path: <linux-media+bounces-45751-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF6C134E5
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2796501D9C
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E31239E63;
	Tue, 28 Oct 2025 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T3AJvbia"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635F2C0293;
	Tue, 28 Oct 2025 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636547; cv=none; b=N8KlCFENGu4rLkj72d5EOjBSRalYG7vkZUUTMNdlUHCN2MsmFKQXjoNgYn5qExEGE54P9cC+9dSC+myVH+c9FBtUEYwRDhxnLBpBCvWkTMPhQHRd+V7mfBzififI7Zyg21zkdaLOhUlvxi+iZsFopuYnUtrH3PZbinWFjo2JePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636547; c=relaxed/simple;
	bh=hvfA4Ah59qm/v8O8K2KW1GDfsB5vN1xxLwWQ74787r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FjKGxIu10HrVuLO23UDR5uxzvLArAik4rb+uT/AxshfdfUXZBnvL6K5bElSCSv46M8o3TG28iXHNtVAxFo/O06fNbhJBX8/8GkvG+xvXymcWZ/MxAwxv7FByFpCjwUt8bQpQZmua/+NkfQD2u6TChrQEu3j1modJQXRYyqQcebw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T3AJvbia; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A48616CD;
	Tue, 28 Oct 2025 08:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636436;
	bh=hvfA4Ah59qm/v8O8K2KW1GDfsB5vN1xxLwWQ74787r0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T3AJvbiaG5sBLaw9ULddFdbsD8MjN7OolTKZw0pp5A7rISY4MjCWdD/Kdh5oowpt2
	 xwWg50+PGWixPy1VAqA8N9wqp2Cj8P3sOVYQsN8tDhUo5XOz+uwgIedW+Uewm9+Ws2
	 HTONtSHFba/G2h73g7MVlPLKngqkFxuDUxaXx9m0=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:24 +0530
Subject: [PATCH 13/13] media: i2c: ov5647: Add V4L2_CID_LINK_FREQUENCY
 control
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-13-098413454f5e@ideasonboard.com>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
In-Reply-To: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 David Plowman <david.plowman@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Peter Robinson <pbrobinson@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
 "Ivan T. Ivanov" <iivanov@suse.de>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3673;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=52a32CqFPvBiwD5Owyt1AoUV8v1FmZr4CihFE6NrvFo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHB2YkPCA9SBw0Ha5S8iuboMj/AaSQmas5Bgz
 IeQMHLWctKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwdgAKCRBD3pH5JJpx
 Re8qEADLonQ4dc68GpOKoazvhDQtjkLug5grwuIg0qbcey+qYhdqqHTSSVUqJF/8DeywQQ8Q6+Y
 KYnJZVe6WjO61hfRhPRWfO6lhHUSzdkGqyIBPFDNht4V5i+QApuuW7uDy1bQlr8PRaahi0W17O6
 Mg8Y/8qpoARS3YFhPhXhR2/zaXk/Et+RZO0JxUp57H3/RSLGStYCVie76jhBKVScfu/el0ZJdBv
 eJzevAYX2Agod7IsrpT6YuYIECorSgs5jTULD6bF/UZOJ5ydsEBlp5PaM5NgZRwt7I5fcJZtjXb
 7Zt0JxZkoBoBaomHUhFQRlbo5iEP3fOAhlYh7YomO0MRisFR2E2q1d1QFKbHT1A8gRlIMnDjko+
 EgtCj24+XfBrjAE+DKBRAjp3yBEIz6RdaGHigbDfhIGqE+RHSSaHQzk01SlJd6tH0LHQHZvUsVZ
 uwOGPZyzDlLw2HtE6Hd4+a5ZmGlrUQCGjSwLR575TOZDomPBESwP0cmg7RukPJ9DuLZl21JQKYa
 sfMh8yWyylP/+6T8nt9lOWDbw1b5cx+pcmoPCu7+WrWKgjJZNeZpdMcPaTTA9g2RodcHBWcaQ2V
 dkFt7R1LGJHQ3yQP5bvhQ+OHukhLA7v2uG7GH6N/Q/+4O0NYRVYb3akqEckMpAIY3nK4e/NknFa
 lBAeBiQHMxHDcUw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The link frequency can vary between modes, so add it as a
control.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index be0b96c4372ae0c6d8fc57280b195d6069dd7019..dea978305c3c868819780f7f631b225f4c1e7756 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -97,6 +97,13 @@ static const char * const ov5647_supply_names[] = {
 
 #define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
 
+#define FREQ_INDEX_FULL		0
+#define FREQ_INDEX_VGA		1
+static const s64 ov5647_link_freqs[] = {
+	[FREQ_INDEX_FULL]	= 218500000,
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
@@ -925,6 +938,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 sensor->exposure->minimum,
 					 exposure_max, sensor->exposure->step,
 					 exposure_def);
+
+		__v4l2_ctrl_s_ctrl(sensor->link_freq, mode->link_freq_index);
 	}
 	*fmt = mode->format;
 	/* The code we pass back must reflect the current h/vflips. */
@@ -1230,7 +1245,7 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 	int hblank, exposure_max, exposure_def;
 	struct v4l2_fwnode_device_properties props;
 
-	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
+	v4l2_ctrl_handler_init(&sensor->ctrls, 10);
 
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
@@ -1290,6 +1305,14 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 	if (sensor->vflip)
 		sensor->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
 
+	sensor->link_freq =
+		v4l2_ctrl_new_int_menu(&sensor->ctrls, &ov5647_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(ov5647_link_freqs) - 1, 0,
+				       ov5647_link_freqs);
+	if (sensor->link_freq)
+		sensor->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	v4l2_fwnode_device_parse(dev, &props);
 
 	v4l2_ctrl_new_fwnode_properties(&sensor->ctrls, &ov5647_ctrl_ops,

-- 
2.51.0


