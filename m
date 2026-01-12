Return-Path: <linux-media+bounces-50463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B63D127DB
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 13:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1CE55304A960
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5167E242D7C;
	Mon, 12 Jan 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b="BDHMHnJ8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [93.188.205.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8D6357729;
	Mon, 12 Jan 2026 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.205.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220106; cv=none; b=WtqlilAbXR8HikzkrqxSIqzy7apAOhtLL3CFMS7VTOHbe3tdUowc4H+ZzKTiHKi7KZam0LeCM5zy90R+PjnuLPgTpd/0dnLmijxEFoSyeiQ5IfuPaVr/xEcFC+IzrUnN7JTwH8ma2rlqk3abgxH27TGHYTXiTz/a2Ya1F4O8FL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220106; c=relaxed/simple;
	bh=TrxqcYqosusx3z/UbaVA6l6OPDcl2cGqeX7pIJvYw6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pdo9Tza9BubCTTmcH2E6JRtUO0KNglgW1RV3SRRsXJr1w5AFQ0FdkgltDSGT5aRvxV1Q9HHgN/T7t/qSsVBTE3SSQMTNhRfJDqsfJrU8VbAxVgL6Vo1Th88pcJZZf9ABVNFffSXaD/HRdrGhtmjIs+k9sL4+7doFD1F305qBYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b=BDHMHnJ8; arc=none smtp.client-ip=93.188.205.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1768219726;
	bh=TrxqcYqosusx3z/UbaVA6l6OPDcl2cGqeX7pIJvYw6o=;
	h=From:To:Cc:Subject:Date:From;
	b=BDHMHnJ85E79i3rbaZw1HVEUxkO8KB5KTyVBObpeHQ9o8UXKroU3+EKgxVc/OnZtJ
	 Kbqy+elP/BhlLrFoeM+zFmPWUKB5Y81TjjRPpwXZ9b+6Souqa6pnp+PzZ1d+738mKt
	 t7vC8n7x+EupRjB9JBkYySUJGpb3YNEiutW1f+lWDt2W6E4u5KUwPr4JLUhX1pVm9v
	 smU82hnQMcx5OfRwU6GKAq8Q3TrVJK3hXDEHfTzoX8jPrph7m9ICllGkFTeEojCe0N
	 tRu4rmdnqmMY6iQ88SOYLvu0e20GgdHQWt7aYzJ0p9ClqaHEH0QIp37MSHlY4muOA6
	 nhHiqNkmb+cMQ==
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 60C301F4E5;
	Mon, 12 Jan 2026 15:08:46 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Mon, 12 Jan 2026 15:08:44 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.ru.astracloud.ru (unknown [10.198.25.116])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4dqWNn4Q25zSgqV;
	Mon, 12 Jan 2026 15:08:09 +0300 (MSK)
From: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
To: Hans de Goede <hansg@kernel.org>
Cc: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] media: staging: atomisp: remove unnecessary NULL checks in sensor drivers
Date: Mon, 12 Jan 2026 15:07:49 +0300
Message-Id: <20260112120749.90664-1-mdmitrichenko@astralinux.ru>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: mdmitrichenko@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 86 0.3.86 47cb2a3d3f5c7e795bff2d0998e8c196722872ab, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;new-mail.astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 199427 [Jan 12 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2026/01/12 07:47:00 #28107568
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1

There are unnecessary NULL checks for v4l2_subdev_format::format
pointer in ov2722 and gc2235 sensor driver format operations.
The fmt pointer is derived from &format->format where format
is a pointer to an embedded struct v4l2_mbus_framefmt inside
struct v4l2_subdev_format, therefore fmt cannot be NULL.

Remove unnecessary NULL checks for v4l2_subdev_format::format
pointer to avoid unnecessary computations and make code
clearer.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Mikhail Dmitrichenko <mdmitrichenko@astralinux.ru>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc2235.c | 5 -----
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 6050637a0def..98d43b93a3ba 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -535,8 +535,6 @@ static int gc2235_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 
 	mutex_lock(&dev->input_lock);
 	res = v4l2_find_nearest_size(gc2235_res_preview,
@@ -577,9 +575,6 @@ static int gc2235_get_fmt(struct v4l2_subdev *sd,
 	if (format->pad)
 		return -EINVAL;
 
-	if (!fmt)
-		return -EINVAL;
-
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
 	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index a4519babf37d..aaf30f072ad5 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -635,8 +635,6 @@ static int ov2722_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 	ov2722_info = v4l2_get_subdev_hostdata(sd);
 	if (!ov2722_info)
 		return -EINVAL;
@@ -705,8 +703,6 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 
 	if (format->pad)
 		return -EINVAL;
-	if (!fmt)
-		return -EINVAL;
 
 	fmt->width = dev->res->width;
 	fmt->height = dev->res->height;
-- 
2.39.2


