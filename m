Return-Path: <linux-media+bounces-60522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEBHB6Dk+mm3TwMAu9opvQ
	(envelope-from <linux-media+bounces-60522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:50:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8BB4D6C81
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC31F3025BE6
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39A6369206;
	Wed,  6 May 2026 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1yyYBiz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0486F36C598
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050155; cv=none; b=bn2bOGlQ5ZjDOSCftdLZMDP5FM3Ugudcy+byZnOsbigFlU+UPn2EpevSCVHMX69h3h1OFeaV49Ka0kw1qimoE/PKrbVJx7i8xNVOvnzXexYQu0eRC/xEwSIFuohjH45KNVmU7ye0bYVde+xFnXk/ym6PBYFiHmSBYg/SMyYgDqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050155; c=relaxed/simple;
	bh=89540iaVZSqku3rNQPcP/FeBt8NoJGP35+1Y9aLPSUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAdWYOR2MKGAVqqVhGfL9Zur/+MBOYGPs+SxRbtc1SGXDSXaoYZkJ5u+cKg/aU5yP0T3sDJk/rYlzUdhDV1bRShqFwP7rr6BSQbQKKZ6aUhKNc3RB5FFFKxC8SY5jAIkuEs9dwQdhxUBSmiwjJipkqxyM1IW5NvkeQ/MLiaC5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1yyYBiz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so38023215e9.3
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050151; x=1778654951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1A33MEOc97LDWAJfo5ET+7oDF3PRcg1aKX3rJdiUA4=;
        b=T1yyYBizbjFa1qUhxJgT3uxyhg91vV5PaRcwt3JpYRu5PyjJ9QNiTf0sFI+3+LCETF
         SN7/czf04i/G6IZ+XFKuUaMLw6ASlZi4og4XRb/SnubourxkaKD2BjLf8AiFszFyWQvV
         iLheH+itIf32DjrSxFVsF/PmItGLk+5zMEhrm3fArCbUi4hDQarDuop4s2yUpiQ/Klt+
         zjpAwMoZr1i0DtZ40XTVmyw4uqau2RXO3MCJraNFlVdPWTT/HUr229xxLeXSRdUfSBBJ
         X+Et1272S5qkzaJ+Lyqg3eu9nnZCdsVExuSeZoNlHc+vEUX55FPDCFRQ95sFs3wUxNmZ
         7YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050151; x=1778654951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1A33MEOc97LDWAJfo5ET+7oDF3PRcg1aKX3rJdiUA4=;
        b=TPqRBdhKRAj1Y5uC4uw7Y6PEC91iBzd+zjcU5rctg/Bazpzto4Po5AqG0/kbVeoxuW
         K2FQ998xM0DUdc1BfPJQLWOOmDfmaiWZ7MKIHCO8a2jtfHtj4iYK6R2oA148gLOpsc8a
         msZ8O+ixgq67FWAZ5XEevuwFpUNossLrkqWD7uUHq4Va8rEqHKZJSpPvatUk8Xt6Km9U
         DP4a8iQVgUstx4tYPEl4a12Ojkj4BE+/Cra/rMQ1MNsQFBlOWirZuikfteDbnOIYIHNx
         8qFc2QGSjtNbTF3B2lLpE6I/CulkqIP3d0E3MirYh0T9isO5QQdHw0nU5W26EyZskD0w
         x/5w==
X-Forwarded-Encrypted: i=1; AFNElJ/cu/xc6JwO5as+KnIodaOjjyom7I+77i0W8LIxLutYPP3mlK54eVfmQD5TK0fvBhBKNFpv5u57pVncdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bDl3RgvaQeFOkPQmm7iqcA/ZPIRNlBJdNm4xP2z4PzxqEzps
	Jd4Fp7gFMwQIjZe0ACzk54vYga9nV3Thias01bU2GucSG0P7wAAbmF42
X-Gm-Gg: AeBDiesz+avQQ+3LCuHHS15eDBkOmH36btRqKQq/nAS7gHEL0UluCaN+1QadtAkzM61
	ZmarP498vdt5gWYGvsaL3rY54SpDKHbfHaOTSrbjgH/Ag8Uc3yNBBf9zlZlBPMUhQhJNiJwID3d
	79nEthdIqQrNPfoKwqbhVdogLCj/DNEKFNNk2IVazFHIB8sybV0zI/P9eK8ghP+C/yiSz/unCau
	FiI8Vr1UE1EazhwCSGy+7p16pzEjRdXgjCK2MsTHPe93kmYwAE3nYxop9ckVmxE2fiyAuIpixqc
	j2/i0M+qmzS2dWXQAxmN0grYY5Ny52RQGKLDxdTA6cPextZ1ig5iKtoveZrWQbztG3VKLV8MnNT
	AB1DjEvYMV4T6SUVxKE87aSBHDx0y1wOZY1okiHZtaogpra3X8BhLDcavJdFAj5/LdmS9Pm3buO
	NkBSF9TqYkHZcxdDBYbcgaOXM=
X-Received: by 2002:a05:600c:3208:b0:48a:75b9:b0bc with SMTP id 5b1f17b1804b1-48e51f46c07mr20345135e9.29.1778050151249;
        Tue, 05 May 2026 23:49:11 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:10 -0700 (PDT)
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
Subject: [PATCH v6 5/6] media: i2c: lm3560: Add support for PM features
Date: Wed,  6 May 2026 09:48:46 +0300
Message-ID: <20260506064847.37795-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506064847.37795-1-clamor95@gmail.com>
References: <20260506064847.37795-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: ED8BB4D6C81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-60522-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Added PM operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 609fd0339345..49030bc0f441 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -12,12 +12,15 @@
 #include <linux/bitmap.h>
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
@@ -48,6 +51,8 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
+ * @hwen_gpio: line connected to HWEN pin
+ * @vin_supply: line connected to IN supply (2.5V - 5.5V)
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
@@ -62,6 +67,9 @@ struct lm3560_flash {
 	struct regmap *regmap;
 	struct mutex lock;
 
+	struct gpio_desc *hwen_gpio;
+	struct regulator *vin_supply;
+
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
@@ -176,12 +184,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_active(flash->dev))
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
@@ -191,6 +204,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -200,6 +215,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_active(flash->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -245,6 +263,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -408,6 +428,38 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static int __maybe_unused lm3560_power_off(struct device *dev)
+{
+	struct lm3560_flash *flash = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return 0;
+}
+
+static int __maybe_unused lm3560_power_on(struct device *dev)
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
 static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
 {
 	int led_no;
@@ -440,6 +492,17 @@ static int lm3560_probe(struct i2c_client *client)
 
 	bitmap_zero(flash->led_id, LM3560_LED_MAX);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(flash->dev, "enable",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(flash->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
+	flash->vin_supply = devm_regulator_get(flash->dev, "vin");
+	if (IS_ERR(flash->vin_supply))
+		return dev_err_probe(flash->dev, PTR_ERR(flash->vin_supply),
+				     "failed to get vin-supply\n");
+
 	flash->peak = LM3560_PEAK_1600mA;
 	rval = device_property_read_u32(flash->dev,
 					"ti,peak-current-microamp", &peak_ua);
@@ -467,9 +530,19 @@ static int lm3560_probe(struct i2c_client *client)
 				 &flash->max_flash_timeout);
 	flash->max_flash_timeout /= 1000;
 
+	rval = regulator_enable(flash->vin_supply);
+	if (rval < 0)
+		return dev_err_probe(flash->dev, rval,
+				     "failed to enable vin power supply\n");
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 1);
+
 	rval = lm3560_init_device(flash);
 	if (rval < 0)
-		return rval;
+		goto error_disable;
+
+	pm_runtime_set_active(flash->dev);
+	pm_runtime_enable(flash->dev);
 
 	device_for_each_child_node_scoped(flash->dev, node) {
 		u32 reg;
@@ -490,10 +563,10 @@ static int lm3560_probe(struct i2c_client *client)
 
 			rval = lm3560_subdev_init(flash, reg, node);
 			if (rval < 0) {
-				lm3560_subdev_cleanup(flash);
-				return dev_err_probe(flash->dev, rval,
-						    "failed to register led%d\n",
-						    reg);
+				dev_err(flash->dev,
+					"failed to register led%d: %d\n",
+					reg, rval);
+				goto error_clean;
 			}
 
 			set_bit(reg, flash->led_id);
@@ -502,7 +575,23 @@ static int lm3560_probe(struct i2c_client *client)
 
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
+
+	lm3560_subdev_cleanup(flash);
+
+error_disable:
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
+	regulator_disable(flash->vin_supply);
+
+	return rval;
 }
 
 static void lm3560_remove(struct i2c_client *client)
@@ -510,8 +599,22 @@ static void lm3560_remove(struct i2c_client *client)
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
 
 	lm3560_subdev_cleanup(flash);
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev)) {
+		lm3560_power_off(&client->dev);
+		pm_runtime_set_suspended(&client->dev);
+	}
 }
 
+static const struct dev_pm_ops lm3560_pm_ops = {
+	SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
+};
+
 static const struct of_device_id lm3560_of_match[] = {
 	{ .compatible = "ti,lm3559" },
 	{ .compatible = "ti,lm3560" },
@@ -530,7 +633,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
 static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
-		   .pm = NULL,
+		   .pm = pm_ptr(&lm3560_pm_ops),
 		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
-- 
2.51.0


