Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC79437330
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 09:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbhJVH4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 03:56:34 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:22728 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhJVH41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 03:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634889250; x=1666425250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zC/S5JoxrW9wPWNFUwF6hzlwSc6G6XtCvAP06ceXI7o=;
  b=f0f4Tnp5bwZ8Nfg32vs61ac8YRiTk+VMOleK6zmdTSGo0mQBfBrQngAQ
   x5q7MyyDC/zuu/1SLAA2mwam+tPI38LV+huYm1sZEth6D+8EU6HYP3WZ9
   kHTrxpdvgyFlaVDty+t5ZSDDOOVOR9UqY6CMTk55j8kz1KiMjTDmHsR+P
   l2pd7sP9hV2x5TLTLwyhofZOdEvVsPphbOZS8DLfxz9FxgTHtBRI2BZM/
   QGAEwMRkjbLm2ec/HBm49wKf9vx7+7NMVQFng57nwln7oZ5yRfvQUyQtL
   hpvwkNxf6+EaYZOVQfHGjBhZJde5rnuChcZVgMuTL4TBmI3OomRylTErX
   A==;
IronPort-SDR: k8PMjQVSTLoRMhMIGkQr5BiLO9WMvyA0T9uIIfbKDXSMtl/rfZUs606yO0z6hOKDel3lXs7A2d
 WimB01KxiUtKnibyN5JLlIs7dKrP7mEB/WrXDCvkIVJeDIBl7p2pJVoKWr4PD1au3qstz6Ow2k
 3db3UgGRZgWEgGT+IDlM/0taS1xsAjnvYHgFxe5dclQJjkVNS6DW3kK43Uwm5jCkc/+ixhDV/z
 BQIf6EDNY7uLV10nwIiZiX3tw+ZQUyabE3L+1WJv0v34JZpGjah88qRPMc2ICNg/sre92TjI4R
 ec/yvmxc/N84S3xq/rDp4Qog
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; 
   d="scan'208";a="73928984"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Oct 2021 00:54:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 00:54:09 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 00:54:06 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC:     <jacopo@jmondi.org>, <laurent.pinchart@ideasonboard.com>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 07/21] media: atmel: atmel-sama7g5-isc: fix ispck leftover
Date:   Fri, 22 Oct 2021 10:52:33 +0300
Message-ID: <20211022075247.518880-8-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211022075247.518880-1-eugen.hristev@microchip.com>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ispck is not used for sama7g5 variant of the ISC.
Calls to ispck have to be removed also from module insert/removal.

Fixes: d7f26849ed7c ("media: atmel: fix the ispck initialization")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-sama7g5-isc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-sama7g5-isc.c b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
index 9c05acafd072..6a5d3f7ce75e 100644
--- a/drivers/media/platform/atmel/atmel-sama7g5-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama7g5-isc.c
@@ -555,7 +555,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&isc->v4l2_dev);
 
-	clk_disable_unprepare(isc->ispck);
 	clk_disable_unprepare(isc->hclock);
 
 	isc_clk_cleanup(isc);
@@ -567,7 +566,6 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
 {
 	struct isc_device *isc = dev_get_drvdata(dev);
 
-	clk_disable_unprepare(isc->ispck);
 	clk_disable_unprepare(isc->hclock);
 
 	return 0;
@@ -582,10 +580,6 @@ static int __maybe_unused xisc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(isc->ispck);
-	if (ret)
-		clk_disable_unprepare(isc->hclock);
-
 	return ret;
 }
 
-- 
2.25.1

