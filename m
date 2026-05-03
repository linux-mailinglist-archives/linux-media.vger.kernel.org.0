Return-Path: <linux-media+bounces-60204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kB1BDL9792kpiQIAu9opvQ
	(envelope-from <linux-media+bounces-60204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:45:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7134B68ED
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF0973005AF4
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 16:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704C835E923;
	Sun,  3 May 2026 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElGr9luZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB837CD22
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826713; cv=none; b=VITPZrF8jc4xs/0bCaY2Vn6y8WdTICcjnYu0G4eK0Llhnggbp74luZBmGqinRQE0iMOGZMX2Z86whoX80G+/Zg/KvnAGFmdCm34irWfdKaLc/TvqG9ybAGtz1Wg/CUohokFMwhhmkISa0a2l0oVXxGpj8/KJ6coxXVitg5yHNqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826713; c=relaxed/simple;
	bh=PXMbL35meuA3K4hWiUmh26Ifh+2vO6KRGqztajociNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEbi6QU77SAyMTF67p7Hrssod6Sx6Ipil9Iu3wqSvf3EXbGvyEkRDHdXycdJlvlt3PUh3IXE8hWE0eXKuUAzXrXDcpcBe7oNCAyNw78ht+9B+VonsKkwksmkPbu074NQtF81s2e9xkotQYOOTvT0+oMnEXOQnJ6+wDgJkgqsghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElGr9luZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so6572709a12.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826704; x=1778431504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRXkstlVfDTEdoKTn7b1ddY7nla/Jav5UO7h+m11Go8=;
        b=ElGr9luZA0OJ5FVLJTAGW7vaysrroq6JUTWHJLSizlBnhGbc+KWWvi1LFYVgv1AbxC
         GC5ML+UZupBN8CSarMuTOKFW9XdjvMlMPq8AtURO7u4Luom1dfkHPTv9b8JKyAnIkSR6
         3Yp5N3D90g885uJONZgupf4ShUTvdM53Nn1tGyw+Hpxhs4816bjfxinnDT8yLE+Z6cz3
         GWtBpYaRuXtrjzYB9jankuJm8MEeoEWeWpyLWx3sy/3bxXiRtL2cIpQNvvL2MCqS+78a
         37M8tELMGYjqdbWIp7KpB8/KAGe3Ll+RcB0U5rOzIls2SCgN7ub27OKvMZYEGgzkzNvb
         nHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826704; x=1778431504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRXkstlVfDTEdoKTn7b1ddY7nla/Jav5UO7h+m11Go8=;
        b=nIpssvYFNn9CJZb7D3wwVrfmoXujp3AnRjTumvI+7XeOOdAE94AVqZKaS0XjEA/y81
         p//F0VlRuKkFB21B+VDCvu0owdY3+HIEcFoIkWZaniUwDYtH/iMTUeectLcP8rTyGvuZ
         JqwXSpzOf/ZjlwflurIr4UnvBtaIzrPg8hqlplnmhSpyhgzd+bclwTu1szKivVRI3Fk7
         ldMAkibr0/cRDMIKtSIywq3wxMdRh02QtHsS8yn0kOlvoQscGVSEDQe51Rfr777pJsCu
         BagUUG3LzGXVtvv2FW3s3NCyYMpokH25z0YO8sPCEnb6zOmkbAwvDW4oQAMwlDhK+/Cq
         /8uA==
X-Forwarded-Encrypted: i=1; AFNElJ9HHUey1sIsSeZtvkQDAxm+M/LnInhQkJiEJDqeUFYc8G0O7ctf5SpyE4jLzOYOwrSE/Urq7JT5jaQMzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj/bUwwaUyY3tT7b/Jp004S7olu/i55gXUl0oR3ig0Us83FjeZ
	9d3aOBwVQObs5/PI1tECrvf2rxA19H5oFptKEJcQRNUG0XqDpo01v1md943uXQ==
X-Gm-Gg: AeBDietfz7auMXyyPAoLDQchWMAZu0ebTxms8HbZCUku+ZQsGSmKFH4iz/hJ5tOdLYD
	rhbdbI0lnMNgCz+9qbGcFBS3mY7EZcuqsRqLuJ+HxtyxIKCGILBxARyZ2zrUSGAzzlNYq754Bl0
	GO69r6XO7YBy4eJwGimi5AeubwJI/xZV47o2Xr0Ljfzs6r8D0vwRhylREhug1J6FgEME5+15c8r
	k4TuYY6gCpbfYPHZ5UAexisbK0krvHevFbCnNaj8M0p3xbm+/uGnVSAAsmaQ4zfapTqQCoYCaDB
	UljmAKbyqrJwvyfjPHng025BFiyeFU03C2V1EV0NwuRT4Rmmc+9pJVRe8/VrBeSY90TBMHlNv7S
	trDachx9RKKOszmRjBmRNN8eg19HopXunQ0APSOKvOR/ELK+YLshT43iAphz3TBaOEdlNjHKdXN
	BTUT7Mx1go4J0SeEioLja4a1c=
X-Received: by 2002:a17:907:930d:b0:bad:52bd:8764 with SMTP id a640c23a62f3a-bbffcf919b4mr313501666b.24.1777826704242;
        Sun, 03 May 2026 09:45:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:45:03 -0700 (PDT)
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
Subject: [PATCH v5 5/6] media: i2c: lm3560: Add support for PM features
Date: Sun,  3 May 2026 19:44:44 +0300
Message-ID: <20260503164445.215540-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260503164445.215540-1-clamor95@gmail.com>
References: <20260503164445.215540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD7134B68ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60204-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add support for power management features to better control the LM3560
within the media framework. To achieve the desired PM support, the HWEN
GPIO and VIN power supply were added and configured into power on/off
sequences. Added PM operations along with the PM configuration setup.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 117 ++++++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index ce4b09d1f208..15741ea5684f 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -12,13 +12,16 @@
 #include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
@@ -49,6 +52,8 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
+ * @hwen_gpio: line connected to HWEN pin
+ * @vin_supply: line connected to IN supply (2.5V - 5.5V)
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
@@ -63,6 +68,9 @@ struct lm3560_flash {
 	struct regmap *regmap;
 	struct mutex lock;
 
+	struct gpio_desc *hwen_gpio;
+	struct regulator *vin_supply;
+
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
@@ -177,12 +185,17 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
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
@@ -192,6 +205,8 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -201,6 +216,9 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
+	if (!pm_runtime_get_if_in_use(flash->dev))
+		return 0;
+
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -246,6 +264,8 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
+	pm_runtime_put(flash->dev);
+
 	return rval;
 }
 
@@ -409,6 +429,38 @@ static int lm3560_init_device(struct lm3560_flash *flash)
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
@@ -442,6 +494,17 @@ static int lm3560_probe(struct i2c_client *client)
 
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
@@ -469,9 +532,19 @@ static int lm3560_probe(struct i2c_client *client)
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
 
 	for_each_available_child_of_node(dev_of_node(flash->dev), node) {
 		u32 reg;
@@ -492,10 +565,10 @@ static int lm3560_probe(struct i2c_client *client)
 
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
@@ -504,7 +577,23 @@ static int lm3560_probe(struct i2c_client *client)
 
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
@@ -512,8 +601,22 @@ static void lm3560_remove(struct i2c_client *client)
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
@@ -532,7 +635,7 @@ MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
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


