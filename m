Return-Path: <linux-media+bounces-59489-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNtGMJga62lTIgAAu9opvQ
	(envelope-from <linux-media+bounces-59489-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0445AA9E
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC251300868C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0746F37CD55;
	Fri, 24 Apr 2026 07:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3xwtS0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E7F378D71
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015377; cv=none; b=SrlNny/MkIYqvdowkz2y4FoPjbDyLst8zWSWHFrAVHlgoHP7CoBph6AiOXq0IkDjWKRA3cIvhEXkQOqZTrAFGxASwiOSo3SrN52GEj46yxwvEvD4YDQYdeKoTIr3tMFgY1OboSRw92NjvkeCLed7uE4Z8Np7N2KvpPGFulJu/ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015377; c=relaxed/simple;
	bh=uYzCO2a7lwvw6rXeiwoe9LzLhm1VKeGalP4isbTrZz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M52km8Hm6DuyKvqlyGPXV0Nj/qZo3+Qb39irk5UJK3iy/keF+rn4tj/l5+mi5Fa5TeCwteqjgxn6pfFpEzZX0lppCPCq+ftLvNkhRZicj0/8YPdt40Q9KYun/5llMBrJcRSEQctbPuEU650oApJ8Hj4Tmg4H/BxvPGtsmQpWTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3xwtS0q; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so6406230e87.0
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015374; x=1777620174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTjooS0n+OLO5qAqY+PpCTXsi3phlO0GRX2wY3bD3Wo=;
        b=a3xwtS0qEv1Yk0Q2l1h/TXs7UHC6TE4jpBd/SumvBs179pIlmJrjECan/LhKI/3tRP
         1quI+kDms/a+8FPdZLjBBH6C6PltS02SrSlNOXhdcpq+rK2BbYWUhcweXMd0u2HEN1MJ
         Zai/4mnKBmOAEf4NrzmI6dCfEOCcwkydWCBpAfOfcd6b+rCQTyPUOOTxM3xlX44hpV7q
         OgVxi7ZaQZ3hvsAtiNlTncB0zNCGmu2irZU4kzzI7/2ZN+B/6BZ2boYuiuP8xeV545ea
         k35JHAjR5xeGstzePAdsyJUcSAijaB/Gh3I3yVIvt5voQfGlJJPixW7F77r+sbJSUk63
         T57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015374; x=1777620174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTjooS0n+OLO5qAqY+PpCTXsi3phlO0GRX2wY3bD3Wo=;
        b=jA3rA2t19Yey+rhlBjCFtx21cpdTPYAvqineucmSCPvdIsCdSLv6U5fV+mn3uS4Ps5
         1TSVeDhGk/8a25C+AMWJG0Mz//nI/mQS8fMrybkw/tLcV1ZC3o0WPwUXRzTf/Pe1421Y
         Msx6R956eMTeUca4MZvL3zypvhn7QtfC599YEIVYVhvre73gxjWHdCpzmqzGmgD9gXBP
         vPJ0Dy/2UcubJ9+9j9iM7lqkqnpovdgRtRw8hNXdGMLpUczHbiRX9GIHI03WDh3YvR81
         Rznf9Zyd4YU4/xX+8VSCBCmH9sJCPfKwV+hU2eW7Aj3j9kUnzFeSHFTJBx//VuXrQ9YP
         DuSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cxhAH5LG9z6WKaOlATGo0XIYv6mPnc6wqdeMMmRI3gC5VphqctosDssrZwGycvi0ZvT55iqjcpSx7aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn1b04lmC5bpxe92x5yLf1/Z9RgRg5PQ6YtVG4zu1PVdCX/iyk
	sIyqciNA85DvomkxVWGHb2LCIhZU1kiU0QWHVCxFPQZAvFO48PcAA3JX
X-Gm-Gg: AeBDietHauvTkrAI+q/3kSvWbciNT+d2wwNd8gzhbV7i2213oUH712cw0s+ndL8xbQK
	ZN7S7u14saxg+ex/VF4fVeDEiS+Kpy8YKfVTRK2VVrfzJJdyFzQtgDOL2g8E5IZwmjLlezI4i82
	PD6oQCaoyzRwYl1GQg4hak2yjDcivAeVXhQ0BliQmMez/c+k94TO3ja9eJ+MEs/21nAT/SUS2Xe
	9P7qtGd1ppq2rmSr6DVhSuoxwTUg9H5aoQsjN3cR2Q+ksT4T7zJ8B7l9Efz1zaP6KHMa3tlpdw5
	gPPzka1P+8AKesMYL88QdQBUN10apJOgX0uPCDeWt2B0J/A1jCIaJZaTMSKmz1f51Ibvr2mhbza
	XizEUhgwNdX2AiTjTpixVe6W1c0Me80Al6+VFSwEEn1Si563IbohYuSv/E2vGilaPZzoZhk/1tq
	h89EGrep3sqi/I0ZtNyt87WwE=
X-Received: by 2002:a05:6512:39c7:b0:5a2:a703:969 with SMTP id 2adb3069b0e04-5a4172f61e8mr11674232e87.40.1777015373466;
        Fri, 24 Apr 2026 00:22:53 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:53 -0700 (PDT)
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
Subject: [PATCH v3 5/5] media: i2c: lm3560: Add support for PM features
Date: Fri, 24 Apr 2026 10:22:30 +0300
Message-ID: <20260424072230.90354-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CAA0445AA9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59489-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Media device deregistration helpers were grouped into a
separate function to simplify the probe/remove process. Added PM
operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 123 +++++++++++++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 022a6a76befb..ebb30d45fdfe 100644
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
 
@@ -403,6 +423,49 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static int lm3560_power_off(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return 0;
+}
+
+static int lm3560_power_on(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
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
+		lm3560_power_off(dev);
+		return rval;
+	}
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
@@ -423,6 +486,17 @@ static int lm3560_probe(struct i2c_client *client)
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
@@ -450,10 +524,13 @@ static int lm3560_probe(struct i2c_client *client)
 				 &flash->max_flash_timeout);
 	flash->max_flash_timeout /= 1000;
 
-	rval = lm3560_init_device(flash);
+	rval = lm3560_power_on(flash->dev);
 	if (rval < 0)
 		return rval;
 
+	pm_runtime_set_active(flash->dev);
+	pm_runtime_enable(flash->dev);
+
 	device_for_each_child_node(flash->dev, node) {
 		fwnode_property_read_u32(node, "reg", &reg);
 
@@ -467,30 +544,52 @@ static int lm3560_probe(struct i2c_client *client)
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
+	lm3560_power_off(flash->dev);
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
+		lm3560_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
 	}
 }
 
+static const struct dev_pm_ops lm3560_pm_ops = {
+	SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
+};
+
 static const struct of_device_id lm3560_of_match[] = {
 	{ .compatible = "ti,lm3559" },
 	{ .compatible = "ti,lm3560" },
@@ -509,7 +608,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
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


