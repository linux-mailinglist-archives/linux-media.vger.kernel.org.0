Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127D63543EC
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbhDEP6U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:58:20 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:41946 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238110AbhDEP6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638293; x=1649174293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m3AUyedur1/fvaghauHM2iA19tNbhRZGs4zP8HiP8AE=;
  b=lGqeKs3PRvoT1Shub6Rvd9XYaRqti+2d8ZtZkZnPOnNu25yeB9+W1Nfh
   Q+ISuPHEHOxGRxlwwZGFw1rXcHkVUxZI5EKWbz4K792NZI3fWy66yFjy0
   fSovH3JjKw1VbDHX29uMmPDCtLVLK+1+YtuCk6q49O6A6AopSbUxqDG9f
   PbomveR0K1c7rGNv/CFjtVp+/1wC6mqVVaYaw6Y3Y/+DLHajhh4wQUx6Q
   179U/NmU8pzEH9TeJBwGQ2C+p/+TSlgQ9BU0TM4ZPMOACtSVUjDTQvPRx
   iih8DsxH0ja+wrAUujrktniv9h0mEcOztwsMrfQdUA2WYXhFBOHgBZo/p
   Q==;
IronPort-SDR: ncnQiAT0hvaAGVvV+Zohy42/YY796KFJZgUmDfXHiu7erORxQ9hkcHfDRG1ccLOA1KtFyF0kIJ
 u3pu+ZV9jMPxp3h3TKHKpNEN0cXYOdkxVnVEoCAnnLl5Tfnw9SjZAYB0EaNioZR/FStp20WjNn
 +FO/rmLsNRSIE0brAOZXXh2Ge0WSHPTT7rqP8ViIzH9ZRpA4B2lySGMxAs5imgRoWheBioHo51
 w1Q9VAQSlGNokh0BHcgS9KEGIBpRmhXALF7ipj+JKJyriwQOwJnD9KKfuuGsFbYM+xGBT40E4v
 o9s=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="50026891"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:58:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:58:12 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:58:03 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 25/30] media: atmel: atmel-isc: create an adapt pipeline callback for product specific
Date:   Mon, 5 Apr 2021 18:51:00 +0300
Message-ID: <20210405155105.162529-26-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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
Changes in v2:
- addded function prototype to avoid warning with W=1

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

