Return-Path: <linux-media+bounces-48759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16BCBCCF4
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBB56301A1D7
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 07:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD3F32E72F;
	Mon, 15 Dec 2025 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E4HOTzDM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E9732E6B5;
	Mon, 15 Dec 2025 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765783965; cv=none; b=REgLe1en8aqoNPSUz24EqU5epJ/3ZEhA0u0yvAIAmsyO0YM0pR2OGL5UfUyXYp2SD7/aOtZYqVfZW3rMV1weFjVnX/iBb5JUA0CnCXBxSBoIIKNXUP9VlJZ2lEGtxzBLqTltNERY2FhMkWBY6rrU3MdwHh49riCAEs9LiQY6Ong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765783965; c=relaxed/simple;
	bh=5RmybB//uGZtA09y4X6yaZHmDmqZCV5tXrjwSaXytvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQJehQX49q0WmfNUY8hy3XeFf4OydZmRLCEpBWeymaF5UlK/Mlta2l9Oc2RvzKrV7mR/wt8ewsW59FweDLRuextBpQISRsnf5IjTnio3NI9GMZvWxcYk6vSL9wqkrj/wDM/Dye2O1AjW8oRF/rH+x+m2NSa0bFF+J/mLftBJnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E4HOTzDM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.82.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EEC1581;
	Mon, 15 Dec 2025 08:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765783957;
	bh=5RmybB//uGZtA09y4X6yaZHmDmqZCV5tXrjwSaXytvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E4HOTzDMNnGi9Y1gQQXLpRjANZCMWLD32OqzTGK1KZMiWO91P6WiqATSCfRdnwIjD
	 RJJ+lQ144ABMGOXFTqh7VUIOjbns7sfz4MSlxbk2AnXgjX6/8zubrXn3zEdDYUAAMO
	 nIF6mnRw+mVnbZ61S4LrFXomjyGvw4n4XA7yJ4fI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 15 Dec 2025 12:58:07 +0530
Subject: [PATCH v3 11/16] media: i2c: ov5647: Add control of
 V4L2_CID_HBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-b4-rpi-ov5647-v3-11-4c25e3c883b2@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4382;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=AfO8ofB8E1I6v4Z0kIGCSmY+ew/jROlfukpTBRxlpAY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpP7jhSx7zPnifszZri7UqHX0OfCFzAF8z10TJj
 pYlKtz5y8mJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaT+44QAKCRBD3pH5JJpx
 RTUMD/9L6/nFYdMEuwtlQ5J1PneX0rXbht2z+YVJUJDRhSWzn7Zmpqq3eLhDQ3PC5lc11+6fige
 r5nUVTPwjny/b10VdpqiEYyWpmveRBR1cEvldbKjUUrEleRyaoDD8vD9O+5g9wgaVrOaeb9VwRe
 zT5C6bdIW4oY3oto09XCUF5pt1pzEWiyfhOEqEVSXrbsOjuy7XkuXgQbdxktlVHnbuwe/ySxaox
 zcisoPSQyvd55X0MZ/kSERRiFKEd5Gj0gH5yTSusyn6GSA7iXQ0M1J5RzaJUCQveyvQFOtSEBY5
 p9N02B99g+YCjEENKhN1Iz1an2/7t9YpZGFGeQj+zFVZjzVZKqJpPZAVpLsNHkOrGLku3YTxfj5
 9YJXBG7ABi/iI+wp2NKDWIabslJFUW4drNILpIZc7lLUn7luY7nm4Ep5NmL7C3OyKSS/G6nt+tQ
 NXH7roO/sJ+kOmRnIZWw9gfZXOrgSXr2blszSQlSlSPgX+aWEJiwbHeHSAJ3JWkpW+3woNgQOJi
 63y+6ves+h2gs61anZxp7xkyXpbK/4wrHO1eZgWEflCY/oiD8wAGL1dGrJh22pbgwreZ8u8N4nZ
 5P5ccrgi3APKMOaMwPSg+wdQHWk98xUrnzioYu4T02o+mZUSRxRdxHVym+sDE74g6pyayu5a/4j
 bf5L0vYeU/xnK0Q==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The driver did expose V4L2_CID_HBLANK, but as a READ_ONLY control.

