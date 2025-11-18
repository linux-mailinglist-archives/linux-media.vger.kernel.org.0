Return-Path: <linux-media+bounces-47283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 037ACC69473
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 13:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7837C4E38C4
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 12:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C466B3587D3;
	Tue, 18 Nov 2025 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wmxLiqzK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8F34B43D;
	Tue, 18 Nov 2025 12:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467465; cv=none; b=EqJseYO1O4Foc3sIK/5sHw1MuVQaBQKIb/czVsBu01fVSuS82RTOEZIOJS+Iu8I5OoJCRHqnFLEy5U3AoL9oNrTqhenSl1FR7VzAs0R82B+nujGG9zn7EMmwwrii2cUKYc9rs9rFzzRT0g6ZE4839iIuoHxaYM0U2Kw0AbvpGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467465; c=relaxed/simple;
	bh=1irBu6cJLTfs7Tdq3rgpbbLXe54lmsiy+kz3MrJ2EH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JIfjwvs5DejLJ6MxuN6/tUdHnjMMsHQOsi9McFS87JRpXvkmNd+CKBxkshQTUzpi9BCAQN6wJmPOXXFYGWCTuW3BnDj7DO3+UcadhNmOZMxnVZcrf98dzDjKwPALgoij6mmU8zwqPUS+zFGCdcMbo3KtNqVZYxoeC/kafim6g70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wmxLiqzK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4b0d:7040:4d69:4c7c:d231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E81F320FB;
	Tue, 18 Nov 2025 13:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763467338;
	bh=1irBu6cJLTfs7Tdq3rgpbbLXe54lmsiy+kz3MrJ2EH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wmxLiqzKz4TKmHSRebzgdvQOmFgx9FHx/Yd19WpIYUmosfuNAmnvbaXOaR6glJrQM
	 FtdNqv3FWeqXNiQtn1075tzcLzi3qXR+qc2xqRuGfEAmXUbEFqdfMBwM+6reJiq7Il
	 WJJAOsEbUV3BBj5oLd1XXPK7wC0vA8lIZC+ZIUSY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 18 Nov 2025 17:33:04 +0530
Subject: [PATCH v2 11/16] media: i2c: ov5647: Add control of
 V4L2_CID_HBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-b4-rpi-ov5647-v2-11-5e78e7cb7f9b@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=oDXaaG5T92XczKd4fvTILltQ4U+P7TvumEQTtd8oLnE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpHGCEs5NT8z+U7/ZQzLcTSIZu+EoVEGPrNmiad
 ykIlkUCvz2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaRxghAAKCRBD3pH5JJpx
 ReHpD/4h6TAR0+RbtPuoD647A88vOvICxkTTCW1B/g24XPjI56Hsc3Be910xjfkm6c6XWFuFDNy
 PQN2V1rapjFAXcUSsFIQAppABbBm6e+iM5NQRrKpkpIqq6sgnDvzdFj8YZXx/TcJKtCsLqcYIlB
 iFCa2M1qWG7a94hBm1cuReWl7yDXIEIculbOeH4i0oUQVLGQ1RkqiBAqbQF7qAETSS0HNLeG0pj
 5l5O0PJA5tN7YawiIdrZkmyP07oWuIEbe655+IJt/H3mWWo/iWNn9dfKMmusPcth/judT2DlDdd
 W78Lji4pXZJNnceWsuIJ/sVnSsNfsrNhFBOXkTs9UhfCLL6G1J9MHFca6xItWZNMh36flcyULt4
 S7pHma9dCvbcQgjhM+Ud11cV4Pt1w7aAw75IrmDE73Ue0DG6FyWNQtI/dk/+6BaK2WlDkoxKgW3
 ngn4Eqq7duJmnVce+TEJ5oSFv/9KeLuXMBephv5f0KK7RNWhq7/g7vCXMR0tMwK9ijbEzHLJ5WY
 B8AJWy1eqeExekBvhINlKPuVMNDfLZ/l1xJ00zxF2FWh43JEGtsXUAIYi2JCCv/rwVOxJ5vQ8Uk
 BJMNz+fOAaAvZTngAOFq8ki6G6f439Euf/zJGJpiV6ri+vBd5t5Dz1mKrnBA0HZQ6FYa5PK14n4
 8ngQtqPkAA9NXTQ==
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
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 9b5a1275c29877dff99c74aa8d49605c02fa6ed6..48c0e302319d724a20aa7885a62e517d515c6191 100644
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
@@ -1338,6 +1335,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1345,7 +1346,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
-	case V4L2_CID_HBLANK:
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
@@ -1421,10 +1421,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
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
@@ -1454,7 +1455,6 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 		goto handler_free;
 
 	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.51.1


