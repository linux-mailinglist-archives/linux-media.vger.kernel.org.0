Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B497351E39
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237975AbhDASg3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:36:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:60700 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240828AbhDASbi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617301899; x=1648837899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jCzGB/5nxDRF5zHetU+FXH2sdCatrGHOQpHiMo1ettU=;
  b=L8o+i2qhuQDJizr6T/wt27dF7as5umxGI0sZAMT0nmhF7wKOASQHYMeg
   /Q8CRXpohm8AFv5Bszw07k2P1N72F85P5pmQ9+fNGFyVYOCLgnUk9zCfU
   Nnqnx+9e+yiy44y/0q06TTDDZ+J8dN09nOkxYAJL/n+uc6+ctPETmXEzt
   fmqUX9e+L24qUDcOwszyiwdYThKczdUYrDnHCmFZVYSosHNcKpUxU78I/
   NzoHIaNggvApjFgwvu7gVCFOJMhC4wee71gpeoRlabGx1IZXU3WP+kGpb
   ffL4JAkX+QobmePOcXzZdBdrFdH+KlvAptDpOuqm//GhHBqMbg6YC6QEx
   Q==;
IronPort-SDR: MeC3eHuwf+PoH+EQpHRmRP5z6lY02fAzawQm4i8a19dGak7j94eJ1tptfjm3UjCXd/L4JzbL+b
 R79mmxmrdbXAdTRs9B571ynkO/1OnwbEBzmXHC2bZOpo67G7LyKWI3BeKaJ/ZLaUZh9C0WG6dr
 7RWLn/9M4suzK7uiIhbwuBcHoGLNSQ0DuR7h8Z1PlPXw5E6gFqV9j661F27PKKVvsg3Bk7ARRs
 jChCQacKNOb+FyYWm/hq+CHVbS+hXsN/O5BK+UNlgfnMTFsd764iH/UTtV9mpY9HIY2zsgbrEQ
 2A8=
X-IronPort-AV: E=Sophos;i="5.81,296,1610434800"; 
   d="scan'208";a="114976413"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Apr 2021 04:29:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 04:29:02 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 1 Apr 2021 04:28:56 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 02/30] media: atmel: atmel-isc: specialize driver name constant
Date:   Thu, 1 Apr 2021 14:26:55 +0300
Message-ID: <20210401112723.189107-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401112723.189107-1-eugen.hristev@microchip.com>
References: <20210401112723.189107-1-eugen.hristev@microchip.com>
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

