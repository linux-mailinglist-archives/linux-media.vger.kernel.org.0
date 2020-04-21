Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419FD1B2294
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 11:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgDUJXs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 05:23:48 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42591 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725920AbgDUJXr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 05:23:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Qp81j6T3B7xncQp85jJpSx; Tue, 21 Apr 2020 11:23:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587461025; bh=JKt344UkuDD3egKkW+tihRnZRHf1PfZ3mME3CUrXyLg=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=iByx5dUcVySQobLj+4XBsCOOPjUDSOyAm22WgrAU+hekZSMAXg56kuwP12fZJFFkH
         dgRxOXLRlYO3Iui3+xUs9FXXAyl9qm1Ns5Ph7QLLc2n0EGcFaXIfaLXeaUlmF4UFtj
         y6CbJMCfV0Yq/cVoW0vWePDLMWZz1d+2Txs1tH+XM4C0kxqjo7HMK3aZIKAL/CQt5v
         yWDStWbAZ75D7DLaOBTxeUevgr62NN4xM6I85/DPBSaNHxIgW7OXF59vbqDooArpS8
         fhYFALQDZfiK668/xoo+wEbeUiRFYz9mNa3EtkfzDDLM5JCxrKXg5iWC3KpPd9hQ0e
         Pzrg8/z6qjzNw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] cec-gpio: handle gpiod_get_value errors correctly
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <0bfb4311-0e4e-2a7c-4e9f-cd97f8e63c46@xs4all.nl>
Date:   Tue, 21 Apr 2020 11:23:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUX3jXmj+WnruNSxnf8B4ROeXKL+cnqTTyXcyhMHSWIQVtkxniz8vFK52xCHw87OVQHpfjdte0e4Ct9Tq5mT3YoGtbd4WBKNozAIPsL794fgVEBxOKR
 Z6vYFCs7WPS0PEltmTP0nzZmx+1ZoLdDY+IC/TRRPhA7l8gdaT0AW40M007pr8ux/kxh/1z0icWXMgnSx44Df/MDg9ZuDoDBbV8/vaWT7vdlcixcMGgvf0+A
 MaNAdt4/pxQVX1n4xc9Hsg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gpiod_get_value() can return negative values if an error occurs.
In several places this error code was ignored.

Ensure that errors codes are handled correctly throughout the CEC
pin framework and CEC pin drivers.

The return code of the cec_pin_ops read() callback had to be changed
from 'bool' to 'int', which mean the prototype of that callback in the
sun4i drm driver also had to be changed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 68d4644ac2dc..126e1517ade2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -282,7 +282,7 @@ static const struct drm_connector_funcs sun4i_hdmi_connector_funcs = {
 };

 #ifdef CONFIG_DRM_SUN4I_HDMI_CEC
-static bool sun4i_hdmi_cec_pin_read(struct cec_adapter *adap)
+static int sun4i_hdmi_cec_pin_read(struct cec_adapter *adap)
 {
 	struct sun4i_hdmi *hdmi = cec_get_drvdata(adap);

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 42d2c2cd9a78..c8c4efc83f5f 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -31,12 +31,12 @@ struct cec_gpio {
 	ktime_t			v5_ts;
 };

-static bool cec_gpio_read(struct cec_adapter *adap)
+static int cec_gpio_read(struct cec_adapter *adap)
 {
 	struct cec_gpio *cec = cec_get_drvdata(adap);

 	if (cec->cec_is_low)
-		return false;
+		return 0;
 	return gpiod_get_value(cec->cec_gpio);
 }

@@ -71,9 +71,10 @@ static irqreturn_t cec_hpd_gpio_irq_handler_thread(int irq, void *priv)
 static irqreturn_t cec_5v_gpio_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
-	bool is_high = gpiod_get_value(cec->v5_gpio);
+	int val = gpiod_get_value(cec->v5_gpio);
+	bool is_high = val > 0;

-	if (is_high == cec->v5_is_high)
+	if (val < 0 || is_high == cec->v5_is_high)
 		return IRQ_HANDLED;
 	cec->v5_ts = ktime_get();
 	cec->v5_is_high = is_high;
@@ -91,9 +92,10 @@ static irqreturn_t cec_5v_gpio_irq_handler_thread(int irq, void *priv)
 static irqreturn_t cec_hpd_gpio_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
-	bool is_high = gpiod_get_value(cec->hpd_gpio);
+	int val = gpiod_get_value(cec->hpd_gpio);
+	bool is_high = val > 0;

-	if (is_high == cec->hpd_is_high)
+	if (val < 0 || is_high == cec->hpd_is_high)
 		return IRQ_HANDLED;
 	cec->hpd_ts = ktime_get();
 	cec->hpd_is_high = is_high;
@@ -103,8 +105,10 @@ static irqreturn_t cec_hpd_gpio_irq_handler(int irq, void *priv)
 static irqreturn_t cec_gpio_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
+	int val = gpiod_get_value(cec->cec_gpio);

-	cec_pin_changed(cec->adap, gpiod_get_value(cec->cec_gpio));
+	if (val >= 0)
+		cec_pin_changed(cec->adap, val > 0);
 	return IRQ_HANDLED;
 }

diff --git a/include/media/cec-pin.h b/include/media/cec-pin.h
index 88c8b016eb09..483bc4769fe9 100644
--- a/include/media/cec-pin.h
+++ b/include/media/cec-pin.h
@@ -13,7 +13,8 @@

 /**
  * struct cec_pin_ops - low-level CEC pin operations
- * @read:	read the CEC pin. Return true if high, false if low.
+ * @read:	read the CEC pin. Returns > 0 if high, 0 if low, or an error
+ *		if negative.
  * @low:	drive the CEC pin low.
  * @high:	stop driving the CEC pin. The pull-up will drive the pin
  *		high, unless someone else is driving the pin low.
@@ -22,13 +23,10 @@
  * @free:	optional. Free any allocated resources. Called when the
  *		adapter is deleted.
  * @status:	optional, log status information.
- * @read_hpd:	read the HPD pin. Return true if high, false if low or
- *		an error if negative. If NULL or -ENOTTY is returned,
- *		then this is not supported.
- * @read_5v:	read the 5V pin. Return true if high, false if low or
- *		an error if negative. If NULL or -ENOTTY is returned,
- *		then this is not supported.
- *
+ * @read_hpd:	optional. Read the HPD pin. Returns > 0 if high, 0 if low or
+ *		an error if negative.
+ * @read_5v:	optional. Read the 5V pin. Returns > 0 if high, 0 if low or
+ *		an error if negative.
  * @received:	optional. High-level CEC message callback. Allows the driver
  *		to process CEC messages.
  *
@@ -36,7 +34,7 @@
  * cec pin framework to manipulate the CEC pin.
  */
 struct cec_pin_ops {
-	bool (*read)(struct cec_adapter *adap);
+	int  (*read)(struct cec_adapter *adap);
 	void (*low)(struct cec_adapter *adap);
 	void (*high)(struct cec_adapter *adap);
 	bool (*enable_irq)(struct cec_adapter *adap);
