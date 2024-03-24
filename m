Return-Path: <linux-media+bounces-7692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3482B887F55
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 23:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD76F1F215CB
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 22:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D4338FB9;
	Sun, 24 Mar 2024 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SXY87t6x"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB91CF92
	for <linux-media@vger.kernel.org>; Sun, 24 Mar 2024 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318153; cv=none; b=XN8q/xURDlagj5ZeAdVggCeu9hMKER0LfrTw7X+qGibIav7wGpgmrRvc/tpJn3q78vyiPXbV4WwHg0mvAGJH6UcVW4qAVLHkB/FJTC41wzSs0a2swzANaUHrsGFS5B9Ge7xLRYt1CSr9XZTss/gDzCOW7rqtND9RbLxmlOv3Bi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318153; c=relaxed/simple;
	bh=IurxyhF0Rr+Zmx0yYclKnIBDme5B86iFuQnfwJ7yv9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UP/7TnFxp/XKrM8TzNhJ9JNYSALsr3K1nES3thnYdu8zVsEa0kbsYdMgfKfuIkEr9aUJbZTIXRdqoXI/eP3+uYLgvMRbYRGkIdg10jXN56v8LP5+VFEuR7Td0hpb8Hj4bzZymJW8/kxy24SkyK5mm4cEg0UNEyn42CpWRvpCgQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SXY87t6x; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66B9C1FAF;
	Sun, 24 Mar 2024 23:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711318113;
	bh=IurxyhF0Rr+Zmx0yYclKnIBDme5B86iFuQnfwJ7yv9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXY87t6xPNWiC+qaUt8RpXHKS07Si3DACDyRw1CheDT83AThgCiAdtC0Su/Qm1zqu
	 0yxNnoIWxl5DwEjJHaZeNazbMtbz9rUOfoQeDkll1pN+K9SQh7qp3N2DCJb+4/I0Jl
	 9M1WuoJ4UVBmTxzguwWhLgUildeEiTBVMVD8rzzU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v7 01/15] media: i2c: imx219: Inline imx219_update_pad_format() in its caller
Date: Mon, 25 Mar 2024 00:08:37 +0200
Message-ID: <20240324220854.15010-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx219_update_pad_format() is short and called from a single place,
in imx219_set_pad_format(). Inline the code in the caller to keep all
format adjustments grouped in a single place and improve readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index e17ef2e9d9d0..3878da50860e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -758,21 +758,6 @@ static int imx219_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
-static void imx219_update_pad_format(struct imx219 *imx219,
-				     const struct imx219_mode *mode,
-				     struct v4l2_mbus_framefmt *fmt, u32 code)
-{
-	/* Bayer order varies with flips */
-	fmt->code = imx219_get_format_code(imx219, code);
-	fmt->width = mode->width;
-	fmt->height = mode->height;
-	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_RAW;
-	fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
-	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
-}
-
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -819,12 +804,23 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 	unsigned int bin_h, bin_v;
 
+	/*
+	 * Adjust the requested format to match the closest mode. The Bayer
+	 * order varies with flips.
+	 */
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
 				      width, height,
 				      fmt->format.width, fmt->format.height);
 
-	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
+	fmt->format.code = imx219_get_format_code(imx219, fmt->format.code);
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 	*format = fmt->format;
-- 
Regards,

Laurent Pinchart


