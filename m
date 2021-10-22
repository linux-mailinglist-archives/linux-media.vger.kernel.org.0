Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BDE43733D
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbhJVH4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:53 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:17436 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhJVH4q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889270; x=1666425270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YophVPqSKDOhZAeaX0zq7lMCw+/S9NtNX5xE+8ZrvMo=;
  b=xRqGcM8W21xQUKcqP4FpGgC+gLwJyDVB+5wu95sfONT8qN6Fy57xl6Uo
   jbVJLGdwdb7NirNoduk9aest0YiQzFMZYKWkZee8fiPcdM/AKLcoaffLR
   8qBsWMT9w/K9k670r1+R4TVucymTqGPaAvjlGj6wcApCQcl4QBSf23Ut+
   XrbGycLc88gkdiMbjLnvVPu8xYKTgK/N9hUYyQm0Yp14ZnDd+6uT+xf/F
   BUiFoShXj24idJw8Tj3ww56A6dBbde4qRMYmKMDRC3UW/ibqqSIviK9X0
   OKuWBvvqz46FpzvhNMNac/8PkW/oTO6VAxafLlMECgkgx5GkaPd21ap+i
   A==;
IronPort-SDR: xtWR+VxUGXkaS/4HzDYnrNhrrEoXi/BI5Vb1eaBgimoIz+wrvPragc6+S75PGg/MoaIld1kzkB
 5sJlNyWo+KlmYzxTctVR9D4MnBK07ezy/kKM8cRYgb6HLVxT/UhQDXPIL5Ev7bUd2IvX742m7S
 kVXwbaZ1YpyNCfNGNav4i9tMFj9y3DOsF6YZSgU1JaAWiyC/zEDbNf7JSCUjEOgEPN6sXYWhj+
 tZLEr45+L09XvLy1lqzJMsIjbl5oauPt4+EpsRQeNpJFRJkcWe+s9+xWZXnk10qVPH0Uw4FRHx
 Cm/Ouag6WGAQBuW2UEPfE4kH
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="136538099"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:28 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:25 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 12/21] media: atmel: atmel-isc-base: fix bytesperline value for planar formats
Date:   Fri, 22 Oct 2021 10:52:38 +0300
Message-ID: <20211022075247.518880-13-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The bytesperline field of the pixfmt should be only for the first plane
in case of planar formats like YUV420 or YUV422.
The bytesperline is used by the driver to compute the framesize.
We have to report a different bpp (bytes per pixel) to v4l2 in bytesperline
than the actual bpp.
For example for YUV420, the real bpp is 12, but the first plane has only
8 bpp. Thus we report a bytesperline 8*width instead of 12*width.
However, for real framezise we have to compute 12*width*height.
Hence added a new variable to hold this information and to correctly
compute the frame size.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 19 +++++++++++++++++--
 drivers/media/platform/atmel/atmel-isc.h      |  4 ++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 1f7fbe5e4d79..f782a9c0c07d 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -655,6 +655,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED8;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 8;
+		isc->try_config.bpp_v4l2 = 8;
 		break;
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
@@ -664,6 +665,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_SBGGR12:
 	case V4L2_PIX_FMT_SGBRG12:
@@ -673,24 +675,28 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_RGB565:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_RGB565;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_ARGB444:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_ARGB444;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_ARGB555:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_ARGB555;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_ABGR32:
 	case V4L2_PIX_FMT_XBGR32:
@@ -698,42 +704,49 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 32;
+		isc->try_config.bpp_v4l2 = 32;
 		break;
 	case V4L2_PIX_FMT_YUV420:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YYCC;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_YC420P;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PLANAR;
 		isc->try_config.bpp = 12;
+		isc->try_config.bpp_v4l2 = 8; /* only first plane */
 		break;
 	case V4L2_PIX_FMT_YUV422P:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YYCC;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_YC422P;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PLANAR;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 8; /* only first plane */
 		break;
 	case V4L2_PIX_FMT_YUYV:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_YUYV;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_UYVY:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_UYVY;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_VYUY:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_VYUY;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_GREY:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_DATY8;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED8;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 8;
+		isc->try_config.bpp_v4l2 = 8;
 		break;
 	case V4L2_PIX_FMT_Y16:
 		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_DATY10 | ISC_RLP_CFG_LSH;
@@ -743,6 +756,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	default:
 		return -EINVAL;
@@ -991,8 +1005,9 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
 		pixfmt->height = isc->max_height;
 
 	pixfmt->field = V4L2_FIELD_NONE;
-	pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp) >> 3;
-	pixfmt->sizeimage = pixfmt->bytesperline * pixfmt->height;
+	pixfmt->bytesperline = (pixfmt->width * isc->try_config.bpp_v4l2) >> 3;
+	pixfmt->sizeimage = ((pixfmt->width * isc->try_config.bpp) >> 3) *
+			     pixfmt->height;
 
 	if (code)
 		*code = mbus_code;
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 2bfcb135ef13..dd45e9ca22a9 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -95,6 +95,9 @@ struct isc_format {
 			configuration.
  * @fourcc:		Fourcc code for this format.
  * @bpp:		Bytes per pixel in the current format.
+ * @bpp_v4l2:		Bytes per pixel in the current format, for v4l2.
+			This differs from 'bpp' in the sense that in planar
+			formats, it refers only to the first plane.
  * @rlp_cfg_mode:	Configuration of the RLP (rounding, limiting packaging)
  * @dcfg_imode:		Configuration of the input of the DMA module
  * @dctrl_dview:	Configuration of the output of the DMA module
@@ -105,6 +108,7 @@ struct fmt_config {
 
 	u32			fourcc;
 	u8			bpp;
+	u8			bpp_v4l2;
 
 	u32			rlp_cfg_mode;
 	u32			dcfg_imode;
-- 
2.25.1

