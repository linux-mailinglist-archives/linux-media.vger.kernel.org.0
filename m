Return-Path: <linux-media+bounces-51704-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC73DUjteGkCuAEAu9opvQ
	(envelope-from <linux-media+bounces-51704-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:52:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E16A797FE4
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 17:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B66253049EE7
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D932363C55;
	Tue, 27 Jan 2026 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lau6TCtt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB43363C40
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532657; cv=none; b=Y3oxeEXmmiNiTjZCNsRXMLiSTorC4Wj5P1Eh0LsMYB5bQbptdInomMxfq+IeiukFq/UXeWmPx/L/kk6niSjKAQA30U8Z7I6lJt+B+WeuOBL3smk05x2L8wgk7X2qKIBKxSacq1g6ApKi+Jt3+0dITaRppAFtz447DLir23Tupa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532657; c=relaxed/simple;
	bh=nuy9kCIcT6D2JU2yrVi1wvj+w0vJ76rxXT7o2vo9aSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8rlpUao8uelbfG2ZAjgwGvpEDl2d7tUVhPkz/luFJuOr251QO6wla5LyzOy+FxzDIgY4OtjiAkKKwHXHAx4R1H2A0TrhvLvhAmxRo37H+xT3g5xpq1KoWh354wXD1sHI5o2am9JroqNvWrz2ZKOEd2OVzD3uF4zUY1/DI1p2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lau6TCtt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so62029805ad.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 08:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532655; x=1770137455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BKn4aFL+2s1aT9WYTZvpY1Tv/MFVpnlV48wAgQcplo=;
        b=Lau6TCttDiAvq1/mIDoYn9UZEi1GT1qTVdLNU0rmEXsr5hMuS2BQwEpDMl7hLZnga+
         vQ1gBY4Kuc1M7MPiPKEN9BhhFKMEpeMfus5Wu5wW2eNjpQvc31tTNT6HPrff+RRhyL0a
         Tgib6kOvBoi5r2g+GbtEkXexZODoOw5CJksV10Yww1FnzCDXAznpn95yqn6UUVdyT+Xf
         44tbGYEHpfR+/lhcOz44HGj+FQtb4n6DH7pnoQrdtImPFwAuYa8sUcbUP7LPMfpkxd7X
         tu9L95oKFBRHlKBUUN97f3mBnp/4FOLS2vL21X+rIrsdhlpk/TsuiGDtdLpHkxw7cYd7
         tAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532655; x=1770137455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BKn4aFL+2s1aT9WYTZvpY1Tv/MFVpnlV48wAgQcplo=;
        b=PLEYkNRR74zCoHcxb/kKgBFwHSVrwYKmAeP6XYNB6w0DqNgDFz6Wsws+5ALTIqZ+A5
         SpEs8WuBEmZ/aPq+kuzwjXKjllbtJl9Ov/2GI0/ku5L2vCOA6osMVqWUpMyOXodNUD5C
         JgIz98kyGRxhWpnz1t1QnwYrdROIoGLc6w8jpxzkBlPNlbk74GdWqGq2TCAwCdYeDcrz
         Dx3w/KaA1Ra8Q12riY+eJrbyVmrNBjpO8785PpCDafzKpM17hmavI5YpV3k0ma0+9REU
         LoYRgFPypwzJelyZLIorX6V/Z5InPu29p1CRxndSuSvzQ2rKvojL6wagCFzGid1yEIdp
         +sDQ==
X-Gm-Message-State: AOJu0YxdcVbgAl/QsHK/btyQw0S/f+U8eCsL2arEdzsyDTCqSdf4l4Yu
	cFMvcFRh1Tlq9EMZ5BAcd1+v0eO2mzvvLFsUC0KXFaP2Yr9vNoyCDCutD+z2dwXB
X-Gm-Gg: AZuq6aJL5ra+5DdtpRf8jtjE6jH84+0FSC8HLA3JykZE98/uem0YsSZrp8J0Zfux0Rs
	bnnPU1fTRAaSwMo/C68QU1k7Oc5mNAsalahy14/9MqjLcPgL/ZDBItq3nt/9NtBpZEZLEjsNzl/
	V5cwxW/+hD4SqA7V2vYbjBrpZ+m1zK+qFbWixZb7las6M0jPH/T6G7jQM8iC1Lz1h9Kia6aI9Yo
	5Ifg/kdtSFUcaSozULIdVVQC7Ew2+gg33dDFyGf+gFayHcdElX5WNMpOxzJ3i/jLZpdXvtb6KXC
	B4MPvI8J9cRhAsvUjmsMENzS51Qo9WSQ2gVqnqptTCn8Gda3n1lKg9dE9Ke1C9+PyA8JH2Uw38u
	kzktft+HKoyZGvNlfLHHNrFUD9SB8e5zeq6nzk61zkNPc/RXA8mPwkqJjf5LCo5fiMtOaonUKTZ
	c8AU+KusqzlJHPEFzDkUeWqEngkC79NXwBOZWcAcjLC8uQqA==
X-Received: by 2002:a17:903:3504:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a870e18902mr23308865ad.32.1769532654708;
        Tue, 27 Jan 2026 08:50:54 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa46fsm120318675ad.21.2026.01.27.08.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:50:54 -0800 (PST)
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
Subject: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and timing
Date: Tue, 27 Jan 2026 22:20:24 +0530
Message-ID: <20260127165024.46156-3-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127165024.46156-1-bjsaikiran@gmail.com>
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-51704-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E16A797FE4
X-Rspamd-Action: no action

The previous power-on sequence did not strictly follow the hardware timing
requirements (T1), potentially leading to initialization failures on some
platforms.

Update the sequence to match the datasheet and maintainer recommendations:
1. Assert XSHUTDOWN (reset) for 5ms (T1 >= 5ms) before enabling power
   resources.
2. Enable clock and regulators in the standard order.
3. De-assert XSHUTDOWN.
4. Wait 5ms (T2 >= 5ms) for sensor boot before I2C access (using a wider
   range for timer coalescing).

This ensures the sensor enters a clean state during cold boot.

Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
Fixes: 44f8901 ("media: i2c: add OmniVision OV02C10 sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Saikiran <bjsaikiran@gmail.com>
---
 drivers/media/i2c/ov02c10.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index fa7cc48b769a..3bfbd0deb126 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -676,6 +676,12 @@ static int ov02c10_power_on(struct device *dev)
 	struct ov02c10 *ov02c10 = to_ov02c10(sd);
 	int ret;
 
+	/* Assert reset for 5ms to ensure sensor is in reset state */
+	if (ov02c10->reset) {
+		gpiod_set_value_cansleep(ov02c10->reset, 1);
+		usleep_range(5000, 6000);
+	}
+
 	ret = clk_prepare_enable(ov02c10->img_clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable imaging clock: %d", ret);
@@ -691,10 +697,8 @@ static int ov02c10_power_on(struct device *dev)
 	}
 
 	if (ov02c10->reset) {
-		/* Assert reset for at least 2ms on back to back off-on */
-		usleep_range(2000, 2200);
 		gpiod_set_value_cansleep(ov02c10->reset, 0);
-		usleep_range(5000, 5100);
+		usleep_range(5000, 5500);
 	}
 
 	return 0;
-- 
2.51.0


