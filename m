Return-Path: <linux-media+bounces-50790-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FEDD249A2
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D7F0301D501
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C26B39900F;
	Thu, 15 Jan 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCtnbeoX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FD739B487
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481188; cv=none; b=rhuA3mDaO+FvhdwbkO4b3RGgjvB1/1Ff0SQ8JeMW8Xvi5VS7b8EWxwO/UExkE2rhx7jBketGQWcKLAbOXIA8lYdKF41Jbsm7/CuYOIgJzKYhvvs/ntFlD6dLmII9RqyFVuF7OYlhDeWw9KxS+mckpdZrErpKiEv0E9luI4KMB60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481188; c=relaxed/simple;
	bh=baPGX6+jUFC9QuoGuKPFDsVKSob7RDlHuuols9oTGqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvGgix+Xs7xaEUn6Tj2TaQ+7Vq/iW6gnVuuqzkWzEqxVxcX6Mf2MKztRdHzxgPTV3tQfdyo4OWx8JipsTz1Ilr6qkPASQTdnHH+LyYg3CD+9/LGq86wIesiVIANnr/UcuS1AHM2WE//cXp5kUcunl9eyJWImdd/L3Cx7fMnXarE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCtnbeoX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481186; x=1800017186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=baPGX6+jUFC9QuoGuKPFDsVKSob7RDlHuuols9oTGqU=;
  b=LCtnbeoXAGOMAFKb/AerqfKVrMcL0iAg0L/XFB30odUCTe1phfv5xjsr
   IVPLrGq6LLm6aSepX2Qy/DljpNHkyitw8NtK4/Fl6G7FuNkc8KMs1lfK2
   xb3s8jpr+6jsI4n2oRxEn3jFqdRY0YCuViT6tA66/NreqNs0N4eJfSnY6
   GgWj0zlf60vwrG6UG0i78eiG+PWUnSuscEhMEwCcg8F7f/TVZGAZN49lv
   fEw87a5r0GYXKs70B1dRQ6tVdRicBKCxD4wT6e6doGIP0iZkLuH56S+m6
   bWbB1N9SDlHxiMPPabulZ58vFgC94PpeQc+GIpQo80yxes7tFb77kvJXa
   Q==;
X-CSE-ConnectionGUID: maK8+RBCQWi6f7n2TGlbbQ==
X-CSE-MsgGUID: LztDUrvWSR+nqlXQP3/6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80428319"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80428319"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:20 -0800
X-CSE-ConnectionGUID: BipDtsOeQRem/1pA7KF3rw==
X-CSE-MsgGUID: WewPVyndTPquYUMCqBEGsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204980467"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.213])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:46:19 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0605A121DBB;
	Thu, 15 Jan 2026 14:46:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgMjs-00000000UMZ-3iiF;
	Thu, 15 Jan 2026 14:46:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH 7/7] media: i2c: imx219: Inline imx219_update_pad_format() in its caller
Date: Thu, 15 Jan 2026 14:46:12 +0200
Message-ID: <20260115124612.116663-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
References: <20260115124612.116663-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx219_update_pad_format() is short and called from a single place,
in imx219_set_pad_format(). Inline the code in the caller to keep all
format adjustments grouped in a single place and improve readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index bc55fe2a93b4..fee63bc106d9 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -792,21 +792,6 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
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
@@ -858,12 +843,24 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 	prev_line_len = format->width + imx219->hblank->val;
 
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
+
 	*format = fmt->format;
 
 	/*
-- 
2.47.3


