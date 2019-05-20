Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C87C23A68
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 16:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387518AbfETOiq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 10:38:46 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50477 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387476AbfETOiq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 10:38:46 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id SjR3hFszF0YQeSjR6hrTzI; Mon, 20 May 2019 16:38:44 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-gpio: use disable/enable_irq
Message-ID: <bad6042c-81d7-a358-d197-9fe141ddc778@xs4all.nl>
Date:   Mon, 20 May 2019 16:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAKg6AIccmR0pCCk5loizv5Nyi0oEHKKPc9HYvXVZZ4hfaRJu85Mb0MpAuPccDu5k5H46bzbH+1FFX6hi41JI8I7ijsl7P3dedmcyShWcNktMpF4gZWj
 JpLt6zVOjRXZ3iYFg13qkpjlZ8YKYrpFeQSF/6jt9+lApuTxI+xrY/baSp1PPSWcFKODG6MC23Mp0w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to limitations in gpiolib it was impossible to disable the interrupt of
an input gpio and then switch it to gpio output and drive it. The only way
to achieve that was to free the interrupt first, then switch the direction.

When going back to gpio input and using interrupts to read the gpio pin you
had to request the irq again.

This limitation was lifted in gpiolib in kernel 4.20, but the cec-gpio driver
was still using the old workaround implementation.

This patch updates the cec-gpio driver to just enable and disable the irq.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/cec-gpio/cec-gpio.c | 28 +++++++++-------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/cec-gpio/cec-gpio.c b/drivers/media/platform/cec-gpio/cec-gpio.c
index d2861749d640..5b17d3a31896 100644
--- a/drivers/media/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/platform/cec-gpio/cec-gpio.c
@@ -17,7 +17,6 @@ struct cec_gpio {
 	struct gpio_desc	*cec_gpio;
 	int			cec_irq;
 	bool			cec_is_low;
-	bool			cec_have_irq;

 	struct gpio_desc	*hpd_gpio;
 	int			hpd_irq;
@@ -55,9 +54,6 @@ static void cec_gpio_low(struct cec_adapter *adap)

 	if (cec->cec_is_low)
 		return;
-	if (WARN_ON_ONCE(cec->cec_have_irq))
-		free_irq(cec->cec_irq, cec);
-	cec->cec_have_irq = false;
 	cec->cec_is_low = true;
 	gpiod_set_value(cec->cec_gpio, 0);
 }
@@ -114,14 +110,7 @@ static bool cec_gpio_enable_irq(struct cec_adapter *adap)
 {
 	struct cec_gpio *cec = cec_get_drvdata(adap);

-	if (cec->cec_have_irq)
-		return true;
-
-	if (request_irq(cec->cec_irq, cec_gpio_irq_handler,
-			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-			adap->name, cec))
-		return false;
-	cec->cec_have_irq = true;
+	enable_irq(cec->cec_irq);
 	return true;
 }

@@ -129,9 +118,7 @@ static void cec_gpio_disable_irq(struct cec_adapter *adap)
 {
 	struct cec_gpio *cec = cec_get_drvdata(adap);

-	if (cec->cec_have_irq)
-		free_irq(cec->cec_irq, cec);
-	cec->cec_have_irq = false;
+	disable_irq(cec->cec_irq);
 }

 static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
@@ -139,8 +126,7 @@ static void cec_gpio_status(struct cec_adapter *adap, struct seq_file *file)
 	struct cec_gpio *cec = cec_get_drvdata(adap);

 	seq_printf(file, "mode: %s\n", cec->cec_is_low ? "low-drive" : "read");
-	if (cec->cec_have_irq)
-		seq_printf(file, "using irq: %d\n", cec->cec_irq);
+	seq_printf(file, "using irq: %d\n", cec->cec_irq);
 	if (cec->hpd_gpio)
 		seq_printf(file, "hpd: %s\n",
 			   cec->hpd_is_high ? "high" : "low");
@@ -215,6 +201,14 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);

+	ret = devm_request_irq(dev, cec->cec_irq, cec_gpio_irq_handler,
+			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+			       cec->adap->name, cec);
+	if (ret)
+		return ret;
+
+	cec_gpio_disable_irq(cec->adap);
+
 	if (cec->hpd_gpio) {
 		cec->hpd_irq = gpiod_to_irq(cec->hpd_gpio);
 		ret = devm_request_threaded_irq(dev, cec->hpd_irq,
-- 
2.20.1

