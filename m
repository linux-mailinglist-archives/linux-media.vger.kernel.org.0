Return-Path: <linux-media+bounces-11994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE38D0762
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85BE2949C4
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE3816C6B6;
	Mon, 27 May 2024 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwY2Osjz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B755816C6AC;
	Mon, 27 May 2024 15:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825379; cv=none; b=W0IoY5tFFcjP42Lt1zh0p9/sDpxfnZdh3nHXqt8e4Rtt6uMyH57l2l+q8Err3F8j8odj01Kzvq/zpwdnrlgcDmt/GPSCNiAht5UtsSkNd5K7NOGjRDCKZO2hbs1EhzzAjtVGas5EUzv6i8eGw5uLJcGwgw4gb27UvAN23GErlak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825379; c=relaxed/simple;
	bh=Tw3zDUMJPnwZjnIYo1ORXpO1GQ+JnxUHJ0CmsdPjWLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFiWMH+3bT9eBHRwpwazEKidsMrufps8WpbW1FgtCAoAL+gg1MqxTha5gzH3HRSoudqNZgCp8DWxMDSayT2DqcDEJcS5j0xgXjuBuOvJ//JurWbcu9+wVaDjsQy0NGl9lFdMrx4HEFJrG01rz7xxs0cGQ/KHZeYcopCfJYtl1Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwY2Osjz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677AEC2BBFC;
	Mon, 27 May 2024 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825379;
	bh=Tw3zDUMJPnwZjnIYo1ORXpO1GQ+JnxUHJ0CmsdPjWLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mwY2OsjzXiCoHd1jYaaH37z6hehKZg4dRraVv0xI0+eAxWwI4Z9bverKbT1+DYx6s
	 tbyuGo+ccc08AMK1xhSOcWjoLNGmzWDQTJBMm7sNbefrM71qXr6GKqct1Y6XanEmmJ
	 G+VdyFYFvbc3jCV8iumbGqlJCKu4hQpSjAVbTc3HF7GYO+9vGF2Ek0cbeKx+FKBHFj
	 cmgO0ZIW36U20yw/y4JbuoY3cinU4nmAuQnP/GL7U4x3K74FP8wJzf06FqNyliiQAO
	 FnLoON3iijhnv6hGAr/2HqTAylNSEFKip6RegLnDPTG4BZjXHyNYzB7dYK7AablIxS
	 MrswHR1tMocjA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcgrof@kernel.org,
	andriy.shevchenko@linux.intel.com,
	tzimmermann@suse.de,
	hkallweit1@gmail.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 10/16] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:55:01 -0400
Message-ID: <20240527155541.3865428-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155541.3865428-1-sashal@kernel.org>
References: <20240527155541.3865428-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
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
index 2638875924153..231b45632ad5a 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2176,6 +2176,11 @@ static int lgdt3306a_probe(struct i2c_client *client)
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


