Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4188435DD3F
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344994AbhDMLDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:62163 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344922AbhDMLDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311777; x=1649847777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IEwPQEbzjaae7NeHjXIAlTuXJus6yY8SKxZBqN/Rb9s=;
  b=JxUQeEZzMTMYHmKsuyW1RhjkypeIzaNqtOfinJ9nknjYwgz+oL4Rf8/3
   2CmS5zsgENofSkkScXJIzkXD8jkaF3yrA4DNULzPV8kJKwof3NZpfQARa
   +BHFou+h9sbfORXY9Kg/Wd9+hzplE9ByKKbVXTGBIVcftwb5GIU85FPSN
   QcEGJUOqc/aPh6KTfVuMhfsZfpjfPN/RZlzb532zwpN2Nv2NqrtW7aHog
   aEhZzm8mERqAjGHLaf44S9HggiE3w72QMkvUgdLc9zdQH3DMp0rSVUgFH
   OTkp3v88W1RkTliG4cNkA0680DyOAjp4qHdNxvYDJjJ7OtxmBexFbEPjM
   w==;
IronPort-SDR: 6PI4NuZubVXmgHxyfFqh99v8IUb+LvsE/+udR+i1TERyB7nY9dkUnK2F0q9seOgxfb/bxWFJg9
 futoIMSW/aGlk43TkCWXgjrVeJ6pw9BSMutYHM3Avqxc3ZYbyw7YiM4vS6hEy/QFXZPTV1tRD+
 31WC7njS1q2wyV+/lB7QyHhMpcuGjjcA+cRF4P9wcdR/fCqPpAzm3EwmXKhzq/nwiB9CUmwEgv
 JhJiH2kT01IANjVDRKWwuPnWEC19Ypm8WIQBExW7UtWY8udkKezuepBfKbRKE5O5RXuqkdB2ty
 2W8=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="113386305"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:02:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:56 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:51 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 21/33] media: atmel: atmel-isc: create callback for DPC submodule product specific
Date:   Tue, 13 Apr 2021 13:57:19 +0300
Message-ID: <20210413105731.610028-22-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DPC submodule is a part of the atmel-isc pipeline, and stands for
Defective Pixel Correction. Its purpose is to detect defective pixels and
correct them if possible with the help of adjacent pixels.
Create a product specific callback for initializing the DPC submodule
of the pipeline.
For sama5d2 product, this module does not exist, thus this function is a noop.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v3:
- added module description in commit message
Changes in v2:
- addded function prototype to avoid warning with W=1

 drivers/media/platform/atmel/atmel-isc-base.c    | 1 +
 drivers/media/platform/atmel/atmel-isc.h         | 3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 7 +++++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 69952b6ac401..1f7116abc61a 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -651,6 +651,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
 	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
 
+	isc->config_dpc(isc);
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
 	isc->config_cc(isc);
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index eb549fadb1a8..d6cd85a4c3e9 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -221,6 +221,8 @@ struct isc_reg_offsets {
  * @max_width:		maximum frame width, dependent on the internal RAM
  * @max_height:		maximum frame height, dependent on the internal RAM
  *
+ * @config_dpc:		pointer to a function that initializes product
+ *			specific DPC module
  * @config_csc:		pointer to a function that initializes product
  *			specific CSC module
  * @config_cbc:		pointer to a function that initializes product
@@ -300,6 +302,7 @@ struct isc_device {
 	u32		max_height;
 
 	struct {
+		void (*config_dpc)(struct isc_device *isc);
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
 		void (*config_cc)(struct isc_device *isc);
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 7ff8b362568d..2b53e9427353 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -57,6 +57,7 @@
 void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
 void isc_sama5d2_config_cc(struct isc_device *isc);
+void isc_sama5d2_config_dpc(struct isc_device *isc);
 
 void isc_sama5d2_config_ctrls(struct isc_device *isc,
 			      const struct v4l2_ctrl_ops *ops);
@@ -114,6 +115,11 @@ void isc_sama5d2_config_ctrls(struct isc_device *isc,
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
 }
 
+void isc_sama5d2_config_dpc(struct isc_device *isc)
+{
+	/* This module is not present on sama5d2 pipeline */
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -259,6 +265,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
+	isc->config_dpc = isc_sama5d2_config_dpc;
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
-- 
2.25.1

