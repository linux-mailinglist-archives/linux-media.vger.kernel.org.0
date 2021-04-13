Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5512135DD0C
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 13:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244626AbhDMLAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 07:00:35 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:23964 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244331AbhDMLAZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 07:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618311606; x=1649847606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zGiPMKIR71RoJeRCsbyz2/Jkh0vjyf2K5BPASY5QkfU=;
  b=J8cxB8iklbajsoPOQmYPuQlWnaz6DN6xVVixnnuF6FYpvjCjlLS+JRZU
   nPgd4R+/++t6bY4rmacnNMfPImC6BYugsjOoDQjpcf8Gc8HLiyJD40j9I
   FCQeta1SuBqLGI/sGf8O5sbw0wJbDqhE93q3QfofNHHZ9j0p3PPdPMtEs
   J/+BjQCwZNdhoPqcL0UVcjzhNVska2vhmoUgIbg8E5Z+EUYM1l1iqLai1
   FSeQKwm+MdXd2yeQm+vo+y58iNI8mOdc/2NZ6RG+0WTKA7+yBEULWuutE
   dBDE8YIqmhtuKAp2BVYwO/wppJsYYCmWZM01eBFmUPzjUa1d46ry2aqs2
   A==;
IronPort-SDR: X/o/dHwuNs2wcZSVli9/ALFVOK9EQSIUU27SXrF+whVQvjyP2HJiMhVHM+W1FJM9jOghsTee9l
 VbAtkLxAlV+Gx1cE7Ta4IZ6LBJSVS29FZWWPfRh1FTbiNjDRc5UnTQPsBjW8FADpEYw9eVtOR7
 glEoGXzhkAnRpF+U3j7TQC+rUCFUvSf2OqkOFDRnjqO86sZJ3IBmOMyEDr8Yds7khfGdwkXO+q
 Xagpup+yhDMjlbKRmKXE/TeispjxC+8WyP/5Hy6ZhJpwh3B+FC+cPoorLxDEN181Pj+YkiPcqd
 OWQ=
X-IronPort-AV: E=Sophos;i="5.82,219,1613458800"; 
   d="scan'208";a="110611734"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Apr 2021 04:00:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Apr 2021 03:59:51 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Apr 2021 03:59:38 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <jacopo@jmondi.org>, <robh+dt@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v3 05/33] media: atmel: atmel-isc: specialize dma cfg
Date:   Tue, 13 Apr 2021 13:57:03 +0300
Message-ID: <20210413105731.610028-6-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413105731.610028-1-eugen.hristev@microchip.com>
References: <20210413105731.610028-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dma configuration (DCFG) is specific to the product.
Move this configuration in the product specific driver, and add the
field inside the driver struct.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 3 +--
 drivers/media/platform/atmel/atmel-isc.h         | 2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 350076dd029a..ff40ee2e2759 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -716,8 +716,7 @@ static int isc_configure(struct isc_device *isc)
 	rlp_mode = isc->config.rlp_cfg_mode;
 	pipeline = isc->config.bits_pipeline;
 
-	dcfg = isc->config.dcfg_imode |
-		       ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
+	dcfg = isc->config.dcfg_imode | isc->dcfg;
 
 	pfe_cfg0  |= subdev->pfe_cfg0 | ISC_PFE_CFG0_MODE_PROGRESSIVE;
 	mask = ISC_PFE_CFG0_BPS_MASK | ISC_PFE_CFG0_HPOL_LOW |
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index 6becc6c3aaf0..d14ae096fbf6 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -150,6 +150,7 @@ struct isc_ctrls {
  * @hclock:		Hclock clock input (refer datasheet)
  * @ispck:		iscpck clock (refer datasheet)
  * @isc_clks:		ISC clocks
+ * @dcfg:		DMA master configuration, architecture dependent
  *
  * @dev:		Registered device driver
  * @v4l2_dev:		v4l2 registered device
@@ -197,6 +198,7 @@ struct isc_device {
 	struct clk		*hclock;
 	struct clk		*ispck;
 	struct isc_clk		isc_clks[2];
+	u32			dcfg;
 
 	struct device		*dev;
 	struct v4l2_device	v4l2_dev;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index f8d1c8ba99b3..6d9942dcd7c1 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -198,6 +198,9 @@ static int atmel_isc_probe(struct platform_device *pdev)
 	isc->max_width = ISC_SAMA5D2_MAX_SUPPORT_WIDTH;
 	isc->max_height = ISC_SAMA5D2_MAX_SUPPORT_HEIGHT;
 
+	/* sama5d2-isc - 8 bits per beat */
+	isc->dcfg = ISC_DCFG_YMBSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
+
 	ret = isc_pipeline_init(isc);
 	if (ret)
 		return ret;
-- 
2.25.1

