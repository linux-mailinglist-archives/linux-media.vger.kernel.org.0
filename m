Return-Path: <linux-media+bounces-6257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F372886EB2A
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DA21F2378C
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7B85820C;
	Fri,  1 Mar 2024 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bpsJmjQB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427D58AA6
	for <linux-media@vger.kernel.org>; Fri,  1 Mar 2024 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328754; cv=none; b=uAC44uPDkMEZEWKq9bPkc3dmcJbrvm8ONMg2Wb8KAEjhhfHesc46MYX2zyG5PjxLiYqKsnB1hi4IyBULlKs5E2cY8OJhLW/1RScRQi7HvQM1+pZk+DcuyB7qjHlkjDR2LOJ4Ev19RFLR9yxZiVjMwOveIU9oi9MkyFmyH3OTM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328754; c=relaxed/simple;
	bh=ebTtc8MMaAC+aPJJrjae2Fn9I4hX5Eit5aOXr5R7Ys8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prPb+ci//ZAq6UKY3V0IagfThgcEgAbUZfJwg4xwE0nR6ELFLOwvQKMQUYvUacoV3ixw+rZGgFRILOvOzFA3iC8d1Ztv+Sy440vHZpuEkBAtzotRAcb+hcMcb5ClKQ+nq23eGcTBmlSR1LMi4TxBx3KZXcnsv/bM2iVC2xCZA40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bpsJmjQB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71F4BD04;
	Fri,  1 Mar 2024 22:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328736;
	bh=ebTtc8MMaAC+aPJJrjae2Fn9I4hX5Eit5aOXr5R7Ys8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bpsJmjQBkcsKVZtqtJp+3Nlu5mTJ5FxyL1yonKDy2tylOl/B0cULFcdoSD0OmiW6b
	 F9p3eXRN3VPh2UXPzC/UxZotPsY2ExwpgJc2IY0QwKz03EiR6fCiSOzlTPqaJyYoiN
	 psj+qQgTv34bJTWwjoq2KZAn4Ey0vHag1FUFsJqI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v6 01/15] media: i2c: imx219: Inline imx219_update_pad_format() in its caller
Date: Fri,  1 Mar 2024 23:32:16 +0200
Message-ID: <20240301213231.10340-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx219_update_pad_format() is short and called from a single place,
in imx219_set_pad_format(). Inline the code in the caller to keep all
format adjustements grouped in a single place and improve readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


