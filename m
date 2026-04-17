Return-Path: <linux-media+bounces-59003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK8cJdsc4mlX1wAAu9opvQ
	(envelope-from <linux-media+bounces-59003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:43:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4241ADFF
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 13:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A91B93032F54
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E27396B8E;
	Fri, 17 Apr 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3Q+OsQr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2A396D0D
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426169; cv=none; b=Lt6ZFbECSYEIpXbQGc++/S5do5Yod9SZQQYXf2bHgEdacXXkzZLR8bnym2dQVYpBR1t0H1vffNyZ9LEqGfjT1HGFuadNeUTCYKnX6NPA/PovUYP2zaqC9Ql4Clr7D1MUbxaN9Fdfg49wyDPUnbBy9Uaid6vOEb6zZMZNoAC1G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426169; c=relaxed/simple;
	bh=2SoN076WkKPP9dslU6jI1ybrIMLHSTNOhkvnyADFEu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7CN+YoX+YO9XS/x+/RBuBkiBcVszlFlE5WbaAlYrJX/vFA3VwT/a/L5t5xRKxL74sCSpZ6FCVZ0/EGxja+MYvkebTa1PATye2RuVifE96zT5nr6IeB7gOyc1e7U82bH6S+gQqSGM4b2h4Q20q+/icZelNKfFdHACdT2Nk+eG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3Q+OsQr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a3d1561e38so477659e87.0
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426166; x=1777030966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=U3Q+OsQrqFj9zxxhBl6l+pnWu2fXBHRpsTivXAo2KmD6I6Fsl+1zwSkXerpJ3ipzoQ
         kuTU0/5BJ1Mbwxao5kHb+iisUffH5NlLjfUHdryWZMTZ69QDqvGRTyfFrEEUkNs9Thax
         pdwKThk8niYPRacMEtYiJVd4+/vKzs+MWoUnM8EgjHGEYQQozJUzu7V9Uby1I0hiwxcV
         BS+q9cNcIBMGxg0euq7sSZQzSqnucIJMyD4ML5NqpyLoQYOLfsMXGTcbxFjYJGtXcmBE
         NjfTjohpTdpUuWHXBxPcJqtBezN6Oa9nYT/XJ5I8EaTvigflklhEO4ukE8nuQX3INvCj
         MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426166; x=1777030966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aIsBkEhxNk5zSXNzbm4OjEaayYLvWVn1IlfYzqWmAY8=;
        b=Qwwhoak/HBDvLlOu++oioFFk0u1Qeg3dmYRIvJ9SuaDFTknM6SUBeLDukeYhsJEu/1
         h28a1xy9Ra1mrS2Pi8ihcYF1ENk9ksDLMKcXlAHUCnpcUyxZJXmJ9ZyTC7scYf0CgroT
         52brUvy0zrmdnSh9j+2znKCf30vsEJMBfyGaC9bH/f/3/q64BLgdvQfOVy3k20HyyH+o
         ksM0ll29L7pwWTlfEzv2q8HUIusMlGyS3jxAEMKnqOznhEs96x1CF5u8Vw4aHVY4t0X5
         bUOzlH57uiiC2uvX5VtLlhIlT/zkKkM0YrOfGr5jJHOFqmrnW2k/ctaqFRIIpytPcaMs
         h4RA==
X-Forwarded-Encrypted: i=1; AFNElJ9G47cAhOw0Uzr7DXn+Dro75UCcm9PnmDbBoDaJTaoO7FR3zk6l3rjpPQmkLE2aGJDdY3pEyam5Q3vDTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9DIhiejy6RatMCpgcH4TKhMbEMsKDljJSvC6/yGWIM6CwtbB9
	CPxULJoSJ2dtrhXZPQZ+lKpUdwSuXb3XLsN9ZppRJgn9YpRWG+k1QpKE
X-Gm-Gg: AeBDietrkB4DPxBO2K7aWLu2tFDP0KamLj0SoW+1VguS8Vj1UnKea/nU4VigoZL34we
	zV+EU7R6+wqRampgfMES5O3qyk2SIeN6M8mI8GMJy8lvtRFWCZa+vpZATz83xQLFzSqCyJDDwzy
	RiL+HcjD/qN1thxvuZqGil6UBCAfMuytTdNCR0d/DIMcdlVSJ0Q5oyVNbd2GTUsKJuoeb1wnRCx
	7FYcsygJkWiLZ1g0i/OHaBlCLVl/XFFWXDYI3GhxegfJ7PFUfrjF4JpgpO+0JtJleKFSLchB6XA
	drFN6WIiXZXTid/ugICcN1i0LO9+2AL1k8TPpDHYzjWK/hhCcegbKj8fUINBdm8Fq5PeOps+48k
	IYthrF3OBJaP7luQPhAEyMo2PuS+DdwourTZ5sQ3picz5HhbOJtFwodNR0c4Og26owxY9Ef++fJ
	dXra5Phs7wpEyStZbcKx73ixk=
X-Received: by 2002:a05:6512:3b8e:b0:5a3:ff73:29d6 with SMTP id 2adb3069b0e04-5a4172bb921mr657348e87.7.1776426165787;
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:45 -0700 (PDT)
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
Subject: [PATCH v1 1/5] media: lm3560: Add HWEN pin support
Date: Fri, 17 Apr 2026 14:42:22 +0300
Message-ID: <20260417114226.100033-2-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59003-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 95D4241ADFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add HWEN - logic high hardware enable input found in LM3560 to ensure its
proper operation.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..e6af61415821 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -11,6 +11,7 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
@@ -45,6 +46,7 @@ enum led_enable {
  * @dev: pointer to &struct device
  * @pdata: platform data
  * @regmap: reg. map for i2c
+ * @hwen_gpio: line connected to hwen pin
  * @lock: muxtex for serial access.
  * @led_mode: V4L2 LED mode
  * @ctrls_led: V4L2 controls
@@ -54,6 +56,7 @@ struct lm3560_flash {
 	struct device *dev;
 	struct lm3560_platform_data *pdata;
 	struct regmap *regmap;
+	struct gpio_desc *hwen_gpio;
 	struct mutex lock;
 
 	enum v4l2_flash_led_mode led_mode;
@@ -425,6 +428,12 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
+	flash->hwen_gpio = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(flash->hwen_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(flash->hwen_gpio),
+				     "failed to get hwen gpio\n");
+
 	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
@@ -452,6 +461,8 @@ static void lm3560_remove(struct i2c_client *client)
 		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
 		media_entity_cleanup(&flash->subdev_led[i].entity);
 	}
+
+	gpiod_set_value_cansleep(flash->hwen_gpio, 0);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0


