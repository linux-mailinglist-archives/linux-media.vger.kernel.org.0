Return-Path: <linux-media+bounces-40992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B0B33C04
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42B571885A82
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E262E1745;
	Mon, 25 Aug 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWPXzfv/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0C2E1744
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115524; cv=none; b=oBsRsWIBPkQM6iv713pJLlP+Kros50EKs240/gw4brPZWoHaSF4U5W49IsrUpQQchGvT3kFf8Nwhe+PIR+x0ePpJPXOkPxv13DLvAS5LGXNfsho0XRw0Ov5I6d3+7URoHezjd6RUosnY/L1FHePB1UurpB6GZ4f7if7UeQp3qFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115524; c=relaxed/simple;
	bh=lHuTGO+qc7AImKT2eRA1NCS1J53tBaXoPbOTUBnlj4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htOqJJ00kajEiFwOsr+5d0U2JihVveJVZFjjjm6b/LXpOL2xJz5pD/yUBwAl9gT64h5G2A7mWax8HdUEnEDPhwpnT3ianrDRCcNFmaEkRq7Z+S4yfC4jq9p6ew70IOUN6tKQGPRxCxyuS+KhMjj9kDjoUUiI6npC0G25CUzPg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWPXzfv/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115524; x=1787651524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lHuTGO+qc7AImKT2eRA1NCS1J53tBaXoPbOTUBnlj4M=;
  b=aWPXzfv/ItJeF1P5JWY9fCSnw9Owq5yRA+desEMXERAiXGYFUsSRSGLX
   cNL1bSOZtf2w8nFqm9kJnhiYHjopEqF4jkYzb5e5kz0CxEYxR5217a076
   X4c4Vj7m7i8Tm+He4kvBBIF1Y5o51qIpmVkBKP7K1Q+hiksDW9hbSkQms
   MaIB3LUYjAcLwAPvTrsYF+2x1fTnsbPSfRYroDh92eWOaMWTp6+c9zwHs
   4WgBZviQFH6BYX2I6LvHIrIfG7ZxObrD8cprlLuTut6Ks/G2BP8zoTWNf
   njIZ0MC4uUlhVr8Tpn2TwLSU8fXFwzJXywgSv8aGbkBGqVlHtQGJiNsk3
   A==;
X-CSE-ConnectionGUID: A2M5mXHNRr+piX4Xnz6uEw==
X-CSE-MsgGUID: okXzSl7mRMKna7fm9cUsVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032501"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032501"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:55 -0700
X-CSE-ConnectionGUID: ZkwZmbQrQC6pnI1mQl58/w==
X-CSE-MsgGUID: zA1QIw6fQ7yvixoifncEIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431164"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:47 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 52E95122010;
	Mon, 25 Aug 2025 12:51:09 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr3-00000005aiH-1GAW;
	Mon, 25 Aug 2025 12:51:09 +0300
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
Subject: [PATCH v11 63/66] media: imx219: Add support for generic raw formats
Date: Mon, 25 Aug 2025 12:51:04 +0300
Message-ID: <20250825095107.1332313-64-sakari.ailus@linux.intel.com>
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

Add support for colour pattern agnostic raw formats, including controls to
convey the colour pattern and related information.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/imx219.c | 47 +++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index d2d64a1644a9..b0e1e02f5210 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -284,6 +284,12 @@ static const u32 imx219_mbus_formats[] = {
 	MEDIA_BUS_FMT_SBGGR8_1X8,
 };
 
+static const u32 imx219_mbus_formats_raw[] = {
+	IMX219_NATIVE_FORMAT,
+	MEDIA_BUS_FMT_RAW_10,
+	MEDIA_BUS_FMT_RAW_8,
+};
+
 /*
  * Initialisation delay between XCLR low->high and the moment when the sensor
  * can start capture (i.e. can leave software stanby) must be not less than:
@@ -386,6 +392,10 @@ static u32 imx219_get_format_code(struct imx219 *imx219, u32 code)
 {
 	unsigned int i;
 
+	if (code == MEDIA_BUS_FMT_RAW_10 ||
+	    code == MEDIA_BUS_FMT_RAW_8)
+		return code;
+
 	for (i = 0; i < ARRAY_SIZE(imx219_mbus_formats); i++)
 		if (imx219_mbus_formats[i] == code)
 			break;
@@ -650,6 +660,20 @@ static int imx219_init_controls(struct imx219 *imx219)
 		/* The "Solid color" pattern is white by default */
 	}
 
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_COLOR_PATTERN,
+			  V4L2_COLOR_PATTERN_RGGB, V4L2_COLOR_PATTERN_RGGB,
+			  1, V4L2_COLOR_PATTERN_RGGB);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+			  V4L2_CID_COLOR_PATTERN_FLIP,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH,
+			  0, V4L2_COLOR_PATTERN_FLIP_BOTH);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_METADATA_LAYOUT,
+			  0, V4L2_METADATA_LAYOUT_CCS,
+			  1, V4L2_METADATA_LAYOUT_CCS);
+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_CONFIG_MODEL,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR,
+			  0, V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err_probe(&client->dev, ret, "Control init failed\n");
@@ -870,13 +894,19 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	struct imx219 *imx219 = to_imx219(sd);
 
 	switch (code->pad) {
-	case IMX219_PAD_IMAGE:
+	case IMX219_PAD_IMAGE: {
+		const u32 img_codes[] = {
+			IMX219_NATIVE_FORMAT,
+			MEDIA_BUS_FMT_RAW_10,
+		};
+
 		/* The internal image pad is hardwired to the native format. */
-		if (code->index > 0)
+		if (code->index > ARRAY_SIZE(img_codes))
 			return -EINVAL;
 
-		code->code = IMX219_NATIVE_FORMAT;
+		code->code = img_codes[code->index];
 		return 0;
+	}
 
 	case IMX219_PAD_EDATA:
 		if (code->index > 0)
@@ -898,10 +928,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->stream == IMX219_STREAM_IMAGE) {
 		u32 format;
 
-		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
-			return -EINVAL;
+		if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4) {
+			u32 idx = code->index - ARRAY_SIZE(imx219_mbus_formats);
+			if (idx >= ARRAY_SIZE(imx219_mbus_formats_raw))
+				return -EINVAL;
 
-		format = imx219_mbus_formats[code->index * 4];
+			format = imx219_mbus_formats_raw[idx];
+		} else {
+			format = imx219_mbus_formats[code->index * 4];
+		}
 		code->code = imx219_get_format_code(imx219, format);
 	} else {
 		struct v4l2_mbus_framefmt *fmt;
-- 
2.47.2


