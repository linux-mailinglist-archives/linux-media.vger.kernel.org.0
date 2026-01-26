Return-Path: <linux-media+bounces-51521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF6nBn4Hd2lGawEAu9opvQ
	(envelope-from <linux-media+bounces-51521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 07:19:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB2846EE
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 07:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E79305FCBF
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4EF26F291;
	Mon, 26 Jan 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7Za7FJj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5828C26A08F
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408145; cv=none; b=jN0nh8mWxpOSFYxgvqKZ+Pn5tCIxYKqJUdz4mT6DWMr0iAJ6+BItn8qkZ0mVXbIOzlx8Nw8Il0hU11WYJ62cJjGHVkNFi/1BxUJf6WvV+p9drf9xox5FbJzvaLMFVL0N/G66kvC3gtnpTZnr32Qz+iTSSZOQMcdY43Pq37HTddo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408145; c=relaxed/simple;
	bh=MPxLt7/tXrlo8zKyLHDM89n9EE2I71La6bkx+2LGojk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGGWSTypHuthmaWDoLZbsXXcOMsrT4M1ASAS9mRNh3PmNjQI6860NtYlSGqB1ARUNm+lm9XfF/4vB3JZlBN0Rw2J/4cp16fEzzvexIGgbHDgrEACVCHMLvyz/CbUHyDcJJO6vTQ2fq2Uhsys0XT43NEHLA2/OHbswsFOd+SXCic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7Za7FJj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82307c6902eso1801189b3a.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 22:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769408142; x=1770012942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a26PVSg2s1zCkYdz5QXB8nugoY0+QBmne9i7+GQ+2tI=;
        b=l7Za7FJjqvC7KkDGEB4RdBIJip++zHaoNAKug4ZWHKE+xa8rlwRbSI/yg4vyg1Wk6U
         8WMd0Xs6pJIryKkSsh4n4Yh4vcNEygoc6bbKaZmnfAxsu82DEptU8eXW8M8Ut7sE2UYg
         ZHBJlvcucpIPv3KXZBziLfO8ChKQMSQheUNRBw+qbo09OZ3aHpUzNdyjIyLh7pnLVsyr
         EXUdG9y7kHcgxxt+yGnR9Pkp1R9dfIaJk8Qg5SauJnk0ajF9+tItDMe8HZ7DFWoqSwHC
         yEgF8tODHJXgP/AYSd4leCMll3uL5S72OeJzYQtmt5dx6VbkNc+gnG7ueqKIx39sWHqR
         BmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408142; x=1770012942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a26PVSg2s1zCkYdz5QXB8nugoY0+QBmne9i7+GQ+2tI=;
        b=MkeZVCH04N0OLP7Lbi5MM3XwgTslsdZ/F2DP0DjqSV02gsKToEjDXe/jnHfyftY3mM
         mxpxGiW8W34AiIB82fNE7+x5RKUTFTPxFNW6SUeUEeXi1ujw44fAappXZsGVE8sCyfPa
         h4C52OFScLp/z/YCw+tS5zjy063qDderuVvUOgKOi71FoveKp3+2M8CV8Vk677IXfJrJ
         k/6DvD59xwt5+RnjSMooCNIAMwCkhEjcrEudTvoulBy7NXJmwdsE8YP03pLQfeKRFzpL
         gDMH00lTJAErkEznPK1L7juv6PpkY0WvhpisNyyu8Ud7oPT1DBFHKFdEjOKElXlBrpmu
         ZflQ==
X-Gm-Message-State: AOJu0YwCMyNIeJfubH6hvrnRVEX3bmcbXAfSvit7Kfo9N+6dlFsdSNr/
	XP1Cs4fKniOTgd1ac6rcCs5lv8fKCG69+8KFNMW/cWRtizTBK8Jmwx3jm3M+WJFm
X-Gm-Gg: AZuq6aI/2w4xqsgnMTWcPcuxd95RLj0EtMOZxTiRnXh0q/NdD/EHa8gzYt8WeP5Gcu3
	VYX3+Sx2i6msI64gduRg40OMmWVQhwt02yJnPouZoh8dnfAjFjXuo0Sh69Loi5dQQF62CLmITzM
	wKDoxNirOa3y9TPqtkuBZ26hO750e2X4mJMPrSzHdM7jv5nppkPWNDZgTXxtDGkzECg9/62WwmD
	zBsjhhWCj8NTNHR9q8wuW1hGzEXpUq8fh+h3EtT2gFqiRGpfxK+ah7+lpMm21EF7e2VaqAKVTsy
	w+IPrZyyOWs9rAN6qb1ezHec28U3YY+3v9Zxv3dmCgYPtdStzuVw8Rfb6/Tg03DK5Hz46DumiKP
	mxfYsmX166gxQ0MtfIrC3ARjsqfDCiSqbdLuuauZpnRAVZtWxjrQADci/XxLhc2C4IVPVNRpc1/
	uajNi0SdtqSEkXBUmO/jKIWNgJTEoOoCdjClnwMDyitRsjPEY=
X-Received: by 2002:a05:6a00:8019:b0:81f:46ba:1817 with SMTP id d2e1a72fcca58-82341317dbfmr3033161b3a.66.1769408142128;
        Sun, 25 Jan 2026 22:15:42 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:9b36:8e2c:6fb6:590b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823187716ebsm8543796b3a.66.2026.01.25.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:15:41 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] media: i2c: ov02c10: Keep power on and use reset for power management
