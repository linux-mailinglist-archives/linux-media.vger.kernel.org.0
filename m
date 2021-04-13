Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75BB35DD56
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345192AbhDMLEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:04:23 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:17242 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345247AbhDMLEE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311825; x=1649847825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iv2cqhnseVH6O4TtVM0YOMu8+myW61ElDWycN/PhvMo=;
  b=UgcwuJKunV/wGKXczw0i57aV6+i/eyJPehUkG5+TBjQ8x9+a8hUsgXy+
   z8u4aS5ckapZCFdH4U3laeKSMeErFzB4halZZTm0BSdi+spMPn7opiJ/z
   a48XRDM1MhLL4/P3hJU1fXgf6VsE1/glJPXQmmKT1Ecir7yxvIFhBmVMc
   tyoixC6Ucgkgyhqmj8QuUDRJ7+Ui91ze3Re9t6+dJAGO3xk/U21JqDW1L
   Sd0Pl7niWw0mXtpr45X0ZF1wIv/ENM/qLUg8Ereakxe5Ign/94v6BNeKK
   oOzhX/jXRUi6+pDjofHrxvCtJM6j4b7uUCaAjsZI8J1EPkwe2epRoeO7q
   Q==;
IronPort-SDR: NsGu9RD/ZoMiBR9eZbFT0vUKcEw4WCWXN1CqGwmj8qoCl/aW99nrfefRb/BsYX9XpN2lHl+TUy
 6Ajl25lTv8diPVZLA5hS27RrEtCZkToECmlG8s4FbkrqcK7G2/0DISBkyiDiyZPuNPTdHG1iXz
 yCDlDOfCSMq9iKfHIWBKCvCriWNPx2C6f34RQ9bXhss8EIoQbwyc/dt+9MBDVXg/t4l0O9ZUkX
 NCmO9+3VnPMHrD2Wmr9vArFzHAwzFrVC3pMnwuxCknGwK0ipeortdspUbjRRz9ly4uRZprzrYL
 oY4=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="116804449"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:03:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 04:03:44 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 04:03:32 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 25/33] media: atmel: atmel-isc: create an adapt pipeline callback for product specific
Date:   Tue, 13 Apr 2021 13:57:23 +0300
Message-ID: <20210413105731.610028-26-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Once the pipeline is set in the base code, create a callback that will adapt
the ISC pipeline to each product.
Create the adapt_pipeline callback that will be used in this fashion.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    |  4 ++++
 drivers/media/platform/atmel/atmel-isc.h         |  5 +++++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 12 ++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 6746c9060e3f..a3c299068bd5 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -1047,6 +1047,10 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 	default:
 		isc->try_config.bits_pipeline = 0x0;
 	}
+
+	/* Tune the pipeline to product specific */
+	isc->adapt_pipeline(isc);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 14e318a7373c..19cc60dfcbe0 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -236,6 +236,9 @@ struct isc_reg_offsets {
  * @config_ctrls:	pointer to a functoin that initializes product
  *			specific v4l2 controls.
  *
+ * @adapt_pipeline:	pointer to a function that adapts the pipeline bits
+ *			to the product specific pipeline
+ *
  * @offsets:		struct holding the product specific register offsets
  * @controller_formats:	pointer to the array of possible formats that the
  *			controller can output
@@ -321,6 +324,8 @@ struct isc_device {
 
 		void (*config_ctrls)(struct isc_device *isc,
 				     const struct v4l2_ctrl_ops *ops);
+
+		void (*adapt_pipeline)(struct isc_device *isc);
 	};
 
 	struct isc_reg_offsets		offsets;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index a5823a3a6111..b2ace528b260 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,12 +54,17 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+#define ISC_SAMA5D2_PIPELINE \
+	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+
 void isc_sama5d2_config_csc(struct isc_device *isc);
 void isc_sama5d2_config_cbc(struct isc_device *isc);
 void isc_sama5d2_config_cc(struct isc_device *isc);
 void isc_sama5d2_config_dpc(struct isc_device *isc);
 void isc_sama5d2_config_gam(struct isc_device *isc);
 void isc_sama5d2_config_rlp(struct isc_device *isc);
+void isc_sama5d2_adapt_pipeline(struct isc_device *isc);
 
 void isc_sama5d2_config_ctrls(struct isc_device *isc,
 			      const struct v4l2_ctrl_ops *ops);
@@ -267,6 +272,11 @@ void isc_sama5d2_config_rlp(struct isc_device *isc)
 			   ISC_RLP_CFG_MODE_MASK, rlp_mode);
 }
 
+void isc_sama5d2_adapt_pipeline(struct isc_device *isc)
+{
+	isc->try_config.bits_pipeline &= ISC_SAMA5D2_PIPELINE;
+}
+
 /* Gamma table with gamma 1/2.2 */
 const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 	/* 0 --> gamma 1/1.8 */
@@ -420,6 +430,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_rlp = isc_sama5d2_config_rlp;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
+	isc->adapt_pipeline = isc_sama5d2_adapt_pipeline;
+
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
-- 
2.25.1

