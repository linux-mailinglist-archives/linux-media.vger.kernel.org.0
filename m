Return-Path: <linux-media+bounces-11998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9148D07A2
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BA6296642
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4F016F822;
	Mon, 27 May 2024 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSUUdrOP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793C167289;
	Mon, 27 May 2024 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825504; cv=none; b=Es96Bl9k4N0kPVGYPR1l6sNDjEPFQVwknKscFuwfIOQ/Le+MoLCbnRKsSRYUccq6JQJ22Xcw6NF61LboMIwKI9D6yhpW51r+W92upbO2ApgkBjw7F3NtOZFZiFfIt5ETyi1ipFzst+B9TTwBdadHmYvBLNOEfoPb/KCeoe3XKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825504; c=relaxed/simple;
	bh=+675MIHNbN9OSUKuccdTXAcdMyna4REx8+9EpCYYC+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxsGXGn2dnlRPSaF5Be7FuU07WkwYNnY8AY9o7PEOcjuEeX9hhp3ynrVKhJKAaRpYSrIEWsGIjmCI61cGLNnY/YU9pIednmovOmJa3y4DA0ah3uMVs5dSZSYWHyB4BH3jY2Jo9Fezv0VwH/Jet1sbQJ2UyVQDiuZEre41/z2x5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSUUdrOP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8133C4AF07;
	Mon, 27 May 2024 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825504;
	bh=+675MIHNbN9OSUKuccdTXAcdMyna4REx8+9EpCYYC+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dSUUdrOPlQfRZ6ESKc5FZKRF7H1NohbvG19pIBJQnu4ZhhCyF9KL7rwZsS/H3Nioa
	 Str34Uo0P/WN/Pmj1Acgt8bRWV0DMV6cbjfHbqy9kF1/Vz4XZ8B8c5bq2sGBLNO7UU
	 wSptMV7NbhQWFTox4StZHKoRzTtdSYZzIdjDbyjabiZV9f69UyzymS0UiPuWHA/bYQ
	 DK5aSNqSXja4NL9GOqu4sIhUFJaMSoX9CujBVwqegqDTgbhIXLA72H72g1OkwW+iMt
	 1CcP46rWqvxBSGJnObBpDYhBNfQ0mCLxxKPxgeNPgYUf1eEltYhqw7MLDnhX0+Xqho
	 uKk5q6nTZzORQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	broonie@kernel.org,
	hkallweit1@gmail.com,
	gregkh@linuxfoundation.org,
	mcgrof@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 4/6] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:57:54 -0400
Message-ID: <20240527155808.3866107-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155808.3866107-1-sashal@kernel.org>
References: <20240527155808.3866107-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.160
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
index f6e83a38738dd..79174336faec2 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2177,6 +2177,11 @@ static int lgdt3306a_probe(struct i2c_client *client,
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


