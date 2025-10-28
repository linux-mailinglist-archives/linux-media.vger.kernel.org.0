Return-Path: <linux-media+bounces-45747-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C7C134E1
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 08:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80991AA043A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 07:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071462D8370;
	Tue, 28 Oct 2025 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TXHY89Gs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA372D7DF9;
	Tue, 28 Oct 2025 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761636526; cv=none; b=U3BnJvdRv9py5TR4yJG7GAe75vJ6Ood//kxnusAbtDeH2wCvEWJUt54yxeAufgmzyG5X3DLXuVgZfuPxL8k0XpFWeE1O8Z02kNQwilXVG3V5e0CzWEpDaC/PN9HWu7uH7qIGMl4t/fyDC2oM0O0S1ANAbFwUJfDzUlxXQ7qLjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761636526; c=relaxed/simple;
	bh=HcRfHafi+fSKKt8vTtoNShb7iTHV8TCHOmA90RRFdvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzF1DvaLNuNSTQCW9ZbQnHuMZOQJgwSGPEVmYubwNwoZMwe2WmuNL5cekISGTdhxmk9l2OMSgIVtdzg8F4MRnYY+DVdXn999LcKhCs+H2ee3HtNwK5/1JYBNxotMVvIJEHz0eowR5OEUrdsbOvkjwN17HyiTR1U5h01v86a2X+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TXHY89Gs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB2EA176B;
	Tue, 28 Oct 2025 08:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761636415;
	bh=HcRfHafi+fSKKt8vTtoNShb7iTHV8TCHOmA90RRFdvo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TXHY89Gs7Tb11B2Du5y1U3o/Dx2Fq1vaAcNxdKCqUXKUDs5s5D0yTrQAL9jg8g6gk
	 DqHesYT4YWiRXL0pARaOOJwZXQVmB0g8Q38x4t3P5WLh42kHik3mpEyHoKhcACRbrU
	 o3099qjDey8MexP+glY8+ExDs4w7ODeoxsy9pHMM=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 12:57:20 +0530
Subject: [PATCH 09/13] media: i2c: ov5647: Add control of V4L2_CID_HBLANK
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-rpi-ov5647-v1-9-098413454f5e@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4357;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=QS1AqsJCLG9Gp+IXHfYjJ8vL/00BWzwShpKdv+nNPPo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAHByzrjSVjzDTm9urlmHEHk+rCTXz1AHSEZOv
 oDNE8PMjnCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQBwcgAKCRBD3pH5JJpx
 RUrCEADGt4oKwPBs3zuvKjyEBzCMadStQ5P1vL85ky37wdKu+GaXG/Ch8vYOeXUUpfKkdT2MHtL
 g6jXdn6FTVQPDvVoT59hHK8dxDUBC1cOakSQGMPGlKQzygvw/NiIllSSdqYIGjYBgmLr1NVSI+A
 fe/sR5DzdRyUOvED/wf3r+otVQ48ZL3/k27agPZINRHXHDVd9LhaEyRa7+ZLnYVsnmLNY9+RsjN
 9yStCUomPvcfg0/ECTmUxb0TMJHqbKa5ZOA3p9WKnNs2iJJTnDuzYn8zxQESB5aCfqAVldvGYp+
 vOdPGrSCRAWvj27dUzsNbfKXbwHfBEeGrHr2vasa8ejzmtXhYvvoM5/ff7CcsT9kJn9q6j2n6PE
 5JeBKXOw5IM62HB3MkGJzo2HfazK/LBNfUWrAalOaXo6h8Fm3q3fvk6mNsegkyNbwSFSUGegcW1
 1x/HGKSFdQq9EyTP9vtwfmJKVuh3+sa4CQ/l35ti2Nsn3zgHqh1sgacIXSDGTwEwOBRr6N+nPWr
 M37X2VaeUcki5UuzRaEP+gkLEzXoM1DvO7JBreNoB37dNVyQ8LzqMtteNprgRGT6OE/O58nOZG/
 0KRdSnltFD55w/TcaustOC8xdATypKEhW1dgEY+953Q4Afepnt7u/y15bvHlIE55g4XLYepHpuA
 XvYQrBmGJkvwbxw==
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
index 3aad3dc9b5cd0c24c07a37e2567e3c61c52e4fc2..59c21b91d09d79f073a54871221f197a0bcf3aa2 100644
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
 #define OV5647_REG_VFLIP		0x3820
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
@@ -1061,7 +1057,8 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 mode->pixel_rate, 1, mode->pixel_rate);
 
 		hblank = mode->hts - mode->format.width;
-		__v4l2_ctrl_modify_range(sensor->hblank, hblank, hblank, 1,
+		__v4l2_ctrl_modify_range(sensor->hblank, hblank,
+					 OV5647_HTS_MAX - mode->format.width, 1,
 					 hblank);
 
 		vblank = mode->vts - mode->format.height;
@@ -1325,6 +1322,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1332,7 +1333,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	/* Read-only, but we adjust it based on mode. */
 	case V4L2_CID_PIXEL_RATE:
-	case V4L2_CID_HBLANK:
 		/* Read-only, but we adjust it based on mode. */
 		break;
 
@@ -1409,10 +1409,11 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
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
@@ -1446,7 +1447,6 @@ static int ov5647_init_controls(struct ov5647 *sensor, struct device *dev)
 		goto handler_free;
 
 	sensor->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	sensor->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	sensor->sd.ctrl_handler = &sensor->ctrls;
 
 	return 0;

-- 
2.51.0


