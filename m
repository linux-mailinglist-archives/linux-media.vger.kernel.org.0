Return-Path: <linux-media+bounces-14093-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C27916144
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 10:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6036B24FB4
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 08:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D2F148FEC;
	Tue, 25 Jun 2024 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jOA1XAp6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14778149002;
	Tue, 25 Jun 2024 08:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304304; cv=none; b=X/rnjw+LBcvlfu6p0Jopuq5gLNdXJDqKrM84cwKcUaxX7A/BJP8MEqCSDjs/KYdxq++z+10iJdaFPGVSvv2bDFXo6FCwOfSB5i4P2SjTBTPTaiOpraKiQg9FFnlkmYu0vC3oB/vouMuC9xC/D5Lhg0vFWYaNhVSdxK2ALFVYM1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304304; c=relaxed/simple;
	bh=sLKOAZP2twvyMrkmWFwa9gsRqsnFd0yb0cRV/chnGZ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dz9trTUkup8apQu6K/LxJ+9aFoCI6XDpApprKxMOoMJ82PI8M2MknOHF5Jbfsb6mXRLd/p5zD1bKx9ugBHtUjfbVKZU8kiK6xY9ZnOj99XpVinGIBIuoX4FvR6HDp6En5OFUBcKM/pvWUr8lvN8FDpeAcRbpc3Hi5ikVaB1RWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jOA1XAp6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P7gUUk021217;
	Tue, 25 Jun 2024 10:31:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VRn4fM4+qyVZ6+D1sS8F/uhdseWA+WqX0MM6GsLHCJo=; b=jOA1XAp6s8VR2Jt5
	gnT834DUUtk7Ooivja3fxVDdBTi1zdQgM3J2iKY5rS1LSwJ4AkTCxzYTwk8BZ48T
	IWUCcz/8Zw8pIgy2bjHD5/ZAfqQKLkZOV6Y6XhJdrp+EwLzN6lOYiU/Kh4YNNaFo
	Q1MyYAHaUzqekMD1OsOGlj5PZw0TdOPve9uGV3O9a5RqNHhL0xZoqv+Pgf06KoOR
	ztIm7hyoMQ/OudMFPijBmkrb1R56ymrv85d6U4amiFAY8dqOHCoNtpshRBg7qxAf
	AlHGHZIqDlAyadSQnbutApJFKfNMsHER0DGYk0JkjSYH4lxrCs6As5XvKgDQG0IO
	fUX5Yg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywm1gb2fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 10:31:31 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 34B5A4002D;
	Tue, 25 Jun 2024 10:31:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8C7B20FA24;
	Tue, 25 Jun 2024 10:31:12 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 25 Jun
 2024 10:31:12 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] media: i2c: gc2145: addition of RAW8 formats support
Date: Tue, 25 Jun 2024 10:29:54 +0200
Message-ID: <20240625082956.2556293-2-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625082956.2556293-1-alain.volmat@foss.st.com>
References: <20240625082956.2556293-1-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_04,2024-06-24_01,2024-05-17_01

