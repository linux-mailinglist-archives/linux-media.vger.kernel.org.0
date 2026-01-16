Return-Path: <linux-media+bounces-50888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C077D3126D
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 041DB300D802
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06222163B2;
	Fri, 16 Jan 2026 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRPlgsc6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C341C860A
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566928; cv=none; b=qWYijRIxWoUY1wSV6u6YU+gYLxe1ltTUn7OtbB0BGTrsD4/x1ukTvmcoAtRIlVjxrnHmtPGXkyLwb7cvrYLiBKNEl6KRq9dniuiRCQ/9SYwcg2G04ECgpbTGwGeERdsnyxZtdwHss0Ay4WSajamD0GJDGsxhN8PpTD9k+zxc45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566928; c=relaxed/simple;
	bh=baPGX6+jUFC9QuoGuKPFDsVKSob7RDlHuuols9oTGqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEub85G9+ucQl4bcaAQf1LVAHD6iVJMT8LOnFTSt58m2oYL3aM1X0/AvlY+twk4z1Ap14U7HeY/08eFAQkUbyolMQbTJPOGt6ipcjG3S2fET4xMSKCC0IzaM6au5IDi8TZRLkrLRTmX0CakpS45owRTd3jPiuB3lOwjena1TuTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRPlgsc6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768566921; x=1800102921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=baPGX6+jUFC9QuoGuKPFDsVKSob7RDlHuuols9oTGqU=;
  b=JRPlgsc6m1IIcAuyVfeIH9PHjFC7sTV9RYnN7BNFH5fYkmJ3ttCsINq/
   UY29yf7vPA9Wut+RiF/wBycWlKIcBhSq1HchU4PuE94vsq8nqDJC1I4YZ
   DPVgjBitK11mG68l3mBlnaOr0yHtlibdImiZCnyFSZbHSRCm8AEMYt7Bl
   lD0Ph7mbRcwPVuaRy/rHO3ZMNXyQyuYsuO4/UvVYXIyfMiHHygqA5KW1W
   jeSZAe9I+RSpBJXXZXtHL/ynKXBESNi0r1wfODGzbVUhzp0iPsp5GJ0R1
   jbvId4fHiZiSuDgc4KXZis+mYVh5VaUvBhi190x5BcMOnxYVCg3Hu/YEI
   A==;
X-CSE-ConnectionGUID: UR9geh+OQvG+KSwrm7Advw==
X-CSE-MsgGUID: r5oNEgTGTuGTlqqm0mGreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="81327488"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="81327488"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:19 -0800
X-CSE-ConnectionGUID: 9l19aya0TCGzWr1ZsgGaMg==
X-CSE-MsgGUID: mZY5dmjGRwqZOgCeGUzmPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="205511913"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.150])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 04:35:18 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 22D1212133E;
	Fri, 16 Jan 2026 14:35:15 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vgj2p-00000000vUi-01nO;
	Fri, 16 Jan 2026 14:35:15 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	laurent.pinchart@ideasonboard.com,
	jai.luthra@ideasonboard.com
Subject: [PATCH v2 8/8] media: i2c: imx219: Inline imx219_update_pad_format() in its caller
Date: Fri, 16 Jan 2026 14:35:14 +0200
Message-ID: <20260116123514.220949-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
References: <20260116123514.220949-1-sakari.ailus@linux.intel.com>
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


