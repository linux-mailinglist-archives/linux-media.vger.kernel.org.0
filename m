Return-Path: <linux-media+bounces-20500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EB9B451F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 09:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CF231C21F0D
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 08:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327320400C;
	Tue, 29 Oct 2024 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VpC+mVIa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D3204030;
	Tue, 29 Oct 2024 08:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192327; cv=none; b=fmzSFXyV1/oHv8dB3gsyQmx9FDIeYDgshZ4RduIum9W8xT0K/vcYShHDGnU4XSlah1SgOoW51t8j65e6F/j2WkgPGfjP7hFi2K9pRHnVb20+yRDywx26MaSjqyJ8mj5VE8qNf76kFCg/gSthXFkq6zI9MmdKuOhMWxNKIaxcQTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192327; c=relaxed/simple;
	bh=0FEs/gIX99kz8JpOvHrvJN2dpFqvML8cWtHwraR2EGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtPY4s31iPEQZFkEXI8vcVv9xWZ1uqxAvjnN/OgFvnW3MhbWAaxYCeNIfJ0ArM0nLJqq7EFO3SIU+KBvIFfQq1oXpo83NjwIPs7nREaTtocBOeBfpKSoFNdiKhWEXTFbJ9zEdd88CYTLGBn/t4d5Vr6dFsK+h82ADcIRdi0vZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VpC+mVIa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:9301:2bb5:b494:2d46:ba69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AACE54D4;
	Tue, 29 Oct 2024 09:58:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730192320;
	bh=0FEs/gIX99kz8JpOvHrvJN2dpFqvML8cWtHwraR2EGw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VpC+mVIauVVw3jIpyhGbdOWzorXWu3/ZYaRBHzY3L6s1zT0ACx+kVRxYJ/UaGTBCC
	 ZXKZVNa38ghCaHfECVlRbu0JB5uN/ZLTqzml1Hxvdu1dsNf86oCp5M2YDPX7qSdpuD
	 J1eA0SRtPwJrOJF5BztqdNTd1pNNEYH6F8cls1KE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 29 Oct 2024 14:27:36 +0530
Subject: [PATCH 2/3] media: i2c: imx219: make HBLANK r/w to allow longer
 exposures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-imx219_fixes-v1-2-b45dc3658b4e@ideasonboard.com>
References: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
In-Reply-To: <20241029-imx219_fixes-v1-0-b45dc3658b4e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=e6R2yb1OtTps+G3Y/rqGJ9x5BhQfEck/djqyB7t/WzM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnIKOvZ0xjExV4inWaTSq4DYpGu/DOF5d39Aw85
 nP/dfujeviJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZyCjrwAKCRBD3pH5JJpx
 ReqzD/9qS5UKt0S/yuW0WXdT/x/1BDpKKJfXmdav3wjn0+N4zkouHNs7y2RcLpyUSzJmi0vGmCD
 2QNLM3MbpqcDOM/y2xN6jLOqciZr9Pkyb0SGaAHQYTU8LfC6B4FPBKE622/5SsgtQVMRT1GOG80
 78wzxbMdjWM7HmGsgzmOabVXuom1sruHmzaE6Pux5NJXQKNaXPZg3OlmIUR62XJM3H0aw78Hu+G
 KvdBJK3AFD/ncaQ3JlU6W9H897KJWZC0gzsEnb17oitrM+GsVTFInEfgyonKX/I80gccMC1lw2F
 1XwRJXBJoeCz2qkNAGTGc5IPYCSIShnKCOa7W7ZPJgkj4QznIce12NGXLOzqwyAgvabig+lair8
 kyv0zGO/Ml8xTXtAu5BJeuH6gZfEP470h8a7UW23nf5l3RZ8vI/laVSCnzlAqVX+Lz6uC7I8wD5
 FC08J7G19YlPYXZHjfca4ELtTuui3WkqF7dfLSs+8ifx9kqVss6N05/jT4ig4C07cLzMmWKpEV/
 aSGxMFLkz0HyrFhtfbMPSa0lb1g325F4s917IrWI+ChQ2KffVdv9YIOsX9UMnkGh0kQGe+pm0Nu
 n5gYxRYhs/LH7yatVo+CB1fhLwSfCgzzBuWUX3BEBx/jA4Fybpdtds9O5rbcHfY4GqBQVQb3juE
 ArXPqSJrLGzEIig==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The HBLANK control was read-only, and always configured such
that the sensor HTS register was 3448. This limited the maximum
exposure time that could be achieved to around 1.26 secs.

Make HBLANK read/write so that the line time can be extended,
and thereby allow longer exposures (and slower frame rates).
Retain the overall HTS setting when changing modes rather than
resetting it to a default.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f98aad74fe584a18e2fe7126f92bf294762a54e3..de9230d4ad81f085640be254db9391ae7ad20773 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -76,8 +76,10 @@
 
 #define IMX219_VBLANK_MIN		32
 
-/* HBLANK control - read only */
-#define IMX219_PPL_DEFAULT		3448
+/* HBLANK control range */
+#define IMX219_PPL_MIN			3448
+#define IMX219_PPL_MAX			0x7ff0
+#define IMX219_REG_HTS			CCI_REG16(0x0162)
 
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -422,6 +424,10 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 		cci_write(imx219->regmap, IMX219_REG_VTS,
 			  format->height + ctrl->val, &ret);
 		break;
+	case V4L2_CID_HBLANK:
+		cci_write(imx219->regmap, IMX219_REG_HTS,
+			  format->width + ctrl->val, &ret);
+		break;
 	case V4L2_CID_TEST_PATTERN_RED:
 		cci_write(imx219->regmap, IMX219_REG_TESTP_RED,
 			  ctrl->val, &ret);
@@ -496,12 +502,11 @@ static int imx219_init_controls(struct imx219 *imx219)
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
 					   IMX219_VTS_MAX - mode->height, 1,
 					   mode->vts_def - mode->height);
-	hblank = IMX219_PPL_DEFAULT - mode->width;
+	hblank = IMX219_PPL_MIN - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
+					   V4L2_CID_HBLANK, hblank,
+					   IMX219_PPL_MIN - mode->width,
 					   1, hblank);
-	if (imx219->hblank)
-		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 	exposure_max = mode->vts_def - 4;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 		exposure_max : IMX219_EXPOSURE_DEFAULT;
@@ -842,6 +847,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		u32 prev_hts = format->width + imx219->hblank->val;
 		int exposure_max;
 		int exposure_def;
 		int hblank;
@@ -861,13 +867,18 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 exposure_max, imx219->exposure->step,
 					 exposure_def);
 		/*
-		 * Currently PPL is fixed to IMX219_PPL_DEFAULT, so hblank
-		 * depends on mode->width only, and is not changeble in any
-		 * way other than changing the mode.
+		 * Retain PPL setting from previous mode so that the
+		 * line time does not change on a mode change.
+		 * Limits have to be recomputed as the controls define
+		 * the blanking only, so PPL values need to have the
+		 * mode width subtracted.
 		 */
-		hblank = IMX219_PPL_DEFAULT - mode->width;
-		__v4l2_ctrl_modify_range(imx219->hblank, hblank, hblank, 1,
-					 hblank);
+		hblank = prev_hts - mode->width;
+		__v4l2_ctrl_modify_range(imx219->hblank,
+					 IMX219_PPL_MIN - mode->width,
+					 IMX219_PPL_MAX - mode->width,
+					 1, IMX219_PPL_MIN - mode->width);
+		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 	}
 
 	return 0;

-- 
2.47.0


