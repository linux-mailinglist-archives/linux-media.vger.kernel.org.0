Return-Path: <linux-media+bounces-60202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFAdFyN892kpiQIAu9opvQ
	(envelope-from <linux-media+bounces-60202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:47:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5DD4B694E
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03ED4302D511
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 16:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56833CCFC0;
	Sun,  3 May 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZ2EBZ7E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A893373BF4
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 16:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826712; cv=none; b=DaVcbhdTQBBesmopsbMFcTQZ+28w8nd7+70hhzJQILmt+gziRO3vssBIFrcNV5eQRN97m5ttOlk9MkNFQMZ2QcOf84dIhywENv3fpQqwd7Rc3DrgF9TvHJl4m/fMml1XJJqMHvTBkWmfvThMtu6T81/J3DcRUmEeYXwk0hxXxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826712; c=relaxed/simple;
	bh=7Op9ubqBC6Ql1b7wKXH5NzggGBRcOSoMZ1O9wP90KmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUsIIqPgEgsIQVIlOWm+wT+QGn3z1jZ81UNIcY/rZ/qqo/DCQOHcttVF0K4rzCVVWAunl5iEeQx4+TC4Sb6/9RdH85IHwVEcc3xyqpYr3DNq9Cczlj0LP6+six/V14Bn3/aKFu5VARyy1Pmk6GkfhB+gecppjeXJaPJ8kNIZbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZ2EBZ7E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ba545100a13so612599466b.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826706; x=1778431506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOh4PG7yMJifApqzJycmTrJ4xR4vGrLLw/m7gNops7A=;
        b=qZ2EBZ7ENRshJPbMVu6KZ1CweDgNubT8ktNbsN5I6mcwXaXTji5x9AZtuTq6ZI4kap
         KLHFRzCaioz1DbweFDIPu6TAXvBAeX0NLE65KE78x9DMYZDED66YmgZ0m39bqwhAlLJJ
         S2tIwSMx4Ib12DBp1rKl/0cC6YLVnyJQ1Fr4TbLjXmpnYT9Oc9gtQun6DEDP0RggQ7iu
         11LOhQBp9x8fDPJui2S6KJ9asdHacY56UD3JzQHJstxLJfI+DP1h2gJa9Ya3dU0aLvNQ
         A6CCIx33Y31CEAAWJ5yYSXAcfInzbWQJl76P5JpehdxoMYwtjXrXOmoN1Z2QDOoMlZWW
         Uk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826706; x=1778431506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOh4PG7yMJifApqzJycmTrJ4xR4vGrLLw/m7gNops7A=;
        b=DDiooDRjmiRmjPfmDib1Mt2uQunSHRy8o6HyAGQqIvFQr4Tjllx+Fog2VDrnB3KOT0
         aw/1pC/jnwleauPUS1W1m/ump0V3I2IsjysKaXlaLX6ZmgQXsVcPhXOhyJh+SbqtGg51
         2jMusszYP3zr5/bj5mI1M++XNsnyd3qJgAGrcauRM2yRwbiJkv1auUfdSITN1FSQQPHk
         ocIywvKQ9hd9Wej9nQaxyKIGZ5zcwG9nUyPwDcSMZYP84CVYi2+rsToFaT2QUHxlmHFr
         xkJkjbXZN9wGf6GGVzIY0eXO4E02fbIKAYSwPP3nInO1vAhUQBc5cNNdMjPOqVn5ZbTE
         te7g==
X-Forwarded-Encrypted: i=1; AFNElJ8petHJdDACPK2bzUaIwDSywfj91f0UVoopozKn5mAu4OIOITHLFssbvgndMhJ283RCK0FTfiPqM/Yamw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzKphGkjNL2rjv9bSl0ist/A1ssCzOre9Rrr3Glf73T9RY4YnL
	4s9P6xN/OFRInoeTtfgacMiLYQqvXCm7rjO7OiOHcpXJvRqK0H44OT3M
X-Gm-Gg: AeBDieu5WUb/hiCzkVQRXsgfM350FVDUJEd3cZu2NccoHuGs5r2+HthERpi7y4ycK9d
	e9+fIT94x+bRAC9Kk0UypbbKFMMmTD6Y7iQ976kdE66s6xiPQTtNxPawGjPmQq/CDf5zUdN0yq0
	Jt2SFm8wJZT6jeqR/Lf2uf4ag9oK16nGUrF12ExTURCMkNet70rT+DiU8qNigiUo1Rux1f0aH76
	1A1zPbolt2Zn5OyY1kFPnU7Yg12eNXI1uoCrjOCr0SuRK7eukoSFV+Eo855rg7nMK1tMZ+cdAnX
	7hzM4M8slVSX/1Q1mDcXEqUmko6DhwwtpwPoCMvYme+MPvWlAl5K0uKbbUla0HUjZWt8AJddmcW
	1+BTAu/2OKbE+B3eJ1COI2SxNH65oU7NoMLXJsdKjeycRY0n2y8ee52CbJO1lcqongwbWCfTgZG
	KA8FaR/Hb6JPkb9CcdOZS3HVl0tstI9EdJrA==
X-Received: by 2002:a17:907:805:b0:bc1:6ec9:453b with SMTP id a640c23a62f3a-bc16ec95285mr139456566b.42.1777826705359;
        Sun, 03 May 2026 09:45:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:45:04 -0700 (PDT)
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
Subject: [PATCH v5 6/6] media: i2c: lm3560: Add proper support for LM3559
Date: Sun,  3 May 2026 19:44:45 +0300
Message-ID: <20260503164445.215540-7-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: DE5DD4B694E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60202-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]

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
index 15741ea5684f..da12fbd7dc59 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -23,9 +23,9 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
-#include <media/i2c/lm3560.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
 
 /* registers definitions */
 #define REG_ENABLE		0x10
