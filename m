Return-Path: <linux-media+bounces-35266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A863AE04C2
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2017C5A42FB
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E572505A9;
	Thu, 19 Jun 2025 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2wmGhDk"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABC238D54
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334329; cv=none; b=b8erfzMfGj5AZ2Va9E/tfTqS37ZMGBPsq/Qwm7N1ZE+Z+2lo8F5eXcsAWdcI18TogDDFL725p8hQhYgp2HSeaNwGmryLjYvB/B+hFgI2JCpQ7cWvEQoVLfAPeFEO9oo8G9G53sEY8rLSzi4Z9BMv/5RtRNQI4qSnIR/OCyuyQqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334329; c=relaxed/simple;
	bh=5rWsQ32KoNsXDnhtqvv5hdVfi727tUc0Te4r5ANZZtc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PwSOmrw6eo99fVY5h6V5137mtkjIvn7vJt14vabl8vKbnaescoMfgCVbfXJAAfAaEvYKHF4Od48yv4m33dlTFvQ7KvmHrzH1ueduFzvrDoXACs4aGFbJjlhV7zrtlsDn6oa9QL3Ryf+7Rd7WkCWZ1zJAlc4+pep7DCftyKbz7VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2wmGhDk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334328; x=1781870328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5rWsQ32KoNsXDnhtqvv5hdVfi727tUc0Te4r5ANZZtc=;
  b=L2wmGhDkf9HDaLB/eoasFrEZboR5OEyua30cCNPiMnYRGvG2tF40c3wa
   oLUebEtptqtQjpibATAyHXlx2XMEyDhsNMjxechSLhrOOA7B/DNxRQYx7
   dRluINPihTl0CvXzqMbR4hun6x4b63vJyW5fyX7PXXLkwXTwrNgvMe6yr
   7XgEqqI0N/9UUGvjvnettfUn/LRwRf2fglHx2CC8diCAHbI8Jdt9GPWCI
   OZ0RGb/ca8eODs+pNtrpQps2YtYejXr20Qx2JJypqfrNkvnzRyGY/z4Xc
   MTt/vPjFjgpE/zdDMQ0PZxfcnn4r+3k2E8NW94W6GFhdvIhxxs9kQDPjS
   w==;
X-CSE-ConnectionGUID: aja993BpTnqCOszqIhVJug==
X-CSE-MsgGUID: kA27ZbV1RYuMdq7tqzAfBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="64014732"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="64014732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:46 -0700
X-CSE-ConnectionGUID: bPw0tUfjSm+d07G2xYMdLA==
X-CSE-MsgGUID: JYm/EJjjTVio0d0PvSvIZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155192127"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:58:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A3BB7120323;
	Thu, 19 Jun 2025 14:58:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDue-008AHf-22;
	Thu, 19 Jun 2025 14:58:36 +0300
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
Subject: [PATCH v10 01/64] media: ov2740: Remove shorthand variables
Date: Thu, 19 Jun 2025 14:57:33 +0300
Message-Id: <20250619115836.1946016-2-sakari.ailus@linux.intel.com>
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

Remove two variables in ov2740_init_control() that are used as a shorthand
for where the information is really located. Make the code more readable
by removing them.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov2740.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 6cf461e3373c..4e959534e6e7 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -766,11 +766,9 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const struct ov2740_mode *cur_mode;
 	s64 exposure_max, h_blank, pixel_rate;
 	u32 vblank_min, vblank_max, vblank_default;
 	struct v4l2_fwnode_device_properties props;
-	int size;
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
@@ -778,12 +776,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	if (ret)
 		return ret;
 
-	cur_mode = ov2740->cur_mode;
-	size = ARRAY_SIZE(link_freq_menu_items);
-
 	ov2740->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
-				       V4L2_CID_LINK_FREQ, size - 1,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(link_freq_menu_items) - 1,
 				       ov2740->supported_modes->link_freq_index,
 				       link_freq_menu_items);
 	if (ov2740->link_freq)
@@ -794,14 +790,14 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 					       V4L2_CID_PIXEL_RATE, 0,
 					       pixel_rate, 1, pixel_rate);
 
-	vblank_min = cur_mode->vts_min - cur_mode->height;
-	vblank_max = cur_mode->vts_max - cur_mode->height;
-	vblank_default = cur_mode->vts_def - cur_mode->height;
+	vblank_min = ov2740->cur_mode->vts_min - ov2740->cur_mode->height;
+	vblank_max = ov2740->cur_mode->vts_max - ov2740->cur_mode->height;
+	vblank_default = ov2740->cur_mode->vts_def - ov2740->cur_mode->height;
 	ov2740->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_VBLANK, vblank_min,
 					   vblank_max, 1, vblank_default);
 
-	h_blank = cur_mode->hts - cur_mode->width;
+	h_blank = ov2740->cur_mode->hts - ov2740->cur_mode->width;
 	ov2740->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					   V4L2_CID_HBLANK, h_blank, h_blank, 1,
 					   h_blank);
@@ -814,7 +810,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
 			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
 			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
-	exposure_max = cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
+	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
 					     OV2740_EXPOSURE_MIN, exposure_max,
-- 
2.39.5


