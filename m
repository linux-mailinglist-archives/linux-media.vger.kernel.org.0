Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34C8F5263A5
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 16:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350758AbiEMOQh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 10:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346668AbiEMOQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 10:16:15 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444FB1194AC
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652451370; x=1683987370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CJg8M0MK68zJnQWBEOwXPXBhXbcLF9nzWgXdqyJs6zg=;
  b=g9YzljbwymJX6Ajr/PYNf2jfcv9AoqSnyM36ihssEBmBVbf6NW9x72Ii
   gJl7P0qzlCHhPQkQdaTGtbJ8f+H5FBl/Li58vOO51n1dM35nvjZy724Ck
   pX7xMA0+fBRq+cPow9ErruRlGXdM80ZrdLrrLsEZBvzsx9a93AKkQZQFJ
   5L1J7uoCHVZdSfaTaRtjosnXDhmeqVkdAHrAi4yb6r1GNz+hx4u0I3WJt
   GShTiwBg443F8WUQA76UpxkOZfxCSU12fqfZHeuXWAiIRw1lLygvryH07
   JKqr3G11lLRHLiHywp/PO/mHyLgk6rdbYvksBCkw17QjVv27/Qfygyf/W
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252360910"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="252360910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="815393377"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 07:16:04 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 1D33121C0D;
        Fri, 13 May 2022 17:15:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1npW59-0001hH-DB; Fri, 13 May 2022 17:15:51 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        mirela.rabulea@nxp.com, xavier.roumegue@oss.nxp.com,
        tomi.valkeinen@ideasonboard.com, hugues.fruchet@st.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com, aford173@gmail.com,
        festevam@gmail.com, Eugen.Hristev@microchip.com,
        jbrunet@baylibre.com, paul.elder@ideasonboard.com,
        eddy.khan@vergesense.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 28/28] media: ov5640: Move format mux config in format
Date:   Fri, 13 May 2022 17:15:48 +0300
Message-Id: <20220513141548.6344-29-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
References: <20220513141548.6344-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The image format produced by the sensor is controlled by two registers,
whose values computation is open coded in ov5640_set_framefmt().

As we have a list of formats already, move the OV5640_REG_FORMAT_CONTROL00
and OV5640_REG_ISP_FORMAT_MUX_CTRL register values to the static list
of formats instead of open coding it.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Acked-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Tested-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov5640.c | 233 +++++++++++++++++++------------------
 1 file changed, 117 insertions(+), 116 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 44f26d5cf029c..502f0b62e9505 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -192,86 +192,142 @@ struct ov5640_pixfmt {
 	u32 code;
 	u32 colorspace;
 	u8 bpp;
+	u8 ctrl00;
+	enum ov5640_format_mux mux;
 };
 
 static const struct ov5640_pixfmt ov5640_dvp_formats[] = {
 	{
-		.code = MEDIA_BUS_FMT_JPEG_1X8,
-		.colorspace = V4L2_COLORSPACE_JPEG,
-		.bpp = 16,
+		/* YUV422, YUYV */
+		.code		= MEDIA_BUS_FMT_JPEG_1X8,
+		.colorspace	= V4L2_COLORSPACE_JPEG,
+		.bpp		= 16,
+		.ctrl00		= 0x30,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_UYVY8_2X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* YUV422, UYVY */
+		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x3f,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* YUV422, YUYV */
+		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x30,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_RGB565_2X8_LE,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x6f,
+		.mux		= OV5640_FMT_MUX_RGB,
 	}, {
-		.code = MEDIA_BUS_FMT_RGB565_2X8_BE,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* RGB565 {r[4:0],g[5:3]},{g[2:0],b[4:0]} */
+		.code		= MEDIA_BUS_FMT_RGB565_2X8_BE,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x61,
+		.mux		= OV5640_FMT_MUX_RGB,
 	}, {
-		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw, BGBG... / GRGR... */
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x00,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8
+		/* Raw bayer, GBGB... / RGRG... */
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x01,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw bayer, GRGR... / BGBG... */
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x02,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw bayer, RGRG... / GBGB... */
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x03,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	},
 	{ /* sentinel */ }
 };
 
 static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
 	{
-		.code = MEDIA_BUS_FMT_JPEG_1X8,
-		.colorspace = V4L2_COLORSPACE_JPEG,
-		.bpp = 16,
+		/* YUV422, YUYV */
+		.code		= MEDIA_BUS_FMT_JPEG_1X8,
+		.colorspace	= V4L2_COLORSPACE_JPEG,
+		.bpp		= 16,
+		.ctrl00		= 0x30,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_UYVY8_1X16,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* YUV422, UYVY */
+		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x3f,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_1X16,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* YUV422, YUYV */
+		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x30,
+		.mux		= OV5640_FMT_MUX_YUV422,
 	}, {
-		.code = MEDIA_BUS_FMT_RGB565_1X16,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 16,
+		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
+		.code		= MEDIA_BUS_FMT_RGB565_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 16,
+		.ctrl00		= 0x6f,
+		.mux		= OV5640_FMT_MUX_RGB,
 	}, {
-		.code = MEDIA_BUS_FMT_BGR888_1X24,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 24,
+		/* BGR888: RGB */
+		.code		= MEDIA_BUS_FMT_BGR888_1X24,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 24,
+		.ctrl00		= 0x23,
+		.mux		= OV5640_FMT_MUX_RGB,
 	}, {
-		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw, BGBG... / GRGR... */
+		.code		= MEDIA_BUS_FMT_SBGGR8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x00,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8
+		/* Raw bayer, GBGB... / RGRG... */
+		.code		= MEDIA_BUS_FMT_SGBRG8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x01,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw bayer, GRGR... / BGBG... */
+		.code		= MEDIA_BUS_FMT_SGRBG8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x02,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	}, {
-		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.colorspace = V4L2_COLORSPACE_SRGB,
-		.bpp = 8,
+		/* Raw bayer, RGRG... / GBGB... */
+		.code		= MEDIA_BUS_FMT_SRGGB8_1X8,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.bpp		= 8,
+		.ctrl00		= 0x03,
+		.mux		= OV5640_FMT_MUX_RAW_DPC,
 	},
 	{ /* sentinel */ }
 };
