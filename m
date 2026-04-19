Return-Path: <linux-media+bounces-59098-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGVYMt2h5Gl6XgEAu9opvQ
	(envelope-from <linux-media+bounces-59098-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:35:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD642383E
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 11:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17216300ED83
	for <lists+linux-media@lfdr.de>; Sun, 19 Apr 2026 09:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B237B028;
	Sun, 19 Apr 2026 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5192/ac"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E937D127
	for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591284; cv=none; b=Mqyr4en14zRgvF1BxhBCv9e2yo7nr4ZIdES7FN9Vt6CQyz5vY7AUxYJ4E+gC8BIHKacx/PZz0TJ9mD6KD76hNmXgKfJsoul8OiowQpT2fyYKfhHOhBuaGCQAWh7I7hXoPFhgfJMsfozVIhBXyucjjch1vjF+KDuT9Bc/7IWYYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591284; c=relaxed/simple;
	bh=ZK2PZapdmsACBN8s8mYncIJi9NrYgSvG33Qhg9WudsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXTV8eyxNpoPzu4tyeK8EN+x2JCBZrvNYw/XdT+6otnE2mU09bF/R31IfyOumx2+su9f0JQ0DKsefqrEYCMRBMxEDV7UhiIzg7Cfdk91zJ+hhbyThuh6IkNBp6g1L/h/u0WNelywGWokItbfwNn6jy7ftjttwOIs/9r3OJ//XLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5192/ac; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so2576919e87.0
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2026 02:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591281; x=1777196081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqXMxrwVP9xmPVimr0jG3GpsUd0+k6xNRj5bMFCO5o=;
        b=D5192/acvcXgXI5a5s4MTKLlL+BGC4bK9KiHO9UOyo6wJRZG5WbpQXuUCJEE2JfPeA
         ae0i1RwQCEtI3m8sKR5GdLBlGaOoYp/U7j9vjF5MgBsiiFk9FXIJwl5WLpH4vvMgfa6d
         oips6zI18dmNpfDKATr/QVbsRwSREmJ8UoBsNtjeNW3KrHaoBKgg6Fii1FhYAUMhda5a
         9gmXWxcUaL9F2DPdB77cc9UTOmEgiNxoJNdKZDZRInbjfoPm7cnbrDLgFRvNzwCLX6Tg
         N83k+em9U7lztjX4TP+Pfg/DQqO6zGKjrG0JyG5lp0hy73iJEfU8Dbb9VsHdz8oMpCGf
         /y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591281; x=1777196081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=duqXMxrwVP9xmPVimr0jG3GpsUd0+k6xNRj5bMFCO5o=;
        b=DU2qIuncj9yXu1a73JhEL5AWxyEEp8Z29P9IdAe4xiHOLSfIHfpeEpSAGYJ984fI8h
         Pewg/jUSb3uFPKs0j6f+1KXso92nuCq1aU/Vls++gc5PekbomVCnN6e0qx6RKyWmT2f8
         48uc0X2AXAurOZc82BrsePZXrVrCGngAeXmYyqB4UroeO0e7dFoZ059YjN7NMkYkrfqD
         ksLtIrc+e3xfzw+PqQHsWw4rvH1Hi3W6MmEaR2eaZ2HW2V5WN1oLA1qB+/Ghw7icOZsb
         lXC7i7jKyXRNM4dzVuEdPmuJnYbqKcye9SQx0wpOqQ9mdpHmK/agOXcfcmOM4SzoEx5W
         fDww==
X-Forwarded-Encrypted: i=1; AFNElJ+0dnyXbpfRmO6HmmbdgXu/hXOb1oFnS95NAPuHwcxwfsae/O7CQuxVq5Rf7XPoZff5PGkQbGabMn64/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2bO+gXK0Ecimejchagj/RMOQq1ezpJsbiGisB375uEf3vW2cj
	ISUN5kdnb3UhCaB6Y/JR/5wWj9T/Pf5NVNDtIJc8hWEyB3zZONcqo8em
X-Gm-Gg: AeBDiev+n5B0JgaclNf4Q6s/7lGERq18QeBaQCN1kYS+olHU7XlkRnL2ieFMfqPx+sS
	uM6y4idUpNTNl9QpfnaUhVtCbF2Z9KYclLaEERvuHO9BACjYRSxbX8SwEv8daGf1gfPMAIctlyp
	SEdnV6Z3+CxRtH07+9LAIv8klIAnHedECfJL6TFhAFSyRQPHcUYQRg84ifzQbgWhVxwfGZF7k5Z
	erFpVohexcY0PA+NA58pukGRdBz+60LLe/KhamiAjgKxML536yKFbLAY3ebqCElt3IIacUoQoDQ
	vnmZfvB2H0A1UC6do/c7vR+wF5DiQnOQWrgIs7Zy8YfIMTix8KpxbdKXFJdsQNrUcsSUBbI6NbF
	ECSYYj3dbJQGAIlAaa3+x+u/HPB5UnF7vJZ2RPfWSwXvD2A5EWgIXcr8DovsFk1JFD1Hed9no/s
	7cDZ9lyT8RrdxReiKdeZZvc58=
X-Received: by 2002:a05:6512:159f:b0:5a3:f0f7:7da1 with SMTP id 2adb3069b0e04-5a4172cd17amr3379372e87.17.1776591280877;
        Sun, 19 Apr 2026 02:34:40 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 5/5] media: i2c: lm3560: Add support for PM features
