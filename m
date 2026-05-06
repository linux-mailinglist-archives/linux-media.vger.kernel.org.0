Return-Path: <linux-media+bounces-60523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PUGKS/l+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:52:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4E4D6D4D
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 39D90307135F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A7336F439;
	Wed,  6 May 2026 06:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsA95KII"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEDA36E494
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050156; cv=none; b=aVsHj3ZIKPk68Q38F13OprQBzsMf7Vdhhur4rCG6FxmdBKzIMujJ3iiASX2v/G27AUJDqBShgX3KWJfAqriAesA1o2oCbg9ji9s1Ttaiu86E2e5OhCLmMf3ZvQaQzTBC6KNe9yUm4cp4irVHkqdyZlZo5PxWiBcN/96067TS2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050156; c=relaxed/simple;
	bh=TMThTQo3yIw9ubNee6V0unpg1zKvURsJh6wm0IbVOkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fk7i4fhurkudT4SKOdzlw0auo0yCe4I5aqC6oKOBUdqqfEfvXXDwI10E1cU5SSqDTJCTHfkb5VUsEWchZVXnMTAMEnCg8YauNhJz2rCKPrb0q84YCDs8IIQpK4Lw0vt8WI4x9n5jy31rloyFgCIRKp3a6V5VqlDizArSJMIZN3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsA95KII; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891f625344so5689715e9.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050153; x=1778654953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTtL2NS35lfymU/+dj8+RyAAWq/AZ/bJ0227rifTUmU=;
        b=gsA95KIIHSc8m2uGbDyY14AXERZApu0JPQ3DWTYFJyvi6k6Bs3X8RmmHu94D+afHzG
         mJ/GL4gMxQr6xCtvyhc8wopJ65y46AcsVnrvTHsCCdQ7pB+JwLvMBVP+p+zcosSZE4Y2
         LdDI8/oU3wrM3nUPpVALjxww54Sct3pqb/AfgtGqvX2Vdt01Ixcy1yA8cxJB7pl3pFKf
         tqhd66H9Xwxp/CORiqXfjZFZD1JjmbtMzjeiC1qvZxw3WXx8/+vpugn2eDL5ylrSPD1S
         AlaIOo+8Y6RKouOxkfrDwC+CC6SuHZ6cZbnILSz0MoGTVq6lkYONfI/FrLIu45X7K6wf
         7Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050153; x=1778654953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTtL2NS35lfymU/+dj8+RyAAWq/AZ/bJ0227rifTUmU=;
        b=kwdXaCsrRGnp7r21AhA3OuzP0kN1bylY7QCssqCvXDDn2x3l5yJfQFs9D+d+2w8McO
         VqBQoggkttFkTegqL8mDXTz7hCtP/YBToM5O9IZbaLkRzb8DrDQ4u97ovdxiTrT1+lHa
         fXsw8WbRAvDR8RqKhFowqrVUumwuV61VEoN8EOcaRRZcFJMI9V4faHtzVDrEi1xCHnX+
         k2dYbTR7arDNNh0ivEYIWnh/9bcaLxau6QhAD3hvZcTHRJGxQxVE8w0mwaQH1O7+XwOY
         HN/1vL2tyXgtos89vYW0983vA9j1k9wrfboG/0WCY4jOU+X+2mT8J1C+VyUk40cOzikA
         ZFxA==
X-Forwarded-Encrypted: i=1; AFNElJ/uU8ol8Lcf20s6u1AMaNvkpX1+yM+v/Rw5hhqRMbpSpSrzO3teSqKtlnhcIYdYFPPqseXSw+bDQP+/VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSEDm4QGbMvuKcw3lmB2zH7DfkU1pJbCrnzOb75xvTqHsB4Re
	DCHMf3IPfs7w4Z721geji8yrA9AWp3To1w9libhdagX5a/7+jKFjBiAZ
