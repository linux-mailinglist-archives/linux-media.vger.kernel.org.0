Return-Path: <linux-media+bounces-40973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD76B33BF6
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3D971889968
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055A42DF70E;
	Mon, 25 Aug 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9iBC/ho"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E082D7DED
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115513; cv=none; b=idOLK9cfw1A/aFSGTqnYE4HhZwdigdqi9r7C4vFMjz6/WJ4nnEfg82zHCYdkyWgthPiCbumdKA25DgyYg67rO3Rl92aB9C9ZnOMjd7j9XEg0wjZq6Kkh3srDBTaB0xSk8FCYKD8Cnryd+XrePRjebHSQAAsJIitQzB/sZ6MzozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115513; c=relaxed/simple;
	bh=sS8oolTotKaU4NlM8tb7UK2AEua8KEQMCCmnuNJ+DIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFdDLLwWaew/p+XicyDKoeMeiRpDLL0G7EO6rHpCkf/1hFX6+ROd7C9Q23ZhoUg9Duj2YyfxZiMUsPv55rgVn+yqNQB1TV72XV5vwKJm7+Z38WkOexvD4b4lhvWoaulPmwFCoIoAV8g3CtL2fbAhdlnr4657RMPgpFt97yq3V3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9iBC/ho; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115512; x=1787651512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sS8oolTotKaU4NlM8tb7UK2AEua8KEQMCCmnuNJ+DIw=;
  b=n9iBC/ho1yDiPi+TSF410k0ub3SgkvZeQ1rTRrfGM2L2kB9mM1hWAAw1
   I+M8IoRWfCrDlNRLVICkHir1EbjSZn+44+KbiCPPVnnxBfgSkIEsSMhyq
   jHFfdeOJXsIUDorW4Wo3TjYzfei8xZ1Pb2h/BHbkkkOMuVuyyQY6JIVkY
   867U2FZpJsxZIyNKFo7yH5sx5fMsyO0CnewoGLTKPIyWEfM1jEpsueOwq
   X1Q7bGvhtQvVdDYLIWrwrEPBFoHmIagFVQjRuJNbUd2tMTpvZpQYE1v7f
   QMPER20sx5sOqrRa3SdMH8INOSzaDxYsioHHuUbuqLv2LWdI9ccax2T/w
   g==;
X-CSE-ConnectionGUID: a9qMpUJuRpKGFZsmnQu0cA==
X-CSE-MsgGUID: +if776eATZSQzxAsYgxOng==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032250"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032250"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:45 -0700
X-CSE-ConnectionGUID: K2xyCU//RaOb1oBtYF4ndA==
X-CSE-MsgGUID: xhLg8EmWRC6yHIDNJ2a0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431089"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C2578121FFE;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agz-3Bjl;
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
Subject: [PATCH v11 47/66] media: ov2740: Add support for embedded data
Date: Mon, 25 Aug 2025 12:50:48 +0300
Message-ID: <20250825095107.1332313-48-sakari.ailus@linux.intel.com>
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

Add support for embedded data. This introduces two internal pads for pixel
and embedded data streams. As the driver supports a single mode only,
there's no need for backward compatibility in mode selection.

The embedded data is configured to be placed before the image data whereas
after the image data is the default.

This patch includes switching to {enable,disable}_streams as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov2740.c | 245 +++++++++++++++++++++++++++++--------
 1 file changed, 191 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 4e959534e6e7..684e6999dbd9 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,6 +12,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -72,6 +73,15 @@
 #define OV2740_REG_ISP_CTRL00		0x5000
 /* ISP CTRL01 */
 #define OV2740_REG_ISP_CTRL01		0x5001
+
+/* Embedded data line location control */
+#define OV2740_REG_EMBEDDED_FLAG	0x5a08
+#define OV2740_EMBEDDED_FLAG_FOOTER	BIT(2) /* otherwise it's in header */
+#define OV2740_EMBEDDED_FLAG_MYSTERY	BIT(1)
+#define OV2740_REG_EMBEDDED_DT		0x3036
+#define OV2740_REG_EMBEDDED_CTRL	0x4307
+#define OV2740_EMBEDDED_CTRL_MYSTERY	0x30
+#define OV2740_EMBEDDED_CTRL_ENABLE	BIT(0)
 /* Customer Addresses: 0x7010 - 0x710F */
 #define CUSTOMER_USE_OTP_SIZE		0x100
 /* OTP registers from sensor */
