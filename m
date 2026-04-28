Return-Path: <linux-media+bounces-59837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EmjCEag8GkRWQEAu9opvQ
	(envelope-from <linux-media+bounces-59837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:55:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 94550484565
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 660FE3153152
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B9B3B4E9C;
	Tue, 28 Apr 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gpesw2fz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421523B3888
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376392; cv=none; b=Gpq98T5gySQylpSm9Y1pSz3DN0a3ZSQUzQSMi8GMV63zrTVEcxZOxIxP414w7CUmje+K8gy97VVEbwKPsj2BUZHxSUch8X8/uDiU5QYOkajZlLjleK14L69V00yaRtP5ENP7t6O8k7Z08AonA35QHzY0nBeFHw1BDXrY6ODoZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376392; c=relaxed/simple;
	bh=if5fzn6EiYAdYQ0JVkfWJ2iUwqyjky8GCm3SoGv3Ckg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW1Sz4YYa754papr6R5dmx+tc6lcJSeuNWnq8Pn8Xmr+MrAReVQ/a+e34viPQT0YyXDQtT34bHS8Sph4D/eoD940A5YLT91vs0ye279pyjvr/ofi6O8/4VNY2yF6mjtuxBtDKw/wrIA2m07GZeyB4LQ7fhGyxZTDNTarYz3/Iaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gpesw2fz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so81535635e9.3
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376386; x=1777981186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1tztVTuc1e4/H1fOczCbpXpJF5rF4H8B95UHFGdg+4=;
        b=Gpesw2fzFTKz3Pv8OOpjrTU6vMEMZxzdC62fZuAlAc9+DzxFwLt9EPwtoNR1noA+qj
         ZB8pfS5t/itOop1S15LBigamXHxTgpP+3ciiC6AZXIQ7g4g5D96Jn0n8qLTEih8Iroud
         f4jUkcTDGr5uPw1QBQRZcgOjT9VgfAneFLOcmbsQrJI4vnyPtse4qtLeuxeXQxQVl9Aa
         ENchRSgd+Qfyys+gElBGGpPbASYJaTgd1C2GqorM+NwUVLyCeoYCY4W2h4SzbPYWPyl9
         lyDEm3i7pakwl3ukdAc4BNweUfKoszccRSANmL8ObQXzz+eELFn8HVWZ2pR4YtsXMdMD
         Qv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376386; x=1777981186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1tztVTuc1e4/H1fOczCbpXpJF5rF4H8B95UHFGdg+4=;
        b=CflqktltgqtiuzJTeLM5UYduvuG1+/fqXttEy/r3CoHKpB4S9LYebD91Lh6ObZiIjZ
         XggKdH18HEf6YYckk2gzKW1gR+2ioK9/K/kTIPRz6KUx/S5Pg0nsXF2YuRE9PVyFO5bh
         PjC0pBXEDr/Dv3g7ApHzKBfna8Ck+b965HFljjR6EQdh83SWfRA/kdnyBDN6P1eGrP5B
         yOzTvztnvA4CQUSqby+cNPv6a1XSDH8hHyyAKMSxG5s1wBA8ds0Th5W7xV5J7cFkr0u7
         bY2kBJ0gmQIJwjd4QcMaVaYUH0u7SrKRNjNWX1VtXtr8EWOf60GMSJXX+2Dmd2IgnsHM
         i/aw==
X-Forwarded-Encrypted: i=1; AFNElJ+Vs5NirYPRE4zK7+dwelgdSlJJv8jobj8NaH/XqfQQnMgg63WS9AT7Fvm0CaEoMtnol4LQTciSeHy6ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHj6s5WuYFHEAvAziy/0dMfFvlNr0HNt0xFbJXK/8loQKCuTG6
	dYRTmM1jzF8Z+PUg0x4x4oGmbKi5olyrJqzwXrhIfNa9WseheNOcJxjJ
X-Gm-Gg: AeBDietNImTChQK/Sec/7hBxvNA4zkVc9G5nhehpqhRB2HM7Bf7JqGtqBzDg4UkDccR
	zTlzpJfOcyRCNkBh91zWiYA4/CnIaoGlCk5XAYlBGginPp6zKJKo7fIX9FpQwPukdbrmc3B6QZ/
	33p3laXaEJkS7WxzFRBypzmUa1edrO+nVEUMMyY7uL3RKGsFX1X6U5Jr0uAGIK5Ukn9SThyqI8B
	G/r6LMLMH+RhUxElD+ZAKD+FoBXw+rA6dh3PULlnr37yyZPefX3v3WnoEb3RJAAXiZ/5HNjBqra
	NX/88zQs66nDk9BNG41gi5hci8Xjk8CVp9agUIGe62OTCngkAYV4BSIEWPUeA2TPXmFg77/PXmt
	43kU3IgVZ4m+1GdyTC8hb+4/4NTyeeV5EuXmc1UFVMMa3LAgNW6+FwNPaBkkN8XAaH4Eq3STtZO
	7viAjdqT25d/PefiMaGH7Z+xI=
X-Received: by 2002:a05:600c:3e19:b0:48a:569c:abab with SMTP id 5b1f17b1804b1-48a77b12a61mr46745105e9.14.1777376386237;
        Tue, 28 Apr 2026 04:39:46 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
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
Subject: [PATCH v4 4/5] media: i2c: lm3560: Convert to use OF bindings
Date: Tue, 28 Apr 2026 14:39:21 +0300
Message-ID: <20260428113923.112920-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 94550484565
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59837-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email]

