Return-Path: <linux-media+bounces-59006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AB8xMuUd4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:47:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FD41AEBB
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32331307C888
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC353AE71D;
	Fri, 17 Apr 2026 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8zxzGTl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0913AF665
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426172; cv=none; b=b363DUThzinY2nFLPZBsyfl4q6DLwdUT9bE4pGPouNX8o7xObAE7qdIBeomGnPdUcazwrX310W861CUuejFxUazEd4xWa/ER10ZlmMyiZcpFi5zJr3W5VPYHCt/GwiigHog7xAuKDBrg1X0vAP4xoMzNX1WE94f2lQDpXyL1u2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426172; c=relaxed/simple;
	bh=VpCpaSO1ucraQ3B7/VvBud97a5nA6kkSmvpdAqJ6roQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7mE75vt5Q8uLLaTDAGFTIiGkxftPsKNM+87RhJAMb5/W4DCUNQrDOVUfewlmwlO+BHRm8Ys55yb3kx6i/vxx8lMD1atZ1aQazc81eXOdwoAym+oXABOKE8hqm3Stz3/bAYm55z3AL/qYXs7aZMk9BtOzSQagB/xAs0i3diCIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8zxzGTl; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso634428e87.3
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426169; x=1777030969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJb8co/czgyX/XI8FbsewLawUh1VhpEwCHFYYh7bdCk=;
        b=i8zxzGTlZc8N85l/9gh4eUnMKha+1REcPGKj9NO+ML0Wk8cwRilJmb01G8sJrjQ/Jh
         iO1ZWZzKMZYXb1KJiZcHQWwt8FqREC88McshsX4AtmuwyMUDePV3zdlPGFGyTZviruco
         N4l/piXDd720NOn9tt4xoLyXZcH8XAiOQGGQ/UCj1KOKHKcE4XvUF4ndTpBWX+fYm9q0
         Qe1D63u8+sfKb05jaQ2RqX5o3ez8dOSJDwzNc6oR6sM7/DgHHCsfxq6Mx6dYKn9s9wG7
         DaQLnizQ+lFaE3etYLAd159vdkGtCZoRLpKiosapOoaD/usVuY0nQfkI9sUuVO5LQvos
         Rm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426169; x=1777030969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJb8co/czgyX/XI8FbsewLawUh1VhpEwCHFYYh7bdCk=;
        b=lbimXv7tbKLQrWOwnLKfPClehwKHzwEGi3MB2p3YtGbAA4ytKuPDgtwFzf6qn2A3rl
         hp+guE/jy5U6/BGTMOYmjHVl8WFzVVx3rexiRzEehwfenWSsYjwpLIuTVCto6WGKtLTM
         4nvnQuuy5M55G2eeQxnoFTtDRIdcj9XrZ9i0BNwcNf5bBauPQ3btbcAQjRb2ArWnEXyI
         FoVDudlDaDFg45aCGncoY5skwV2NFUzvXuhu3M4QZaen+7ps9XMUoMmG0EFKOH4fPJ2M
         PHHVoLetUiam4kkL2ZlOnP3Y3SGFhK0YDBs56TMDiIGwr8ydh7TTOlGp1cn+MmIGuvsA
         D05A==
X-Forwarded-Encrypted: i=1; AFNElJ9iY1lM33mX6vLKc+lQeZhrtFX9tajTfn2seOMgbWmo61jMV83LYygE02oBkTL6YnN40RGTHZVCpl+sKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtsf72Xn5aajyvoot2XFZAbFonItt3PWbMomWWct4xyz2KO2MF
	8K+3/qTkplAnFzeDz/YSIEufg3CEq0lHwk0ICHt4Bqm7yBEOPNkx7Eke
X-Gm-Gg: AeBDiesAN9417/2L5YYKhfaJPmWYyurZhUEiyhZGvyZbnEob/I2+e1BzD6aNpMpWYWu
	i8N5Q2q+IlbMw2dD2Z9cw59TOxFBjGpAZP+MwC1yVS8e5bphevRWDVPrIZu+PliYjkMl11KkEUB
	68F/7wBZu7NEaVU4xU8FawO90sX00RWFQDceVjhzsGKw/pfzC/cdu1dd0T2U6ZnBB1dmIsOrmMy
	/U/+juhTPMmgPoQEc5zWH+IUfts/Ln6uLEZ0zgS9963mDqRR9gpkt/T6zCO9Xlf0VpnbydM4wXT
	tyt2i80ysILCKZBBf2UtF5vqgNukRoFU1ke6bTj0daEIvsTwb3cbXl2NxL/nS1WGsJ31gDeDZNs
	WoO7Qw62urKSg0Jlxk6jvo3USgT57OnzlL6hCr2MOYcO45FDgZvWyb8Z3scwpoJO5aK/nbPHaEE
	Ma9xkTpO4ZR0SqGdWtgbGfwlw=