@@ -83,6 +93,21 @@ static const char * const ov2740_supply_name[] = {
 	"DVDD",
 };
 
+enum {
+	OV2740_PAD_SOURCE,
+	OV2740_PAD_PIXEL,
+	OV2740_PAD_META,
+	OV2740_NUM_PADS,
+};
+
+enum {
+	OV2740_STREAM_PIXEL,
+	OV2740_STREAM_META,
+};
+
+#define OV2740_META_WIDTH		100U
+#define OV2740_META_HEIGHT		1U
+
 struct nvm_data {
 	struct nvmem_device *nvmem;
 	struct regmap *regmap;
@@ -156,6 +181,7 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
 	{0x3000, 0x00},
 	{0x3018, 0x32},
 	{0x3031, 0x0a},
+	{OV2740_REG_EMBEDDED_DT, MIPI_CSI2_DT_EMBEDDED_8B},
 	{0x3080, 0x08},
 	{0x3083, 0xB4},
 	{0x3103, 0x00},
@@ -260,7 +286,8 @@ static const struct ov2740_reg mode_1932x1092_regs_360mhz[] = {
 	{0x4017, 0x10},
 	{0x4044, 0x02},
 	{0x4304, 0x08},
-	{0x4307, 0x30},
+	{OV2740_REG_EMBEDDED_CTRL,
+	 OV2740_EMBEDDED_CTRL_MYSTERY | OV2740_EMBEDDED_CTRL_ENABLE},
 	{0x4320, 0x80},
 	{0x4322, 0x00},
 	{0x4323, 0x00},
@@ -309,6 +336,7 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
 	{0x3000, 0x00},
 	{0x3018, 0x32},	/* 0x32 for 2 lanes, 0x12 for 1 lane */
 	{0x3031, 0x0a},
+	{OV2740_REG_EMBEDDED_DT, MIPI_CSI2_DT_EMBEDDED_8B},
 	{0x3080, 0x08},
 	{0x3083, 0xB4},
 	{0x3103, 0x00},
@@ -413,7 +441,8 @@ static const struct ov2740_reg mode_1932x1092_regs_180mhz[] = {
 	{0x4017, 0x10},
 	{0x4044, 0x02},
 	{0x4304, 0x08},
-	{0x4307, 0x30},
+	{OV2740_REG_EMBEDDED_CTRL,
+	 OV2740_EMBEDDED_CTRL_MYSTERY | OV2740_EMBEDDED_CTRL_ENABLE},
 	{0x4320, 0x80},
 	{0x4322, 0x00},
 	{0x4323, 0x00},
@@ -520,7 +549,7 @@ static const struct ov2740_mode supported_modes_180mhz[] = {
 
 struct ov2740 {
 	struct v4l2_subdev sd;
-	struct media_pad pad;
+	struct media_pad pads[OV2740_NUM_PADS];
 	struct v4l2_ctrl_handler ctrl_handler;
 
 	/* V4L2 Controls */
@@ -548,6 +577,9 @@ struct ov2740 {
 
 	/* True if the device has been identified */
 	bool identified;
+
+	/* Track streaming state */
+	u8 streaming;
 };
 
 static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
@@ -938,16 +970,28 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 	return ret;
 }
 
-static int ov2740_start_streaming(struct ov2740 *ov2740)
+static int ov2740_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_reg_list *reg_list;
 	int link_freq_index;
 	int ret;
 
+	if (ov2740->streaming) {
+		ov2740->streaming |= streams_mask;
+		return 0;
+	}
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov2740_identify_module(ov2740);
 	if (ret)
-		return ret;
+		goto out_pm_put;
 
 	if (ov2740->nvm)
 		ov2740_load_otp_data(ov2740->nvm);
@@ -956,7 +1000,7 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
 	if (ret) {
 		dev_err(&client->dev, "failed to reset\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	usleep_range(10000, 15000);
@@ -966,85 +1010,104 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(&client->dev, "failed to set plls\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	reg_list = &ov2740->cur_mode->reg_list;
 	ret = ov2740_write_reg_list(ov2740, reg_list);
 	if (ret) {
 		dev_err(&client->dev, "failed to set mode\n");
-		return ret;
+		goto out_pm_put;
 	}
 
 	ret = __v4l2_ctrl_handler_setup(ov2740->sd.ctrl_handler);
 	if (ret)
-		return ret;
+		goto out_pm_put;
+
+	ret = ov2740_write_reg(ov2740, OV2740_REG_EMBEDDED_FLAG, 1,
+			       OV2740_EMBEDDED_FLAG_MYSTERY);
+	if (ret)
+		goto out_pm_put;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
 			       OV2740_MODE_STREAMING);
-	if (ret)
+	if (ret) {
 		dev_err(&client->dev, "failed to start streaming\n");
+		goto out_pm_put;
+	}
 
-	return ret;
-}
+	ov2740->streaming |= streams_mask;
 
-static void ov2740_stop_streaming(struct ov2740 *ov2740)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
+	return 0;
 
-	if (ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
-			     OV2740_MODE_STANDBY))
-		dev_err(&client->dev, "failed to stop streaming\n");
+out_pm_put:
+	pm_runtime_put(&client->dev);
+
+	return ret;
 }
 
-static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov2740_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
-	struct ov2740 *ov2740 = to_ov2740(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev_state *sd_state;
-	int ret = 0;
-
-	sd_state = v4l2_subdev_lock_and_get_active_state(&ov2740->sd);
+	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret;
 
-	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0)
-			goto out_unlock;
+	ov2740->streaming &= ~streams_mask;
+	if (ov2740->streaming)
+		return 0;
 
-		ret = ov2740_start_streaming(ov2740);
-		if (ret) {
-			enable = 0;
-			ov2740_stop_streaming(ov2740);
-			pm_runtime_put(&client->dev);
-		}
-	} else {
-		ov2740_stop_streaming(ov2740);
-		pm_runtime_put(&client->dev);
-	}
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
+			       OV2740_MODE_STANDBY);
 
-out_unlock:
-	v4l2_subdev_unlock_state(sd_state);
+	pm_runtime_put(&client->dev);
 
 	return ret;
 }
 