Since there are no users of this driver via platform data, remove the
platform data support and switch to using Device Tree bindings.

Converting to Device Tree assumes dynamic and independent registration of
LEDs. To monitor the configured LEDs, a bitmap has been added. This makes
LED cleanup more robust and less context dependent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 145 ++++++++++++++++++++++++++-----------
 include/media/i2c/lm3560.h |  15 ----
 2 files changed, 102 insertions(+), 58 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 5b568ed9536b..1052c11f42e8 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -9,11 +9,14 @@
  *			Ldd-Mlp <ldd-mlp@list.ti.com>
  */
 
+#include <linux/bitmap.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <media/i2c/lm3560.h>
@@ -43,22 +46,33 @@ enum led_enable {
  * struct lm3560_flash
  *
  * @dev: pointer to &struct device
- * @pdata: platform data
  * @regmap: reg. map for i2c
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
  * @subdev_led: V4L2 subdev
+ * @led_id: LED status holder
+ * @peak: peak current
+ * @max_flash_timeout: flash timeout
+ * @max_flash_brt: flash mode led brightness
+ * @max_torch_brt: torch mode led brightness
  */
 struct lm3560_flash {
 	struct device *dev;
-	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
 	struct v4l2_ctrl_handler ctrls_led[LM3560_LED_MAX];
 	struct v4l2_subdev subdev_led[LM3560_LED_MAX];
+
+	DECLARE_BITMAP(led_id, LM3560_LED_MAX);
+
+	enum lm3560_peak_current peak;
+	u32 max_flash_timeout;
+
+	u32 max_flash_brt[LM3560_LED_MAX];
+	u32 max_torch_brt[LM3560_LED_MAX];
 };
 
 #define to_lm3560_flash(_ctrl, _no)	\
@@ -269,8 +283,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 				enum lm3560_led_id led_no)
 {
 	struct v4l2_ctrl *fault;
-	u32 max_flash_brt = flash->pdata->max_flash_brt[led_no];
-	u32 max_torch_brt = flash->pdata->max_torch_brt[led_no];
+	u32 max_flash_brt = flash->max_flash_brt[led_no];
+	u32 max_torch_brt = flash->max_torch_brt[led_no];
 	struct v4l2_ctrl_handler *hdl = &flash->ctrls_led[led_no];
 	const struct v4l2_ctrl_ops *ops = &lm3560_led_ctrl_ops[led_no];
 
@@ -295,9 +309,9 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
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
@@ -339,15 +353,18 @@ static const struct regmap_config lm3560_regmap = {
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
+	flash->subdev_led[led_no].fwnode = fwnode;
 	rval = lm3560_init_controls(flash, led_no);
 	if (rval)
 		goto err_out;
@@ -378,7 +395,7 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 
 	/* set peak current */
 	rval = regmap_update_bits(flash->regmap,
-				  REG_FLASH_TOUT, 0x60, flash->pdata->peak);
+				  REG_FLASH_TOUT, 0x60, flash->peak);
 	if (rval < 0)
 		return rval;
 	/* output disable */
@@ -391,19 +408,23 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
-static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
-				  enum lm3560_led_id led_no)
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash)
 {
-	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
-	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
-	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+	int led_no;
+
+	for_each_set_bit(led_no, flash->led_id, LM3560_LED_MAX) {
+		v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
+		v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+		media_entity_cleanup(&flash->subdev_led[led_no].entity);
+	}
 }
 
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
-	struct lm3560_platform_data *pdata = dev_get_platdata(&client->dev);
-	int rval;
+	struct fwnode_handle *node;
+	u32 peak_ua;
+	int rval, reg;
 
 	flash = devm_kzalloc(&client->dev, sizeof(*flash), GFP_KERNEL);
 	if (flash == NULL)
