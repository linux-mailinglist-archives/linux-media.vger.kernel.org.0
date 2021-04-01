Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC8A351B85
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237802AbhDASIv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:08:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:1272 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237699AbhDASEK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617300251; x=1648836251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwVmuhcuP0mbkPb9G0ZjUPRewv6a/UcN2N/zsqQK+6E=;
  b=hXN7hAWvLlwl2R/5WJrcuIWFoXO1FFoY8C5X4dNtC/KAbEwjyU46iIGb
   sfPeqS0UPdc3/JG3xJIp1Xg0QBreEcmdjb+jPRUZX6o3Bi7ddXw15Fw1h
   7t7q6hwcJsHd4V7wVvu32KEkYNOyOh7LIxbSz/qZOVGsZbzO4nzJFEqaE
   e/g/tOBZ9y3Zu28lf7evGTgP4u0gZPtrBSljh7Wm2AL+qcrp2feEnRLPd
   wpjw4V8GX84erSPJy7IsxHtn5XrQ+T0BIbKnqJaRR0j7ccnKsR/keP9db
   0O/0RZPEt/a2YGRAI8g2v40wafh5YGGSJMgLb28nlQzvr5UaWXXn8zO+p
   g==;
IronPort-SDR: 2avqN/GIltDF063VwkTMNBT47ALPCK0XA3TbL0GVsoK+CG7X4rOOO8bg1szaFyEKc14J44u+Pi
 8STEd17EnsZBSUQdnVGs1dGWZI2eu3In/F3G2ANjdPmwj8BpVvOSUoYmuGz97Yq3G1MeFyl0mj
 v3D8MYDu/5d7Y/CTVwYQUGUNG/+cfCfo7QKLZ8Kj11IjtaCS4CowGijsE2eWFwW/m9yFGH7ajK
 Itzk1Kl+XiXyedMiG0N4cLKLYT6DPvZUbXiRnSV+vIJgMJHz5ydgfdJP3dqT9L04WeJaSUDKwp
 30k=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="49671114"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:33:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:33:28 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:33:02 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 20/30] media: atmel: atmel-isc: create product specific v4l2 controls config
Date:   Thu, 1 Apr 2021 14:27:13 +0300
Message-ID: <20210401112723.189107-21-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 12 ++++++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

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
index 917d10baa525..a8375961f97d 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -96,6 +96,17 @@ void isc_sama5d2_config_cc(struct isc_device *isc)
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
@@ -244,6 +255,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->config_csc = isc_sama5d2_config_csc;
 	isc->config_cbc = isc_sama5d2_config_cbc;
 	isc->config_cc = isc_sama5d2_config_cc;
+	isc->config_ctrls = isc_sama5d2_config_ctrls;
 
 	isc->offsets.csc = ISC_SAMA5D2_CSC_OFFSET;
 	isc->offsets.cbc = ISC_SAMA5D2_CBC_OFFSET;
-- 
2.25.1

