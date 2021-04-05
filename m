Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C453543A1
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238415AbhDEPxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:53:31 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:57502 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhDEPxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617638005; x=1649174005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zGiPMKIR71RoJeRCsbyz2/Jkh0vjyf2K5BPASY5QkfU=;
  b=QJ5RsxZ1kSRS8VWPpHRuYF6X4fTCIgV8M/UMRnFOi/f5kLowf0Q51fwZ
   jeEbhlm51vNvsHYPGIqUnNbFolpAL0QoroLtvsrGK3+gT7cDVDCB3tFpR
   A+MB/D5MdL544sXg1lT8tg+fPJ/i3wzoWpnuhacRLTcErIpeuMq2wO2p+
   6FhjdCWcbBjfvUkavCCqXE2A2GF5BRy8sIBYfztwXsKBGXxjjw1G+hCvj
   NtQJO9LW/bBLdhsdSRLcGBIkHqDsugCS3bFbSwaC7zBFmNXA4tH4oz+gZ
   8e42RzI39gdy0Dn6ARNb+8CCkBV6ZOTECg7Kw8VMtzymZuBZIo7yqWaGw
   g==;
IronPort-SDR: BYg+Do5jNbtGiaeZ6Bw94KjY+jmGfmoT4CfqJnlJu/MUkt3JVmld4bcuS5HI2Q+js+PFeW226+
 E15G7YZrwdblTSirCSuSZt580kKuJb+eL1ouPbSXN5P0c/ELpmd2bt6iD+YOiIe28+MtYVLb/v
 RwMATp1MGzb0FGUamDrhMG0Q/kdJ650TIPSkiXmaLjNV7+GvfREPTGKiz1amU0aVIoVyrB91ph
 NeynCrpI8Klq7YfafXtNnhqUi3qisKFkBboiwuO/0bZ9KdMm1xU4p6/QS0tu9u7TSLj2UUQKz4
 S3A=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="121808111"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:53:25 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:53:24 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:53:07 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 05/30] media: atmel: atmel-isc: specialize dma cfg
Date:   Mon, 5 Apr 2021 18:50:40 +0300
Message-ID: <20210405155105.162529-6-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
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