X-Gm-Gg: AeBDiev2B1PMncByn7lYq1ucq/NJWJMTr78iNIFW/ZeyCYwxin6V0813YbOTXZkhBYN
	22hMHdITAQQTQSppRsiPv7j/PYDJliGVGIBCrJHpcc6+pP9brY9iOYxd07uqJRwsN15Kap5Cijy
	ptHlyL2GdiwuFqleI7NdfKVaKaKcgVTEWFjYS8X5veOdrQhcvExzFQRuCb+g9xWcm2N4j+Z1K5e
	VbKYGjuukpwE6Bjv9yUs4Vu6PmxTmH1zj4lUt/afIPB2XyG37/Z0sXnCmXl9dp4aUxmpsLmVm/v
	30EtGkfvjac1jkFSiZzN/0pM8ioJqf/tL76WsY9ak5k+PdQCEncmP5Bzu9Ti4YMS3pHIaVf3gs/
	kywrkpNe8Ml6U/yaDbPJKrD58A9h7brmwEm2frjCBww9aK3VwnL9Qo++ne7zI4MNx+bdKH4ZdlO
	wxGzZ0Pqs0E4et1RYWaoVBdME=
X-Received: by 2002:a05:600c:c11c:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5226c4f0mr20936315e9.2.1778050152566;
        Tue, 05 May 2026 23:49:12 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:12 -0700 (PDT)
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
Subject: [PATCH v6 6/6] media: i2c: lm3560: Add proper support for LM3559
Date: Wed,  6 May 2026 09:48:47 +0300
Message-ID: <20260506064847.37795-7-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 39C4E4D6D4D
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
	TAGGED_FROM(0.00)[bounces-60523-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email]

The LM3559 is very similar to the LM3560, but it operates at much lower
currents. This may result in incorrect current selection if LM3560 ranges
are applied to the LM3559. Implement driver data matching to use
device-specific current configurations.

Since the driver no longer supports platform data and device configuration
is performed more granularly, move the remaining enums from the header
into the driver file and remove the header.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 120 ++++++++++++++++++++++++++++++-------
 include/media/i2c/lm3560.h |  69 ---------------------
 2 files changed, 100 insertions(+), 89 deletions(-)
 delete mode 100644 include/media/i2c/lm3560.h

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 49030bc0f441..46d316a26e50 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -22,9 +22,9 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
-#include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
 
 /* registers definitions */
 #define REG_ENABLE		0x10
@@ -39,12 +39,44 @@
 #define FAULT_OVERTEMP	(1<<1)
 #define FAULT_SHORT_CIRCUIT	(1<<2)
 
+#define LM3560_FLASH_TOUT_MIN			32
+#define LM3560_FLASH_TOUT_STEP			32
+#define LM3560_FLASH_TOUT_MAX			1024
+#define LM3560_FLASH_TOUT_ms_TO_REG(a)		\
+	((a) < LM3560_FLASH_TOUT_MIN ? 0 :	\
+	 (((a) - LM3560_FLASH_TOUT_MIN) / LM3560_FLASH_TOUT_STEP))
+#define LM3560_FLASH_TOUT_REG_TO_ms(a)		\
+	((a) * LM3560_FLASH_TOUT_STEP + LM3560_FLASH_TOUT_MIN)
+
+enum lm3560_led_id {
+	LM3560_LED0 = 0,
+	LM3560_LED1,
+	LM3560_LED_MAX
+};
+
+enum lm3560_peak_current {
+	LM3560_PEAK_1600mA = 0x00,
+	LM3560_PEAK_2300mA = 0x20,
+	LM3560_PEAK_3000mA = 0x40,
+	LM3560_PEAK_3600mA = 0x60
+};
+
 enum led_enable {
 	MODE_SHDN = 0x0,
 	MODE_TORCH = 0x2,
 	MODE_FLASH = 0x3,
 };
 
