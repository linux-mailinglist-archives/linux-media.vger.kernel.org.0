Return-Path: <linux-media+bounces-17066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C6963A06
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 07:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F101F22B8F
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 05:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D50C1494C3;
	Thu, 29 Aug 2024 05:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckNrZli2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D2A92D;
	Thu, 29 Aug 2024 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724910561; cv=none; b=SRTMFjDFUYzj5LjDt6xV+/rnlOue0qSoiiB2cWyI+KD/BEDPZTsrETBzdo6ehnC9h972yVSNEjiG9JXkcYj71rXiMIkLzuGE4pGUb4RB3dLeES8iSBxnBlgDMObCy9vIBlI9fffIOoxX169qlsSx7B/SChVklFWuwmv7onWKyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724910561; c=relaxed/simple;
	bh=+ORoHkwu8yc9FC2/cRB8bR+JZlYlWk6e4n/Y+1kLbZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmeaGZpAvot3a8hd87HfPAvZmuW+/Nmv399sKRg4oI1v1HzslcH4rrjTZTUpiFCIqn//Yb5xTRVPj9SqNdjgGKAF21Ymj1auFbvhK88PRuiCOqrQuth6D9nY7dii1CbC4JBiQEIxSdd4zB7tpjZUcdFXbPkHoGG/rDmfMbAjql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckNrZli2; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53349d3071eso289857e87.2;
        Wed, 28 Aug 2024 22:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724910557; x=1725515357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lf+70dzVNc7+ZcuFEI6sBcacID86FK+qx4MraBn0nrA=;
        b=ckNrZli2E3oVY87nbZVgy3Eqdx5GtbKFh9MbOFpuQ6BSNRe0uHUtTt7qpLwnPVZZIo
         H4lLM1Z4t2g/2ZVrGONS4QMpRmRbj2RZUADTEkqOuVzl1/jsrDW2J31l0h45Fz4h9xAO
         EkKljdT4ji7esD6N1GcPFjAJnYQbY/D05FK0iv50HWAvdX5kgDGhx2Kg8a0YLPMBFk6H
         6+RVViDEOpSYbqcQ5yo10MoS6PmTUh72mu3wQfKfeK/f83V84D59cBaQAHEGGEbNAJA8
         lZYZiKhYoalPoTed6Kpvif6GdK1RhcyJw+gnH/6OQuTqXsGcrsrF8O+lXb8/U2gO4T1X
         e4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724910557; x=1725515357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lf+70dzVNc7+ZcuFEI6sBcacID86FK+qx4MraBn0nrA=;
        b=eR+VHFxSNF3ucHpamBqI+AxbzAZm2qa/DocaTluXE3n4YrXPrH6bRD2D0XsaEq53rf
         nhA0hQIKzbnWmGhPuXB9iTM0efKyeVSsr888A+43WpumBg4wLeTdDSpuRm0r642nbIk/
         mZUJzoFSjqEVUkm6e/gtuytsjAnLy8t4+ZXM3ZRlHuBn9asNIXCStGt057z5OaYd5yZM
         FxLTuwE3PtXjhPVyLHxVaN84Q9jiz84iZIYFgkIYBrDBfZj+huzHLPSDcVV3fFTLJM9a
         rvQGsNJ2PTMyPeeJpIcxMnhjPHHyrHeP34o4/hC5+t4PQGDs35HT02pl8yPHl13sMX8k
         2nSg==
X-Forwarded-Encrypted: i=1; AJvYcCVRWSUKDKTgvi2ZuDO1lHNSwfi/t5Mup2NUBjsB20zoqUjZAGKbHtDvHf2x47TCtE37xCSWYKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBH/GXsvXC4+wETZHrH6VtLd8x22J2+T4pdWqRDP63UVU6aSmV
	wbbEIpS8dC4A4zmCK95i7We3lwxDMkeEPl/XUeM2hwjJToKMMRKVhCzHS6qUhYw=
X-Google-Smtp-Source: AGHT+IGJiQdMhzeJMjxw+66kB40qbf392T6hHN1f96oKpbOP2FW2B5oOwC7WC4MY/qLVbxiOsI1jWQ==
X-Received: by 2002:a05:6512:33c9:b0:533:ad6:8119 with SMTP id 2adb3069b0e04-5353e569850mr928524e87.14.1724910556670;
        Wed, 28 Aug 2024 22:49:16 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540854ad1sm55961e87.292.2024.08.28.22.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 22:49:16 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ar0521: Use cansleep version of gpiod_set_value()
Date: Thu, 29 Aug 2024 08:48:49 +0300
Message-Id: <20240829054849.4761-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If we use GPIO reset from I2C port expander, we must use *_cansleep()
variant of GPIO functions.
This was not done in ar0521_power_on()/ar0521_power_off() functions.
Let's fix that.

------------[ cut here ]------------
WARNING: CPU: 0 PID: 11 at drivers/gpio/gpiolib.c:3496 gpiod_set_value+0x74/0x7c
Modules linked in:
CPU: 0 PID: 11 Comm: kworker/u16:0 Not tainted 6.10.0 #53
Hardware name: Diasom DS-RK3568-SOM-EVB (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : gpiod_set_value+0x74/0x7c
lr : ar0521_power_on+0xcc/0x290
sp : ffffff8001d7ab70
x29: ffffff8001d7ab70 x28: ffffff80027dcc90 x27: ffffff8003c82000
x26: ffffff8003ca9250 x25: ffffffc080a39c60 x24: ffffff8003ca9088
x23: ffffff8002402720 x22: ffffff8003ca9080 x21: ffffff8003ca9088
x20: 0000000000000000 x19: ffffff8001eb2a00 x18: ffffff80efeeac80
x17: 756d2d6332692f30 x16: 0000000000000000 x15: 0000000000000000
x14: ffffff8001d91d40 x13: 0000000000000016 x12: ffffffc080e98930
x11: ffffff8001eb2880 x10: 0000000000000890 x9 : ffffff8001d7a9f0
x8 : ffffff8001d92570 x7 : ffffff80efeeac80 x6 : 000000003fc6e780
x5 : ffffff8001d91c80 x4 : 0000000000000002 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000001
Call trace:
 gpiod_set_value+0x74/0x7c
 ar0521_power_on+0xcc/0x290
...

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Fixes: 852b50aeed15 ("media: On Semi AR0521 sensor driver")
Cc: stable@vger.kernel.org
---
 drivers/media/i2c/ar0521.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 09331cf95c62..d557f3b3de3d 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -844,7 +844,8 @@ static int ar0521_power_off(struct device *dev)
 	clk_disable_unprepare(sensor->extclk);
 
 	if (sensor->reset_gpio)
-		gpiod_set_value(sensor->reset_gpio, 1); /* assert RESET signal */
+		/* assert RESET signal */
+		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
 
 	for (i = ARRAY_SIZE(ar0521_supply_names) - 1; i >= 0; i--) {
 		if (sensor->supplies[i])
@@ -878,7 +879,7 @@ static int ar0521_power_on(struct device *dev)
 
 	if (sensor->reset_gpio)
 		/* deassert RESET signal */
-		gpiod_set_value(sensor->reset_gpio, 0);
+		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
 	usleep_range(4500, 5000); /* min 45000 clocks */
 
 	for (cnt = 0; cnt < ARRAY_SIZE(initial_regs); cnt++) {
-- 
2.39.1


