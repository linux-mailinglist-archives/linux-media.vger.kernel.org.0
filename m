Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E43635DD47
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345062AbhDMLDe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:34 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64818 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345023AbhDMLDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311793; x=1649847793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S/0vz3mGicfYvuOuMvfCW2wMt7bft/DcBJ9lakhWmfk=;
  b=e1/oB+lt4CjQcIybvzxiaMpgMdT+sY93MjO5wE0pQ1E5ceXPD8K3x6sm
   7SVS2asBTVGW0aqOWR60ThdVtmI92/qc5S9ByBZni33MQGDt1m+3z0ICL
   Eg/bJMFCeCfA1ZEObDxpHqNth6PfpRv3TN/cVWNV6yS/nqmWzumiwHrtx
   dkmTwG7L3mE8KDcxqVFJeYyeanvgnjFDsBXzOeicd4Tf9SLg0u68IOUEE
   jNLiNC0bSpS8kkTEtj/Cw/RwkC/ydSiVPKp1zncRFKhVhF70U+ZhPHGMa
   enkPVNnftgxOVfnReuz+qEfX8cFLO1C4Fa9b0ckwxvWaLXnmZJTm5g3XZ
   w==;
IronPort-SDR: tOUsfNrL8nur/PWdsruQbQrV+6fVa0OgXwzhZQKj2zMXXhBY+NG6OYxJVuyglyEkpvs4U5zn8H
 58LzKTk1XYEYobIIJzu77GD17K4snoSyrhTMqO9otkK02zt5ci/Ftamt/iFbIqFxoKSJluFzs5
 fVWtY2hKwT3GZ7SxvhiSu6oRq6od0ToNVOdsK0mLYWzs5NXw7M841PAm2JXpgfXp4lN6D2G1Na
 5owpf9khQln08lIkaCxCg+JylEaD35lLthwyzsVb0ZXj+nvNOL8dpm4TyemLEuaioYAllj8Ipd
 R9E=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="113386328"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:03:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:03:11 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:03:06 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 23/33] media: atmel: atmel-isc: create callback for RLP submodule product specific
Date:   Tue, 13 Apr 2021 13:57:21 +0300
Message-ID: <20210413105731.610028-24-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RLP submodule is a part of the atmel-isc pipeline, and stands for
Rounding,Limiting and Packaging. It used to extract specific data from the
ISC pipeline. For example if we want to output greyscale 8 bit, we would
use limiting to 8 bits, and packaging to Luma component only.

Create a product specific callback for initializing the RLP submodule
of the pipeline

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added module description in commit message
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c    |  6 ++----
 drivers/media/platform/atmel/atmel-isc.h         |  3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 11 +++++++++++
 3 files changed, 16 insertions(+), 4 deletions(-)

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
index df26941af64b..855027821fba 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -59,6 +59,7 @@ void isc_sama5d2_config_cbc(struct isc_device *isc);
 void isc_sama5d2_config_cc(struct isc_device *isc);
 void isc_sama5d2_config_dpc(struct isc_device *isc);
 void isc_sama5d2_config_gam(struct isc_device *isc);
+void isc_sama5d2_config_rlp(struct isc_device *isc);
 
 void isc_sama5d2_config_ctrls(struct isc_device *isc,
 			      const struct v4l2_ctrl_ops *ops);
@@ -126,6 +127,15 @@ void isc_sama5d2_config_gam(struct isc_device *isc)
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
@@ -276,6 +286,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
 	isc->config_gam = isc_sama5d2_config_gam;
+	isc->config_rlp = isc_sama5d2_config_rlp;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
-- 
2.25.1

