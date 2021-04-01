Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA11E351E35
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhDASgY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:36:24 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:46540 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240057AbhDAS1B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617301621; x=1648837621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GVvIsZVQNrPMN1hvtWjBMXJ1JLr9Fd87AOEdQTPgcIk=;
  b=Rd7VLyWhf8ddys2AYPRgwdDKm0//R3wGiTs9qvO1NuTN6wE3lssmYleL
   oNoaLZEgkGHFpWolM06i3Kfx+tZaaZbv4fE89a1p/6sn9tlBqdtmB5Pmf
   JbvOCYzdt+h8ii8KFScAJxhT5klLEAvsLv6ERN0sbM0Ye3bM/9WuxzhVC
   Aq5LbF5LanHEjgCVBlnVL8G9OtAq93/F0VG061hKktxiw/+0x88w+ILzI
   4VrlDjKHUUupvVchR4o+RBSd1cTC5Xdw2PggEbGf2L8fNlZ133hst4QK5
   GqDQS8eyXMflszwGKP6b1Pti9bFkRCIU1PQNBTFJ6qBG/z8k+tiy+aZH1
   A==;
IronPort-SDR: nHdQnCDb6C7TBFjD1RAlb/KXxyl/VTykt5tJfKvqnNkKKAcIebDSVCkx2k+Hy9fXYT+1QmIDz/
 +OnYjdK6OpjDFXG/UIS6pP3y2Y3Vx79bg5Dmur+6OtzFuev8Mk9/qxmoDBAM8VPShKQFDt2WRe
 5UpnR87trs0vcCu45mIUsM5+TZDLE+VNqOcACP2pYRwhq5mGybXegLv3ZkzEOUvyUOJorEMfud
 NUFEI32UACLNRISUHf/RAtc5Of2s8mGp6lDwnGPWT2JEJfSaNFSS0Tq6oBCr23e0fMxMRBmCAS
 AvQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="121402132"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:33:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:33:40 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:33:30 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 21/30] media: atmel: atmel-isc: create callback for DPC submodule product specific
Date:   Thu, 1 Apr 2021 14:27:14 +0300
Message-ID: <20210401112723.189107-22-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
 drivers/media/platform/atmel/atmel-isc-base.c    | 1 +
 drivers/media/platform/atmel/atmel-isc.h         | 3 +++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 6 ++++++
 3 files changed, 10 insertions(+)

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
index a8375961f97d..ae906126ffb8 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -107,6 +107,11 @@ void isc_sama5d2_config_ctrls(struct isc_device *isc,
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
@@ -252,6 +257,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
+	isc->config_dpc = isc_sama5d2_config_dpc;
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
-- 
2.25.1

