Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF71D44E8C7
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbhKLObX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:23 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:42697 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235146AbhKLObU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727309; x=1668263309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwGIh+icyUT9Y4VNtitTRw8qYSuogMgVht/pZmxWI4U=;
  b=Z0T33sFjnmjY32kyxS0q02DOYdf4/QCUa220aVTDzlk9JXqM4KZgDBL/
   tZD69oV64XjJKUWZAx/9PkKxBIMQ6AqASRSt8dBVNifwau7RrrRZ1a5OY
   sauJi38Wi4UwTIUoNlAsvsysbP7oVYYwRmLcHWo5liXkSldWm5T5tGt3p
   +GVZWs1Hx+E5cg+vdY9hppBbKnaZvMdBHKAMHuenUz8q0afIo2tZmoera
   ZGJ+8QaJaIeyAM7EslKgLFFx8kNOx7kg4LdLTTImFq9I7HQnZyvJ4OiR6
   NZsuUXf/xk18ECqDzpeOnlEBmRCV2EVrrSZVhVVNrP/w1fRCe8D99SG9B
   Q==;
IronPort-SDR: mU5ZZXYrV+9GQ4iNjMnXJhjPNi36Ue+CbLHv5f4IyruNeF8CSBprQIe4WwlDlDd7eau2JMyCS0
 as3B4wf+Rz8CP7liWJ+BRfJuw+8r6AhFDbbdqjdILGWPwLBccWVt+q0ZybPV8Z73AOGk4GyJLH
 bLwADLr5G+Ftm4Jtzljj34VwRexZznJPx1rVV7TIWKuiJswv1ki9ex3FtNja2tE3MY+jfTvTME
 T0RlNbcOqf6luKOuIInJkbDWBtEpMs3aOuO9ukLUTa/6z0i6r0BNtzjVHpCl+lPxjvjsBkp0hp
 uQd9ebGXBAuJxfjZuP0Ar7LZ
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="138947667"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:28:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:28:27 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:28:24 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 12/25] media: atmel: atmel-isc-base: fix bytesperline value for planar formats
Date:   Fri, 12 Nov 2021 16:24:56 +0200
Message-ID: <20211112142509.2230884-13-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
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
index 2cb8446ff90c..d0542b97a391 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -654,6 +654,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED8;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 8;
+		isc->try_config.bpp_v4l2 = 8;
 		break;
 	case V4L2_PIX_FMT_SBGGR10:
 	case V4L2_PIX_FMT_SGBRG10:
@@ -663,6 +664,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	case V4L2_PIX_FMT_SBGGR12:
 	case V4L2_PIX_FMT_SGBRG12:
@@ -672,24 +674,28 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
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
@@ -697,42 +703,49 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
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
@@ -742,6 +755,7 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
+		isc->try_config.bpp_v4l2 = 16;
 		break;
 	default:
 		return -EINVAL;
@@ -990,8 +1004,9 @@ static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f,
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
index 32448ccfc636..07fa6dbf8460 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -102,6 +102,9 @@ struct isc_format {
 			configuration.
  * @fourcc:		Fourcc code for this format.
  * @bpp:		Bytes per pixel in the current format.
+ * @bpp_v4l2:		Bytes per pixel in the current format, for v4l2.
+			This differs from 'bpp' in the sense that in planar
+			formats, it refers only to the first plane.
  * @rlp_cfg_mode:	Configuration of the RLP (rounding, limiting packaging)
  * @dcfg_imode:		Configuration of the input of the DMA module
  * @dctrl_dview:	Configuration of the output of the DMA module
@@ -112,6 +115,7 @@ struct fmt_config {
 
 	u32			fourcc;
 	u8			bpp;
+	u8			bpp_v4l2;
 
 	u32			rlp_cfg_mode;
 	u32			dcfg_imode;
-- 
2.25.1

