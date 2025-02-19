Return-Path: <linux-media+bounces-26361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE681A3BD62
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 12:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13EC7189C92B
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3811E00BE;
	Wed, 19 Feb 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LVpI5S7p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739931DEFF7;
	Wed, 19 Feb 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965646; cv=none; b=rX4UaAba4gN3kR/pj1UikbvYOeMzqw0At31RRJdwL2QlmJjQfk2yF9QFakDqeeZXRbRUKRMv5VM4lwLwkfGxSpDjB11UXc0nNl1jSA51ST9HJzUSBgRcvM8LPpHaYfhVKOpRollZil9B1Au/aKW/1A/xtei3Nf3eMQcpngSFrhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965646; c=relaxed/simple;
	bh=VlV8WyFDoIICqjbwQwi/nMjALKnR7Xan0VUKAoqPBWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWtJK6Jk6+FZoy4fp1GXmjSJX4QnniOdzdV8vdvXd1lCvcYVmmyPNFldvqcNHMJbJSt1hf60t43Kog0ZrqTSjrLfGjxTaYbqmf4wnzDRK37YTkz6pUawDpSFZzMWVRnoX49OTcz0Wjj3yy/pFn6Ja0YNGZntLCHDjd3FwArYOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LVpI5S7p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9A6D169;
	Wed, 19 Feb 2025 12:45:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739965560;
	bh=VlV8WyFDoIICqjbwQwi/nMjALKnR7Xan0VUKAoqPBWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LVpI5S7pK0XHgfI0Bud1a1KzP0hBaVIT+rg9TywQGaTDXZYOR+Wp6xyplbXbDvHaJ
	 fH+38dsd3cJ2jQSfQzJ5NmpGOpXm54TCKcmBj03rf4j77j5Lwo0ooKRoYXfvCAs+cG
	 7vXh/G5pCN2VX+d7Wy+HYz70DTISiebgLX4PT0NA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 19 Feb 2025 17:16:44 +0530
Subject: [PATCH 2/3] media: i2c: imx219: Simplify binning mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-imx219_fixes_v2-v1-2-0e3f5dd9b024@ideasonboard.com>
References: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
In-Reply-To: <20250219-imx219_fixes_v2-v1-0-0e3f5dd9b024@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4441;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=VlV8WyFDoIICqjbwQwi/nMjALKnR7Xan0VUKAoqPBWE=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBntcS2R7N2vZJ3Ej9O2E4jvpNldmtt4MrdQwwzF
 yvfAwQGatiJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7XEtgAKCRBD3pH5JJpx
 RbRZEAC1vjnpW+gpW4E8mmm1kR7yRMJYX1mtXU4der2QAFz73kyyO0XJqGJmWmQeKMDdXnXk9XE
 3qs947Pb1sNlcprR+S6/DY75tnmp+XXjxyy89Y78ROsMF4EZqroZfK5OANuKgt3AaYErkHrcrJp
 tTMagj4hnKk6WGMUo5dJUn1YAXvH6IE9DXWS36PU8SVg11wjkGcplKmISWKeZFTt4xIqS06JgMo
 Grcm2K8PaeQnlypn5q9N6eYT9TEj7sYx5C3zjWXCT6rK0bK0CKbG2oRFKjvRHt/L5LcdycuyvHR
 iyRZzwXzFRuZ3hIuvK6/+4Wj5GCmv/wrX1W1lxcjmTE076j3Fiftx2VMignwRzYEC87Osomb8wN
 DHpL0yBjeMIO6QELQ9gtnwDqF083hAoh9wLTB6OTHqTfpoG2IjN8aaXjWDXHhHqDxv+3ix02YP9
 y0YBgstd5GhBcKCqZBy6lKldLfvSrU9ZbLYIvUzLFuTKDmdpKFB/EYpjODqcTBoSjOtL1d0PRan
 Cm42XGw3YMzzFPsDN5+2sDZ/e6lzG//fr8cCxX8B2+E6Jiew9YTIV+tzKZO88WZBgG2u+XW0TM7
 +M4Yta4I6wBZFPy0PJWq8MjHw4Rb//wPFBltktxrITDGRYgih41iAM5VGsQr76SoKAaI2qKMp9W
 HoPNGEelIAA346g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The imx219_get_binning() function currently returns two separate pieces