X-Received: by 2002:a05:6512:a90:b0:5a4:d4:5c5e with SMTP id 2adb3069b0e04-5a4172dc775mr697994e87.22.1776426169121;
        Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
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
Subject: [PATCH v1 4/5] media: lm3560: convert to use OF bindings
Date: Fri, 17 Apr 2026 14:42:25 +0300
Message-ID: <20260417114226.100033-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59006-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 316FD41AEBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since there are no users of this driver via platform data, remove platform
data and switch to using device tree bindings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 118 +++++++++++++++++++++++++++----------
 include/media/i2c/lm3560.h |  15 -----
 2 files changed, 87 insertions(+), 46 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index bee1681a1603..dab2da87331d 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -14,7 +14,9 @@
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/videodev2.h>
@@ -45,17 +47,19 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @hwen_gpio: line connected to hwen pin
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @peak: peak current
+ * @max_flash_timeout: flash timeout
+ * @max_flash_brt: flash mode led brightness
+ * @max_torch_brt: torch mode led brightness
  */
 struct lm3560_flash {
 	struct device *dev;
-	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
 	struct gpio_desc *hwen_gpio;
 	struct mutex lock;
@@ -63,6 +67,12 @@ struct lm3560_flash {
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -283,8 +293,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -309,9 +319,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	/* flash strobe timeout */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_TIMEOUT,
 			  LM3560_FLASH_TOUT_MIN,
-			  flash->pdata->max_flash_timeout,
+			  flash->max_flash_timeout,
 			  LM3560_FLASH_TOUT_STEP,
-			  flash->pdata->max_flash_timeout);
+			  flash->max_flash_timeout);
 
 	/* flash brt */
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FLASH_INTENSITY,
@@ -351,15 +361,17 @@ static const struct regmap_config lm3560_regmap = {
 };
 
 static int lm3560_subdev_init(struct lm3560_flash *flash,
-			      enum lm3560_led_id led_no, char *led_name)
+			      enum lm3560_led_id led_no,
+			      struct fwnode_handle *fwnode)
 {
 	struct i2c_client *client = to_i2c_client(flash->dev);
 	int rval;
 
 	v4l2_i2c_subdev_init(&flash->subdev_led[led_no], client, &lm3560_ops);
 	flash->subdev_led[led_no].flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strscpy(flash->subdev_led[led_no].name, led_name,
-		sizeof(flash->subdev_led[led_no].name));
+	snprintf(flash->subdev_led[led_no].name,
+		 sizeof(flash->subdev_led[led_no].name),
+		 "lm3560-led%d", led_no);
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -367,6 +379,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].fwnode = fwnode;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0)
@@ -388,7 +401,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -401,10 +414,64 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static int lm3560_of_probe(struct lm3560_flash *flash)
+{
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
+
+	flash->peak = LM3560_PEAK_3600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 16000000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 23000000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 30000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 36000000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
+	device_property_read_u32(flash->dev, "ti,max-flash-timeout-ms",
+				 &flash->max_flash_timeout);
+
+	device_for_each_child_node(flash->dev, node) {
+		fwnode_property_read_u32(node, "reg", &reg);
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MAX;
+			fwnode_property_read_u32(node, "ti,max-flash-current-microamp",
+						 &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MAX;
+			fwnode_property_read_u32(node, "ti,max-torch-current-microamp",
+						 &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0)
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+		}
+	}
+
+	return 0;
+}
+
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
 	int rval;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
@@ -417,21 +484,6 @@ static int lm3560_probe(struct i2c_client *client)
 		return rval;
 	}
 
-	/* if there is no platform data, use chip default value */
-	if (pdata == NULL) {
-		pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
-		if (pdata == NULL)
-			return -ENODEV;
-		pdata->peak = LM3560_PEAK_3600mA;
-		pdata->max_flash_timeout = LM3560_FLASH_TOUT_MAX;
-		/* led 1 */
-		pdata->max_flash_brt[LM3560_LED0] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED0] = LM3560_TORCH_BRT_MAX;
-		/* led 2 */
-		pdata->max_flash_brt[LM3560_LED1] = LM3560_FLASH_BRT_MAX;
-		pdata->max_torch_brt[LM3560_LED1] = LM3560_TORCH_BRT_MAX;
-	}
-	flash->pdata = pdata;
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
@@ -446,11 +498,7 @@ static int lm3560_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, rval,
 				     "failed to enable regulator\n");
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
-	if (rval < 0)
-		return rval;
-
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	rval = lm3560_of_probe(flash);
 	if (rval < 0)
 		return rval;
 
@@ -477,6 +525,13 @@ static void lm3560_remove(struct i2c_client *client)
 	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
 }
 
+static const struct of_device_id lm3560_of_match[] = {
+	{ .compatible = "ti,lm3559" },
+	{ .compatible = "ti,lm3560" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm3560_of_match);
+
 static const struct i2c_device_id lm3560_id_table[] = {
 	{ LM3559_NAME },
 	{ LM3560_NAME },
@@ -489,6 +544,7 @@ static struct i2c_driver lm3560_i2c_driver = {
 	.driver = {
 		   .name = LM3560_NAME,
 		   .pm = NULL,
+		   .of_match_table = lm3560_of_match,
 		   },
 	.probe = lm3560_probe,
 	.remove = lm3560_remove,
diff --git a/include/media/i2c/lm3560.h b/include/media/i2c/lm3560.h
index 770d8c72c94a..b56c1ff8fd49 100644
--- a/include/media/i2c/lm3560.h
+++ b/include/media/i2c/lm3560.h
@@ -66,19 +66,4 @@ enum lm3560_peak_current {
 	LM3560_PEAK_3600mA = 0x60
 };
 
-/* struct lm3560_platform_data
- *
- * @peak :  peak current
- * @max_flash_timeout: flash timeout
- * @max_flash_brt: flash mode led brightness
- * @max_torch_brt: torch mode led brightness
- */
-struct lm3560_platform_data {
-	enum lm3560_peak_current peak;
-
-	u32 max_flash_timeout;
-	u32 max_flash_brt[LM3560_LED_MAX];
-	u32 max_torch_brt[LM3560_LED_MAX];
-};
-
 #endif /* __LM3560_H__ */
-- 
2.51.0


