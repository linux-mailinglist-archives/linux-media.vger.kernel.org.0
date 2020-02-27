Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A30317221F
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 16:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729652AbgB0PTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 10:19:18 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:33007 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729439AbgB0PTR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 10:19:17 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: IsuR96Cb9xvLmy2wbVUHg6Eb0y08j7S6svkniz+pMtYiaNsaxqkTJJcDL3ALFi1P61F9uohEdr
 0pWekaEntO1lrZUAksk9O+KcQ6lM6iopr2uN49yJTgOVmkaOqpDqCordmlsT9RwQrz0yv33/On
 7KHMTXeFygZZJ0EJPEMFylPxSOURNQDJCXwcBqFKNMy0gXawYRFzGVHBLXqb+VRWFJiEfTEjsT
 lsNHUFKzreqz0pXDMg6dbsKOXl5BgO1O/ptc7YieoJKrAvSu7Tt1ezgeEQPMjGoBbjwwSQdfet
 j+M=
X-IronPort-AV: E=Sophos;i="5.70,492,1574146800"; 
   d="scan'208";a="68206434"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Feb 2020 08:19:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Feb 2020 08:19:16 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 27 Feb 2020 08:19:14 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <dave.stevenson@raspberrypi.com>, <andrey.konovalov@linaro.org>,
        <sakari.ailus@iki.fi>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: i2c: imx219: add support for enum frame interval
Date:   Thu, 27 Feb 2020 17:17:52 +0200
Message-ID: <20200227151752.21985-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for enum frame intervals IOCTL.
The current supported framerates are only available as comments inside
the code.
Add support for VIDIOC_ENUM_FRAMEINTERVALS as the enum_frame_interval
callback as pad ops.

 # v4l2-ctl --list-frameintervals width=1920,height=1080,pixelformat=RG10
 ioctl: VIDIOC_ENUM_FRAMEINTERVALS
        Interval: Discrete 0.067s (15.000 fps)
        Interval: Discrete 0.033s (30.000 fps)
        Interval: Discrete 0.033s (30.000 fps)

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

Hello,

This is on top of Sakari's tree in linuxtv.org

Thanks
Eugen

 drivers/media/i2c/imx219.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f1effb5a5f66..17fcedd4edb6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -127,6 +127,8 @@ struct imx219_mode {
 	unsigned int width;
 	/* Frame height */
 	unsigned int height;
+	/* Frame rate */
+	u8 fps;
 
 	/* V-timing */
 	unsigned int vts_def;
@@ -381,6 +383,7 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
+		.fps = 15,
 		.vts_def = IMX219_VTS_15FPS,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
@@ -391,6 +394,7 @@ static const struct imx219_mode supported_modes[] = {
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
+		.fps = 30,
 		.vts_def = IMX219_VTS_30FPS_1080P,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
@@ -401,6 +405,7 @@ static const struct imx219_mode supported_modes[] = {
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
+		.fps = 30,
 		.vts_def = IMX219_VTS_30FPS_BINNED,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
@@ -680,6 +685,27 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx219_enum_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_pad_config *cfg,
+				      struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+
+	if (fie->index >= ARRAY_SIZE(supported_modes))
+		return -EINVAL;
+
+	if (fie->code != imx219_get_format_code(imx219))
+		return -EINVAL;
+
+	if (fie->pad)
+		return -EINVAL;
+
+	fie->interval.numerator = 1;
+	fie->interval.denominator = supported_modes[fie->index].fps;
+
+	return 0;
+}
+
 static void imx219_reset_colorspace(struct v4l2_mbus_framefmt *fmt)
 {
 	fmt->colorspace = V4L2_COLORSPACE_SRGB;
@@ -1004,6 +1030,7 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.get_fmt = imx219_get_pad_format,
 	.set_fmt = imx219_set_pad_format,
 	.enum_frame_size = imx219_enum_frame_size,
+	.enum_frame_interval = imx219_enum_frame_interval,
 };
 
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
-- 
2.20.1

