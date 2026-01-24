Return-Path: <linux-media+bounces-51447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA1eNDxydGno5gAAu9opvQ
	(envelope-from <linux-media+bounces-51447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE137CC92
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 08:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 729033002B76
	for <lists+linux-media@lfdr.de>; Sat, 24 Jan 2026 07:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7004023EA81;
	Sat, 24 Jan 2026 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBYVzadN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A836E3B2A0
	for <linux-media@vger.kernel.org>; Sat, 24 Jan 2026 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769239093; cv=none; b=kcC2tOS4Hj5yQO/2MxLog3umlX4oes+jRpUP9gmX6plKVhvqrrtAgxEK5h75wx5xT0Y1Nb83dCkqrrndhG5QQ2UWrzNnl9HyihrSikTTzKB7J8MO34KehybhdkSK00pKblmd6fAY3gEgH8OTDHgPBUKyfdLycNksoIORC0v6cwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769239093; c=relaxed/simple;
	bh=WIibVz39CMmx/Xn5UgYW9FhSIiFGDTft+9KDelnI1YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3Syf7qyDsSmfzkshgjG5CxVXlFGS8H0hN+2ZcrHRaMpNa2EXL7SbqgHAjuTq7Zey0VG/QI9C+XpJp3fGWI7k2+GGRepyMW1lSpjybIVTSgAPf3w/IKnsTDPUlc9v0VC4WTeiuUb2heYi0oPao2rFWmxAdAdsowDlGkivBwf8vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBYVzadN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823081bb15fso1530825b3a.3
        for <linux-media@vger.kernel.org>; Fri, 23 Jan 2026 23:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769239092; x=1769843892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmAIbUHK+QXTXYr1+KkJbeE5POp9xFaomwUAao+Tq7A=;
        b=lBYVzadN2w7FEnPCwERr3ImE3b6U39wvpt19xu1KU4iYjvNTU4r3L804LnFTdYEXpK
         x4A1Gv9Z0FEonoAoxMrzT14+ADQ80UMtN9l8TUjUG9uAV0+GfmZcY+t6Q1jrFyaOKyqY
         TsDEZJJxu1cXowBZDNcORW+0uexL94VZEP1tWIfl6qxtmGcTPnhctWnXSb/Ehpr1TDuT
         i/fnYgdLpYAFygUChmMkoMIiqMgkphIJjz/iOd7/o8UD2kruM2bqjwc6WWs5cELpjMYd
         i+yuo55fwhm9wV788cQhhF2bd6OshgvHgakZxfIhjBTz5CCBtJf7ZjHxeyForeq4dEqj
         85yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769239092; x=1769843892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmAIbUHK+QXTXYr1+KkJbeE5POp9xFaomwUAao+Tq7A=;
        b=owaAomgrYyv6ETn0V47iFBeWvm2yQOJcjYf9YyBtgKuRaTDVAHnvnKUicWmntXKAKk
         WqmLjPa1OE/nQ9YLu1OYYFJxyOsNCfVzGbLNZacNEpwJn4KFkqENWhOzoUGHJ3viPreM
         2NjInFAYN3h/6RMpnQ0J5RO3l/fMs6ZX4ggKNQGwE77j8BKCDo4sRNul1HqMUetOejpZ
         L65NE0jbD89rPZUoPttJ6P3QvkGeixahDMQwwO8ZeLDATFf/krk3vO5kaniJZs7bQSHY
         8GIwd1Pr2k4KUAenk3FMhJcgzjUkQ5N8rJGCpkGm/ccWe6bJaSWsHShE0KVkDfljnNQU
         l4nA==
X-Gm-Message-State: AOJu0YwiBiCCUq3wsOWj886aXjnGa19fQmfZhgyjW5Em2R5bs8Mkpb/d
	k/grPynyxfTKYQCsZD01MBBmHGRPRjPZiWTCALS2VNCghBBDMnsdqUIwUXdQ9LDC
X-Gm-Gg: AZuq6aLUwPejNY6bXMzgzR3Ghz3eihy4qZcg7HuVVo2HrNuShnEu7iblGmieSzntr4r
	o59Qx2OybUCQe8m4Ao71p1XXyJer7km84ObBDEbYi8ADLQiS1UjupTrOI9H144SmQ3mZJEzldbX
	bsnir5oWgrnfexAUKKiUf62Y7IH7hV/GdW0CrgU2nU2wJBYYIxoFZjoqElWgBBJIzFRJ6U211TN
	QPad9+IgHJpzV2+mzeHMFbgwCeubPMZj8bimMxvygxpH6ihX6aTE0sYGvaNg1JvERd4lpfAShl5
	iokdPPRCl3yt4nNZF+0LT53hENwIrYOHENrEbqE/3tSJkRaanYiE6IU37tg7kz8pqA5VQmjvj10
	Q+Ri30Uki8swtQotufjBs3Pumwcy5ck4Yz2Mg81W7xVzoIqT6KYwqkmWkW4KACncDQ9A/XzLrvw
	NJaq3ukd/SUTWfG97trK4Amc0gFYWqrYmV5FE=
X-Received: by 2002:a05:6a21:7001:b0:38b:e55a:97db with SMTP id adf61e73a8af0-38e6f830415mr5987885637.64.1769239091742;
        Fri, 23 Jan 2026 23:18:11 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:1ce:3fd2:e11e:72d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a42e8ecsm3645344a12.32.2026.01.23.23.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 23:18:11 -0800 (PST)
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
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH] media: i2c: ov02c10: Enforce cool-down period to prevent brownout
Date: Sat, 24 Jan 2026 12:47:51 +0530
Message-ID: <20260124071751.5885-4-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124071751.5885-1-bjsaikiran@gmail.com>
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51447-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CEE137CC92
X-Rspamd-Action: no action

