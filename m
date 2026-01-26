Return-Path: <linux-media+bounces-51586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMZXFcyld2lrjwEAu9opvQ
	(envelope-from <linux-media+bounces-51586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E88B894
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B74E3017BE7
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A057C271457;
	Mon, 26 Jan 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UIhU9zFO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C6B346791
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 17:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448904; cv=none; b=bCmpMX6uYkFYu2QfX53h0IcW2D+667QPfH8wnIWP2yB5od4HBiB+AHacUOXGS0HAB1tdO+eHEAzILZiO9fElTrxatsEonc9MDSBhtaEwJA9poas2dijyLiGQ4p1HLXLdryZP8e61wcVcq4Bx0qsjveahHq3q35pzb1ORv622qvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448904; c=relaxed/simple;
	bh=p5cR6L+r/9DlXjg+WOWfhu5skZgeastUVDPp9EDgrt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YO9lHBntqH9V016D1zbEUmdHtSv4wTE7S5kq0XbYKGg45pLtjuHXq4YT7xoOfqSSULcA4ct2MYewk8z3TvkfF61LwWxrGufFHnY6QbKqXu2htP2HDOncy5UWjskEesKpkR36CTOxKgx4svUh2sjCBgyGP7YXvmXB0sLVroGzMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UIhU9zFO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35305538592so4337008a91.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448902; x=1770053702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RffcJHdsTonAwt9Ao2IhaDUDPGQyk+jkPGIUwU57TVM=;
        b=UIhU9zFOkmPOarF0TQTSox+haF5F5Ij+A30UR80iScRd2oDyBz20UEEfBtvOVhzZGS
         Etghy5KyCtvDuxGaGKJdU+Rp05X9yrEQN+m0wSwlZCts0b/VuM6KCcuPQ3mCja25WXO5
         UtVZ/9ZG/CnjVBeXW7+bnGHgKlO+rfT+m2MeNtsNbwgNmk0sue+mDMlM8uFjlFGlJ+2H
         OOvBpkJNgDoHr2D6fbVksHygIXshsqPOpDbVsjarA7EMhakBX3YdMXC1McYLMmnBMLRH
         m9fRXWAqZdrs/0/PWSvXjNdAI0w0NMBkHAtUg3O6+gC7QNJ0n2hHco+1qG/MwTXFLxEa
         VJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448902; x=1770053702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RffcJHdsTonAwt9Ao2IhaDUDPGQyk+jkPGIUwU57TVM=;
        b=iFVDlqdJyglzSKVkzy9N9I+010qt7SeYNz++bnaAw2H1rjXorShz23EI7rgeugLoT0
         hhCGBeICUkni3aVgUCy3uavn5ksYA/JnKr6J+/AM0Ch9z0du18kv8LZbqvZ4yT+rTNHL
         gnXzj6Rq/jd4I5DPvAJOvdilPucxjfF29H5KVL7QAQiU+aAWadBPjlxzUwfXS4mnLbFP
         cF94vyDPN6tCGLdB4dvgcTNMKLJIYXKOsfBqp39BSQXYBnomm7HgR1jOm5vQTK4evbR2
         sb/tFJc7MhBu8pKixY9juz/Id755lLsFeDXVbWLPVppezBqFJ+u4M5dNa8OpR7vFo6rC
         T57g==
X-Gm-Message-State: AOJu0YwH/OvBlwkzQWu/WJb9WNhUyGk9Kct5SQ2VzTygTvfl5lSq3nnX
	v59wiEsTpGC64GcJ5hImBVT/vkF+0nXbQVkIiRvE2LjCFEihXcOEDxLE9j9Ric/a
X-Gm-Gg: AZuq6aJ9vLhgz0sJKg3CDQTH/q1VZsfzs83Y1PH0vfEiZwhDxog7FfjIoz3VtyyUOPx
	r462ZmS2dBsmUqi+DuY9+bh3es9j3kQbQiJFVJM0XCjL0JiMeTuYE3bDGmBw18vTsAx2YfaRU9D
	+ykPW3YBHJeRZd3UOjEbz138gWEssDqI8RibJSaUuPYnvjyGg3Pd5qvtXHN0gJXpzEupswwg2et
	yeaMjP7oJx4/T3y65fzM/P0oQLX48CMCAHFA43DxqkHb7CJhaMeqQK2rGQd5NVQKZrXy5K4XYTT
	pj0DtndR3bHtkYf/xEgW9sh9gtcv7wxd/XiylQ/qaNeAgNYPpzx5p72XxYWpZNoZDqqeNyHbBp+
	iHeEjmgt/0KHtCEBvtED1YI5+5FgkTmEB1YuzdUFO5iIMOib8Qt4s4XCoq4aZ9GtsKHnLTbM9SW
	tcSwacbnKXcjzR/VoGJ1qoOq5RnC1W+badwKMV
X-Received: by 2002:a17:90b:1c01:b0:33e:1acc:1799 with SMTP id 98e67ed59e1d1-353c40c66bbmr4815618a91.14.1769448901662;
        Mon, 26 Jan 2026 09:35:01 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:35:01 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v3 2/3] media: i2c: ov02c10: Correct power-on sequence and timing
