Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BC8351B7D
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237746AbhDASIr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:62179 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbhDASCY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300145; x=1648836145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0ubezju1a2v2fOHoFbJx+Tkrd4cQqmjDLOQsJU/n+8=;
  b=EHqBa21dRwD4c9wF5hbM8/ote9XQNeyL6w3C4pzOF9KrC+xsQxMElcHg
   O1OK3rdD/qKHUSNUGJxN65zUOcT8NIDhgyy7kB/nF7qnrNlMq8iiiaVb3
   y8KdJ3vBxPBCXxaIRK78T7QWTJUSrdk4Faz278DlYH3WIO0ok1wX03NB0
   fCxbcjNInF8QZG35GeJOOrYvCZypVA4unIajcRe8uuTKcQbV0DvnD2aRb
   Qi4J2htx07HIPNwTTfTzrZM0ArMeTu4lAAT5weklMVQeNxdmJiNfjSMtZ
   fgR/bwVfqAp+rU0QvOnCBe6qrfdluJA3tMAQDTN/zOeRyYTkIYL3PoBoB
   A==;
IronPort-SDR: S/pkNKb7HxGslXFGHwGadqVL0WtxVhne5KeCkMiRQ5DOWM5o26A84staS93b5TEqt+y7V+cOUs
 BN8nauKhC61MeR5u1I7iVCo4WjGfhNzlZMl9j02/+Jr3XvaOO8x2LvfHlOuJ0GOVcQMzNGkV4P
 iS7OeSaKtvGuKzoo5wQNrwEWNYfk9xvBx7lrxM67s4sXZ4IwgtdtKmBIM0/BOb2/i5dmKlziGL
 5pswdaeN3cewfy6YLykQe13RITW0PKh0B+jzZjSs08B/wuHbtiui2KoIIf/sVi2mZd1ulhF87K
 0Mw=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="112132861"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:18 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:34:17 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 27/30] media: atmel: atmel-isc-base: add support for more formats and additional pipeline modules
Date:   Thu, 1 Apr 2021 14:27:20 +0300
Message-ID: <20210401112723.189107-28-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for additional formats supported by newer pipelines, and for
additional pipeline modules.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c | 48 +++++++++++++++----
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index a3c299068bd5..f30493a1dccd 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -843,6 +843,8 @@ static int isc_try_validate_formats(struct isc_device *isc)
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YUV422P:
 	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
 		ret = 0;
 		yuv = true;
 		break;
@@ -857,6 +859,7 @@ static int isc_try_validate_formats(struct isc_device *isc)
 		break;
 	case V4L2_PIX_FMT_GREY:
 	case V4L2_PIX_FMT_Y10:
+	case V4L2_PIX_FMT_Y16:
 		ret = 0;
 		grey = true;
 		break;
@@ -887,6 +890,8 @@ static int isc_try_validate_formats(struct isc_device *isc)
  */
 static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 {
+	isc->try_config.rlp_cfg_mode = 0;
+
 	switch (isc->try_config.fourcc) {
 	case V4L2_PIX_FMT_SBGGR8:
 	case V4L2_PIX_FMT_SGBRG8:
@@ -953,7 +958,19 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.bpp = 16;
 		break;
 	case V4L2_PIX_FMT_YUYV:
-		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YYCC;
+		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_YUYV;
+		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
+		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
+		isc->try_config.bpp = 16;
+		break;
+	case V4L2_PIX_FMT_UYVY:
+		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_UYVY;
+		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
+		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
+		isc->try_config.bpp = 16;
+		break;
+	case V4L2_PIX_FMT_VYUY:
+		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_YCYC | ISC_RLP_CFG_YMODE_VYUY;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED32;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
@@ -964,8 +981,11 @@ static int isc_try_configure_rlp_dma(struct isc_device *isc, bool direct_dump)
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 8;
 		break;
+	case V4L2_PIX_FMT_Y16:
+		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_DATY10 | ISC_RLP_CFG_LSH;
+		fallthrough;
 	case V4L2_PIX_FMT_Y10:
-		isc->try_config.rlp_cfg_mode = ISC_RLP_CFG_MODE_DATY10;
+		isc->try_config.rlp_cfg_mode |= ISC_RLP_CFG_MODE_DATY10;
 		isc->try_config.dcfg_imode = ISC_DCFG_IMODE_PACKED16;
 		isc->try_config.dctrl_dview = ISC_DCTRL_DVIEW_PACKED;
 		isc->try_config.bpp = 16;
@@ -999,7 +1019,8 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		/* if sensor format is RAW, we convert inside ISC */
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
-				WB_ENABLE | GAM_ENABLES;
+				WB_ENABLE | GAM_ENABLES | DPC_BLCENABLE |
+				CC_ENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -1008,8 +1029,9 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		/* if sensor format is RAW, we convert inside ISC */
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
-				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE;
+				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -1019,33 +1041,39 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE;
+				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
 		break;
 	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
 		/* if sensor format is RAW, we convert inside ISC */
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE;
+				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
 		break;
 	case V4L2_PIX_FMT_GREY:
-		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
+	case V4L2_PIX_FMT_Y16:
 		/* if sensor format is RAW, we convert inside ISC */
+		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE;
+				CBC_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
 		break;
 	default:
-		isc->try_config.bits_pipeline = 0x0;
+		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code))
+			isc->try_config.bits_pipeline = WB_ENABLE | DPC_BLCENABLE;
+		else
+			isc->try_config.bits_pipeline = 0x0;
 	}
 
 	/* Tune the pipeline to product specific */
-- 
2.25.1

