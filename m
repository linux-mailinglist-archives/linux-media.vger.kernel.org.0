Return-Path: <linux-media+bounces-8000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD288F1D1
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAB0298380
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 22:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2A15383A;
	Wed, 27 Mar 2024 22:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="B9ff2Ubw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta157.mxroute.com (mail-108-mta157.mxroute.com [136.175.108.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A55154444
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711578370; cv=none; b=rjxQaBvhFTkmQKQzSBh+YOsJNAHdjLCf1F/Mj1Ct6j5U8AOTYzBuwmUxzwXxpBJeOzFxkrv9yKHwRj8U1tV7j2CUOzgXP5f3XuY3kEeOsPinv6JNsc5mCeOb/f1uTYttgMs4oOCBx1URvIxUaj5MbYVlXBgmbNm05KkJRmv2Fn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711578370; c=relaxed/simple;
	bh=jNP2p08WMq4rAvPD5G7zFc0QqU8Ssu6AvUGSAXAqNqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfnL5/0VXwb5gQscO1KfAIuI06/jLY8b77lZLLqX9mcqbc0FsCJgu6nj/mW4HTgv8Ij3T8ObKF6UuCs2Q6NSbg+JDcErsne2EKv/w6/iknRkZVqLt4h/wLgIZArE4Y4l6ltmURONFnFNpUUAqSv22+Rl9Vneff8vU2trdCjy7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=B9ff2Ubw; arc=none smtp.client-ip=136.175.108.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta157.mxroute.com (ZoneMTA) with ESMTPSA id 18e82006d5c0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 22:20:49 +0000
X-Zone-Loop: 844d6272af5a9a16b273286cb2f7eabf295281c3bfcb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pF+o/HwmqytRK3VcYcqwANjTHrDtZUjVJoHdG1r7wW4=; b=B9ff2UbwQIo2dGt/8jliHkC86K
	1X65lupM9IL10DCFtqVqNnxhhE6T1t9Sawp0WHl1NMRiVEWhndkcJN3NyPJMOZUm8f7AzGMP2126I
	vwil6teubbCObwrkk0WhXa0eTDBrs5eVJqsItdxpT5f8CtD5l4QgViLmAGAmGGyJf0drQwbgKOFTz
	UMqQf0+bydgTl6NpyiCDTZhHX00czOLICnstXJbobPZqoCkPmIK+92aWBBBxRgypzJvYWiyQQmozH
	vIGWL6ig70yumWRfLP3w//kM7vva3W0T3uyoCXlYzNSWQFwHegtCtDnpPFVY4Db4fSgMOmMaHM7Jj
	d3zbq4Mg==;
From: git@luigi311.com
To: linux-media@vger.kernel.org
Cc: dave.stevenson@raspberrypi.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	x@xnux.eu
Subject: [PATCH 02/23] media: i2c: imx258: Make image geometry meet sensor requirements
Date: Wed, 27 Mar 2024 16:20:14 -0600
Message-ID: <20240327222035.47208-3-git@luigi311.com>
In-Reply-To: <20240327222035.47208-1-git@luigi311.com>
References: <20240327222035.47208-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The output image is defined as being 4208x3118 pixels in size.
Y_ADD_STA register was set to 0, and Y_ADD_END to 3118, giving
3119 lines total.

The datasheet lists a requirement for Y_ADD_STA to be a multiple
of a power of 2 depending on binning/scaling mode (2 for full pixel,
4 for x2-bin/scale, 8 for (x2-bin)+(x2-subsample) or x4-bin, or 16
for (x4-bin)+(x2-subsample)).
(Y_ADD_END – Y_ADD_STA + 1) also has to be a similar power of 2.

The current configuration for the full res modes breaks that second
requirement, and we can't increase Y_ADD_STA to 1 to retain exactly
the same field of view as that then breaks the first requirement.
For the binned modes, they are worse off as 3118 is not a multiple of
4.