@@ -2970,76 +3026,21 @@ static int ov5640_get_selection(struct v4l2_subdev *sd,
 static int ov5640_set_framefmt(struct ov5640_dev *sensor,
 			       struct v4l2_mbus_framefmt *format)
 {
+	bool is_jpeg = format->code == MEDIA_BUS_FMT_JPEG_1X8;
+	const struct ov5640_pixfmt *pixfmt;
 	int ret = 0;
-	bool is_jpeg = false;
-	u8 fmt, mux;
 
-	switch (format->code) {
-	case MEDIA_BUS_FMT_UYVY8_1X16:
-	case MEDIA_BUS_FMT_UYVY8_2X8:
-		/* YUV422, UYVY */
-		fmt = 0x3f;
-		mux = OV5640_FMT_MUX_YUV422;
-		break;
-	case MEDIA_BUS_FMT_YUYV8_1X16:
-	case MEDIA_BUS_FMT_YUYV8_2X8:
-		/* YUV422, YUYV */
-		fmt = 0x30;
-		mux = OV5640_FMT_MUX_YUV422;
-		break;
-	case MEDIA_BUS_FMT_RGB565_2X8_LE:
-	case MEDIA_BUS_FMT_RGB565_1X16:
-		/* RGB565 {g[2:0],b[4:0]},{r[4:0],g[5:3]} */
-		fmt = 0x6F;
-		mux = OV5640_FMT_MUX_RGB;
-		break;
-	case MEDIA_BUS_FMT_RGB565_2X8_BE:
-		/* RGB565 {r[4:0],g[5:3]},{g[2:0],b[4:0]} */
-		fmt = 0x61;
-		mux = OV5640_FMT_MUX_RGB;
-		break;
-	case MEDIA_BUS_FMT_BGR888_1X24:
-		/* BGR888: RGB */
-		fmt = 0x23;
-		mux = OV5640_FMT_MUX_RGB;
-		break;
-	case MEDIA_BUS_FMT_JPEG_1X8:
-		/* YUV422, YUYV */
-		fmt = 0x30;
-		mux = OV5640_FMT_MUX_YUV422;
-		is_jpeg = true;
-		break;
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		/* Raw, BGBG... / GRGR... */
-		fmt = 0x00;
-		mux = OV5640_FMT_MUX_RAW_DPC;
-		break;
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-		/* Raw bayer, GBGB... / RGRG... */
-		fmt = 0x01;
-		mux = OV5640_FMT_MUX_RAW_DPC;
-		break;
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-		/* Raw bayer, GRGR... / BGBG... */
-		fmt = 0x02;
-		mux = OV5640_FMT_MUX_RAW_DPC;
-		break;
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-		/* Raw bayer, RGRG... / GBGB... */
-		fmt = 0x03;
-		mux = OV5640_FMT_MUX_RAW_DPC;
-		break;
-	default:
-		return -EINVAL;
-	}
+	pixfmt = ov5640_code_to_pixfmt(sensor, format->code);
 
 	/* FORMAT CONTROL00: YUV and RGB formatting */
-	ret = ov5640_write_reg(sensor, OV5640_REG_FORMAT_CONTROL00, fmt);
+	ret = ov5640_write_reg(sensor, OV5640_REG_FORMAT_CONTROL00,
+			       pixfmt->ctrl00);
 	if (ret)
 		return ret;
 
 	/* FORMAT MUX CONTROL: ISP YUV or RGB */
-	ret = ov5640_write_reg(sensor, OV5640_REG_ISP_FORMAT_MUX_CTRL, mux);
+	ret = ov5640_write_reg(sensor, OV5640_REG_ISP_FORMAT_MUX_CTRL,
+			       pixfmt->mux);
 	if (ret)
 		return ret;
 
-- 
2.30.2

