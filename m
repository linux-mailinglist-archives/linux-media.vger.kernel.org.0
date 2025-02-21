Return-Path: <linux-media+bounces-26560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD30A3F286
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 11:52:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD808700B1E
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BB52080EB;
	Fri, 21 Feb 2025 10:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RqkUuMnz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FC1F0E27;
	Fri, 21 Feb 2025 10:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740135159; cv=none; b=Ayz1oucME+YvjR8JV13TC+6IaaS3Hj1Kh4Wwbo+rzX61ZyFjGyKCU2iOqp2wOChCvlnXlTY5hkL3GwJaclmWIHeFu/2jcCOpGeaq1VL+Gih4eDGkytgNZUEBNvhCjnSGWFdfkBUjZOQfeXzvp9cA5HPRDBnEWVi7G0wajXFaJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740135159; c=relaxed/simple;
	bh=WAHtWMpHlTKYllOEkTcIYXk283ppVbyt8Gtb1RsBEHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHig2aeL1/UVWFobeCaqjm2ZvQPsaBl/5j3pPVFQ4oDhZvQD6CqmxGsCRYrutMGebMqDXv5YAt6pacRuVt9gm6Oz7y15WLZXpS2NqQ1I7k+HCUnp+xtozJq+d4JSmVdNLcVH4OjeIQncJtKhJAa8vLOZOShRcBWcyPD5BO0JpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RqkUuMnz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:4abb:6de5:9248:813e:8db3])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5A892EC;
	Fri, 21 Feb 2025 11:51:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740135072;
	bh=WAHtWMpHlTKYllOEkTcIYXk283ppVbyt8Gtb1RsBEHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqkUuMnzP3NjOoUtAQnDineYZ0DQuGsBmfB//8NxBmAOuiEKy3Kz7czPRxilB6jii
	 wvp7xoYGfYccYxiBwOA7z9D/dgiygTlBu12wp5WgoJ/7jHM7dYwSLFfNpCyWFAc1mx
	 04LSmslth4CbHpr9gj3HQEuz2qHJQIft7CR/auvo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 21 Feb 2025 16:22:13 +0530
Subject: [PATCH v2 1/3] media: i2c: imx219: Simplify binning mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-imx219_fixes_v2-v2-1-a72154c7c267@ideasonboard.com>
References: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
In-Reply-To: <20250221-imx219_fixes_v2-v2-0-a72154c7c267@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4500;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=WAHtWMpHlTKYllOEkTcIYXk283ppVbyt8Gtb1RsBEHY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnuFrh+vfFsWdf/NeuEJJCxT6frPI+bteB3jPGg
 c3s6DXgDQSJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7ha4QAKCRBD3pH5JJpx
 Rb9TD/9P7fD2yTSNo2RUKP9qn6OcW6D1HF8PHiN19XhEFMUNSo4PuKeFXcvLJq1hC9SgDeDZEKP
 stDnjmSOfUUK5b11NE0HBLPioJX01KtDkrrPCoDRdIyuMpkrJiSQIlWRb3cKRh2+G+BFGgdFuAd
 ZbxfTEsd73S6Xr9M89dHHYEZKXCcNGTP/cnLEMcQtZE4uyKKkUazK/oPFgVGvKMj3VZ9aJfe9+b
 6kgWOGk75N5LuC7RqnwYl3M3ElR2HEYpMHcrw36YYve7+NFVJDwP6i222orgyMb1CxWDktY2cLY
 D3yp6OpeNpRiO3WqsccXE2pm5/jf0OUuAe4irL/iog8ppKUpMmNv5aMeC2ZLqihAX8adyA1qdBk
 4K1Cp9ZkmDkTVuSMUa/YujDGgnw/LWLn4FGXajO2HPwWLaDJcpAO96Zdkv2kKjKt3I1i8Bxa+02
 vgIo9A/MoBvrALn/JA7Z8jMhxpvvf0+PGOZ9LSmMTD7zYN0o6Rz1bplt+bHmP8zL0NdGKPJF6cw
 fHv6nehkijuc4oXGmVUs8gdnljOfL2WH7+sv/mprM3l2UG8OF/f6fsQjDXbw3xRl9Lco9H2SDNE
 UJ6Bhm33t1QLvSl7ckZBbWICKJ9qxigrAhJz+V/fj6dUqvHfZyYiFUEB1gj2StL6LtY7Af7Irwd
 nQipdftISfoE+6w==
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
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 55 +++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f662c9d755114265aad46c5cc7f5031b9bc0dbba..1e0fecdcbeb102fccb7e3825f83e16358dc1fd9c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -145,12 +145,6 @@
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
@@ -405,39 +399,43 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
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
@@ -673,7 +671,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
-	enum binning_mode binning;
 	u8 bin_h, bin_v;
 	u32 bpp;
 	int ret = 0;
@@ -691,11 +688,9 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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


