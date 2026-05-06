Return-Path: <linux-media+bounces-60520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJavJO3k+mmGTgMAu9opvQ
	(envelope-from <linux-media+bounces-60520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:51:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 336334D6D01
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 08:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBC763059C70
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 06:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A341B369203;
	Wed,  6 May 2026 06:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwEXz4Pz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6305736C598
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 06:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050152; cv=none; b=AVaYxrWBwc2/WlZ9vv1zB4VwEycZAO0oFvxK2A8sjRLvEL4NE++lsmRD+C2rEDd6OxeYxr7jVoB36E7q19IkoDMX0p8l1waoVU+C4rSreZjmQyrA4s5MlyeQL9y8NQfBjih5RzIfKp8AxAeaCyLMhlq4jwkG3XLs3MNCdgHCFXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050152; c=relaxed/simple;
	bh=LRXlNS9x02z8g+CGxmATU/6gvHvDK0YuBVqtECCU2ME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj79d4g73BsBp1so07X54rI+ey2IOdCUA30teTYA26tDmJ2lyFAFHvdbbfDM2gAm8cvSUzyv4GX6kYWdA3BkJ0zwijLIkuMzmppR5K6otw59rHR0LfsGrZHgqnEWpf2jMjYAC8Gtm/FlP8GxTuaDXbze7Fj9c0CFGCFesEKlqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwEXz4Pz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso2794561f8f.2
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050149; x=1778654949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=YwEXz4Pzty/l82umOVfQLn1ytJucYokbpH7jLwYuugLDPyvHkirQUCYwncQZpvqWQQ
         jCbAv27Mv6yFUm90kCMHtAxRM80+coU5/ZSPClG3zP/aCcW+O1m50DSxxaMPPVAaojjT
         sraGyH4Qu7XOvxb7WO1st01yK7bgAjjT23GfhWivW8Mjx/TMX8O9ipFlVL6rnm8YsAiA
         utJYo2PTfj5K0Te4sfmqUe3YFiQ/5pP3uxt4iAYiuqwYASrlYs+shLvTm6rzvSNHFtVy
         r5Xx1nkpLrdpvpziZr/09uB9rBdiDysPlVZIXp13lyAToN1oapuBQc7yKHQ1M1UAARkn
         SNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050149; x=1778654949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KGU01Qq2W7EXZE5uDuHFOzhjoXBSa5CoF8m94VBiMo=;
        b=RkZ215JWnDPng3xaPch5JOzUTq07g0L0CDwwrvpk6wI8BBMLyn12n4D7OrQMDX2aTJ
         wKqpWcfQ3/F0VQjKbFbetIP+P8BWfUcz5/aX6W5mWGpjYh+SVWtuJ+MM4HlXT2521xgx
         qKinC7Vto8ZSjPG2hAggJBxplSfws2XC2+3EX2JQyb+ugKWJS/+kfk3Y6GdBNQdmXuFD
         cep4JV6Cynevolnj7/KjyyCLLTd6GWsd1s+H+Pgex15zNOxQxpeYPpxxkFN/gq3faD87
         iAF97+JS/hJ4TnwjYHA96xDnbST/IVxAQeIaM5mFqe8D0HlngIGChmIVi37Q5/JoanOd
         jyhw==
X-Forwarded-Encrypted: i=1; AFNElJ9tCJ0CYHqmuCmLJJPGIKUV59Z5Tb2F+UZGI9ww7icCT6f64llv2almp7d7uYFV71KgxfZeDAYjv9m8mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkTqp5LVlTIuFlPEUi4PiSxa7DKsHl+/H2QStxKlIY8rsIvRl
	08iAYZwKU2Xh2P+JlHXjJGL4aQLmdmVapiZNG4pohL4ljYAcPOv2SN4z
X-Gm-Gg: AeBDievKvp21INHfhWAtx0HYT/JkXs936Acdpo91Bz31D8+mPprJ5KzJ4ZKNIeVXDrq
	Unu/N1PDyXCHJXbSFNFiT5H5BV+bWwsbDi/kEwF7EdEw30SWa916AU4glCQiTnpeXwm1y+YTFNz
	lG0E/quJveQSx8X8vp3hg2HZMQhO9/EbeD4QtuU9v8AFE+ssIqrJWWrxDJBZ3dDeislssGB8SRj
	eXK6spt/W2L1DruI+rbUIYG2RIo1MLypuQ/sh1a/lJkt/g8tTla3ONElKYpT7LmTjy0LS/iTyFR
	VPyu6fJYIjKm8St6ExeFOBMOJ1YXXzCxv4iUZ7mXDtfvITE2vk+vMdycjUW84x/ED+Jb2lwvSvJ
	Lj3Oc/5ksFfxXF1jhOZi/1TdIVZNjL4p7dq5tj11CreCDSgJgHRxHbr+yPkj8iU5oQGSQ5YL3Jx
	qHy1S9UFwN8KKsufHWgy0tSiU=
X-Received: by 2002:a05:600c:608f:b0:489:1ba8:5be9 with SMTP id 5b1f17b1804b1-48e51f4b0e1mr36256855e9.29.1778050148544;
        Tue, 05 May 2026 23:49:08 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:08 -0700 (PDT)
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
Subject: [PATCH v6 3/6] media: i2c: lm3560: Optimize mutex lock usage
Date: Wed,  6 May 2026 09:48:44 +0300
Message-ID: <20260506064847.37795-4-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 336334D6D01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-60520-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices since they share same hardware,
so the individual sub-device locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index edfb07587cab..5b568ed9536b 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -328,6 +318,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 	if (fault != NULL)
 		fault->flags |= V4L2_CTRL_FLAG_VOLATILE;
 
+	hdl->lock = &flash->lock;
+
 	if (hdl->error)
 		return hdl->error;
 
@@ -363,6 +355,7 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 	if (rval < 0)
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
+	flash->subdev_led[led_no].state_lock = &flash->lock;
 
 	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
 	if (rval < 0) {
-- 
2.51.0