Adds support for RAW8 formats (BGGR/RGGB/RBRG/BRBG).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/i2c/gc2145.c | 75 ++++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/gc2145.c b/drivers/media/i2c/gc2145.c
index bef7b0e056a8..bbab24f3eb57 100644
--- a/drivers/media/i2c/gc2145.c
+++ b/drivers/media/i2c/gc2145.c
@@ -542,45 +542,82 @@ static const struct gc2145_mode supported_modes[] = {
 /**
  * struct gc2145_format - GC2145 pixel format description
  * @code: media bus (MBUS) associated code
+ * @colorspace: V4L2 colospace
  * @datatype: MIPI CSI2 data type
  * @output_fmt: GC2145 output format
  * @switch_bit: GC2145 first/second switch
+ * @row_col_switch: GC2145 switch row and/or column
  */
 struct gc2145_format {
 	unsigned int code;
+	unsigned int colorspace;
 	unsigned char datatype;
 	unsigned char output_fmt;
 	bool switch_bit;
+	unsigned char row_col_switch;
 };
 
 /* All supported formats */
 static const struct gc2145_format supported_formats[] = {
 	{
 		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x00,
 	},
 	{
 		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x01,
 	},
 	{
 		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x02,
 	},
 	{
 		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_YUV422_8B,
 		.output_fmt	= 0x03,
 	},
 	{
 		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
 		.datatype	= MIPI_CSI2_DT_RGB565,
 		.output_fmt	= 0x06,
 		.switch_bit	= true,
 	},
+	{
+		.code           = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.colorspace     = V4L2_COLORSPACE_RAW,
+		.datatype       = MIPI_CSI2_DT_RAW8,
+		.output_fmt     = 0x17,
+		.row_col_switch = GC2145_SYNC_MODE_COL_SWITCH,
+	},
+	{
+		.code           = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.colorspace     = V4L2_COLORSPACE_RAW,
+		.datatype       = MIPI_CSI2_DT_RAW8,
+		.output_fmt     = 0x17,
+		.row_col_switch = GC2145_SYNC_MODE_COL_SWITCH | GC2145_SYNC_MODE_ROW_SWITCH,
+	},
+	{
+		.code           = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.colorspace     = V4L2_COLORSPACE_RAW,
+		.datatype       = MIPI_CSI2_DT_RAW8,
+		.output_fmt     = 0x17,
+		.row_col_switch = 0,
+	},
+	{
+		.code           = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.colorspace     = V4L2_COLORSPACE_RAW,
+		.datatype       = MIPI_CSI2_DT_RAW8,
+		.output_fmt     = 0x17,
+		.row_col_switch = GC2145_SYNC_MODE_ROW_SWITCH,
+	},
 };
 
 struct gc2145_ctrls {
@@ -641,7 +678,8 @@ gc2145_get_format_code(struct gc2145 *gc2145, u32 code)
 
 static void gc2145_update_pad_format(struct gc2145 *gc2145,
 				     const struct gc2145_mode *mode,
-				     struct v4l2_mbus_framefmt *fmt, u32 code)
+				     struct v4l2_mbus_framefmt *fmt, u32 code,
+				     u32 colorspace)
 {
 	fmt->code = code;
 	fmt->width = mode->width;
@@ -663,7 +701,8 @@ static int gc2145_init_state(struct v4l2_subdev *sd,
 	/* Initialize pad format */
 	format = v4l2_subdev_state_get_format(state, 0);
 	gc2145_update_pad_format(gc2145, &supported_modes[0], format,
-				 MEDIA_BUS_FMT_RGB565_1X16);
+				 MEDIA_BUS_FMT_RGB565_1X16,
+				 V4L2_COLORSPACE_SRGB);
 
 	/* Initialize crop rectangle. */
 	crop = v4l2_subdev_state_get_crop(state, 0);
@@ -754,7 +793,13 @@ static int gc2145_set_pad_format(struct v4l2_subdev *sd,
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
-	gc2145_update_pad_format(gc2145, mode, &fmt->format, gc2145_fmt->code);
+	/* In RAW mode, VGA is not possible so use 720p instead */
+	if (gc2145_fmt->colorspace == V4L2_COLORSPACE_RAW &&
+	    mode == &supported_modes[GC2145_MODE_640X480])
+		mode = &supported_modes[GC2145_MODE_1280X720];
+
+	gc2145_update_pad_format(gc2145, mode, &fmt->format, gc2145_fmt->code,
+				 gc2145_fmt->colorspace);
 	framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		gc2145->mode = mode;
@@ -811,7 +856,11 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 	 * For RAW8, LWC = image width
 	 * For RAW10, LWC = image width * 1.25
 	 */
-	lwc = gc2145->mode->width * 2;
+	if (gc2145_format->colorspace != V4L2_COLORSPACE_RAW)
+		lwc = gc2145->mode->width * 2;
+	else
+		lwc = gc2145->mode->width;
+
 	cci_write(gc2145->regmap, GC2145_REG_LWC_HIGH, lwc >> 8, &ret);
 	cci_write(gc2145->regmap, GC2145_REG_LWC_LOW, lwc & 0xff, &ret);
 
@@ -821,10 +870,14 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 	 * 1280x720 / 1600x1200 (aka no scaler) non RAW: 0x0001
 	 * 1600x1200 RAW: 0x0190
 	 */
-	if (gc2145->mode->width == 1280 || gc2145->mode->width == 1600)
-		fifo_full_lvl = 0x0001;
-	else
+	if (gc2145_format->colorspace != V4L2_COLORSPACE_RAW) {
+		if (gc2145->mode->width == 1280 || gc2145->mode->width == 1600)
+			fifo_full_lvl = 0x0001;
+		else
+			fifo_full_lvl = 0x0190;
+	} else {
 		fifo_full_lvl = 0x0190;
+	}
 
 	cci_write(gc2145->regmap, GC2145_REG_FIFO_FULL_LVL_HIGH,
 		  fifo_full_lvl >> 8, &ret);
@@ -835,7 +888,9 @@ static int gc2145_config_mipi_mode(struct gc2145 *gc2145,
 	 * Set the FIFO gate mode / MIPI wdiv set:
 	 * 0xf1 in case of RAW mode and 0xf0 otherwise
 	 */
-	cci_write(gc2145->regmap, GC2145_REG_FIFO_GATE_MODE, 0xf0, &ret);
+	cci_write(gc2145->regmap, GC2145_REG_FIFO_GATE_MODE,
+		  gc2145_format->colorspace == V4L2_COLORSPACE_RAW ?
+		  0xf1 : 0xf0, &ret);
 
 	/* Set the MIPI data type */
 	cci_write(gc2145->regmap, GC2145_REG_MIPI_DT,
@@ -883,6 +938,10 @@ static int gc2145_start_streaming(struct gc2145 *gc2145,
 			GC2145_BYPASS_MODE_SWITCH,
 			gc2145_format->switch_bit ? GC2145_BYPASS_MODE_SWITCH
 						  : 0, &ret);
+	cci_update_bits(gc2145->regmap, GC2145_REG_SYNC_MODE,
+			GC2145_SYNC_MODE_COL_SWITCH |
+			GC2145_SYNC_MODE_ROW_SWITCH,
+			gc2145_format->row_col_switch, &ret);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to write regs\n", __func__);
 		goto err_rpm_put;
-- 
2.25.1