The OV02C10 sensor is susceptible to brownout/latch-up states when
power-cycled rapidly (e.g., within 50-100ms). This often occurs during
userspace interactions like browser WebRTC permissions checks, where
the device is opened, closed, and reopened in quick succession.

When this happens, the regulator discharge is incomplete, and the
sensor fails to perform a clean Power-On Reset (POR). The internal
microcontroller locks up, resulting in I2C timeouts ("failed to set
mode") and necessitating a full system reboot to recover the camera.

To prevent this, implement a mandatory cool-down period. The driver
now tracks the timestamp of the last power-off. If a power-on attempt
occurs within 3 seconds of the last power-off, the driver sleeps for
the remaining duration to ensure physical power rails have fully
discharged and the sensor has completely reset before voltage is
re-applied.

Additionally, standard Power-On-Reset logic is refined:
1. Ensure MCLK is disabled BEFORE regulators during power-off to
   prevent phantom power injection.
2. Assert the reset line (hold low) throughout the regulator ramp-up
   phase to prevent indeterminate states.

Testing Results (10 rapid cycles each):
1. 900ms minimum gap:  Failed (brownout/timeout errors)
2. 1500ms minimum gap: Failed (intermittent failures)
3. 2000ms minimum gap: Reliable (0 failures in 50+ test cycles)
4. 3000ms minimum gap: Reliable (excessive, 2s is sufficient)

The 3-second check window with 2-second minimum enforcement provides
the optimal balance between reliability and responsiveness.

Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 63 +++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index db191dccff75..7e9454e8540c 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -389,6 +389,9 @@ struct ov02c10 {
 	/* MIPI lane info */
 	u32 link_freq_index;
 	u8 mipi_lanes;
+
+	/* Power cycling rate limit */
+	ktime_t last_power_off;
 };
 
 static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
@@ -616,6 +619,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
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
@@ -670,12 +680,25 @@ static int ov02c10_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
+	/* 1. Assert Reset */
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
 
+	/* 2. Disable Clock (Stop sensor state machine) */
+	clk_disable_unprepare(ov02c10->img_clk);
+	usleep_range(1000, 1500);
+
+	/* 3. Disable Power */
 	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
 			       ov02c10->supplies);
 
-	clk_disable_unprepare(ov02c10->img_clk);
+	/*
+	 * 4. Discharge Wait
+	 * Wait for regulators to fully discharge before returning.
+	 * This delay ensures clean power cycling.
+	 */
+	usleep_range(50000, 55000);
+
+	ov02c10->last_power_off = ktime_get();
 
 	return 0;
 }
@@ -685,26 +708,48 @@ static int ov02c10_power_on(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
+	s64 delta_us;
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
-		return ret;
+	/*
+	 * Mandatory Cool-Down:
+	 * If the camera was powered off within the last 3 seconds, ensure at least
+	 * 2 seconds have elapsed to allow full regulator discharge and sensor reset.
+	 * This prevents brownouts during rapid open/close/open sequences.
+	 */
+	delta_us = ktime_us_delta(ktime_get(), ov02c10->last_power_off);
+	if (delta_us < 3000000) {
+		dev_dbg(dev, "Enforcing %lld us cool-down period\n", 2000000 - delta_us);
+		fsleep(2000000 - delta_us);
 	}
 
+	/*
+	 * Standard Power-Up Sequence:
+	 * 1. Enable Regulators
+	 * 2. Enable Clock
+	 * 3. Release Reset (with ample boot time)
+	 */
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
 				    ov02c10->supplies);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable regulators: %d", ret);
-		clk_disable_unprepare(ov02c10->img_clk);
 		return ret;
 	}
 
+	ret = clk_prepare_enable(ov02c10->img_clk);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable imaging clock: %d", ret);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
+		return ret;
+	}
+
+	/* Wait for power/clock to stabilize */
+	usleep_range(5000, 5500);
+
 	if (ov02c10->reset) {
-		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(5000, 5500);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(20000, 21000);
+		usleep_range(80000, 85000);
 	}
 
 	return 0;
-- 
2.51.0


