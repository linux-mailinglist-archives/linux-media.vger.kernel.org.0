Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D1C3543D5
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241805AbhDEP5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:57:31 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43682 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235453AbhDEP5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638244; x=1649174244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6NE168aYAGOsVTgWwYu70CMc7dOuZws71nNZmWK/fkM=;
  b=Yz+cbHk+OX0e2DEwQNdBF6wiVfG9B6dOH8KT5pHtv18ERup7UgVrQS2j
   t3iVgUj25KqVGd/wWbZBzRT3hUXZn3zCSqoVJ5Q1aRKcXzUzD1OR3oAsW
   jEmm69wp31w5vQP7ynvCu2AUCs9oPXcIvQCydsE0kA7imXlyrDr2EdBaz
   JAJr1wMhf9AR4LHTTXRzFfNc9KaPhQGVMf7QtxYEmgLzm4UD2N2zxu8pE
   /lLDo9mtRk5zO0ovuKjtseKQkHDy79erdZAB7BD3042wGB1SqdD+sUK42
   GwOwA05ENOZ02WNySUq8T0Bbnsx2v/JIS275R5btm7sqsPwlGFA1iQgpR
   w==;
IronPort-SDR: xUTO3UTMpzODcfOkKYfSUkiE7f/yY1vUxxhSERLwiYz+EtvQI+Fdf0FII6N5t9ooN+/fauYiKY
 00f/Es5R6NcETNmOGKeFepZ8dxSVndnG8f8mBWgLbJ5jXvQVVZKvgCROO4mk5XIpw0t1YcdJLm
 rRpQWyJskQCFM7WLSc5rlGhgF5u5ipvwLQW68DmP1p5fp1ElhjTR7fBd0IIdae9Q8KYD7R00nj
 xMXE74IVbrW1GvthUnG/g+baSxVagvCqKzjXzQ8t/eFi3Adoilt4I/ARpooZrmDBfWCR0xSLcz
 aqQ=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="115869718"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:57:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:57:23 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:56:52 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 21/30] media: atmel: atmel-isc: create callback for DPC submodule product specific
Date:   Mon, 5 Apr 2021 18:50:56 +0300
Message-ID: <20210405155105.162529-22-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create a product specific callback for initializing the DPC submodule
of the pipeline.
For sama5d2 product, this module does not exist, thus this function is a noop.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
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

