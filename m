Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7F835DD5C
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345301AbhDMLEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:04:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16529 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345291AbhDMLEp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311866; x=1649847866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L0ubezju1a2v2fOHoFbJx+Tkrd4cQqmjDLOQsJU/n+8=;
  b=KPwVad0G4yRAaDSMBJs+YT5cR74hLd5OmIlVAbk0U/nwAWms2hm3C/aI
   f54ZgDClOl99EbzgoU4sEl8XRQqSRD6cxZdCAfOJABHqLYIjFmhCyemCF
   csalGQF5YCXhUJ/k6E+3w//2Poqd1k5ue3BxrG8B+84rwESsCLLF1ZPYj
   TKZA5jZXTTza1YarM+kO98X2b7JyaaHpP+lY2C2KFgtLbMnvnQIqF/tW1
   kAUaFtImTbDXh2HeAoLf8Y41xCjErN14Uo5rf18FfzpKIzfPBRSUDseST
   E09JPKYaiiy+u92sBw8Km7kpDccrdwC8vtsMdTjRebl4a+ZvyM84KZx6X
   A==;
IronPort-SDR: XS/2MB6RSEhfaWJMK+pDVUo+Oaih1K6dpdNtVJJUaJRUj8zENmf2UxUaE5vVRCunXx8Ns5WPSW
 I0hLMVhL+hWAXocG06Z6CVgQgNxPBaATgVwl9eh0nBwJTDgmgqkDBFWYD8KyfDcToA1/E5iN6G
 M1DVAfxn/EhqrXWFIVqpHzLVy6RuvsVN+bg1W1p4eDXGzVNfw7EM/k4UB6CkzAaG8goNRSLVN4
 2oHcGMGo0Q9ucDNwUOso+C5GYfOfJEGlFoFcnfbokuMzFhsjuP0e8iASmTzFWyp/d5zr1F5eUX
 7qA=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="122830422"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:04:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:04:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:04:03 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 27/33] media: atmel: atmel-isc-base: add support for more formats and additional pipeline modules
Date:   Tue, 13 Apr 2021 13:57:25 +0300
Message-ID: <20210413105731.610028-28-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
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

