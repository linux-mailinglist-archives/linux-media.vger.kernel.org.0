Return-Path: <linux-media+bounces-8551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 584958973BC
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 17:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB7261F2476B
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 15:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A950D14BFA4;
	Wed,  3 Apr 2024 15:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="c64wUaeF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta41.mxroute.com (mail-108-mta41.mxroute.com [136.175.108.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F34149E15
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712157213; cv=none; b=SmQ2HlLRSQKw1ZKhKvXzc+iJOOsjGZ/UmYFbCeMrYKdQAQaVqYDk2tyOXF9jDKVdM3kLIjeYT/4Bds1ahiL25qdISv8bVLMwB2YAOYHWuWbk7XyMPgTx3svHIjVkea9jbStSURkVAK9hbSm150kp/5D8uKoTJalHPqY+/BuHf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712157213; c=relaxed/simple;
	bh=wgUfPDIer7AQ37jo80J/dyoU1vBDqQa6Etcv/8WWMyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDggZon6u9dpzuCVPjbgBSdFVM/tt2a+7AJxyfYCLbrjxehU2OUSUsXFjqEfc2/izcvVgHfAP5lYGgN0QRFfDPIj1XEqe6GzPzL3c6VUwmK8l76coNvX6dytctNRQ3xXN3bPTlaZ7D4YWNs49cTycuhJwrRlKRU09woWcilbi2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=c64wUaeF; arc=none smtp.client-ip=136.175.108.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta41.mxroute.com (ZoneMTA) with ESMTPSA id 18ea48054c90003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 15:07:37 +0000
X-Zone-Loop: 992ef997797850dae2da404fc17538f20b48e3f958b0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y+VeEU5f+LeGJ8HV2ZAWs/R6ixOD7sSWebXM6B8M/iY=; b=c64wUaeF3gqp4Yo/TbEETxoUF7
	eIP101qUT8Hr6POQ62/2bo+Q/Cqvt5+QuDtXOgfqZKps1hOxF7MEf8ruDA/WxMKVDp9nVLK9/Nax9
	BDypkk8WOqCao6pZOcYRsiN9wGGZKZraKT7yoa1J547qv9u5L4/yBjWr8AYhsVtwtA/1gpV+HGFby
	ef+nBcUjnVXHGRGw6LeudOJhzg4xJQFdlBpk2kYeAmdI/9F/wkCXTXtbgP+XPYF0Pq0F70nc8/xj8
	OoWkqIKYpyV9uueLAub5pBFanAGEMgMPalkYpWwBVfBaPT103yMPwDQ7kZKaQKUqTwvIBjWVR7UB6
	D51J9QsA==;
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
	pavel@ucw.cz,
	phone-devel@vger.kernel.org,
	Luis Garcia <git@luigi311.com>
Subject: [PATCH v3 10/25] media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposure
Date: Wed,  3 Apr 2024 09:03:39 -0600
Message-ID: <20240403150355.189229-11-git@luigi311.com>
In-Reply-To: <20240403150355.189229-1-git@luigi311.com>
References: <20240403150355.189229-1-git@luigi311.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: personal@luigi311.com

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

V4L2 sensor drivers are expected are expected to clip the supported
exposure range based on the VBLANK configured.
IMX258 wasn't doing that as register 0x350 (FRM_LENGTH_CTL)
switches it to a mode where frame length tracks coarse exposure time.

Disable this mode and clip the range for V4L2_CID_EXPOSURE appropriately
based on V4L2_CID_VBLANK.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Luis Garcia <git@luigi311.com>
---
 drivers/media/i2c/imx258.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index 8f792f0e0738..ebc404b548b3 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -37,10 +37,11 @@
 
 /* Exposure control */
 #define IMX258_REG_EXPOSURE		0x0202
+#define IMX258_EXPOSURE_OFFSET		10
 #define IMX258_EXPOSURE_MIN		4
 #define IMX258_EXPOSURE_STEP		1
 #define IMX258_EXPOSURE_DEFAULT		0x640
-#define IMX258_EXPOSURE_MAX		65535
+#define IMX258_EXPOSURE_MAX		(IMX258_VTS_MAX - IMX258_EXPOSURE_OFFSET)
 
 /* Analog gain control */
 #define IMX258_REG_ANALOG_GAIN		0x0204
@@ -371,7 +372,7 @@ static const struct imx258_reg mode_common_regs[] = {
 	{ 0x303A, 0x00 },
 	{ 0x303B, 0x10 },
 	{ 0x300D, 0x00 },
-	{ 0x0350, 0x01 },
+	{ 0x0350, 0x00 },
 	{ 0x0204, 0x00 },
 	{ 0x0205, 0x00 },
 	{ 0x020E, 0x01 },
@@ -734,6 +735,19 @@ static int imx258_update_digital_gain(struct imx258 *imx258, u32 len, u32 val)
 	return 0;
 }
 
+static void imx258_adjust_exposure_range(struct imx258 *imx258)
+{
+	int exposure_max, exposure_def;
+
+	/* Honour the VBLANK limits when setting exposure. */
+	exposure_max = imx258->cur_mode->height + imx258->vblank->val -
+		       IMX258_EXPOSURE_OFFSET;
+	exposure_def = min(exposure_max, imx258->exposure->val);
+	__v4l2_ctrl_modify_range(imx258->exposure, imx258->exposure->minimum,
+				 exposure_max, imx258->exposure->step,
+				 exposure_def);
+}
+
 static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx258 *imx258 =
@@ -741,6 +755,13 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
 	int ret = 0;
 
+	/*
+	 * The VBLANK control may change the limits of usable exposure, so check
+	 * and adjust if necessary.
+	 */
+	if (ctrl->id == V4L2_CID_VBLANK)
+		imx258_adjust_exposure_range(imx258);
+
 	/*
 	 * Applying V4L2 control value only happens
 	 * when power is up for streaming
-- 
2.42.0


