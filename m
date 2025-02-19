Return-Path: <linux-media+bounces-26360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814DA3BD61
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F31174E3A
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0535B1DFE16;
	Wed, 19 Feb 2025 11:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fkAR+39Q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADD2286291;
	Wed, 19 Feb 2025 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965640; cv=none; b=ZbqcSuwJc71WraPvHhmwm2U2hlosdvn4glKcvJDXUH3qp2hlEoW7Yw0hZge1R98o9u6f8MAYjTwfX+n78kjMgGRV6+hwSaw9pOdE4Xq+nSFmUpv6+fcCIm4mps91QOnfC/G4B+ssDQnN5Eoy8tA1iql4LbGlUfIuSBhC6ncAkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965640; c=relaxed/simple;
	bh=BtEu9PtRzSnbhZz0wx2YPb1bjhWIGOD8GrfxUZprkJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufAqu7UEx1wtYrI5k5h3bDeaX75Ak54tdSEYiJ0fiu0WrMssnnSd2yWSR0F7//q6i65kkYBO/Vs66jGUdm9qnc/SCvf0doHykQi2poJBd+Fkzkxj9VANINKp2xc+GRQ3DuThfkfXbD9PwNPxPmXYV8dvrMw0rvUEDOxVfCfCpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fkAR+39Q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA753514;
	Wed, 19 Feb 2025 12:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739965553;
	bh=BtEu9PtRzSnbhZz0wx2YPb1bjhWIGOD8GrfxUZprkJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fkAR+39QwB1+1BXSGkbMo4ZKAMPbQB+fPE+RfIMaahaNrEPtDp9OoJNl6V3yMpJfO
	 +sqtgHSzTXuJRxygv7yEf97S0tKZeFGjz526IWOCCEt8ouR9OojYHhWZ3chnP6OPwD
	 QCkMztG6lD0yY5+DJpXPpGKnUrJgeBzHI8mOOZoc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 19 Feb 2025 17:16:43 +0530
Subject: [PATCH 1/3] media: i2c: imx219: Only use higher LLP_MIN for binned
 resolutions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-imx219_fixes_v2-v1-1-0e3f5dd9b024@ideasonboard.com>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
In-Reply-To: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BtEu9PtRzSnbhZz0wx2YPb1bjhWIGOD8GrfxUZprkJk=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBntcS1Z9tXBZffzSrfiji0QsQeFlUCLRPEWNsoW
 19Wp7mBtbqJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7XEtQAKCRBD3pH5JJpx
 RUauD/wJKZMu/YFRSfE5sJx4ma8ZFSu0ZyPj4/lXS1ZFgEJjuw6CTx7N7pzVtaCEGzHbTrbxadp
 GxdO7yvDVG6KYnPbbqLVB1eRxk85U8B+dyFNgykpQG7n05iGrb0So3vruiakN2PRdIRCUH2CmYp
 dfff4BHNv8i1L4oPun4Q/l//v2ziboTXSMTnx8lR6CUKtUqypBFvjtIrsAKCMhHY+losfHFOI4a
 5p8TUh8LIMLvky/9s8vtVRMBXkSpgFkhybWO9+D+SwBdiZnTKw+sN++gR1zB8JL1J75IIRji7ja
 cU2TahOf2LNfZTPolGTKoloh0LjiCEL131ZV/ynYlvYFR2672Rv8+W9/mnaZaJ5lJZb1PRGZAVi
 XQ+bgNbs43LHe/nb7bZHZAjeucvBlESotai1wbfi9qWVPi0JFNxD61WFNQa4zR/Yk+WGEYRpSJI
 D70vngoQ2+GwDlFbaHRV1OZKZZhGseq098pSlJlQgrzdiYwhQ8qm9eaTashRhI61Jwdp38apVa+
 iSFfG4AsKHbivr/2NlYUAT2VIi5WH7lgiZPM65AuoBzgfUZK1RhGrZ3mZz/l5Kgop3NKsi/pZ3i
 2EfbviOuaRlStogE/fXERF+Z8QrI5aIZc0fDaIeDhLb36752LJDuOJRG3oDy1TeciRgLB5OVIYi
 KBMLHshrr//DLPw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The LLP_MIN of 3560 is only needed to fix artefacts seen with binned
resolutions. As increasing the LLP reduces the highest possible
framerate by ~3%, use the default minimum of 3448 for non-binned
resolutions.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Link: https://lore.kernel.org/linux-media/CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d755114265aad46c5cc7f5031b9bc0dbba..6e51a7af5e2a05cacefb201d96a9fbdc349f17d8 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -74,7 +74,8 @@
 #define IMX219_FLL_MAX			0xffff
 #define IMX219_VBLANK_MIN		32
 #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
-#define IMX219_LLP_MIN			0x0de8
+#define IMX219_LLP_MIN			0x0d78
+#define IMX219_BINNED_LLP_MIN		0x0de8
 #define IMX219_LLP_MAX			0x7ff0
 
 #define IMX219_REG_X_ADD_STA_A		CCI_REG16(0x0164)
@@ -317,13 +318,13 @@ static const struct imx219_mode supported_modes[] = {
 		/* 8MPix 15fps mode */
 		.width = 3280,
 		.height = 2464,
-		.fll_def = 3415,
+		.fll_def = 3526,
 	},
 	{
 		/* 1080P 30fps cropped */
 		.width = 1920,
 		.height = 1080,
-		.fll_def = 1707,
+		.fll_def = 1763,
 	},
 	{
 		/* 2x2 binned 60fps mode */
@@ -901,7 +902,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		int exposure_max;
 		int exposure_def;
-		int hblank;
+		int hblank, llp_min;
 		int pixel_rate;
 
 		/* Update limits and set FPS to default */
@@ -918,6 +919,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
@@ -926,10 +938,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 		 * mode width subtracted.
 		 */
 		hblank = prev_line_len - mode->width;
-		__v4l2_ctrl_modify_range(imx219->hblank,
-					 IMX219_LLP_MIN - mode->width,
-					 IMX219_LLP_MAX - mode->width, 1,
-					 IMX219_LLP_MIN - mode->width);
 		__v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
 
 		/* Scale the pixel rate based on the mode specific factor */

-- 
2.48.1


