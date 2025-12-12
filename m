Return-Path: <linux-media+bounces-48701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E5CB8D32
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 13:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B27A3066DFA
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3671F757EA;
	Fri, 12 Dec 2025 12:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b="ns+NP5c8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-gw02.astralinux.ru (mail-gw02.astralinux.ru [93.188.205.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56995173;
	Fri, 12 Dec 2025 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.205.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765543535; cv=none; b=FaxzocMaQupJ7wAeUi2y4uPa/KAgLndS8FltsHcrjec6NgK9NofK/E2wk0SnAxH5aKjBIDfNK7/IrX4O/c09dNePIjtp0WrfeBvpkFj587LjE+AHYOIKFpduv0hrR/+8pyLM1WGIoWwUOob5krTYlXryQFv0wge0oXaIcNpi1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765543535; c=relaxed/simple;
	bh=CQgIr5eFzozroxxTWjH25swNTkG1KEut38JnPYbwLvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tVrkojI4Sh7X2Pgb+f+0DDlg2vsrgztv02PPI79yaWkBL3PlRDHSlRaZ82VpGkLrJvybqaa96nMRmL7lPsYNbpJasEf/XPoXM4OzL9ZL+x2wRDIRV1UzIAud+chPn5IVk6LAaAA1CEKDU+NZ9GsgLmd6FWHHanxtz6spNgdAWt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; dkim=pass (2048-bit key) header.d=astralinux.ru header.i=@astralinux.ru header.b=ns+NP5c8; arc=none smtp.client-ip=93.188.205.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=astralinux.ru;
	s=mail; t=1765543153;
	bh=CQgIr5eFzozroxxTWjH25swNTkG1KEut38JnPYbwLvc=;
	h=From:To:Cc:Subject:Date:From;
	b=ns+NP5c8yEFWiJgo1lqJAn7dtCIE7wAocMSpXG4JCPcRaEhNv/CdWzut/DcrCQApR
	 63Os41rf7vJv1aBqbdrX8W/rRpp2dbyhqq9oNgtZwWR8XCOHr0PSw1y+S07KIzwO0G
	 TF6MVtGBFUqklZdJGhvbfM+WCwEETtDEcqomp4DISjeNNjLAj0J36+l7tn+voZDul2
	 mP03xAYNv5fhQso9gvwsBQ7Z17z52rd1STWZZQL2YDE9TuJ3FP1wZv7+V/WcywCY+E
	 Qmvec8JZ6FdJn3/BgAfWr63VwtApaqzGfxzNdp443QCwE+0/hqzYePrB2Kz3+FIdLH
	 awNPCtRQflmsw==
Received: from gca-msk-a-srv-ksmg01 (localhost [127.0.0.1])
	by mail-gw02.astralinux.ru (Postfix) with ESMTP id 0D9A91FA17;
	Fri, 12 Dec 2025 15:39:13 +0300 (MSK)
Received: from new-mail.astralinux.ru (unknown [10.205.207.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
	Fri, 12 Dec 2025 15:39:11 +0300 (MSK)
Received: from rbta-msk-lt-169874.astralinux.ru.astracloud.ru (unknown [10.198.22.24])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4dSTXr6CVBzwPGy;
	Fri, 12 Dec 2025 15:39:08 +0300 (MSK)
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
Subject: [PATCH] media: staging: atomisp: remove unnecessary NULL checks in sensor drivers
Date: Fri, 12 Dec 2025 15:38:14 +0300
Message-Id: <20251212123814.78238-1-mdmitrichenko@astralinux.ru>
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
X-KSMG-AntiSpam-Info: LuaCore: 84 0.3.84 c2f198c3716e341b2aaf9aead95378b399603242, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 198942 [Dec 12 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2025/12/12 10:26:00 #28051895
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

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
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


