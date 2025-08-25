Return-Path: <linux-media+bounces-40981-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECCB33BE8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A13C1655FF
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E102E0901;
	Mon, 25 Aug 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSlrhWrm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000032E03EC
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115518; cv=none; b=gtNjjK4tk4W5zqrmDjUlTyDrILn1iuXv+4E574XUgdJCVoDn3ulGJgIChOHMDoSxFhMrlxv/VNJ+tgjLMMJZEkoxRHxCFhIBzTQAHnFwpMahRDNCDkvOQOj90yocBDk1K2kYlciUGgenypb6KC5qKXOv65+FWUXm3Jl5kmVw1oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115518; c=relaxed/simple;
	bh=Oyftip6z57X9GijhrzXQbjUN5uEeKAFtgEp2HnQqu+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8nsUe+709WtAVNeQOygoqLkGm7yhyvxKgI7+AFOd8qBt+3+XBJUbn7rNhBMxuvmY7hJEKBfJ8ZC3dU9Q0Ajg7HLUejzwuHsiO+01qGZzwmPJP1jeqi0adfOeYRdsxRsSCJ5hmwHdATbvx1oqLldhYtZCb1DUX4iExmhVovamm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BSlrhWrm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115518; x=1787651518;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oyftip6z57X9GijhrzXQbjUN5uEeKAFtgEp2HnQqu+A=;
  b=BSlrhWrmUoKiTi+He0NNExn7wV1C2lbcg5G5aBAvw6RhnNpBPT/8Wc2e
   8orm0iQsq7KX0mcXAuMlg5Prgdc7RLhPX/2DiPRTuGXXdyZW6dwlowIHi
   ckHRplJDyu69F8MQTU6sNYqcCYXqkR1hDykTRV2e2TdN9RJY7IT8Gr7Cx
   iH4CBCGu9XOTQjZpZnv1EBnzz+dcafSx9y1fniRaClhbbTId9Mpc/iZ4o
   Cf2g1CdwaYDy1/w7dnKWj6sxG+qnMNVsX6TBoagxhyrhu+K+Pf9TG2SKz
   Bs/7GaM7N63q7ZXRbzu0SiwnLzGPfQMkp5aH0Ext4/3quAG39Ii78w0+B
   A==;
X-CSE-ConnectionGUID: maIR70RpT6Cp8g9banbaOQ==
X-CSE-MsgGUID: 5kAXToBTS9mI+uoc1VOtDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032353"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032353"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:46 -0700
X-CSE-ConnectionGUID: W2NQsXqkSaCQ0VezfPhakw==
X-CSE-MsgGUID: YtTQnuAXQB2U02/K1v+CfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431111"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C776F121FFF;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005ah4-3FxL;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 48/66] media: ov2740: Add support for generic raw formats
Date: Mon, 25 Aug 2025 12:50:49 +0300
Message-ID: <20250825095107.1332313-49-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
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
2.47.2