Date: Mon, 26 Jan 2026 23:04:43 +0530
Message-ID: <20260126173444.10228-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126173444.10228-1-bjsaikiran@gmail.com>
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51586-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C16E88B894
X-Rspamd-Action: no action

1. Assert XSHUTDOWN (reset) for 10ms (T1 >= 5ms) before enabling power.
2. Enable regulators and wait 20ms for ramp-up stabilization.
3. Enable clock and wait 10ms for stabilization.
4. De-assert XSHUTDOWN.
5. Wait 20ms (T2 >= 20ms) for sensor boot before I2C access.
6. Perform software reset (0x0103) to ensure clean state.

This eliminates potential race conditions and stability issues during cold boot initialization.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 57 ++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index fa7cc48b769a..ba8bbb4f433a 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -22,6 +22,8 @@
 #define OV02C10_CHIP_ID			0x5602
 
 #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
+#define OV02C10_REG_SOFTWARE_RESET	CCI_REG8(0x0103)
+#define OV02C10_SOFTWARE_RESET_TRIGGER	0x01
 
 #define OV02C10_REG_HTS			CCI_REG16(0x380c)
 
@@ -616,6 +618,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto out;
 
+	/*
+	 * Delay before streaming:
+	 * Give the sensor time to process all the register writes and internal
+	 * calibration before we assert the STREAM_ON bit.
+	 */
+	usleep_range(2000, 2500);
+
 	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
 out:
 	if (ret)
@@ -660,13 +669,13 @@ static int ov02c10_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	gpiod_set_value_cansleep(ov02c10->reset, 1);
+	if (ov02c10->reset)
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
 
+	clk_disable_unprepare(ov02c10->img_clk);
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
-
 	return 0;
 }
 
@@ -676,27 +685,53 @@ static int ov02c10_power_on(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
-		return ret;
+	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
+		usleep_range(10000, 11000);
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
 				    ov02c10->supplies);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
 		return ret;
 	}
 
+	/* Allow PMIC to ramp and stabilize */
+	usleep_range(20000, 22000);
+
+	ret = clk_prepare_enable(ov02c10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
+		return ret;
+	}
+
+	/* Let the clock stabilise */
+	usleep_range(10000, 11000);
+
+	/* Release hardware reset */
 	if (ov02c10->reset) {
-		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(2000, 2200);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5100);
+		/*
+		 * Wait for sensor microcontroller to stabilize after reset release.
+		 * 20ms prevents black frames during rapid power cycling.
+		 */
+		usleep_range(20000, 22000);
+	}
+
+	/* Perform software reset to ensure clean state */
+	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
+			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
+	if (ret) {
+		dev_err(dev, "failed to send software reset: %d", ret);
+		return ret;
 	}
 
+	/* Wait for software reset to complete */
+	usleep_range(5000, 5500);
+
 	return 0;
 }
 
-- 
2.51.0


