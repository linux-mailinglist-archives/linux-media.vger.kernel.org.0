Return-Path: <linux-media+bounces-14529-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03E923EAA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 15:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AA7FB22098
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 13:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37B61B47C0;
	Tue,  2 Jul 2024 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="scwfPmS1";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="OGwEOZ8T"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AE41B47B0;
	Tue,  2 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926251; cv=none; b=U24dKV4B8swIZSDK5yT/ff2vhj+5zffKgSN1RxKmmEQnRD82j5UaFtOZTB2+KY0W+3c6D+HYFhxRm8Rvedo2DuucRhAq7EAd80ou61GMYZopBD/j5hcshhoYTt15ig1MyXlsiQnvtOjpB0LjCtqNRSoaaqvZ008vkO1wQGYSnKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926251; c=relaxed/simple;
	bh=09ay23XCwOzUyA7BLTEjSvUFpkRNBr4tnF64rIfEiG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZUzvwdwfP6fsTrFeQfmSatUBRm9Rx4wBjYyr3cWQs2d7ONpUblDKdWzAbM32GR388/Dd8hFu0IGzYHGTNUV5bOMRAxJr5+oN5aIgLJZiUc8wb0zelHeoJdh1/MFY/wIs0mwpcuwPoLfGZYCbDnI5VR+6j+UcPlV+BuYWBy3lps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=scwfPmS1; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=OGwEOZ8T; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1719926241; bh=09ay23XCwOzUyA7BLTEjSvUFpkRNBr4tnF64rIfEiG8=;
	h=From:To:Cc:Subject:Date:From;
	b=scwfPmS1HpLhSZWeaqB3jphFpv3gfVWFQriE7QQJoO/M2dMDX2Ryirh2bkZZKzdKA
	 1BpAZ/YJsx51Kk2daHgWVs7MxYBdSLVTM97U7M1cT+KDhPujucn8ST0lMqLXWKD3jk
	 5TAVTg0KzsAn20+T5SZD6sCozjZ1gYt1WGKiYw/oSKkiRD7XOt52Ejwn7SkrbKfa1A
	 XwICjFZF76nfq/VSJeJsLTRAUEn739BzA1xC+k0n+0Hgwb0zsKX06XMT/smyxmHEph
	 DPWM50DO9MFgdOZucqt2XKfSCnMtuhoJa1sP1I2NTzIgz7ecQIbYAkQyC/8ZYrPdMC
	 OE86gHhdy9TNw==
Received: by gofer.mess.org (Postfix, from userid 501)
	id A9E7E10029F; Tue,  2 Jul 2024 14:17:21 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1719926240; bh=09ay23XCwOzUyA7BLTEjSvUFpkRNBr4tnF64rIfEiG8=;
	h=From:To:Cc:Subject:Date:From;
	b=OGwEOZ8ThNX8/q6cQJ/AU/d209gMXox6qx2NdfMeHTJiyMLyijGzgbLDyYQh71UdQ
	 5+uuGVW5Zfo78Bz/hbcjVp/mKU6IZWRLiaLh6/xJNGUUb9UDrkGUnGX8YeqWCc96oq
	 iujbczd4Y3lg6/M5wvXcmKTLM7URjKnbYeT1i+B9ErmL2HdDqDXFbJb/abpjukEGVo
	 3kbFZvikiHSt6FP8aK1J4l5iGuOBrxRzANq4K2/oG251kaIfvY0GeobBglYm/FZOc1
	 WFH1GWwOvvRRPiNRHbWqgR0b6SZ5bAh5dbCQydIhRouNwMcr6AZEugfh6gsEHu86zh
	 4E0/KEPzac4BQ==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id 04DD3100074;
	Tue,  2 Jul 2024 14:17:20 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: rc: remove unused tx_resolution field
Date: Tue,  2 Jul 2024 14:17:02 +0100
Message-ID: <20240702131705.1073761-1-sean@mess.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tx_resolution field is never read. In theory you can imagine this
field being useful for detecting whether the transmitter has the
resolution for the message you are trying to send, but I am not aware of
any hardware where this could be an issue.

Just remove.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ene_ir.c      | 3 ---
 drivers/media/rc/ite-cir.c     | 1 -
 drivers/media/rc/rc-loopback.c | 1 -
 include/media/rc-core.h        | 2 --
 4 files changed, 7 deletions(-)

diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index 11ee21a7db8f0..67722e2e47ff7 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -451,9 +451,6 @@ static void ene_rx_setup(struct ene_device *dev)
 		dev->rdev->max_timeout = 200000;
 	}
 
-	if (dev->hw_learning_and_tx_capable)
-		dev->rdev->tx_resolution = sample_period;
-
 	if (dev->rdev->timeout > dev->rdev->max_timeout)
 		dev->rdev->timeout = dev->rdev->max_timeout;
 	if (dev->rdev->timeout < dev->rdev->min_timeout)
diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index fcfadd7ea31cf..2bacecb022623 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1380,7 +1380,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	rdev->timeout = IR_DEFAULT_TIMEOUT;
 	rdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
-	rdev->tx_resolution = ITE_BAUDRATE_DIVISOR * sample_period / 1000;
 
 	/* set up transmitter related values */
 	rdev->tx_ir = ite_tx_ir;
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index b356041c5c00e..8288366f891fc 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -230,7 +230,6 @@ static int __init loop_init(void)
 	rc->min_timeout		= 1;
 	rc->max_timeout		= IR_MAX_TIMEOUT;
 	rc->rx_resolution	= 1;
-	rc->tx_resolution	= 1;
 	rc->s_tx_mask		= loop_set_tx_mask;
 	rc->s_tx_carrier	= loop_set_tx_carrier;
 	rc->s_tx_duty_cycle	= loop_set_tx_duty_cycle;
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 803349599c272..d095908073ef9 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -127,7 +127,6 @@ struct lirc_fh {
  * @min_timeout: minimum timeout supported by device
  * @max_timeout: maximum timeout supported by device
  * @rx_resolution : resolution (in us) of input sampler
- * @tx_resolution: resolution (in us) of output sampler
  * @lirc_dev: lirc device
  * @lirc_cdev: lirc char cdev
  * @gap_start: start time for gap after timeout if non-zero
@@ -194,7 +193,6 @@ struct rc_dev {
 	u32				min_timeout;
 	u32				max_timeout;
 	u32				rx_resolution;
-	u32				tx_resolution;
 #ifdef CONFIG_LIRC
 	struct device			lirc_dev;
 	struct cdev			lirc_cdev;
-- 
2.45.2


