Return-Path: <linux-media+bounces-35316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDCCAE04D3
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2274518978A0
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8482472BE;
	Thu, 19 Jun 2025 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAaMrrEX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F36259CBB
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334366; cv=none; b=NnUA3koavXfYSNu7Ainpk65qIBB8uz/CSHHb9xgoblyl2pMtAJAR2egvZ0cafKLhWSmApBt2Vuq/vje1mIpcdRYOMNr0Pmhz1DDZvY7PKlsH5tAtwHHAXq2AVj+2ODvPNSZ8b/loJScAiCYAUzFUXhCDh7yUy2LrBKCTVFxv15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334366; c=relaxed/simple;
	bh=5qmSt/duDCLUpPFE6CNiGAf4Gn9MT3u8hFyQ4ELPS+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tpVC2WDa4n86S5xEY4ImKRqAoQrLIFYTzZ72cqeh2EKIcsp8gry/8Xv6Mu5B2OvcaZJxOjRbayz3A/JoeIos1vvkuC+R4PgNvraOiNBtGnm6CGp/ACpbufdFDj/YLOjPtgISmNju3GIdGnGhjRtbGxY8iuXKbLkO6zKTN1zZi1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAaMrrEX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334365; x=1781870365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5qmSt/duDCLUpPFE6CNiGAf4Gn9MT3u8hFyQ4ELPS+s=;
  b=bAaMrrEXfpyFoddf4Pzir4cawjf15SJIGHuRv3QSZmPb86SG/MtZazAU
   HKIYPEvaRgyjCvq19E8tz2CQca9T9bInFsbuHcOt+u49veDhrk3WfDfwH
   Q3anbkKD6+PjoNwoj9uhnsdHbWjBUzClOr9U9ARp3ZbUcvUMJC02P6vlA
   sum5ek0oX25m79XTO6wMJjlegk9R/yilVEsKSZRUoutIh087mBQreG8ei
   c1oiAyduuFyLn60xh1eFfeEoUakyhz6dU+Cwj+mGxWvvnB3URGzFEztE7
   SYf2cNpf3lWkqa2EiHIy7s9Fusfk8IqFCyTjgiIvEntUKrHtp3k6dDSIX
   w==;
X-CSE-ConnectionGUID: qlBGMJn1Sma1zW8n4YKcpQ==
X-CSE-MsgGUID: V8PECuEvSwmciwbOIBrdtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386736"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: 2oRpTvuzQwyZIyhuk0dN7A==
X-CSE-MsgGUID: saw5w9goRDWrPucBCKV+8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908456"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4D52A123265;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALR-0w;
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
Subject: [PATCH v10 48/64] media: ov2740: Add support for generic raw formats
Date: Thu, 19 Jun 2025 14:58:20 +0300
Message-Id: <20250619115836.1946016-49-sakari.ailus@linux.intel.com>
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

Add Y10 media bus code and V4L2_CID_COLOR_PATTERN as well as
V4L2_CID_COLOR_PATTERN_FLIP control support.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 44 ++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 684e6999dbd9..0b9309fd0461 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -741,7 +741,8 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret;
 
 	/* Propagate change of current control to all related controls */
-	if (ctrl->id == V4L2_CID_VBLANK) {
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
 		exposure_max = ov2740->cur_mode->height + ctrl->val -
 			       OV2740_EXPOSURE_MAX_MARGIN;
@@ -749,6 +750,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 					 ov2740->exposure->minimum,
 					 exposure_max, ov2740->exposure->step,
 					 exposure_max);
+		break;
+	case V4L2_CID_COLOR_PATTERN:
+		return 0;
 	}
 
 	/* V4L2 controls values will be applied only when power is already up */
@@ -804,7 +808,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;
 
 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
 	if (ret)
 		return ret;
 
@@ -852,6 +856,16 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov2740_test_pattern_menu) - 1,
 				     0, 0, ov2740_test_pattern_menu);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_COLOR_PATTERN,
+			  V4L2_COLOR_PATTERN_GRBG, V4L2_COLOR_PATTERN_GRBG,
+			  1, V4L2_COLOR_PATTERN_GRBG);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_COLOR_PATTERN_FLIP,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
 
 	ret = v4l2_fwnode_device_parse(&client->dev, &props);
 	if (ret) {
@@ -876,7 +890,8 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
 {
 	fmt->width = mode->width;
 	fmt->height = mode->height;
-	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->code = fmt->code == MEDIA_BUS_FMT_RAW_10 ?
+		MEDIA_BUS_FMT_RAW_10 : MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->field = V4L2_FIELD_NONE;
 }
 
@@ -1072,7 +1087,7 @@ static int __ov2740_set_format(struct v4l2_subdev *sd,
 			       enum v4l2_subdev_format_whence which,
 			       unsigned int pad, unsigned int stream)
 {
-	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
+	struct v4l2_mbus_framefmt *src_img_fmt, *src_meta_fmt, *img_fmt,
 		*meta_fmt;
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_mode *mode;
@@ -1088,9 +1103,9 @@ static int __ov2740_set_format(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
+	img_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
 	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
-	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+	src_img_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
 						   OV2740_STREAM_PIXEL);
 	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
 						    OV2740_STREAM_META);
@@ -1099,8 +1114,10 @@ static int __ov2740_set_format(struct v4l2_subdev *sd,
 				      ov2740->supported_modes_count,
 				      width, height,
 				      format->width, format->height);
-	ov2740_update_pad_format(mode, pix_fmt);
-	*format = *src_pix_fmt = *pix_fmt;
+
+	img_fmt->code = format->code;
+	ov2740_update_pad_format(mode, img_fmt);
+	*format = *src_img_fmt = *img_fmt;
 
 	meta_fmt->code = MEDIA_BUS_FMT_META_10;
 	meta_fmt->width = OV2740_META_WIDTH;
@@ -1139,10 +1156,14 @@ static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	const u32 codes[] = {
+		MEDIA_BUS_FMT_SGRBG10_1X10,
+		MEDIA_BUS_FMT_RAW_10,
+	};
+	if (code->index >= ARRAY_SIZE(codes))
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	code->code = codes[code->index];
 
 	return 0;
 }
@@ -1157,7 +1178,8 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ov2740->supported_modes_count)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10 &&
+	    fse->code != MEDIA_BUS_FMT_RAW_10)
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.39.5


