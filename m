Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECF8354399
	for <lists+linux-media@lfdr.de>; Mon,  5 Apr 2021 17:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238130AbhDEPw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Apr 2021 11:52:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:54167 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbhDEPw3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Apr 2021 11:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617637943; x=1649173943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCzGB/5nxDRF5zHetU+FXH2sdCatrGHOQpHiMo1ettU=;
  b=ggASXiUHGKHsWsV08wKdpXrsGmyTF8Y+mpc221J+Kw9AeLrjrMxyGkgZ
   jlZfABfLRQkBiJBbYoqCGKoxnEftvuD8kQYKxrbHcnXvRchKTCg1gL2pk
   1XFrTWeLuEAq8Z36QbCzGz4+sfmHfE8QE26gslsM1W/fb6zgt750L0jb9
   IuVMkTGWC3fchVgQupQud8NSkO8+PSFj/ZiN3C8XjYiGqLr/gFWXzkTCz
   128plEBK0CXmGPY6l1gTfDZ++EL4hi0AHXhlBjZ8bC3AeMjvO7R8XPgZY
   ofd2UFpMzh0nzgHf+wioAds/wmU5TdlnGU9RThDbx1mVVG4LCgeXfXpUT
   g==;
IronPort-SDR: 5kd8pzbJ/k/wCFkW4qGbWXhANbBuMPt5grQSOTBRq+nTD4Yj3Grw1mQWKjGgZmFEkuQhgZTu/a
 D/Bf9OlCqmAMlwsHHpn0Whmt4Eqay2TLfZEFugeNmRjCCU57WyPtgbZAW8vyN+HFBziWazEl5q
 q+kLfo3SiN9sc5+qc6fNxazyVHmAp9qApX8imlat9GWAwSYW0q77AIHmxBmvgyTS+Xe1rnvPTs
 hY/N4ydAEvwB+H4QbOMroOT7IMyMjThkORxI60DFqCXMq8ZOrfF4yw+I9j1FzYqd02eDhKykLg
 THw=
X-IronPort-AV: E=Sophos;i="5.81,307,1610434800"; 
   d="scan'208";a="50026501"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Apr 2021 08:52:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Apr 2021 08:52:22 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 5 Apr 2021 08:52:03 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 02/30] media: atmel: atmel-isc: specialize driver name constant
Date:   Mon, 5 Apr 2021 18:50:37 +0300
Message-ID: <20210405155105.162529-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210405155105.162529-1-eugen.hristev@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver name constant must defined based on product driver, thus moving
the constant directly where it's required. This will allow each ISC based
product to define it's own name.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/platform/atmel/atmel-isc-base.c    | 4 ++--
 drivers/media/platform/atmel/atmel-isc.h         | 2 --
 drivers/media/platform/atmel/atmel-sama5d2-isc.c | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
index 8b6c5e339cb8..277a8fd8b83d 100644
--- a/drivers/media/platform/atmel/atmel-isc-base.c
+++ b/drivers/media/platform/atmel/atmel-isc-base.c
@@ -896,7 +896,7 @@ static int isc_querycap(struct file *file, void *priv,
 {
 	struct isc_device *isc = video_drvdata(file);
 
-	strscpy(cap->driver, ATMEL_ISC_NAME, sizeof(cap->driver));
+	strscpy(cap->driver, "microchip-isc", sizeof(cap->driver));
 	strscpy(cap->card, "Atmel Image Sensor Controller", sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
 		 "platform:%s", isc->v4l2_dev.name);
@@ -2246,7 +2246,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	}
 
 	/* Register video device */
-	strscpy(vdev->name, ATMEL_ISC_NAME, sizeof(vdev->name));
+	strscpy(vdev->name, "microchip-isc", sizeof(vdev->name));
 	vdev->release		= video_device_release_empty;
 	vdev->fops		= &isc_fops;
 	vdev->ioctl_ops		= &isc_ioctl_ops;
diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
index f1df47a4655b..8d81d9967ad2 100644
--- a/drivers/media/platform/atmel/atmel-isc.h
+++ b/drivers/media/platform/atmel/atmel-isc.h
@@ -256,8 +256,6 @@ struct isc_device {
 	u32		gamma_max;
 };
 
-#define ATMEL_ISC_NAME "atmel-isc"
-
 extern struct isc_format formats_list[];
 extern const struct isc_format controller_formats[];
 extern const struct regmap_config isc_regmap_config;
diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
index c74f36245bd5..f45d8b96bfb8 100644
--- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
+++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
@@ -185,7 +185,7 @@ static int atmel_isc_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, isc_interrupt, 0,
-			       ATMEL_ISC_NAME, isc);
+			       "atmel-sama5d2-isc", isc);
 	if (ret < 0) {
 		dev_err(dev, "can't register ISR for IRQ %u (ret=%i)\n",
 			irq, ret);
@@ -364,7 +364,7 @@ static struct platform_driver atmel_isc_driver = {
 	.probe	= atmel_isc_probe,
 	.remove	= atmel_isc_remove,
 	.driver	= {
-		.name		= ATMEL_ISC_NAME,
+		.name		= "atmel-sama5d2-isc",
 		.pm		= &atmel_isc_dev_pm_ops,
 		.of_match_table = of_match_ptr(atmel_isc_of_match),
 	},
-- 
2.25.1