+struct lm3560_flash_config {
+	u32 flash_brt_min_ua;
+	u32 flash_brt_max_ua;
+	u32 flash_brt_step_ua;
+
+	u32 torch_brt_min_ua;
+	u32 torch_brt_max_ua;
+	u32 torch_brt_step_ua;
+};
+
 /**
  * struct lm3560_flash
  *
@@ -61,6 +93,7 @@ enum led_enable {
  * @max_flash_timeout: flash timeout
  * @max_flash_brt: flash mode led brightness
  * @max_torch_brt: torch mode led brightness
+ * @config: device specific current configuration
  */
 struct lm3560_flash {
 	struct device *dev;
@@ -81,6 +114,8 @@ struct lm3560_flash {
 
 	u32 max_flash_brt[LM3560_LED_MAX];
 	u32 max_torch_brt[LM3560_LED_MAX];
+
+	const struct lm3560_flash_config *config;
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -136,15 +171,20 @@ static int lm3560_enable_ctrl(struct lm3560_flash *flash,
 static int lm3560_torch_brt_ctrl(struct lm3560_flash *flash,
 				 enum lm3560_led_id led_no, unsigned int brt)
 {
+	const struct lm3560_flash_config *config = flash->config;
 	int rval;
-	u8 br_bits;
+	u32 br_bits;
 
-	if (brt < LM3560_TORCH_BRT_MIN)
+	if (brt < config->torch_brt_min_ua)
 		return lm3560_enable_ctrl(flash, led_no, false);
 	else
 		rval = lm3560_enable_ctrl(flash, led_no, true);
 
-	br_bits = LM3560_TORCH_BRT_uA_TO_REG(brt);
+	br_bits = clamp(brt, config->torch_brt_min_ua,
+			config->torch_brt_max_ua);
+	br_bits = (br_bits - config->torch_brt_min_ua) /
+		  config->torch_brt_step_ua;
+
 	if (led_no == LM3560_LED0)
 		rval = regmap_update_bits(flash->regmap,
 					  REG_TORCH_BR, 0x07, br_bits);
@@ -159,15 +199,20 @@ static int lm3560_torch_brt_ctrl(struct lm3560_flash *flash,
 static int lm3560_flash_brt_ctrl(struct lm3560_flash *flash,
 				 enum lm3560_led_id led_no, unsigned int brt)
 {
+	const struct lm3560_flash_config *config = flash->config;
 	int rval;
-	u8 br_bits;
+	u32 br_bits;
 
-	if (brt < LM3560_FLASH_BRT_MIN)
+	if (brt < config->flash_brt_min_ua)
 		return lm3560_enable_ctrl(flash, led_no, false);
 	else
 		rval = lm3560_enable_ctrl(flash, led_no, true);
 
-	br_bits = LM3560_FLASH_BRT_uA_TO_REG(brt);
+	br_bits = clamp(brt, config->flash_brt_min_ua,
+			config->flash_brt_max_ua);
+	br_bits = (br_bits - config->flash_brt_min_ua) /
+		  config->flash_brt_step_ua;
+
 	if (led_no == LM3560_LED0)
 		rval = regmap_update_bits(flash->regmap,
 					  REG_FLASH_BR, 0x0f, br_bits);
@@ -307,6 +352,7 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
+	const struct lm3560_flash_config *config = flash->config;
 
 	v4l2_ctrl_handler_init(hdl, 8);
 
@@ -335,13 +381,13 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 
 	/* flash brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
-			  LM3560_FLASH_BRT_MIN, max_flash_brt,
-			  LM3560_FLASH_BRT_STEP, max_flash_brt);
+			  config->flash_brt_min_ua, max_flash_brt,
+			  config->flash_brt_step_ua, max_flash_brt);
 
 	/* torch brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TORCH_INTENSITY,
-			  LM3560_TORCH_BRT_MIN, max_torch_brt,
-			  LM3560_TORCH_BRT_STEP, max_torch_brt);
+			  config->torch_brt_min_ua, max_torch_brt,
+			  config->torch_brt_step_ua, max_torch_brt);
 
 	/* fault */
 	fault = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_FAULT, 0,
@@ -481,6 +527,10 @@ static int lm3560_probe(struct i2c_client *client)
 	if (flash == NULL)
 		return -ENOMEM;
 
+	flash->config = device_get_match_data(&client->dev);
+	if (!flash->config)
+		return -ENODEV;
+
 	flash->regmap = devm_regmap_init_i2c(client, &lm3560_regmap);
 	if (IS_ERR(flash->regmap)) {
 		rval = PTR_ERR(flash->regmap);
@@ -507,16 +557,26 @@ static int lm3560_probe(struct i2c_client *client)
 	rval = device_property_read_u32(flash->dev,
 					"ti,peak-current-microamp", &peak_ua);
 	if (!rval) {
+		/*
+		 * LM3559 has lower peak current limit, but
+		 * bit configuration matches LM3560.
+		 * Correct current restrictions are enforced
+		 * by the LM3560 schema.
+		 */
 		switch (peak_ua) {
+		case 1400000:
 		case 1600000:
 			flash->peak = LM3560_PEAK_1600mA;
 			break;
+		case 2100000:
 		case 2300000:
 			flash->peak = LM3560_PEAK_2300mA;
 			break;
+		case 2700000:
 		case 3000000:
 			flash->peak = LM3560_PEAK_3000mA;
 			break;
+		case 3200000:
 		case 3600000:
 			flash->peak = LM3560_PEAK_3600mA;
 			break;
@@ -545,6 +605,7 @@ static int lm3560_probe(struct i2c_client *client)
 	pm_runtime_enable(flash->dev);
 
 	device_for_each_child_node_scoped(flash->dev, node) {
+		const struct lm3560_flash_config *config = flash->config;
 		u32 reg;
 
 		rval = fwnode_property_read_u32(node, "reg", &reg);
@@ -553,11 +614,11 @@ static int lm3560_probe(struct i2c_client *client)
 			continue;
 
 		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
-			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			flash->max_flash_brt[reg] = config->flash_brt_min_ua;
 			fwnode_property_read_u32(node, "flash-max-microamp",
 						 &flash->max_flash_brt[reg]);
 
-			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			flash->max_torch_brt[reg] = config->torch_brt_min_ua;
 			fwnode_property_read_u32(node, "led-max-microamp",
 						 &flash->max_torch_brt[reg]);
 
@@ -615,24 +676,43 @@ static const struct dev_pm_ops lm3560_pm_ops = {
 	SET_RUNTIME_PM_OPS(lm3560_power_off, lm3560_power_on, NULL)
 };
 
+static const struct lm3560_flash_config lm3559_config = {
+	.flash_brt_min_ua = 56250,
+	.flash_brt_max_ua = 900000,
+	.flash_brt_step_ua = 56250,
+
+	.torch_brt_min_ua = 28125,
+	.torch_brt_max_ua = 225000,
+	.torch_brt_step_ua = 28125,
+};
+
+static const struct lm3560_flash_config lm3560_config = {
+	.flash_brt_min_ua = 62500,
+	.flash_brt_max_ua = 1000000,
+	.flash_brt_step_ua = 62500,
+
+	.torch_brt_min_ua = 31250,
+	.torch_brt_max_ua = 250000,
+	.torch_brt_step_ua = 31250,
+};
+
 static const struct of_device_id lm3560_of_match[] = {
-	{ .compatible = "ti,lm3559" },
-	{ .compatible = "ti,lm3560" },
+	{ .compatible = "ti,lm3559", .data = &lm3559_config },
+	{ .compatible = "ti,lm3560", .data = &lm3560_config },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lm3560_of_match);
 
 static const struct i2c_device_id lm3560_id_table[] = {
-	{ LM3559_NAME },
-	{ LM3560_NAME },
-	{}
+	{ "lm3559", (kernel_ulong_t)&lm3559_config },
+	{ "lm3560", (kernel_ulong_t)&lm3560_config },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(i2c, lm3560_id_table);
 
 static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
-		   .name = LM3560_NAME,
+		   .name = "lm3560",
 		   .pm = pm_ptr(&lm3560_pm_ops),
 		   .of_match_table = lm3560_of_match,
 		   },
diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
deleted file mode 100644
index b56c1ff8fd49..000000000000
--- a/include/media/i2c/lm3560.h
+++ /dev/null
@@ -1,69 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * include/media/i2c/lm3560.h
- *
- * Copyright (C) 2013 Texas Instruments
- *
- * Contact: Daniel Jeong <gshark.jeong@gmail.com>
- *			Ldd-Mlp <ldd-mlp@list.ti.com>
- */
-
-#ifndef __LM3560_H__
-#define __LM3560_H__
-
-#include <media/v4l2-subdev.h>
-
-#define LM3559_NAME	"lm3559"
-#define LM3560_NAME	"lm3560"
-#define LM3560_I2C_ADDR	(0x53)
-
-/*  FLASH Brightness
- *	min 62500uA, step 62500uA, max 1000000uA
- */
-#define LM3560_FLASH_BRT_MIN 62500
-#define LM3560_FLASH_BRT_STEP 62500
-#define LM3560_FLASH_BRT_MAX 1000000
-#define LM3560_FLASH_BRT_uA_TO_REG(a)	\
-	((a) < LM3560_FLASH_BRT_MIN ? 0 :	\
-	 (((a) - LM3560_FLASH_BRT_MIN) / LM3560_FLASH_BRT_STEP))
-#define LM3560_FLASH_BRT_REG_TO_uA(a)		\
-	((a) * LM3560_FLASH_BRT_STEP + LM3560_FLASH_BRT_MIN)
-
-/*  FLASH TIMEOUT DURATION
- *	min 32ms, step 32ms, max 1024ms
- */
-#define LM3560_FLASH_TOUT_MIN 32
-#define LM3560_FLASH_TOUT_STEP 32
-#define LM3560_FLASH_TOUT_MAX 1024
-#define LM3560_FLASH_TOUT_ms_TO_REG(a)	\
-	((a) < LM3560_FLASH_TOUT_MIN ? 0 :	\
-	 (((a) - LM3560_FLASH_TOUT_MIN) / LM3560_FLASH_TOUT_STEP))
-#define LM3560_FLASH_TOUT_REG_TO_ms(a)		\
-	((a) * LM3560_FLASH_TOUT_STEP + LM3560_FLASH_TOUT_MIN)
-
-/*  TORCH BRT
- *	min 31250uA, step 31250uA, max 250000uA
- */
-#define LM3560_TORCH_BRT_MIN 31250
-#define LM3560_TORCH_BRT_STEP 31250
-#define LM3560_TORCH_BRT_MAX 250000
-#define LM3560_TORCH_BRT_uA_TO_REG(a)	\
-	((a) < LM3560_TORCH_BRT_MIN ? 0 :	\
-	 (((a) - LM3560_TORCH_BRT_MIN) / LM3560_TORCH_BRT_STEP))
-#define LM3560_TORCH_BRT_REG_TO_uA(a)		\
-	((a) * LM3560_TORCH_BRT_STEP + LM3560_TORCH_BRT_MIN)
-
-enum lm3560_led_id {
-	LM3560_LED0 = 0,
-	LM3560_LED1,
-	LM3560_LED_MAX
-};
-
-enum lm3560_peak_current {
-	LM3560_PEAK_1600mA = 0x00,
-	LM3560_PEAK_2300mA = 0x20,
-	LM3560_PEAK_3000mA = 0x40,
-	LM3560_PEAK_3600mA = 0x60
-};
-
-#endif /* __LM3560_H__ */
-- 
2.51.0


