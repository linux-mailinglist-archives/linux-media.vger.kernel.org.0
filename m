Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3E8A1E928B
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 18:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgE3QPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 12:15:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729120AbgE3QPU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 12:15:20 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 99FA720723;
        Sat, 30 May 2020 16:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590855319;
        bh=32qXr+mbEQxPkrTFD/6PakCp+9hWYzGKGdyuoTKUSRY=;
        h=From:To:Cc:Subject:Date:From;
        b=OdGLG7tx3NSMsr+D2tQFWKcLqOpVHRKT1sZgI1ZsQlD+f+d5K3Cvwt4zwqz1CAdxe
         JRsT3wwJSxaEsrCR6o25atfrnvzLMwIZTuG0IWb1mS5dEOIKPAYACuczFjblJ9n0Zu
         E/qtHQh/u+hJ5CDBLWFo0J8TH4Ou3z0D/PvjYpnM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jf48j-002rjX-4z; Sat, 30 May 2020 18:15:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: atomisp: remove format duplication at mbus->fourcc table
Date:   Sat, 30 May 2020 18:15:14 +0200
Message-Id: <00469a56c0f88554b58892486df55ebfcfb80618.1590855313.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This table used to be used also to translate between ia_css
abstraction and V4L2 fourcc codes.

This was removed on a past patch, but the table now contains
two fields with identical values.

Get rid of one of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  8 ++--
 .../media/atomisp/pci/atomisp_subdev.c        | 42 +++++++++----------
 .../media/atomisp/pci/atomisp_subdev.h        |  1 -
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index efae44c3be43..cea3c1bcefa9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5026,7 +5026,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 			 mipi_info->input_format);
 		if (!fc)
 			return -EINVAL;
-		input_format = fc->css_stream_fmt;
+		input_format = fc->atomisp_in_fmt;
 	} else {
 		struct v4l2_mbus_framefmt *sink;
 
@@ -5036,7 +5036,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		fc = atomisp_find_in_fmt_conv(sink->code);
 		if (!fc)
 			return -EINVAL;
-		input_format = fc->css_stream_fmt;
+		input_format = fc->atomisp_in_fmt;
 		bayer_order = fc->bayer_order;
 	}
 
@@ -5047,7 +5047,7 @@ static inline int atomisp_set_sensor_mipi_to_isp(
 		 mipi_info->metadata_format);
 	if (!fc)
 		return -EINVAL;
-	input_format = fc->css_stream_fmt;
+	input_format = fc->atomisp_in_fmt;
 	atomisp_css_input_configure_port(asd,
 					 __get_mipi_port(asd->isp, mipi_info->port),
 					 mipi_info->num_lanes,
@@ -5230,7 +5230,7 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 		if (!fc)
 			return -EINVAL;
 		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
-		    raw_output_format_match_input(fc->css_stream_fmt,
+		    raw_output_format_match_input(fc->atomisp_in_fmt,
 						  pix->pixelformat))
 			return -EINVAL;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index ba0eb60e87d9..7bc8083a2fb5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -31,31 +31,31 @@
 #include "atomisp_internal.h"
 
 const struct atomisp_in_fmt_conv atomisp_in_fmt_conv[] = {
-	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_BGGR, ATOMISP_INPUT_FORMAT_RAW_8 },
-	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GBRG, ATOMISP_INPUT_FORMAT_RAW_8 },
-	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GRBG, ATOMISP_INPUT_FORMAT_RAW_8 },
-	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_RGGB, ATOMISP_INPUT_FORMAT_RAW_8 },
-	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_BGGR, ATOMISP_INPUT_FORMAT_RAW_10 },
-	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GBRG, ATOMISP_INPUT_FORMAT_RAW_10 },
-	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GRBG, ATOMISP_INPUT_FORMAT_RAW_10 },
-	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_RGGB, ATOMISP_INPUT_FORMAT_RAW_10 },
-	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_BGGR, ATOMISP_INPUT_FORMAT_RAW_12 },
-	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GBRG, ATOMISP_INPUT_FORMAT_RAW_12 },
-	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GRBG, ATOMISP_INPUT_FORMAT_RAW_12 },
-	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_RGGB, ATOMISP_INPUT_FORMAT_RAW_12 },
-	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0, ATOMISP_INPUT_FORMAT_YUV422_8 },
-	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0, ATOMISP_INPUT_FORMAT_YUV422_8 },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, 8, ATOMISP_INPUT_FORMAT_RAW_8, IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, 10, ATOMISP_INPUT_FORMAT_RAW_10, IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_BGGR },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GBRG },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_GRBG },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, 12, ATOMISP_INPUT_FORMAT_RAW_12, IA_CSS_BAYER_ORDER_RGGB },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0 },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, 8, ATOMISP_INPUT_FORMAT_YUV422_8, 0 },
 #if 0 // disabled due to clang warnings
-	{ MEDIA_BUS_FMT_JPEG_1X8, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
-	{ V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, IA_CSS_FRAME_FORMAT_NV12, 0, IA_CSS_FRAME_FORMAT_NV12 },
-	{ V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, IA_CSS_FRAME_FORMAT_NV21, 0, IA_CSS_FRAME_FORMAT_NV21 },
+	{ MEDIA_BUS_FMT_JPEG_1X8, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0 },
+	{ V4L2_MBUS_FMT_CUSTOM_NV12, 12, 12, IA_CSS_FRAME_FORMAT_NV12, 0 },
+	{ V4L2_MBUS_FMT_CUSTOM_NV21, 12, 12, IA_CSS_FRAME_FORMAT_NV21, 0 },
 #endif
-	{ V4L2_MBUS_FMT_CUSTOM_YUV420, 12, 12, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, 0, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY },
+	{ V4L2_MBUS_FMT_CUSTOM_YUV420, 12, 12, ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY, 0 },
 #if 0
-	{ V4L2_MBUS_FMT_CUSTOM_M10MO_RAW, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0, ATOMISP_INPUT_FORMAT_BINARY_8 },
+	{ V4L2_MBUS_FMT_CUSTOM_M10MO_RAW, 8, 8, IA_CSS_FRAME_FORMAT_BINARY_8, 0 },
 #endif
 	/* no valid V4L2 MBUS code for metadata format, so leave it 0. */
-	{ 0, 0, 0, ATOMISP_INPUT_FORMAT_EMBEDDED, 0, ATOMISP_INPUT_FORMAT_EMBEDDED },
+	{ 0, 0, 0, ATOMISP_INPUT_FORMAT_EMBEDDED, 0 },
 	{}
 };
 
@@ -642,7 +642,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			atomisp_css_input_set_bayer_order(isp_sd, stream_id,
 							  fc->bayer_order);
 			atomisp_css_input_set_format(isp_sd, stream_id,
-						     fc->css_stream_fmt);
+						     fc->atomisp_in_fmt);
 			atomisp_css_set_default_isys_config(isp_sd, stream_id,
 							    ffmt);
 		}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e60ec7eea646..330a77eed8aa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -61,7 +61,6 @@ struct atomisp_in_fmt_conv {
 	u8 depth; /* uncompressed */
 	enum atomisp_input_format atomisp_in_fmt;
 	enum ia_css_bayer_order bayer_order;
-	enum atomisp_input_format css_stream_fmt;
 };
 
 struct atomisp_sub_device;
-- 
2.26.2

