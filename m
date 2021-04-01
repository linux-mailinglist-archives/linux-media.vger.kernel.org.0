Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9A1A351A42
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236846AbhDAR6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:58:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:1272 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235559AbhDAR4G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617299766; x=1648835766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iBZmWbvl9sEPKdC1MPZcesj17YCVzTSDdzfTNXGF2es=;
  b=WHeEvvz4qCoSe4qwmpgV7NrNmmhsetOJQRi0mExfCRrHK/zRiR/EuKgH
   LkY5Ai837VwaTGSOQ45nBFS5iGSlb87vRW57//7WCZAAd8Ckjabc0obca
   LV7uk83mfBo+RcLxKXGqNKXq0UTWPA3bmWzuBpzN4l1uaQCpIj1MetpAP
   VjYd0/nxexevaa6i3BoL3gdwwJdPSSxdsGLeA105Hm4LV+EVQ2dgjYTaa
   rU8FLdfET04INx9UUtvFMJxqrj4C6DD9zAtUiJprPOxLy68zztxOSqdvZ
   4z0rLM+9sgLwiJz+89xclIig5kDFolHhG78I6PTpPie0i7W/MAOVoFtcV
   A==;
IronPort-SDR: g659neIUvBhz+PbQbMZwMZKEB0VldDI+uRSO+QBp0qtiDJqf5N5obBa9tKR2/s01pOInUTy6RU
 FIC/EQ6p4H1NajwFu1LSc5G6BeQGxtQy7WBkAxOv1u0atx/kfeJFeYlGspObllzCgd4NWL2K0L
 MJ1PD4d9yQMcOETUCSa3ekgy3x6DSllHuxUOCoQmk3lemL1tmmZOA4NXuzSJMzcgZUH75/dCgy
 1Nz3deluBU6OMK4cQY/4m6MlGjq0scJ0p3W8ZtHypghqoiLmjxZIQk91jAdevYcW6d9zNcKGhp
 5io=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49671216"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:34:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:34:15 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:34:14 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 25/30] media: atmel: atmel-isc: create an adapt pipeline callback for product specific
Date:   Thu, 1 Apr 2021 14:27:18 +0300
Message-ID: <20210401112723.189107-26-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 11 +++++++++++
 3 files changed, 20 insertions(+)

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
index 38b9667537a3..c5687fb5b022 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -54,6 +54,10 @@
 
 #define ISC_CLK_MAX_DIV		255
 
+#define ISC_SAMA5D2_PIPELINE \
+	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
+	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+
 /* This is a list of the formats that the ISC can *output* */
 const struct isc_format sama5d2_controller_formats[] = {
 	{
@@ -257,6 +261,11 @@ void isc_sama5d2_config_rlp(struct isc_device *isc)
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
@@ -410,6 +419,8 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_rlp = isc_sama5d2_config_rlp;
 	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
+	isc->adapt_pipeline = isc_sama5d2_adapt_pipeline;
+
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
 	isc->offsets.sub422 = ISC_SAMA5D2_SUB422_OFFSET;
-- 
2.25.1

