Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3367335DD46
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345035AbhDMLDd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:33 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:60503 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344922AbhDMLDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311793; x=1649847793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iy2lKlBNlg+FxIrewyxh6CPIqYGEo2+dw32oKnP15lI=;
  b=08lNA4bMBKzGNtwHoBO47eldYxAQl+TAcruzgSKD2e7so1ZdFbR28qda
   HUXwwrVZzwohHWWAElQRun0f3BtyIJhxtsQQCkau7Miasy+kVYKu7+Kud
   5NekDhcHsZtaWn2maupHqAWBgXtWMORjxBO8xrBZY0/f1Ci2L8vnCQpYj
   nkQLuYLncLFhsx8/buRf34Q5ieepw3Xp7b6GN7q9GqM9meIwvsCJXxmYU
   qM/PVHJEVMhiThDZUipz7kx8FDlTROTYrLR0qRPAPfMCGmf19gRdLLl/m
   FQnk8haq8EIh/jRlOORvdI1UONyTfFYZnob8V856t7lHbTvwQqOK3rFfz
   g==;
IronPort-SDR: S4YS92YX01JeyqNEW8ImQXIqPz5YmqOaRaWxd4mtSTRY2cxWkIsXc6bkPrnhqffChWau5VK+A/
 WuKmTJuh2bz5rbFtgIo9jiMm06tyH5bEuJNJzPf0Z+BQ4+R3w1X34M3/462TXVbOTl/HlH0TAy
 n87eHGRKFc0bGrl0rWiKAJg1R70wNi5KNzw7jCUxCRDQQYrQVOOM147zhODRg3UHj3nH1Vz51J
 EqHYTGD+vGJdCSquVGp/Ekz0h8gzGBlqmEITZxx33NPC3rObHsd9nLC3WBumEydr9jBe1FsFvs
 JdI=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="113386326"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:03:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:03:05 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:58 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 22/33] media: atmel: atmel-isc: create callback for GAM submodule product specific
Date:   Tue, 13 Apr 2021 13:57:20 +0300
Message-ID: <20210413105731.610028-23-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GAM submodule is a part of the atmel-isc pipeline, and stands for
Gamma Correction. It is used to apply the gamma curve to the incoming pixels.
Create a product specific callback for initializing the GAM submodule
of the pipeline.
For sama5d2 product, there is no special configuration at this moment,
thus this function is a noop.

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
index 1f7116abc61a..bd24e0c99613 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -655,6 +655,7 @@ static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
 	isc->config_cc(isc);
+	isc->config_gam(isc);
 }
 
 static int isc_update_profile(struct isc_device *isc)
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index d6cd85a4c3e9..1e6988f1876e 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -229,6 +229,8 @@ struct isc_reg_offsets {
  *			specific CBC module
  * @config_cc:		pointer to a function that initializes product
  *			specific CC module
+ * @config_gam:		pointer to a function that initializes product
+ *			specific GAMMA module
  * @config_ctrls:	pointer to a functoin that initializes product
  *			specific v4l2 controls.
  *
@@ -306,6 +308,7 @@ struct isc_device {
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
 		void (*config_cc)(struct isc_device *isc);
+		void (*config_gam)(struct isc_device *isc);
 
 		void (*config_ctrls)(struct isc_device *isc,
 				     const struct v4l2_ctrl_ops *ops);
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 2b53e9427353..df26941af64b 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -58,6 +58,7 @@ void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
 void isc_sama5d2_config_cc(struct isc_device *isc);
 void isc_sama5d2_config_dpc(struct isc_device *isc);
+void isc_sama5d2_config_gam(struct isc_device *isc);
 
 void isc_sama5d2_config_ctrls(struct isc_device *isc,
 			      const struct v4l2_ctrl_ops *ops);
@@ -120,6 +121,11 @@ void isc_sama5d2_config_dpc(struct isc_device *isc)
 	/* This module is not present on sama5d2 pipeline */
 }
 
+void isc_sama5d2_config_gam(struct isc_device *isc)
+{
+	/* No specific gamma configuration */
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -269,6 +275,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
+	isc->config_gam = isc_sama5d2_config_gam;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
-- 
2.25.1

