Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D81351A85
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbhDASBr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:01:47 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34747 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236641AbhDAR6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299900; x=1648835900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7gj/UFI0HQr5zvf4EEX4GJfFFABCl5ee36+3k1GuHRk=;
  b=dP/HdGwQrWTMjAn5DsHgGQ2QbAAhm4lGQ2wzbdUaHg6H+kZOo7RXw8da
   HxfE490kERRaSIvLbQHxSw5LNF2h9UgVHYANVPVkdt1Jem17wSAnkr0rD
   3RCtLo2wE1HMHTMYkGD4jCxhbp8Q5eUQbyGvmJHOkWJVHJqoV6v42tT7C
   FRjUZOsvSdgi6FOL1zNCRS2fT2B+4vYlQS7Fp+DXBroe9i/LdPH6ndEmg
   qe+7nrIzhdYBu3L51WeKDGak2VYQMzm215Ha6NsQdmL/LbHjzKQE+q99Y
   xoHNy6K5Er+v30Rab7pykvsbBgv1gowS/c4swcLOuPQkbWONsHJVw1h3s
   Q==;
IronPort-SDR: sdDDHs+sGnLl9wYfziaRgGmxdybaZV6o1KLlIExxXyM0CuwTahiNO2PrVMBdmm6Wqjqx1ShzIh
 MvS5+hgrmM8938f7M3WfMbYN5GyEioyMz2aPBhp5WX/4tWT5ZMIblLgAB7x7fTbDg45kc3tLw+
 rj2ycGw8jdOa1UjGTDR7g3U4Kva0JtYeOTMdQFD0vBbVsOux+4ptpgkK0XCRZlKgmTIOfqDnRa
 g/HLf9NKF/hG09UxTVGp5BALDBgqhqEZSAqO52UPsiQWfzzDSvPIxQTmB0S1uSwwmK/aqQBrfq
 DSA=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="112132843"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:33:57 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 23/30] media: atmel: atmel-isc: create callback for RLP submodule product specific
Date:   Thu, 1 Apr 2021 14:27:16 +0300
Message-ID: <20210401112723.189107-24-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a product specific callback for initializing the RLP submodule
of the pipeline

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    |  6 ++----
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 10 ++++++++++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index bd24e0c99613..8422df41f083 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -711,11 +711,10 @@ static void isc_set_histogram(struct isc_device *isc, bool enable)
 static int isc_configure(struct isc_device *isc)
 {
 	struct regmap *regmap = isc->regmap;
-	u32 pfe_cfg0, rlp_mode, dcfg, mask, pipeline;
+	u32 pfe_cfg0, dcfg, mask, pipeline;
 	struct isc_subdev_entity *subdev = isc->current_subdev;
 
 	pfe_cfg0 = isc->config.sd_format->pfe_cfg0_bps;
-	rlp_mode = isc->config.rlp_cfg_mode;
 	pipeline = isc->config.bits_pipeline;
 
 	dcfg = isc->config.dcfg_imode | isc->dcfg;
@@ -728,8 +727,7 @@ static int isc_configure(struct isc_device *isc)
 
 	regmap_update_bits(regmap, ISC_PFE_CFG0, mask, pfe_cfg0);
 
-	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
-			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
+	isc->config_rlp(isc);
 
 	regmap_write(regmap, ISC_DCFG + isc->offsets.dma, dcfg);
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 1e6988f1876e..abeef7b2ab27 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -231,6 +231,8 @@ struct isc_reg_offsets {
  *			specific CC module
  * @config_gam:		pointer to a function that initializes product
  *			specific GAMMA module
+ * @config_rlp:		pointer to a function that initializes product
+ *			specific RLP module
  * @config_ctrls:	pointer to a functoin that initializes product
  *			specific v4l2 controls.
  *
@@ -309,6 +311,7 @@ struct isc_device {
 		void (*config_cbc)(struct isc_device *isc);
 		void (*config_cc)(struct isc_device *isc);
 		void (*config_gam)(struct isc_device *isc);
+		void (*config_rlp)(struct isc_device *isc);
 
 		void (*config_ctrls)(struct isc_device *isc,
 				     const struct v4l2_ctrl_ops *ops);
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index f5863bf3ac32..342259ad3690 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -117,6 +117,15 @@ void isc_sama5d2_config_gam(struct isc_device *isc)
 	/* No specific gamma configuration */
 }
 
+void isc_sama5d2_config_rlp(struct isc_device *isc)
+{
+	struct regmap *regmap = isc->regmap;
+	u32 rlp_mode = isc->config.rlp_cfg_mode;
+
+	regmap_update_bits(regmap, ISC_RLP_CFG + isc->offsets.rlp,
+			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -267,6 +276,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
 	isc->config_gam = isc_sama5d2_config_gam;
+	isc->config_rlp = isc_sama5d2_config_rlp;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
-- 
2.25.1

