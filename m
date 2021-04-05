Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B81D3543D9
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241818AbhDEP5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:57:39 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:14836 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDEP5j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638252; x=1649174252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1h3AFjt+UqSD1bdwP+UmFcaYK5kQkf3tV/zOCg4W6HY=;
  b=Bop729f21W65PM9jVafTGQxFNfltE0NeQel3ectpjxxA4wWHxKF3buCI
   +/Sq90JusYNBUji50PShvNF0jJkTYn5ULRum/rKneWmUizci42OvuyzJm
   fnATTUZU3diLZgsXwrK/Q1PXPQkCyuSIyUTmO9lLW1jKnkwc9CKbL7H0H
   8ZdCZlj1pZrSIkf1ofvUgzTYW4TcSx+mBuRPnleb745cyiydBktCLbFGm
   prykBdhR518fAYJqKPmg25hReXrb1hKdoASLxIdf19qOZxL5NeapbO7ga
   pBh1kEq0aRiBH/XImibYcmCwgF/fF5ESUi09zBF70z6cugShVYBlJpY4K
   g==;
IronPort-SDR: YKTrAw/+oBLz2p4h34hFlyXqTyzy+nJUz7bjxZspprQrg54m5YT+WQfXWJ9ZB6R0Z6Bfw1bcLR
 QawFMxB4Gk6HT+uNEQ9dfntuQz1yhXlo+I3+K6UuylVpbTL2bZscQpvvvWumz2kGUfLsabSORk
 ZHHF2dHwzvb704nA5ZrrNR9BCCLam0jZIH4k1AKvdWfYm61YEqkyaOxFyZleBZuZBme34NODq7
 cqWFrMz2OW7oQEK26mssgt3Tgj92m3DbEPCc0WgTjxFCXwo0IjujLEFg7b+RdvPDgh/skS8HO9
 1G0=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="109701304"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:57:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:57:32 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:57:24 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 22/30] media: atmel: atmel-isc: create callback for GAM submodule product specific
Date:   Mon, 5 Apr 2021 18:50:57 +0300
Message-ID: <20210405155105.162529-23-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a product specific callback for initializing the GAM submodule
of the pipeline.
For sama5d2 product, there is no special configuration at this moment,
thus this function is a noop.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
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