-static int ov2740_set_format(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
-			     struct v4l2_subdev_format *fmt)
+static int __ov2740_set_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *sd_state,
+			       struct v4l2_mbus_framefmt *format,
+			       enum v4l2_subdev_format_whence which,
+			       unsigned int pad, unsigned int stream)
 {
+	struct v4l2_mbus_framefmt *src_pix_fmt, *src_meta_fmt, *pix_fmt,
+		*meta_fmt;
 	struct ov2740 *ov2740 = to_ov2740(sd);
 	const struct ov2740_mode *mode;
 	s32 vblank_def, h_blank;
 
+	/*
+	 * Allow setting format on internal pixel pad as well as the source
+	 * pad's pixel stream (for compatibility).
+	 */
+	if ((pad == OV2740_PAD_SOURCE && stream == OV2740_STREAM_META) ||
+	    pad == OV2740_PAD_META) {
+		*format = *v4l2_subdev_state_get_format(sd_state, pad, stream);
+		return 0;
+	}
+
+	pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_PIXEL, 0);
+	meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_META, 0);
+	src_pix_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+						   OV2740_STREAM_PIXEL);
+	src_meta_fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+						    OV2740_STREAM_META);
+
 	mode = v4l2_find_nearest_size(ov2740->supported_modes,
 				      ov2740->supported_modes_count,
 				      width, height,
-				      fmt->format.width, fmt->format.height);
+				      format->width, format->height);
+	ov2740_update_pad_format(mode, pix_fmt);
+	*format = *src_pix_fmt = *pix_fmt;
 
-	ov2740_update_pad_format(mode, &fmt->format);
-	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	meta_fmt->code = MEDIA_BUS_FMT_META_10;
+	meta_fmt->width = OV2740_META_WIDTH;
+	meta_fmt->height = OV2740_META_HEIGHT;
+	*src_meta_fmt = *meta_fmt;
 
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
 
 	ov2740->cur_mode = mode;