@@ -40,12 +40,44 @@
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
@@ -62,6 +94,7 @@ enum led_enable {
  * @max_flash_timeout: flash timeout
  * @max_flash_brt: flash mode led brightness
  * @max_torch_brt: torch mode led brightness
+ * @config: device specific current configuration
  */
 struct lm3560_flash {
 	struct device *dev;
@@ -82,6 +115,8 @@ struct lm3560_flash {
 
 	u32 max_flash_brt[LM3560_LED_MAX];
 	u32 max_torch_brt[LM3560_LED_MAX];
+
+	const struct lm3560_flash_config *config;
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -137,15 +172,20 @@ static int lm3560_enable_ctrl(struct lm3560_flash *flash,
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
@@ -160,15 +200,20 @@ static int lm3560_torch_brt_ctrl(struct lm3560_flash *flash,
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
@@ -308,6 +353,7 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
+	const struct lm3560_flash_config *config = flash->config;
 
 	v4l2_ctrl_handler_init(hdl, 8);
 
@@ -336,13 +382,13 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 
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
@@ -483,6 +529,10 @@ static int lm3560_probe(struct i2c_client *client)
 	if (flash == NULL)
 		return -ENOMEM;
 
+	flash->config = device_get_match_data(&client->dev);
+	if (!flash->config)
+		return -ENODEV;
+
 	flash->regmap = devm_regmap_init_i2c(client, &lm3560_regmap);
 	if (IS_ERR(flash->regmap)) {
 		rval = PTR_ERR(flash->regmap);
@@ -509,16 +559,26 @@ static int lm3560_probe(struct i2c_client *client)
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
@@ -547,6 +607,7 @@ static int lm3560_probe(struct i2c_client *client)
 	pm_runtime_enable(flash->dev);
 
 	for_each_available_child_of_node(dev_of_node(flash->dev), node) {
+		const struct lm3560_flash_config *config = flash->config;
 		u32 reg;
 
 		rval = of_property_read_u32(node, "reg", &reg);
@@ -555,11 +616,11 @@ static int lm3560_probe(struct i2c_client *client)
 			continue;
 
 		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
-			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			flash->max_flash_brt[reg] = config->flash_brt_min_ua;
 			of_property_read_u32(node, "flash-max-microamp",
 					     &flash->max_flash_brt[reg]);
 
-			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			flash->max_torch_brt[reg] = config->torch_brt_min_ua;
 			of_property_read_u32(node, "led-max-microamp",
 					     &flash->max_torch_brt[reg]);
 
@@ -617,24 +678,43 @@ static const struct dev_pm_ops lm3560_pm_ops = {
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


