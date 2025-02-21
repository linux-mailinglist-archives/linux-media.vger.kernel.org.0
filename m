Return-Path: <linux-media+bounces-26561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B9A3F288
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C9D37ABC05
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34BF2080E7;
	Fri, 21 Feb 2025 10:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LRA9jnMu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87072080C0;
	Fri, 21 Feb 2025 10:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135167; cv=none; b=PYdstWFTn9UV1dEdSY3gGTpr9UcLTolYXl/aJ0KyTxTfL7MPtjPv9kQR9stfibMUYHyyJj/7c/mi8t6KG1TLTTUVBClbIEee/dNxPdlj6yb94sEdMBtTg/WJjuo1PUIXAdKrmVT2yZuijLQS38hZueSZMwMvAkWMYLe3e9ac+ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135167; c=relaxed/simple;
	bh=IYYlnHsDh+vt4zV3ioWkxLzTTYmftnXyjP91GHR/+9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QeF0jhPiE16pRFOoW0Ni2wpdRZIyunbNypU+f4uRBolpADNlT9Js1Nfw0ZWTV5Jh3MhE+5GxOgfoVdql7gR2J6zY2pw4qmdXCULHaapIxt/kiSDFFzgjQXCybqSWQa2nCbHImt2TMTIFMSopwr6yd0BzMnmORW+psTj4r3zBpKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LRA9jnMu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF14E2EC;
	Fri, 21 Feb 2025 11:51:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740135080;
	bh=IYYlnHsDh+vt4zV3ioWkxLzTTYmftnXyjP91GHR/+9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LRA9jnMulm06wMiOJmhzpmpQiJF+T8hD+2RtXfuACjnEYk1QyarI5roLPYIq0/wCJ
	 NrlVbzKjBpzbEIVZZhGlFfi21YRjHdB6EMEAbMB8L/XG3TIXV9Hr/OOxo3EMn1uaS5
	 jV98lKT7K+j3lakznX10idCutlxDUDAxHH9tMrcY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 21 Feb 2025 16:22:14 +0530
Subject: [PATCH v2 2/3] media: i2c: imx219: Use subdev state to calculate
 binning and pixelrate
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-imx219_fixes_v2-v2-2-a72154c7c267@ideasonboard.com>
References: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
In-Reply-To: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=IYYlnHsDh+vt4zV3ioWkxLzTTYmftnXyjP91GHR/+9g=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnuFrhYzd/G4oS6KRz5wy8qxXtFNx1iIWL6CuwZ
 Uc62PuFjGWJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7ha4QAKCRBD3pH5JJpx
 RfDJEACH7OaBFMPzzauiiXv6w599wiQzc4KVmE9liXPH7fZosM5/7EtToSCHQemsT/0ZRKjN6eK
 kaoKguXXpz/UUsRvWAMnIgE57c1UqVRZqBWWEd4ccK2hgBrl832pZFQQ+pFaMz3mmrtXpkXSTiZ
 wRrLBtJmch/HsrVe7FqJODxzFQLeQidlW9V1zCI7+kcyw885ev6XsS6vNqsJleUOlGDwF63x4Bx
 1TPeFlpOUzwlKy7fZRQyVinLvrgpFJ8YyV2OJY5Dks3ntZSOg0n40+NY6tTY/beIb0AdpB2TKHx
 dBE2tbztbV4EWtbRTYDIu5s7RUGFgqOpw4OTsQ3MLheOFPc5gdaDHzEy6TyXCDOTJMMrsXu/XgA
 c5lQs1m/kVDDDQRMhmaJ/ARGxqJXhtHnkX8FCx5WDDZsAovLoOJnmAg1melx28ZAkp/waMhCei4
 XsXy3rzvAUTG66kfzumV5YnzCr/3xSr9WeiCjFU0LtvgP2LQNdtTKbUO8FyUZqHLX3EYE6lC71o
 u4Lfzi0ep3lxEK27esd8PSKizahh8HmmdlofmZZrTHoT2zFY1ovLuAHQmLypuNt3NLStUjCv+Dc
 THRgqEAveAs5FSB+Ef8TrCd02SRl6DlbY6eFCcczOQmRzV3BZWnUNhHUNb3uSy56G5dzciy4EKr
 b4h+9ZM8mUFrtVA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The pixel rate and binning calculations need the format and resolution
of the sensor, so pass the v4l2 subdev state directly instead of always
operating on the active state.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Link: https://lore.kernel.org/linux-media/sejl7xskif6rlpdsg3jhczjwe5gi6rs53ehbyka6omv2zeg7qq@4iis7i2lla5p/
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 1e0fecdcbeb102fccb7e3825f83e16358dc1fd9c..2081822533f9dff0a1ca93a09dd8333ec4043645 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -399,10 +399,9 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
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
@@ -429,11 +428,11 @@ static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
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
@@ -454,7 +453,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
 	format = v4l2_subdev_state_get_format(state, 0);
-	rate_factor = imx219_get_rate_factor(imx219);
+	rate_factor = imx219_get_rate_factor(state);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -688,7 +687,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	imx219_get_binning(imx219, &bin_h, &bin_v);
+	imx219_get_binning(state, &bin_h, &bin_v);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
 	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
 
@@ -929,7 +928,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 		/* Scale the pixel rate based on the mode specific factor */
 		pixel_rate = imx219_get_pixel_rate(imx219) *
-			     imx219_get_rate_factor(imx219);
+			     imx219_get_rate_factor(state);
 		__v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
 					 pixel_rate, 1, pixel_rate);
 	}

-- 
2.48.1