Date: Mon, 26 Jan 2026 11:45:28 +0530
Message-ID: <20260126061528.63785-2-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126061528.63785-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
 <20260126061528.63785-1-bjsaikiran@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51521-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABBB2846EE
X-Rspamd-Action: no action

The OV02C10 sensor was experiencing brownout conditions during rapid
power cycles (e.g., browser WebRTC permission checks) on Qualcomm
platforms, causing the sensor to lock up and require a system reboot.

Root cause:
The Qualcomm RPMh regulator driver does not support active discharge,
requiring regulators to passively discharge via leakage current. This
takes 2+ seconds on X1E80100 platforms. Without complete voltage
discharge, the sensor's internal microcontroller does not fully reset,
leading to I2C timeouts and a locked state.

Solution:
Instead of power cycling the regulators, keep them continuously enabled
and use reset signals to control the sensor state:

- power_off(): Assert hardware reset GPIO (keep regulators/clock ON)
- power_on(): Release hardware reset + trigger software reset via
  register 0x0103 (standard OmniVision software reset)

This approach:
- Eliminates the 2+ second discharge delay
- Enables instant camera reopening (~17ms vs 2.3s)
- Properly resets the sensor state machine via reset signals
- Maintains correct power sequencing on first initialization
- Follows OmniVision sensor conventions (0x0103 software reset)

The first power-on still performs full regulator and clock
initialization. Subsequent power cycles only toggle reset signals,
avoiding the discharge delay entirely.

Tested on Lenovo Yoga Slim 7x (X1E80100) with rapid camera open/close
cycles - no brownouts or lockups observed.

Fixes: 44f89010dae0 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 119 +++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 7e9454e8540c..08d268de60ec 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -22,6 +22,8 @@
 #define OV02C10_CHIP_ID			0x5602
 
 #define OV02C10_REG_STREAM_CONTROL	CCI_REG8(0x0100)
+#define OV02C10_REG_SOFTWARE_RESET	CCI_REG8(0x0103)
+#define OV02C10_SOFTWARE_RESET_TRIGGER	0x01
 
 #define OV02C10_REG_HTS			CCI_REG16(0x380c)
 
@@ -390,8 +392,8 @@ struct ov02c10 {
 	u32 link_freq_index;
 	u8 mipi_lanes;
 
-	/* Power cycling rate limit */
-	ktime_t last_power_off;
+	/* Power management: track if regulators are enabled */
+	bool powered;
 };
 
 static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
@@ -680,25 +682,16 @@ static int ov02c10_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 
-	/* 1. Assert Reset */
-	gpiod_set_value_cansleep(ov02c10->reset, 1);
-
-	/* 2. Disable Clock (Stop sensor state machine) */
-	clk_disable_unprepare(ov02c10->img_clk);
-	usleep_range(1000, 1500);
-
-	/* 3. Disable Power */
-	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
-			       ov02c10->supplies);
-
 	/*
-	 * 4. Discharge Wait
-	 * Wait for regulators to fully discharge before returning.
-	 * This delay ensures clean power cycling.
+	 * Keep regulators and clock ON to avoid discharge delay.
+	 * Just assert hardware reset to put sensor in reset state.
+	 * This allows instant power-on without waiting for regulator discharge.
 	 */