Increase the main mode to 4208x3120 so that it is the same FOV as the
binned modes, with Y_ADD_STA at 0.
Fix Y_ADD_STA and Y_ADD_END for the binned modes so that they meet the
sensor requirements.

This does change the Bayer order as the default configuration is for
H&V flips to be enabled, so readout is from Y_STA_END to Y_ADD_STA,
and this patch has changed Y_STA_END.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx258.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 2dbafd21dd70..4a7048d834c6 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -111,7 +111,7 @@ struct imx258_mode {
 	struct imx258_reg_list reg_list;
 };
 
-/* 4208x3118 needs 1267Mbps/lane, 4 lanes */
+/* 4208x3120 needs 1267Mbps/lane, 4 lanes */
 static const struct imx258_reg mipi_data_rate_1267mbps[] = {
 	{ 0x0301, 0x05 },
 	{ 0x0303, 0x02 },
@@ -148,7 +148,7 @@ static const struct imx258_reg mipi_data_rate_640mbps[] = {
 	{ 0x0823, 0x00 },
 };
 
-static const struct imx258_reg mode_4208x3118_regs[] = {
+static const struct imx258_reg mode_4208x3120_regs[] = {
 	{ 0x0136, 0x13 },
 	{ 0x0137, 0x33 },
 	{ 0x3051, 0x00 },
@@ -210,7 +210,7 @@ static const struct imx258_reg mode_4208x3118_regs[] = {
 	{ 0x0348, 0x10 },
 	{ 0x0349, 0x6F },
 	{ 0x034A, 0x0C },
-	{ 0x034B, 0x2E },
+	{ 0x034B, 0x2F },
 	{ 0x0381, 0x01 },
 	{ 0x0383, 0x01 },
 	{ 0x0385, 0x01 },
@@ -329,7 +329,7 @@ static const struct imx258_reg mode_2104_1560_regs[] = {
 	{ 0x0348, 0x10 },
 	{ 0x0349, 0x6F },
 	{ 0x034A, 0x0C },
-	{ 0x034B, 0x2E },
+	{ 0x034B, 0x2F },
 	{ 0x0381, 0x01 },
 	{ 0x0383, 0x01 },
 	{ 0x0385, 0x01 },
@@ -448,7 +448,7 @@ static const struct imx258_reg mode_1048_780_regs[] = {
 	{ 0x0348, 0x10 },
 	{ 0x0349, 0x6F },
 	{ 0x034A, 0x0C },
-	{ 0x034B, 0x2E },
+	{ 0x034B, 0x2F },
 	{ 0x0381, 0x01 },
 	{ 0x0383, 0x01 },
 	{ 0x0385, 0x01 },
@@ -562,12 +562,12 @@ static const struct imx258_link_freq_config link_freq_configs[] = {
 static const struct imx258_mode supported_modes[] = {
 	{
 		.width = 4208,
-		.height = 3118,
+		.height = 3120,
 		.vts_def = IMX258_VTS_30FPS,
 		.vts_min = IMX258_VTS_30FPS,
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(mode_4208x3118_regs),
-			.regs = mode_4208x3118_regs,
+			.num_of_regs = ARRAY_SIZE(mode_4208x3120_regs),
+			.regs = mode_4208x3120_regs,
 		},
 		.link_freq_index = IMX258_LINK_FREQ_1267MBPS,
 	},
@@ -707,7 +707,7 @@ static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
 	try_fmt->height = supported_modes[0].height;
-	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	try_fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
 
 	return 0;
@@ -819,7 +819,7 @@ static int imx258_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static int imx258_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_SBGGR10_1X10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
@@ -847,7 +847,7 @@ static void imx258_update_pad_format(const struct imx258_mode *mode,
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
 	fmt->format.field = V4L2_FIELD_NONE;
 }
 
@@ -894,7 +894,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 	mutex_lock(&imx258->mutex);
 
 	/* Only one raw bayer(GBRG) order is supported */
-	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 		ARRAY_SIZE(supported_modes), width, height,
-- 
2.42.0


