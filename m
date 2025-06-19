Return-Path: <linux-media+bounces-35320-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD788AE04D4
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC3C41897180
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D092A25B684;
	Thu, 19 Jun 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYIwgY/9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA27625B1FF
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334368; cv=none; b=KV6f/6doc4g/NFP66bUl/QrASRiom40F3rsA8IljcYe7ZN7d6GWPGdi+kiZ2ISxtiKCcRr+IF8oHgk3G9B592PWI20DRltBtEYtoMi/bfeV11IDQkr19TshexTAK4JuhDtvpcnTJ1dL2OTT6mrYlp4gup1Ih8d6/w8o2IJB7sNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334368; c=relaxed/simple;
	bh=bORtEvIMswYof+qNyP8X8ZsgLp2zbk8trsFJS/uaRUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JZr37aheMWBKVWzI5RGFvG62sLXKMaKikUUkAZSDiFYeBLOzG+XHQYArkFnqRjlArpSIbKWi836R9EShilblN/6HM2Y7NCeE9tKA3l7maJlVI1VjB5d7JSVtOlaLO9qFV6q9k8rgWeavWtN1tFg/T1Mwl3qv1Qiz3CgJwnwWLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYIwgY/9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334367; x=1781870367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bORtEvIMswYof+qNyP8X8ZsgLp2zbk8trsFJS/uaRUQ=;
  b=SYIwgY/9fFFE/gy3HyjYpGaqb9Udo8/V0wMUe/FnpDC5AiKBh4ImD7pZ
   ViOfJz5KN58oqrBAsLc4zf3hwPOxNsOkCJF3E3fUCXZ8ILXnBEttTNd27
   ZM72jz4IdZOpXU9q++illNXgYU7qxbpHVwLCJXtf1IRq2gpONtV/wSyuK
   WW7IGscNSMwYzCN4I3TW00QDwgFyNuTYfAIX1f0dtS/3BCe4qQxAnAJn7
   OOPop80GK+G7rw/HOgVJA314kQwvIm/t0cGzMkhiPvFDx8ciaHOu/cddH
   jerWG0Mrjb49eM5/HXP4Gpa65qsm6fKlNiEdlS2/8+isdOp2bPXPL0ieo
   Q==;
X-CSE-ConnectionGUID: r//N5Q0XQdaMwUdh7fV3dg==
X-CSE-MsgGUID: npF8+TadQta8gCzah/cJSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386777"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386777"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
X-CSE-ConnectionGUID: /cYhmGfxRYSOQtXBHA+muA==
X-CSE-MsgGUID: b+gAxYUbRpy2Jeri3uPuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908467"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6106F123281;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALv-1C;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 54/64] media: i2c: imx219: Inline imx219_update_pad_format() in its caller
Date: Thu, 19 Jun 2025 14:58:26 +0300
Message-Id: <20250619115836.1946016-55-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
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
index 3b4f68543342..6c84b7a4cc64 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -799,21 +799,6 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
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
@@ -864,12 +849,24 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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
2.39.5


