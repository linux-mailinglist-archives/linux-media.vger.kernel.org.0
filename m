Return-Path: <linux-media+bounces-60200-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOTBL9R792kpiQIAu9opvQ
	(envelope-from <linux-media+bounces-60200-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:46:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 484504B68FB
	for <lists+linux-media@lfdr.de>; Sun, 03 May 2026 18:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA49301D043
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 16:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2738137B012;
	Sun,  3 May 2026 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPHX4tN6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7524E30BF66
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777826702; cv=none; b=GLmAN7KEL6ayNboaqZyRU/5LCJyWtkqFRF4hC0RhT7UvAOsNL0dNt3CYHxy9TytlUwrq2E5LfnJOrNtAktCxKA5Q1J3U7qFVFdeoDkdJfZq0bTqRub7MFTriSGf6hAGuI39bnmUiwRtmQmuGxEun553Je6rwms/gDIxS8OWaduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777826702; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sv/7glcEcj+xRPnuaMvxM1p1M80o0VeuanD+vr9wUO36sVRWK3BSSf8adFKc6T4w30HP6ZvcpUTZSmSGiRF4VNMr+UnbPdl1oE8zUKU8YDUva/NVWZpAIUEZ0Um5NcG7iWPU2rcsaL8pHdSTtvEPawXGECoPyuDHa/KyALODASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPHX4tN6; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67bc6098640so2609343a12.0
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777826699; x=1778431499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=HPHX4tN6pvOtLFDE8vxYilTNjL4kyEPNuJ5YNSx0FG8Y9ArrtjSsmw1ntDJFrMtRkq
         juMCYBXOA/Zos9GUcZac0QC4hfOThUnqc0KHaRuIQnL1Gd5rwxsEQO23RD+SaymF/OSf
         2tqXZhwNrpZvHHCrjCd+MzQ1wlAUkWAsWqTuRFw+/GtTQ8AhbXbyEw45RHh+HPsVyVYv
         3s1Tziin/HKa726vlzP9+ljJofrAVWZOZinB18nYqr6Udr8usFXxdh7fQ5RLq97U2uOF
         lorIO4dIqf2BJ6RhCaT5swb2eOSyIBYPbe6B8tTzrbi1uvK+1cvzX69Vej6WXjP1DSnd
         FbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826699; x=1778431499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=YqxADU3jqNmsfPgCey9KRtC0yBV6vMb8hFq14CHdaGw3ZKO1kHWzM1qVJgKXA5C90r
         o0OApXV7RmxkYAdrokaqiUKjMDUK1aYCNMR1biQHmqQYmtQ3DnDllkT1XIp19mMdYn4K
         u6+zhuY+/1KQl4XK+3BXOAY4H3b1lEZcFWS3XRksu4vHQEGEtwDcLHn0zVmpKVjhMszQ
         zAzcYNrA7tBhz/5fh7A221bv/da0KFOMFysaQJPoIS6sBRQkaVRquMgkdbb8J0+NcsF1
         iqD9Gq9AoceATGPFy1tAPyxFDZpro6lwuPbrwG0dLVYH7VnDoTuXexKNY8CU4L3Mi2jf
         4O/A==
X-Forwarded-Encrypted: i=1; AFNElJ+3nDayuklhsUcVQbg+HAI7vE/wDoK9rerOLXeoRCOVYY7sc898Lotkl6lyEWqyy+GAL7JKNKX2ZJbhRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeyXQb8PiF8I9+Zyn9jHLdEuCVseZHC7NWfhZ/binxe7jX7Rw6
	NPVae8D5C5RqwPOWmL8/6MX3tq8QWuBnoPGctmRTu2gG0laqyLp7ERmx
X-Gm-Gg: AeBDietIzLp6eJjbaPgIleSOuelVusReRTHBKGdsbo7mjVc6eDDvY/cDI8Ekdcue8ap
	vhE6MEjY97NSBGNcn/Q9eCAV5ElXDqvHBsrSmgMVJUPuivlvK1o4i9u2oxZPaV+fTr+eJ3c+EEC
	z818lABfp3WMCF3aZQFuTEtcxpyQ/zLx/xxFZqqyvk4Oue3jC4tnw7ogMqpI8owEvunud3hOGCa
	P4FF9hOK0LqXuIAgJKi8JsPqTtn5actESWr4SkWsUV5a7TPO9bRwTXg46qSAzqznqO8420GGp4Q
	6+Q6Vs3JgW/7GuIEf+RrzXEks5HctUq/K7c7TNwVH95edi9dc+lZq0s+4oCQlwWSSgqJg/+lofO
	wvLv4QDpscBeTBCakgHcLl0JPS+uwTvpZooq/Ml0F1Z+DGJkXPFBe+a1k3h2zc2uE7G9JYDkUDt
	rUDczLtvupGMRAKAgKCvzcpIM=
X-Received: by 2002:a17:907:9455:b0:b9c:9594:e00 with SMTP id a640c23a62f3a-bbff9e28c78mr324860966b.1.1777826698801;
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc237ef8297sm27430566b.57.2026.05.03.09.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:44:58 -0700 (PDT)
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
Subject: [PATCH v5 2/6] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Sun,  3 May 2026 19:44:41 +0300
Message-ID: <20260503164445.215540-3-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 484504B68FB
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
	TAGGED_FROM(0.00)[bounces-60200-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Because registering LEDs before device initialization may cause access
attempts before the hardware is ready, lm3560_init_device has been moved
before the subdevice initializations.

An additional helper, lm3560_subdev_cleanup, was added to release LED0 if
the initialization of LED1 fails, and to deregister both LEDs in the
remove function.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..edfb07587cab 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
@@ -391,6 +398,14 @@ static int lm3560_init_device(struct lm3560_flash *flash)
 	return rval;
 }
 
+static void lm3560_subdev_cleanup(struct lm3560_flash *flash,
+				  enum lm3560_led_id led_no)
+{
+	v4l2_async_unregister_subdev(&flash->subdev_led[led_no]);
+	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+}
+
 static int lm3560_probe(struct i2c_client *client)
 {
 	struct lm3560_flash *flash;
@@ -425,17 +440,19 @@ static int lm3560_probe(struct i2c_client *client)
 	flash->dev = &client->dev;
 	mutex_init(&flash->lock);
 
-	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
+	rval = lm3560_init_device(flash);
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	rval = lm3560_subdev_init(flash, LM3560_LED0, "lm3560-led0");
 	if (rval < 0)
 		return rval;
 
-	rval = lm3560_init_device(flash);
-	if (rval < 0)
+	rval = lm3560_subdev_init(flash, LM3560_LED1, "lm3560-led1");
+	if (rval < 0) {
+		lm3560_subdev_cleanup(flash, LM3560_LED0);
 		return rval;
+	}
 
 	i2c_set_clientdata(client, flash);
 
@@ -447,11 +464,8 @@ static void lm3560_remove(struct i2c_client *client)
 	struct lm3560_flash *flash = i2c_get_clientdata(client);
 	unsigned int i;
 
-	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++) {
-		v4l2_device_unregister_subdev(&flash->subdev_led[i]);
-		v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
-		media_entity_cleanup(&flash->subdev_led[i].entity);
-	}
+	for (i = LM3560_LED0; i < LM3560_LED_MAX; i++)
+		lm3560_subdev_cleanup(flash, i);
 }
 
 static const struct i2c_device_id lm3560_id_table[] = {
-- 
2.51.0