The sensor only uses the HTS register to control the line length,
so convert this control to read/write, with the appropriate ranges.
Adopt the old fixed values as the minimum values permitted in each
mode to avoid issues of it not streaming.

This should allow exposure times up to ~3 seconds (up from ~1sec).

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 052fdf0d33a593f9795641ec607528f3d6a54723..9e075fcc891862a61f0c624711f75cdbe0a3f352 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -53,6 +53,8 @@
 #define OV5647_REG_AEC_AGC		0x3503
 #define OV5647_REG_GAIN_HI		0x350a
 #define OV5647_REG_GAIN_LO		0x350b
+#define OV5647_REG_HTS_HI		0x380c
+#define OV5647_REG_HTS_LO		0x380d
 #define OV5647_REG_VTS_HI		0x380e
 #define OV5647_REG_VTS_LO		0x380f
 #define OV5647_REG_TIMING_TC_V		0x3820
@@ -79,6 +81,8 @@
 #define OV5647_VBLANK_MIN		24
 #define OV5647_VTS_MAX			32767
 
+#define OV5647_HTS_MAX			0x1fff
+
 #define OV5647_EXPOSURE_MIN		4
 #define OV5647_EXPOSURE_STEP		1
 #define OV5647_EXPOSURE_DEFAULT		1000
@@ -187,8 +191,6 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x3a19, 0xf8},
 	{0x3c01, 0x80},
 	{0x3b07, 0x0c},
-	{0x380c, 0x0b},
-	{0x380d, 0x1c},
 	{0x3814, 0x11},
 	{0x3815, 0x11},
 	{0x3708, 0x64},
@@ -276,8 +278,6 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x3a19, 0xf8},
 	{0x3c01, 0x80},
 	{0x3b07, 0x0c},
-	{0x380c, 0x09},
-	{0x380d, 0x70},
 	{0x3814, 0x11},
 	{0x3815, 0x11},
 	{0x3708, 0x64},
@@ -375,8 +375,6 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x3809, 0x10},
 	{0x380a, 0x03},
 	{0x380b, 0xcc},
-	{0x380c, 0x07},
-	{0x380d, 0x68},
 	{0x3811, 0x0c},
 	{0x3813, 0x06},
 	{0x3814, 0x31},
@@ -450,8 +448,6 @@ static struct regval_list ov5647_640x480_10bpp[] = {
 	{0x3a19, 0xf8},
 	{0x3c01, 0x80},
 	{0x3b07, 0x0c},
-	{0x380c, 0x07},
-	{0x380d, 0x3c},
 	{0x3814, 0x35},
 	{0x3815, 0x35},
 	{0x3708, 0x64},
@@ -1063,7 +1059,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 mode->pixel_rate, 1, mode->pixel_rate);
 
 		hblank = mode->hts - mode->format.width;
-		__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1,
+		__v4l2_ctrl_modify_range(sensor->hblank, hblank,
+					 OV5647_HTS_MAX - mode->format.width, 1,
 					 hblank);
 
 		vblank = mode->vts - mode->format.height;
@@ -1333,6 +1330,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
 				     sensor->mode->format.height + ctrl->val);
 		break;
+	case V4L2_CID_HBLANK:
+		ret = ov5647_write16(sd, OV5647_REG_HTS_HI,
+				     sensor->mode->format.width + ctrl->val);
+		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
 				   ov5647_test_pattern_val[ctrl->val]);
@@ -1340,7 +1341,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
-	case V4L2_CID_HBLANK:
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
@@ -1416,10 +1416,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 					       sensor->mode->pixel_rate, 1,
 					       sensor->mode->pixel_rate);
 
-	/* By default, HBLANK is read only, but it does change per mode. */
 	hblank = sensor->mode->hts - sensor->mode->format.width;
 	sensor->hblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   V4L2_CID_HBLANK, hblank,
+					   OV5647_HTS_MAX -
+					   sensor->mode->format.width, 1,
 					   hblank);
 
 	sensor->vblank = v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
@@ -1449,7 +1450,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 		goto handler_free;
 
 	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.52.0


