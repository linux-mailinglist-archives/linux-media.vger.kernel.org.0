Return-Path: <linux-media+bounces-8035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BB88F319
	for <lists+linux-media@lfdr.de>; Thu, 28 Mar 2024 00:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73941F2E288
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 23:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1A4156672;
	Wed, 27 Mar 2024 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="LR/pr/hd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta244.mxroute.com (mail-108-mta244.mxroute.com [136.175.108.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFF15666F
	for <linux-media@vger.kernel.org>; Wed, 27 Mar 2024 23:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711581807; cv=none; b=p7XF87jE/5vySomX84iqSXur+oOqKQuI/U2M77J7HUD6d0ERgI58IKwv7/R+/AKesSSVNZf+wdDYQ+u1RbJisFFAlFsusXb0iTiech7Pnf9hkfj03k8wtfizuOoyA/B2eqnoxQ0AytEhrmaVSUrqxNWMrjRSyN+Cw7LsBpzWnAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711581807; c=relaxed/simple;
	bh=l/d1KTSxrdSi8t1Av6GsBX7faXE7YS03/s1Y6XmUM9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5nMaWmeQQwRZu1Sha2+MNSmRH3ParhM2aWXon7NC5jyYekyEL9xkL7qaL6JGPvXcEc9tMkEidnGD73dsRr/vS7u5ZS5EzszGLQJelUU8h2lwwHNfUnlUYME2cGkZll9yYPWVST9CkAj0WZxpmMXTjXyaykLNAZauc64By+i6/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=LR/pr/hd; arc=none smtp.client-ip=136.175.108.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta244.mxroute.com (ZoneMTA) with ESMTPSA id 18e8234741b0003bea.010
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 Mar 2024 23:17:39 +0000
X-Zone-Loop: 37bb64b6bb0d96189236335f22854c43b65502922c3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wfd3IM9yvSlmOOZPNTkn/UcYNYLQj3XQ9wKwbMSeFFA=; b=LR/pr/hdDf/T3GTNGYXS+y6rBl
	5y9PzVXxJy1PDIf+IK31ZEVYkEVmOxaT2/N1x6hYlVMCQ3P5Jbx7DzKQ6bTa5zXctSrCR9bzy71wF
	jdWdIrN/3K14luv/kgu8JjkFpz3d0oX5yLYjJ6zyzCHCHHVC0qVhML3+4UOG9DuPCpGEkYOAj6/sq
	P0WftRtoeGDcrh5/8Vx8nLHk3S8hZdowl7HJMXR+VXRuGAtwTioxKfwFifrEXzoJYEKGteC9PrPpw
	VVqk+Y5QnueNqwbVM2E/oe+mMW66fBo+f6GWl3vnorfQRfYKTa7qpcsTTvQQaJW6Q2rM01gnzWOEF
	6rYt0BEg==;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/23] media: i2c: imx258: Follow normal V4L2 behaviours for clipping exposure
Date: Wed, 27 Mar 2024 17:16:56 -0600
Message-ID: <20240327231710.53188-11-git@luigi311.com>
In-Reply-To: <20240327231710.53188-1-git@luigi311.com>
References: <20240327231710.53188-1-git@luigi311.com>
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
---
 drivers/media/i2c/imx258.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index c65b9aad3b0a..1f5fb980cfbe 100644
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
@@ -741,6 +742,19 @@ static int imx258_update_digital_gain(struct imx258 *imx258, u32 len, u32 val)
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
@@ -748,6 +762,13 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
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