@@ -415,36 +436,68 @@ static int lm3560_probe(struct i2c_client *client)
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
 
-	rval = lm3560_init_device(flash);
-	if (rval < 0)
-		return rval;
+	bitmap_zero(flash->led_id, LM3560_LED_MAX);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
+	flash->peak = LM3560_PEAK_1600mA;
+	rval = device_property_read_u32(flash->dev,
+					"ti,peak-current-microamp", &peak_ua);
+	if (!rval) {
+		switch (peak_ua) {
+		case 1600000:
+			flash->peak = LM3560_PEAK_1600mA;
+			break;
+		case 2300000:
+			flash->peak = LM3560_PEAK_2300mA;
+			break;
+		case 3000000:
+			flash->peak = LM3560_PEAK_3000mA;
+			break;
+		case 3600000:
+			flash->peak = LM3560_PEAK_3600mA;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	flash->max_flash_timeout = LM3560_FLASH_TOUT_MIN * 1000;
+	device_property_read_u32(flash->dev, "flash-max-timeout-us",
+				 &flash->max_flash_timeout);
+	flash->max_flash_timeout /= 1000;
+
+	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
-	if (rval < 0) {
-		lm3560_subdev_cleanup(flash, LM3560_LED0);
-		return rval;
+	device_for_each_child_node(flash->dev, node) {
+		rval = fwnode_property_read_u32(node, "reg", &reg);
+		if (rval < 0)
+			/* We care only about nodes with reg property */
+			continue;
+
+		if (reg == LM3560_LED0 || reg == LM3560_LED1) {
+			flash->max_flash_brt[reg] = LM3560_FLASH_BRT_MIN;
+			fwnode_property_read_u32(node, "flash-max-microamp",
+						 &flash->max_flash_brt[reg]);
+
+			flash->max_torch_brt[reg] = LM3560_TORCH_BRT_MIN;
+			fwnode_property_read_u32(node, "led-max-microamp",
+						 &flash->max_torch_brt[reg]);
+
+			rval = lm3560_subdev_init(flash, reg, node);
+			if (rval < 0) {
+				fwnode_handle_put(node);
+				lm3560_subdev_cleanup(flash);
+				return dev_err_probe(flash->dev, rval,
+						    "failed to register led%d\n",
+						    reg);
+			}
+
+			set_bit(reg, flash->led_id);
+		}
 	}
 
 	i2c_set_clientdata(client, flash);
@@ -455,12 +508,17 @@ static int lm3560_probe(struct i2c_client *client)
 static void lm3560_remove(struct i2c_client *client)
 {
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
-	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
-		lm3560_subdev_cleanup(flash, i);
+	lm3560_subdev_cleanup(flash);
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
@@ -473,6 +531,7 @@ static struct i2c_driver lm3560_i2c_driver = {
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