-	usleep_range(50000, 55000);
+	if (ov02c10->reset)
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
 
-	ov02c10->last_power_off = ktime_get();
+	/* Keep clock running - sensor needs it for software reset */
+	/* Keep regulators enabled - avoids 2.3s discharge delay */
 
 	return 0;
 }
@@ -708,50 +701,63 @@ static int ov02c10_power_on(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
-	s64 delta_us;
 
 	/*
-	 * Mandatory Cool-Down:
-	 * If the camera was powered off within the last 3 seconds, ensure at least
-	 * 2 seconds have elapsed to allow full regulator discharge and sensor reset.
-	 * This prevents brownouts during rapid open/close/open sequences.
+	 * On first power-on, do full initialization.
+	 * On subsequent power-ons, regulators/clock are already on,
+	 * so we just need to release reset and do software reset.
 	 */
-	delta_us = ktime_us_delta(ktime_get(), ov02c10->last_power_off);
-	if (delta_us < 3000000) {
-		dev_dbg(dev, "Enforcing %lld us cool-down period\n", 2000000 - delta_us);
-		fsleep(2000000 - delta_us);
+	if (!ov02c10->powered) {
+		/* First time: enable everything */
+		if (ov02c10->reset) {
+			gpiod_set_value_cansleep(ov02c10->reset, 1);
+			usleep_range(2000, 2200);
+		}
+
+		ret = clk_prepare_enable(ov02c10->img_clk);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable imaging clock: %d", ret);
+			return ret;
+		}
+
+		usleep_range(2000, 2200);
+
+		ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
+					    ov02c10->supplies);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable regulators: %d", ret);
+			clk_disable_unprepare(ov02c10->img_clk);
+			return ret;
+		}
+
+		ov02c10->powered = true;
 	}
 
-	/*
-	 * Standard Power-Up Sequence:
-	 * 1. Enable Regulators
-	 * 2. Enable Clock
-	 * 3. Release Reset (with ample boot time)
-	 */
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
-				    ov02c10->supplies);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable regulators: %d", ret);
-		return ret;
+	/* Release hardware reset */
+	if (ov02c10->reset) {
+		/* Ensure reset was asserted for at least 2ms */
+		usleep_range(2000, 2200);
+		gpiod_set_value_cansleep(ov02c10->reset, 0);
+		/*
+		 * Wait for sensor microcontroller to stabilize after reset release.
+		 * 50ms prevents black frames during rapid power cycling by ensuring
+		 * the sensor's internal state machine is fully initialized before
+		 * software reset and register configuration.
+		 */
+		msleep(50);
 	}
 
-	ret = clk_prepare_enable(ov02c10->img_clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to enable imaging clock: %d", ret);
-		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
-				       ov02c10->supplies);
+	/* Perform software reset to ensure clean state */
+	ret = cci_write(ov02c10->regmap, OV02C10_REG_SOFTWARE_RESET,
+			OV02C10_SOFTWARE_RESET_TRIGGER, NULL);
+	if (ret) {
+		dev_err(dev, "failed to send software reset: %d", ret);
 		return ret;
 	}
 
-	/* Wait for power/clock to stabilize */
+	/* Wait for software reset to complete */
 	usleep_range(5000, 5500);
 
-	if (ov02c10->reset) {
-		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(80000, 85000);
-	}
-
 	return 0;
 }
 
@@ -924,6 +930,19 @@ static void ov02c10_remove(struct i2c_client *client)
 		ov02c10_power_off(ov02c10->dev);
 		pm_runtime_set_suspended(ov02c10->dev);
 	}
+
+	/* Clean up regulators/clock if still enabled */
+	if (ov02c10->powered) {
+		/* Assert reset before disabling power for clean shutdown */
+		if (ov02c10->reset)
+			gpiod_set_value_cansleep(ov02c10->reset, 1);
+
+		clk_disable_unprepare(ov02c10->img_clk);
+		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
+				       ov02c10->supplies);
+		ov02c10->powered = false;
+	}
+
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
-- 
2.51.0


