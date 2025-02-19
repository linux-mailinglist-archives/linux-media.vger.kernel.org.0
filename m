Return-Path: <linux-media+bounces-26362-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63597A3BD64
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0D657A26B9
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EB91E00BF;
	Wed, 19 Feb 2025 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dLngnWDT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59101DF730;
	Wed, 19 Feb 2025 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965653; cv=none; b=hAgBKmlIjEsDeimVXg5KwlrQ7mIB0QRN7ic4QOX9uhero0AE42IDNTSJAx/W6NLKXkeYqi1jcJKt2j2O+Q47V1pta1vbh5wWj4OmDwhUHHfca/I36ei2nKTMoYi3YlybIzztVwVwyFS1kFbE76tp8SJdh3YFZi6RBYQsxNz/+Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965653; c=relaxed/simple;
	bh=4F4BQbwhZ42l1hicc/rXsFLMooM0Yyz+PO4b6Gl8KkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N04e53UJOWFlOpZR2EdPM4r4FKNEQwh/cGfEddZYxz3axhTcq4oaSvNbaUDk/2yl+En9HoPPHFkqO2uDNex16Pukzc9wfavYIcaq5rOul8t51rBN1E4+ErepvC5sYin9hleeO5rDmfD08ExPN5HXI6E8EFz0lOsxbyKYZDtbdeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dLngnWDT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9506E169;
	Wed, 19 Feb 2025 12:46:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739965568;
	bh=4F4BQbwhZ42l1hicc/rXsFLMooM0Yyz+PO4b6Gl8KkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dLngnWDT2KtTfOleSMZsTTkgKtZvtHz5QvJA2PwhbLbS12wixGtAZW7plzORvawCj
	 c3xql2gQWWAp0cXP7hoIQm2TWuUY3ulzUpG8B0bFbo2+2YvT+zKkfbO0GBcz7BcBIG
	 EBtnZ56VLZAGEZDPc0vgk59aKvwUnYYdIrYdxgNc=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 19 Feb 2025 17:16:45 +0530
Subject: [PATCH 3/3] media: i2c: imx219: Use subdev state to calculate
 binning and pixelrate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-imx219_fixes_v2-v1-3-0e3f5dd9b024@ideasonboard.com>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
In-Reply-To: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2950;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=4F4BQbwhZ42l1hicc/rXsFLMooM0Yyz+PO4b6Gl8KkM=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBntcS25HVKh8yh9wn7Cve+Ujd9p3brD8cupdGR0
 0ZhU4L4M/mJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7XEtgAKCRBD3pH5JJpx
 RS4wEACd3PVfkrQM1pon3+eOtOBmLWQxoJ2LD6hErMtOghdW76jFmhyRNZFPS0+Yg41vB1db6Wj
 litNPIiAo8JucJDmIh/Lk7zd5cf1h7/UbK+UczBNZwp+bvJIm7nweIHFGj5WOFhjezP2UQ1X5qT
 nzRMBETFtlPciOhoZhPS4nf5Uf985EfF1BDEFol2fg/JXP6R5ZzcqlJeZ1rrXSu3iStRiVhxdvX
 0CXlykoLPyiLK4ri65jx093Hm1u67imrpBNXopRcDDtDYAjMyunO11cc3fTIEU2ymcACUhG3LzR
 Pkkq0lwVyWaif6gNjQw5REI8IwTgN7sqJiJVKJUfvv2SDQFBn40k76C3RBCQ+tnGiBFh8BAlho1
 1Yq8uiMLn65SOy0X9G7Wc5ctKRNNPjzhJqI2De+k5biTRHwMhQisTbXkYPCd33Yc3WvUkwWEmbf
 H9XICemEfeJhtDVKuerT0iA9RkbrFRC6LX5aNnLEcq+bwMxWtCdkZ8EPmd8AP52WrmR25uCaE1H
 kwQpbxcnMd1yq7VdoYP99PghDVYfC6ZjlTTzESIQiwXYeqTOVJT1ojPQw4rzXveybOcSm3LWl7N
 Be83R4Aseh5UhwcK2Zh8A4SXJB4+BialR0Ns9kbNYQQgQmHVMGJA9CKrd6g2rJCH5y3lrEY3P3T
 lO9TYwlt3VvWKPA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate and binning calculations need the format and resolution
of the sensor, so pass the v4l2 subdev state directly instead of always
operating on the active state.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Link: https://lore.kernel.org/linux-media/sejl7xskif6rlpdsg3jhczjwe5gi6rs53ehbyka6omv2zeg7qq@4iis7i2lla5p/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f02732d8fa95de0a295f247d4f0b60017dbb2ed2..0adfe8e5775ba6661f7d06fedfd920d91c24cba5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -400,10 +400,9 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
-static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
+static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
+			       u8 *bin_v)
 {
-	struct v4l2_subdev_state *state =
-		v4l2_subdev_get_locked_active_state(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format =
 		v4l2_subdev_state_get_format(state, 0);
 	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
@@ -430,11 +429,11 @@ static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
 		*bin_v = IMX219_BINNING_X2;
 }
 
-static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
+static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *state)
 {
 	u8 bin_h, bin_v;
 
-	imx219_get_binning(imx219, &bin_h, &bin_v);
+	imx219_get_binning(state, &bin_h, &bin_v);
 
 	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
@@ -455,7 +454,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
-	rate_factor = imx219_get_rate_factor(imx219);
+	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -689,7 +688,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	imx219_get_binning(imx219, &bin_h, &bin_v);
+	imx219_get_binning(state, &bin_h, &bin_v);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
 
@@ -937,7 +936,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Scale the pixel rate based on the mode specific factor */
 		pixel_rate = imx219_get_pixel_rate(imx219) *
-			     imx219_get_rate_factor(imx219);
+			     imx219_get_rate_factor(state);
 		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
 					 pixel_rate, 1, pixel_rate);
 	}

-- 
2.48.1


