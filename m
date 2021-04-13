Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4E835DD42
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345024AbhDMLDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:03:32 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64818 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344995AbhDMLDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311792; x=1649847792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BLvFfRww4amakvTXNIOWMSQpAgtT0Cv0+C6uuSenAqg=;
  b=cwoulJpyUVCGd8slDiplALbXTtrDhKsUzZABK14oYfQK5XtztqPKnFKn
   fYiAxcWBkP71KObi6+qvBVNttyhQpIr4eqsUUVd2meEMtS8h0tjZKlFJQ
   35SqJqwYyIgOYFpTOdRcNpZU8HMLRtyRd9pBToMhksilqbiD6mlXg9s6y
   8dGDa5we+IBJ4YL/gqf1j4Z1LbQ6V/EoliGeEpqIS5E1lB0LKwF3sBNCn
   tZFm8Lg88a7WGCVC2jCbKOizorroeVnTyaRXJyMOUu6+5MH8sRcLg3yfp
   0N2tqK14NpktDiPYNIE9pftX9JF5C6+WPSSYGoCuErTtC5jjxX8Wwdwyf
   g==;
IronPort-SDR: h0zdM3wZxB9qqlv6qt8YhOXRWjNALpkkfpIGRIVzjspasJ3L71KLdE5sazGhD0r4LN6twYWWow
 czBdJQ/m/TikOi5hmTdXCw5eddDjQgV9fQzhWSdNyWHBTtlSaCOVeJgbD8VPUfZat4r6jQrblO
 UGIdWQLk5PFLXrqpmQLJ9IQYoxAPy5IKc9UqFDuUk1KcNb3M7zpvurKREwzTp7T41exKOJm0Dc
 gcY4y/AA1Os2jM9AUHXS9OH/7dFt8WrnUP11V05UggbFfQSPY1HLDgYJPdv81WMXnMbMdcMD0/
 g4g=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="113386323"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:03:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:02:50 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:02:43 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 20/33] media: atmel: atmel-isc: create product specific v4l2 controls config
Date:   Tue, 13 Apr 2021 13:57:18 +0300
Message-ID: <20210413105731.610028-21-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create product specific callback for initializing v4l2 controls.
Call this from v4l2 controls init function.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    |  5 +++--
 drivers/media/platform/atmel/atmel-isc.h         |  5 +++++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 15 +++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 182903803c05..69952b6ac401 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -2036,11 +2036,12 @@ static int isc_ctrl_init(struct isc_device *isc)
 	if (ret < 0)
 		return ret;
 
+	/* Initialize product specific controls. For example, contrast */
+	isc->config_ctrls(isc, ops);
+
 	ctrls->brightness = 0;
-	ctrls->contrast = 256;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
 			  isc->gamma_max);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index a5f8d5001381..eb549fadb1a8 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -227,6 +227,8 @@ struct isc_reg_offsets {
  *			specific CBC module
  * @config_cc:		pointer to a function that initializes product
  *			specific CC module
+ * @config_ctrls:	pointer to a functoin that initializes product
+ *			specific v4l2 controls.
  *
  * @offsets:		struct holding the product specific register offsets
  */
@@ -301,6 +303,9 @@ struct isc_device {
 		void (*config_csc)(struct isc_device *isc);
 		void (*config_cbc)(struct isc_device *isc);
 		void (*config_cc)(struct isc_device *isc);
+
+		void (*config_ctrls)(struct isc_device *isc,
+				     const struct v4l2_ctrl_ops *ops);
 	};
 
 	struct isc_reg_offsets		offsets;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index 0ce8293622f9..7ff8b362568d 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -58,6 +58,9 @@ void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
 void isc_sama5d2_config_cc(struct isc_device *isc);
 
+void isc_sama5d2_config_ctrls(struct isc_device *isc,
+			      const struct v4l2_ctrl_ops *ops);
+
 void isc_sama5d2_config_csc(struct isc_device *isc)
 {
 	struct regmap *regmap = isc->regmap;
@@ -100,6 +103,17 @@ void isc_sama5d2_config_cc(struct isc_device *isc)
 	regmap_write(regmap, ISC_CC_BB_OB, (1 << 8));
 }
 
+void isc_sama5d2_config_ctrls(struct isc_device *isc,
+			      const struct v4l2_ctrl_ops *ops)
+{
+	struct isc_ctrls *ctrls = &isc->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+
+	ctrls->contrast = 256;
+
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -248,6 +262,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
+	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
-- 
2.25.1

