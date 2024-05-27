Return-Path: <linux-media+bounces-12000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A248D07C5
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98AC0B3052A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634B4169361;
	Mon, 27 May 2024 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAPMZZcv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928C15FA96;
	Mon, 27 May 2024 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825578; cv=none; b=Slxm2opoCi1SNkvcdqCdizWeG671lH3/UYjvYpJxl9X/7dmpm2nNvyR8WaIHJnCeWceK+zm+a/gUwpLSSS3Mp2781pYrQdq0WuEXba7325ZJkye6hIViujghWRyu7TS1UB53uBN5xYqynZ+HOivOzRKHoNAuXMhBdfgTADSiDlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825578; c=relaxed/simple;
	bh=lq530YYLl1oKtKpevFbJTL2Suxm0G8tV8LMK8XJcrbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MLitUU3W5XMT/aWZhn71Qt9B2AN6Ps0lP5ed5ZlsjkF71yHsbmcV9LCcUxaVDk8I3d8KqTMOQRDF4dRwBczIhTlNaD4F+ksZRLFnBWDKlBAtSrYVOD6SXaEZMbJfF0hKxR30W79WGfpc4anx8ALKVVgC3Klzf3sPSlnZnEsNz1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAPMZZcv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605F8C2BBFC;
	Mon, 27 May 2024 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825578;
	bh=lq530YYLl1oKtKpevFbJTL2Suxm0G8tV8LMK8XJcrbc=;
	h=From:To:Cc:Subject:Date:From;
	b=kAPMZZcvOb5zdrGfUjigu/rF6MabCGELBWJzYMTDmyiT4CGrobQtMdC+vysoMSSpi
	 evTFvYQcYtT06+HqEILl9DZQkC4LAoRUcEBMRSAMZGD85PERPQZ0Sf/0/g/y6GpC6j
	 uA0TKhaZEfQJ3saOv/oiZn1/GpoPuP1C9bCae0Jw+CLY6LuhYZNjironJqaliFIbJ3
	 pXRWDShXoZDD30O4ZoA4IZPLgeVlzCRjK0X6+XHx1Su8r/Tv+RpvD/p65uwd3MH/kD
	 92K8+pDac7uPIbtyYPpWYSjr/WDldP2T3PNfkU8e1XNQz+tPMjULK+BHZ2ahmscK3p
	 F/gQj/Zk0/J1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcgrof@kernel.org,
	gregkh@linuxfoundation.org,
	peda@axentia.se,
	hkallweit1@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/3] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:59:16 -0400
Message-ID: <20240527155925.3866466-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.277
Content-Transfer-Encoding: 8bit

From: Zheyu Ma <zheyuma97@gmail.com>

[ Upstream commit c1115ddbda9c930fba0fdd062e7a8873ebaf898d ]

The driver should check whether the client provides the platform_data.

The following log reveals it:

[   29.610324] BUG: KASAN: null-ptr-deref in kmemdup+0x30/0x40
[   29.610730] Read of size 40 at addr 0000000000000000 by task bash/414
[   29.612820] Call Trace:
[   29.613030]  <TASK>
[   29.613201]  dump_stack_lvl+0x56/0x6f
[   29.613496]  ? kmemdup+0x30/0x40
[   29.613754]  print_report.cold+0x494/0x6b7
[   29.614082]  ? kmemdup+0x30/0x40
[   29.614340]  kasan_report+0x8a/0x190
[   29.614628]  ? kmemdup+0x30/0x40
[   29.614888]  kasan_check_range+0x14d/0x1d0
[   29.615213]  memcpy+0x20/0x60
[   29.615454]  kmemdup+0x30/0x40
[   29.615700]  lgdt3306a_probe+0x52/0x310
[   29.616339]  i2c_device_probe+0x951/0xa90

Link: https://lore.kernel.org/linux-media/20220405095018.3993578-1-zheyuma97@gmail.com
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/dvb-frontends/lgdt3306a.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-frontends/lgdt3306a.c
index 0e7d97e7b0f50..a4d881c721b82 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2199,6 +2199,11 @@ static int lgdt3306a_probe(struct i2c_client *client,
 	struct dvb_frontend *fe;
 	int ret;
 
+	if (!client->dev.platform_data) {
+		dev_err(&client->dev, "platform data is mandatory\n");
+		return -EINVAL;
+	}
+
 	config = kmemdup(client->dev.platform_data,
 			 sizeof(struct lgdt3306a_config), GFP_KERNEL);
 	if (config == NULL) {
-- 
2.43.0


