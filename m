Return-Path: <linux-media+bounces-59835-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLhHG1qg8GkRWQEAu9opvQ
	(envelope-from <linux-media+bounces-59835-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:56:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5B484589
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 13:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B184F30EC7BF
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5B03EBF06;
	Tue, 28 Apr 2026 11:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fd65MjkV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659DF3B2FFB
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376387; cv=none; b=g0h5HS+nx03ETba1z2sx/3TfvspwQR4/3Zal2mDlwlAZbwQRcAKse/INVY94KvJvAPKJSgCVMvZ18FaLCwyBF91uY8PkGmk0ZfUZXYAdRD/pP5dXDf0NwAnPkFoDoR64ZfmkmoCzq7ehraGZGdHZyEZuVrAV+zmMelp72v2qB2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376387; c=relaxed/simple;
	bh=/aTZ7FfNJUxGAerV0GyNvRYzlJf90me3mmU4zDgewOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEBspESmlaeEwc2VnRz/IUDMunQXu4AkS1cPqhaJSJb2wkD+tihA9Jxw67YIZQ3yWO2RsV1bSlGadaq23mGCB5zlBBmlYK2Vo09wFwWypLvjUWfkh+y/bv4S8+ALvTlWcZA3T4BE+OzmHx1K23JauHWBlS4yWG6LCY9efoWhEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fd65MjkV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so102855635e9.0
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 04:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376384; x=1777981184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=Fd65MjkVQB3E6GV8G/hk9uAj/8TTqNaJBbmypmq0adYW+KGGgx3tijofFRyE20VjpG
         2lcaUBL6TeRhAsYgYxU0h0jaxlmw2x88YcrZxEbeTpkrVdeSDXlS/JbvpnVbcIVNBZvr
         dqd8gciv5iT2Uk8AdIjFCCgFNArQuBHVLT8R6f2iXz0V8sNsoT47oi9VMb2Wcqba5zkf
         4CrX3kuxXh97RPJdZykwruAT/KwVy7/1R25gLIX07XU0L1dCDvn/5r/pHEUhU/dvMEH3
         eyj+up+GlOt3+T5cXbERY+805a1D9nOTYUiYSsDY3YAAms1pOhyjiDjoevg2rO10Ol/y
         myMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376384; x=1777981184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqEpiDmgYxnJFJBZV5oyq8iX4ijdqmclDgeEbjUzvZU=;
        b=mvX42JPJda0VT2v6Lt/oHMXCxNZ4QQo5QHCBQNeLZWfnbS8ETc1/0P/uQwIdYB3ljj
         QRYLpxvbYn06vBGz9xJbzY9XaiE3ZfQwwomplw/hxmuP96mxOdnKa1aexDmYS+eT9wkI
         XY0LvmSc5vCoUziuK3SIS8FbcbT+IRyTLEuVF+Q/nnQ6D61ZgXU0iDnPgS53mU8eh1df
         a2I4rO0PGYR2G6gI6+l+iUQnqg3EWdnEgBksB2Prrd3GrfKFWkGUjWfEH/pqEThL0guU
         LPw2+8Y7sIZCVd3EJYQLSl1Q2wKCbe/yE0LghW9itKMN3dssoWKdsjwbUp4xhMUEYcka
         p3Fg==
X-Forwarded-Encrypted: i=1; AFNElJ8RGGY2VOwNzxDoXFOA1IsL8tVb3QlfuAIhXa+tYBFbW3V/mKq8dJYpwQl4jGImc+flyqr8xX/fEGR7Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhKk/L4V/6WwkFbAhOs7aJAQ0WnNsH2E1oqCL746BTkaKYcW0C
	v6TE5Oxv35RyW3y1oIUPbk5Y9vB7Rm2Fc4CjO0/SxOZcClv0Qm6iUEZ2
X-Gm-Gg: AeBDiesRnNIzyTSFEf4Qyl2wiZWcI/PDo3LwE2/SrFj9iFCe9zv5dR5kyjbY5x3h82H
	COnaAuN6o6FFFBG+Wt6kmEyG73XmYlNLTcsuBuPwOTko+ncGP6K06i36PQk5LqiJahM/66CGFIG
	bAKvyvAe1THIDj9CQTS3K+zlbtRdtO3+EfBLsMUe1SDGAWJufL/REZQw6JenzxeTBVMyyI8EEsI
	UpoZLoliYj8CfnD2Dpn1jnYx6SKDismFRUm2t3YXfyJKu/Adzaj6/7FnpLrpAJsqdJdPY4yL1N5
	MdBxtZp/T4jU6SqAg8HA1rDHuhhcRaBZ84NO98bwdq42+h9JGgEOWn7tFL7tOxn3uwAiy/T/7dp
	BJ6eQNCnJcbb1mH8o8r4S13DAk3UZAqYXUiSNOQNtKZ5OiIZ67zU4EM+yTx0yIfXTHeoHtX5QbW
	+BcMbMKTwj+yNh6AmZW8oMkAc=
X-Received: by 2002:a05:600c:1393:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48a77b270efmr43569445e9.29.1777376383549;
        Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
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
Subject: [PATCH v4 2/5] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Tue, 28 Apr 2026 14:39:19 +0300
Message-ID: <20260428113923.112920-3-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: C1B5B484589
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
	TAGGED_FROM(0.00)[bounces-59835-lists,linux-media=lfdr.de];
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


