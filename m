Return-Path: <linux-media+bounces-26217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB75A384C5
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 14:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61FD73B3934
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 13:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EC621CA0B;
	Mon, 17 Feb 2025 13:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n7il6tfz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C021A931;
	Mon, 17 Feb 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798936; cv=none; b=RlxiTngBMH6xzISVAMCaSG1barCiPMdjZ/qkHyDMKnc+kW9t2iIF5weLQVp4R8yNJOvvUgNn1FUljbBifkAQwtdinnZVMPBlWxbpr2ix44oRqjJHbQ/CHC56rHZIC1Ehl7+mHiBEV1jOgxtTPeT8m2QcHB7s7LsgbXPP1U+RhwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798936; c=relaxed/simple;
	bh=7iS5A8FDnPJD/vVdqvl8eYOLaMP3h7THJYVB5YmGDKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T0Pc8FkVnox6zE7YEAWxEhE2+hM9hHbhhCDHEOzGRzCSB3dBjUAaW/qYfAGXCFrGR1dUXsjwDcdb7uIO7gaakIKkKb+NEc2JuGvxITamjno20ckNVj5pA/oyHXeQeLv7wBdF2YzUoeDH7KxeSZIDOsk+bwrYtmJTLUNPlzvW0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n7il6tfz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.80.185])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C15F22F;
	Mon, 17 Feb 2025 14:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739798852;
	bh=7iS5A8FDnPJD/vVdqvl8eYOLaMP3h7THJYVB5YmGDKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n7il6tfzaPmouQPOL0wh85PIuqXP+9EP+iF9D9d3jWfHaV7jK396hIGCfMclGQRpt
	 z7AElL2bdv6k+sAPPZU5ZWtDz9WVXxGntLGMcqKicNiDsBnbijl4/tkj5pOOeoxtSE
	 oekB11c5TWQSR3PSvR0y1xvNzTT2ZJLVISJgUBvQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 17 Feb 2025 18:57:34 +0530
Subject: [PATCH v7 4/5] media: i2c: imx219: Increase minimum LLP for binned
 modes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-imx219_fixes-v7-4-83c3c63b737e@ideasonboard.com>
References: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
In-Reply-To: <20250217-imx219_fixes-v7-0-83c3c63b737e@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7iS5A8FDnPJD/vVdqvl8eYOLaMP3h7THJYVB5YmGDKE=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnszlLB4d7zoupT3I1s4vx44eacfrt9xzV7fF5D
 +LrWiUIlTeJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7M5SwAKCRBD3pH5JJpx
 Rct1D/4nEhpKf5fZK6XVU+H/wTjh/soX3mlRyHyPpdXlykICyT1R6mgabVkPrlI15lNrfs0TKsu
 M1deaenTnFXNwyARhsXjBHeXE0n2ObnIUUhOLmWxPxBru9+p4phghqKNsHGIlW8srAKa6/lc+AI
 WRQ5Ux2kCILeKpclhC3k/g/YYniholoWV7iOIA7zx39ASnv79jQ+7BTdjmWkH72nkZHHmXt359o
 BPXSE3zt20n+jqFhLmkYfEptyNoj3SHBLccHEQ+daRKZH2puhtbRxXfbH+uWAoQqwXBbYjvZaLr
 IIIc86I6HNHNVNJ/sCfTS2zefwl3VEnBwJ0IMUQWWkKAS+pY1QmpfbY42YzgQD/LLqCu3RVs+2/
 q3wYh55TB6PFIzT2sQXZF4LCgKTDYrn0QUVSdzwgmQH3ljnOfnQ1WcB43Pq51c4w33uHuAX680q
 kewCeMCyjn3Mr07D+eSGSgfFvrP2n/urlvYrM5w9/MxRLzpy1L43uIdIjrQ25k5WVMSCKs6cB1b
 rcJ2x3kgcQ2E1UTalZFgQTYH3JqdTXG+kjjLhcLn43bb3z0cMoWzfZHeFyHhcIFJQ1bgOtrxUw7
 eARcMB27P0Tp0w1HtvrlaZasPUwfyNn+uTCcZqyBIz/jeZgr3PQ/NR/Sjx06xwrb5QE0QvHCKWF
 WRs6qqwjgt5VjvQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The sensor's internal ADC supports a minimum line length of 3448 pixels,
which may be too small to use with analog binning, where ADC operates on
two lines together. Switch to a higher minimum line length of 3560
pixels to fix the blocky artefacts seen with analog binning.

To keep the same default framerate as before, lower the default fll value
for the binned modes to compensate for the increase in llp.

Link: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..418f88386659d494ff674d64ed69b8441d1ee2cd 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -75,6 +75,7 @@
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
 #define IMX219_LLP_MIN			0x0d78
+#define IMX219_BINNED_LLP_MIN		0x0de8
 #define IMX219_LLP_MAX			0x7ff0
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -298,13 +299,13 @@ static const struct imx219_mode supported_modes[] = {
 		/* 2x2 binned 30fps mode */
 		.width = 1640,
 		.height = 1232,
-		.fll_def = 1763,
+		.fll_def = 1707,
 	},
 	{
 		/* 640x480 30fps mode */
 		.width = 640,
 		.height = 480,
-		.fll_def = 1763,
+		.fll_def = 1707,
 	},
 };
 
@@ -845,7 +846,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
-		int hblank;
+		int hblank, llp_min;
 
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
@@ -861,6 +862,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 imx219->exposure->minimum,
 					 exposure_max, imx219->exposure->step,
 					 exposure_def);
+
+		/*
+		 * With analog binning the default minimum line length of 3448
+		 * can cause artefacts because the ADC operates on two lines
+		 * together. Switch to higher minimum of 3560 if we are binning.
+		 */
+		llp_min = (bin_h || bin_v) ? IMX219_BINNED_LLP_MIN :
+					     IMX219_LLP_MIN;
+		__v4l2_ctrl_modify_range(imx219->hblank, llp_min - mode->width,
+					 IMX219_LLP_MAX - mode->width, 1,
+					 llp_min - mode->width);
 		/*
 		 * Retain PPL setting from previous mode so that the
 		 * line time does not change on a mode change.
@@ -869,10 +881,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		 * mode width subtracted.
 		 */
 		hblank = prev_line_len - mode->width;
-		__v4l2_ctrl_modify_range(imx219->hblank,
-					 IMX219_LLP_MIN - mode->width,
-					 IMX219_LLP_MAX - mode->width, 1,
-					 IMX219_LLP_MIN - mode->width);
 		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 	}
 

-- 
2.48.1