of information, the return value is the binning mode enum, and the bin_h
and bin_v references are updated with whether to perform binning in
horizontal and vertical dimensions.

It is simpler to combine both of these pieces of information, and
directly update the bin_h and bin_v references with the register value
that we will write to the sensor, which includes if the binning is
digital or analog mode, thus allowing us to remove the superfluous
binning mode enum.

This is only a style change for the driver, with no functionality
updated.

Suggested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Link: https://lore.kernel.org/linux-media/ubuuob7mb3o5bxoumrxv4rufutgk3lvdmdery6d3bfc6rytfti@tcchhlechzzp/
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 55 +++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6e51a7af5e2a05cacefb201d96a9fbdc349f17d8..f02732d8fa95de0a295f247d4f0b60017dbb2ed2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -146,12 +146,6 @@
 #define IMX219_PIXEL_ARRAY_WIDTH	3280U
 #define IMX219_PIXEL_ARRAY_HEIGHT	2464U
 
-enum binning_mode {
-	BINNING_NONE = IMX219_BINNING_NONE,
-	BINNING_X2 = IMX219_BINNING_X2,
-	BINNING_ANALOG_X2 = IMX219_BINNING_X2_ANALOG,
-};
-
 /* Mode : resolution and related config&values */
 struct imx219_mode {
 	/* Frame width */
@@ -406,39 +400,43 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
 	}
 }
 
-static enum binning_mode imx219_get_binning(struct imx219 *imx219, u8 *bin_h,
-					    u8 *bin_v)
+static void imx219_get_binning(struct imx219 *imx219, u8 *bin_h, u8 *bin_v)
 {
 	struct v4l2_subdev_state *state =
 		v4l2_subdev_get_locked_active_state(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format =
 		v4l2_subdev_state_get_format(state, 0);
 	const struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	u32 hbin = crop->width / format->width;
+	u32 vbin = crop->height / format->height;
 
-	*bin_h = crop->width / format->width;
-	*bin_v = crop->height / format->height;
+	*bin_h = IMX219_BINNING_NONE;
+	*bin_v = IMX219_BINNING_NONE;
 
-	if (*bin_h == 2 && *bin_v == 2)
-		return BINNING_ANALOG_X2;
-	else if (*bin_h == 2 || *bin_v == 2)
-		/*
-		 * Don't use analog binning if only one dimension
-		 * is binned, as it crops the other dimension
-		 */
-		return BINNING_X2;
-	else
-		return BINNING_NONE;
+	/*
+	 * Use analog binning only if both dimensions are binned, as it crops
+	 * the other dimension.
+	 */
+	if (hbin == 2 && vbin == 2) {
+		*bin_h = IMX219_BINNING_X2_ANALOG;
+		*bin_v = IMX219_BINNING_X2_ANALOG;
+
+		return;
+	}
+
+	if (hbin == 2)
+		*bin_h = IMX219_BINNING_X2;
+	if (vbin == 2)
+		*bin_v = IMX219_BINNING_X2;
 }
 
 static inline u32 imx219_get_rate_factor(struct imx219 *imx219)
 {
 	u8 bin_h, bin_v;
-	enum binning_mode binning = imx219_get_binning(imx219, &bin_h, &bin_v);
 
-	if (binning == BINNING_ANALOG_X2)
-		return 2;
+	imx219_get_binning(imx219, &bin_h, &bin_v);
 
-	return 1;
+	return (bin_h & bin_v) == IMX219_BINNING_X2_ANALOG ? 2 : 1;
 }
 
 /* -----------------------------------------------------------------------------
@@ -674,7 +672,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	enum binning_mode binning;
 	u8 bin_h, bin_v;
 	u32 bpp;
 	int ret = 0;
@@ -692,11 +689,9 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	binning = imx219_get_binning(imx219, &bin_h, &bin_v);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H,
-		  (bin_h == 2) ? binning : BINNING_NONE, &ret);
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V,
-		  (bin_v == 2) ? binning : BINNING_NONE, &ret);
+	imx219_get_binning(imx219, &bin_h, &bin_v);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);

-- 
2.48.1


