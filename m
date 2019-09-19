Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3323B7845
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 13:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389558AbfISLP6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 07:15:58 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:33273 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389541AbfISLP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 07:15:57 -0400
Received: from [IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443] ([IPv6:2001:983:e9a7:1:c95c:52f0:f173:9443])
        by smtp-cloud7.xs4all.net with ESMTPA
        id AuPhiNHBb9D4hAuPjiYPCY; Thu, 19 Sep 2019 13:15:55 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Johan Fjeldtvedt (johfjeld)" <johfjeld@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-gpio: add notifier support
Message-ID: <40b43ec5-a266-f2fa-5c01-4cadda41e5e1@xs4all.nl>
Date:   Thu, 19 Sep 2019 13:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPoJbcUifmbST1KytRsLX5bGUTrdG/dWKEXPfQzQ8PmQRgv5Gh0BprGO2vnTZkBr66KZWk2LN/+5ANu1Xv3qabJKwsRHOFPLf5DEFcR8lzyc6bGDR4v/
 s/6K1RASjGH+XP9t09r5mROKu/CmMEyQjauaQ5lL23D0H6MfxVh7f9V68mNX9re+TutMDtz9wTuiylV3t3Nym0Q+/gSfSp0T2uzmiBU3FGHdnOBane6K15Y3
 7DVGiniUKMYUsJ1SOnOgQBr8lP7JWuTXPSNEF3w3pFXuPpRfZ0n/ENBNX3eEoSLGJTa1CxutS3t/a1aOy3zmWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for cec-notifier to the cec-gpio driver.

This makes it possible to associate the CEC gpio pin with an HDMI
connector. This feature was always documented in the cec-gpio bindings:

Documentation/devicetree/bindings/media/cec-gpio.txt

But support for the hdmi-phandle property was never actually implemented in
this driver.

This patch adds support for this property.

It also fixes a few incorrect error returns in the probe() function, which
skipped the call to cec_delete_adapter().

Tested on a Raspberry Pi 3B with a modified vc4 driver.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/Kconfig             |  1 +
 drivers/media/platform/cec-gpio/cec-gpio.c | 41 +++++++++++++++++-----
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 83a785010753..3fdd9f351632 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -589,6 +589,7 @@ config CEC_GPIO
 	depends on PREEMPT || COMPILE_TEST
 	select CEC_CORE
 	select CEC_PIN
+	select CEC_NOTIFIER
 	select GPIOLIB
 	help
 	  This is a generic GPIO-based CEC driver.
diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/platform/cec-gpio/cec-gpio.c
index 5b17d3a31896..7be91e712c4a 100644
--- a/drivers/media/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/platform/cec-gpio/cec-gpio.c
@@ -8,10 +8,12 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
+#include <media/cec-notifier.h>
 #include <media/cec-pin.h>

 struct cec_gpio {
 	struct cec_adapter	*adap;
+	struct cec_notifier	*notifier;
 	struct device		*dev;

 	struct gpio_desc	*cec_gpio;
@@ -173,9 +175,17 @@ static const struct cec_pin_ops cec_gpio_pin_ops = {
 static int cec_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device *hdmi_dev;
 	struct cec_gpio *cec;
+	u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN;
 	int ret;

+	hdmi_dev = cec_notifier_parse_hdmi_phandle(dev);
+	if (PTR_ERR(hdmi_dev) == -EPROBE_DEFER)
+		return PTR_ERR(hdmi_dev);
+	if (IS_ERR(hdmi_dev))
+		caps |= CEC_CAP_PHYS_ADDR;
+
 	cec = devm_kzalloc(dev, sizeof(*cec), GFP_KERNEL);
 	if (!cec)
 		return -ENOMEM;
@@ -196,8 +206,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(cec->v5_gpio);

 	cec->adap = cec_pin_allocate_adapter(&cec_gpio_pin_ops,
-		cec, pdev->name, CEC_CAP_DEFAULTS | CEC_CAP_PHYS_ADDR |
-				 CEC_CAP_MONITOR_ALL | CEC_CAP_MONITOR_PIN);
+					     cec, pdev->name, caps);
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);

@@ -205,7 +214,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
 			       cec->adap->name, cec);
 	if (ret)
-		return ret;
+		goto del_adap;

 	cec_gpio_disable_irq(cec->adap);

@@ -218,7 +227,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
 			"hpd-gpio", cec);
 		if (ret)
-			return ret;
+			goto del_adap;
 	}

 	if (cec->v5_gpio) {
@@ -230,23 +239,37 @@ static int cec_gpio_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
 			"v5-gpio", cec);
 		if (ret)
-			return ret;
+			goto del_adap;
 	}

-	ret = cec_register_adapter(cec->adap, &pdev->dev);
-	if (ret) {
-		cec_delete_adapter(cec->adap);
-		return ret;
+	if (!IS_ERR(hdmi_dev)) {
+		cec->notifier = cec_notifier_cec_adap_register(hdmi_dev, NULL,
+							       cec->adap);
+		if (!cec->notifier) {
+			ret = -ENOMEM;
+			goto del_adap;
+		}
 	}

+	ret = cec_register_adapter(cec->adap, &pdev->dev);
+	if (ret)
+		goto unreg_notifier;
+
 	platform_set_drvdata(pdev, cec);
 	return 0;
+
+unreg_notifier:
+	cec_notifier_cec_adap_unregister(cec->notifier);
+del_adap:
+	cec_delete_adapter(cec->adap);
+	return ret;
 }

 static int cec_gpio_remove(struct platform_device *pdev)
 {
 	struct cec_gpio *cec = platform_get_drvdata(pdev);

+	cec_notifier_cec_adap_unregister(cec->notifier);
 	cec_unregister_adapter(cec->adap);
 	return 0;
 }
-- 
2.20.1