Date: Sun, 19 Apr 2026 12:34:12 +0300
Message-ID: <20260419093412.40796-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59098-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 54DD642383E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Media device deregistration helpers were grouped into a
separate function to simplify the probe/remove process. Added PM
operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 135 +++++++++++++++++++++++++++++++++----
 1 file changed, 123 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 022a6a76befb..8f5156a80a99 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -11,12 +11,15 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -47,6 +50,8 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
+ * @hwen_gpio: line connected to HWEN pin
+ * @vin_supply: line connected to IN supply (2.5V - 5.5V)
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
@@ -60,6 +65,9 @@ struct lm3560_flash {
 	struct regmap *regmap;
 	struct mutex lock;
 
+	struct gpio_desc *hwen_gpio;
+	struct regulator *vin_supply;
+
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
@@ -172,12 +180,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_in_use(flash->dev))
+		return 0;
+
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
-		if (rval < 0)
+		if (rval < 0) {
+			pm_runtime_put(flash->dev);
 			return rval;
+		}
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -187,6 +200,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -196,6 +211,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_in_use(flash->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -241,6 +259,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -403,6 +423,60 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static void lm3560_power_off(struct lm3560_flash *flash)
+{
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+}
+
+static int lm3560_power_on(struct lm3560_flash *flash)
+{
+	int rval;
+
+	rval = regulator_enable(flash->vin_supply);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to enable vin power supply\n");
+		return rval;
+	}
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
+
+	rval = lm3560_init_device(flash);
+	if (rval < 0) {
+		lm3560_power_off(flash);
+		return rval;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused lm3560_pm_runtime_resume(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	return lm3560_power_on(flash);
+}
+
+static int __maybe_unused lm3560_pm_runtime_suspend(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	lm3560_power_off(flash);
+
+	return 0;
+}
+
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
+{
+	unsigned int i;
+
+	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
+		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
+		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
+		media_entity_cleanup(&flash->subdev_led[i].entity);
+	}
+}
+
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
@@ -423,6 +497,17 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
+	flash->vin_supply = devm_regulator_get(&client->dev, "vin");
+	if (IS_ERR(flash->vin_supply))
+		return dev_err_probe(&client->dev, PTR_ERR(flash->vin_supply),
+				     "failed to get vin-supply\n");
+
 	flash->peak = LM3560_PEAK_1600mA;
 	rval = device_property_read_u32(flash->dev,
 					"ti,peak-current-microamp", &peak_ua);
@@ -450,10 +535,13 @@ static int lm3560_probe(struct i2c_client *client)
 				 &flash->max_flash_timeout);
 	flash->max_flash_timeout /= 1000;
 
-	rval = lm3560_init_device(flash);
+	rval = lm3560_power_on(flash);
 	if (rval < 0)
 		return rval;
 
+	pm_runtime_set_active(flash->dev);
+	pm_runtime_enable(flash->dev);
+
 	device_for_each_child_node(flash->dev, node) {
 		fwnode_property_read_u32(node, "reg", &reg);
 
@@ -467,30 +555,53 @@ static int lm3560_probe(struct i2c_client *client)
 						 &flash->max_torch_brt[reg]);
 
 			rval = lm3560_subdev_init(flash, reg, node);
-			if (rval < 0)
-				return dev_err_probe(flash->dev, rval,
-						    "failed to register led%d\n",
-						    reg);
+			if (rval < 0) {
+				dev_err(flash->dev,
+					"failed to register led%d\n", reg);
+				goto error_clean;
+			}
 		}
 	}
 
 	i2c_set_clientdata(client, flash);
 
+	pm_runtime_set_autosuspend_delay(flash->dev, 1000);
+	pm_runtime_use_autosuspend(flash->dev);
+	pm_runtime_idle(flash->dev);
+
 	return 0;
+
+error_clean:
+	pm_runtime_disable(flash->dev);
+	pm_runtime_set_suspended(flash->dev);
+	lm3560_subdev_cleanup(flash);
+	lm3560_power_off(flash);
+
+	return rval;
 }
 
 static void lm3560_remove(struct i2c_client *client)
 {
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
-	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
-		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
-		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
-		media_entity_cleanup(&flash->subdev_led[i].entity);
+	lm3560_subdev_cleanup(flash);
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		lm3560_power_off(flash);
+		pm_runtime_set_suspended(&client->dev);
 	}
 }
 
+static const struct dev_pm_ops lm3560_pm_ops = {
+	SET_RUNTIME_PM_OPS(lm3560_pm_runtime_suspend,
+			   lm3560_pm_runtime_resume, NULL)
+};
+
 static const struct of_device_id lm3560_of_match[] = {
 	{ .compatible = "ti,lm3559" },
 	{ .compatible = "ti,lm3560" },
@@ -509,7 +620,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
 static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
-		   .pm = NULL,
+		   .pm = &lm3560_pm_ops,
 		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
-- 
2.51.0