@@ -1064,6 +1127,14 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2740_set_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_format *fmt)
+{
+	return __ov2740_set_format(sd, sd_state, &fmt->format, fmt->which,
+				   fmt->pad, fmt->stream);
+}
+
 static int ov2740_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1100,15 +1171,73 @@ static int ov2740_enum_frame_size(struct v4l2_subdev *sd,
 static int ov2740_init_state(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state)
 {
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = OV2740_PAD_PIXEL,
+			.source_pad = OV2740_PAD_SOURCE,
+			.source_stream = OV2740_STREAM_PIXEL,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = OV2740_PAD_META,
+			.source_pad = OV2740_PAD_SOURCE,
+			.source_stream = OV2740_STREAM_META,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.routes = routes,
+		.num_routes = ARRAY_SIZE(routes),
+	};
+	struct v4l2_subdev_state *active_state;
+	struct v4l2_mbus_framefmt format = { 0 };
 	struct ov2740 *ov2740 = to_ov2740(sd);
+	int ret;
+
+	ret = v4l2_subdev_set_routing(sd, sd_state, &routing);
+	if (ret)
+		return ret;
+
+	active_state = v4l2_subdev_get_locked_active_state(sd);
+
+	ov2740_update_pad_format(&ov2740->supported_modes[0], &format);
+
+	return __ov2740_set_format(sd, sd_state, &format,
+				   active_state == sd_state ?
+				   V4L2_SUBDEV_FORMAT_ACTIVE :
+				   V4L2_SUBDEV_FORMAT_TRY, OV2740_PAD_PIXEL, 0);
+}
+
+static int ov2740_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *desc)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = desc->entry;
+	struct v4l2_subdev_state *sd_state;
+	struct v4l2_mbus_framefmt *fmt;
+
+	desc->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(sd_state, OV2740_PAD_SOURCE,
+					   OV2740_STREAM_PIXEL);
+	entry->pixelcode = fmt->code;
+	v4l2_subdev_unlock_state(sd_state);
+
+	entry->stream = OV2740_STREAM_PIXEL;
+	entry->bus.csi2.dt = MIPI_CSI2_DT_RAW10;
+	entry++;
+	desc->num_entries++;
+
+	entry->pixelcode = MEDIA_BUS_FMT_META_10;
+	entry->stream = OV2740_STREAM_META;
+	entry->bus.csi2.dt = MIPI_CSI2_DT_EMBEDDED_8B;
+	entry++;
+	desc->num_entries++;
 
-	ov2740_update_pad_format(&ov2740->supported_modes[0],
-				 v4l2_subdev_state_get_format(sd_state, 0));
 	return 0;
 }
 
 static const struct v4l2_subdev_video_ops ov2740_video_ops = {
-	.s_stream = ov2740_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
@@ -1116,6 +1245,9 @@ static const struct v4l2_subdev_pad_ops ov2740_pad_ops = {
 	.set_fmt = ov2740_set_format,
 	.enum_mbus_code = ov2740_enum_mbus_code,
 	.enum_frame_size = ov2740_enum_frame_size,
+	.enable_streams = ov2740_enable_streams,
+	.disable_streams = ov2740_disable_streams,
+	.get_frame_desc = ov2740_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops ov2740_subdev_ops = {
@@ -1419,11 +1551,16 @@ static int ov2740_probe(struct i2c_client *client)
 	}
 
 	ov2740->sd.state_lock = ov2740->ctrl_handler.lock;
-	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov2740->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
 	ov2740->sd.entity.ops = &ov2740_subdev_entity_ops;
 	ov2740->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	ov2740->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&ov2740->sd.entity, 1, &ov2740->pad);
+	ov2740->pads[OV2740_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ov2740->pads[OV2740_PAD_PIXEL].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+	ov2740->pads[OV2740_PAD_META].flags =
+		MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+	ret = media_entity_pads_init(&ov2740->sd.entity,
+				     ARRAY_SIZE(ov2740->pads), ov2740->pads);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto probe_error_v4l2_ctrl_handler_free;
-- 
2.47.2


