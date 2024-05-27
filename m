Return-Path: <linux-media+bounces-11999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3D8D07AD
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 283351F220F6
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B67316FF49;
	Mon, 27 May 2024 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNWdbh/y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C0168C2B;
	Mon, 27 May 2024 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825552; cv=none; b=OsORGIgBLMzujA4XbSybgYqCNXgL/YuirM+UaWOofbUkx9OUf9gbgAhSZpM/4dAA6IrKgKLHm1Q1R//L+qVd4NzQWTUfBfbHaBMN+AwiutlLHmprTQZFA9oTrtohr+af786mwQMAWHo2PXDUMmozrCcrUlGwYJvNy2rsC1hnTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825552; c=relaxed/simple;
	bh=UZqxU91t6Z3kXOICFJC4gY4Xj+npvx3bzyO2kNdzm1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHFrYcUixC1KQBZYg+8VQClhDLxGTlbgr+8qeXHoR3Sle03bkzhrUAxZFYP9tsCI4xYBNWJ3QapzSetlOndWZSnN2U7bsNiiKIVWXdXRwoH3yua/1fEb1fqibq5nuzIaQm/bX/djyPjcg8bIcvmM1geLDifVLl4aU1KxW800S/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNWdbh/y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23832C32789;
	Mon, 27 May 2024 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825551;
	bh=UZqxU91t6Z3kXOICFJC4gY4Xj+npvx3bzyO2kNdzm1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZNWdbh/yvo6TXyH2NFkZCe315jIkXnu5z+rJ1bXrexqFk1aiKo8SrVCRnwehMdjhZ
	 2dnv/RiAfOnEri5IzJejeYDQwPUc401aVDyXIvyMNqTDm3IFRa433H/oydDwk9qMM4
	 bihB8VBPmzbXT8H20ZmjqK6E1NfkPWt7Eg+K1HCDPfOIds36iNCI9/3OW3cVeBDfYa
	 /FWaVb96ujMMs0RpbIUC0l1mkdzDz0yXfZza4QSkmll27m6VrM+x2RzftmewHltL1h
	 CTeNz7lsAUadBuxPuSrx62zJGLknYZWqX7Yt3Z79lnjeskKgr05SJw1QeItTC+C4HL
	 Ez8JzFe1PZKWg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	broonie@kernel.org,
	andriy.shevchenko@linux.intel.com,
	peda@axentia.se,
	laurent.pinchart+renesas@ideasonboard.com,
	gregkh@linuxfoundation.org,
	hkallweit1@gmail.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 5/7] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:58:29 -0400
Message-ID: <20240527155845.3866271-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155845.3866271-1-sashal@kernel.org>
References: <20240527155845.3866271-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.218
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
index 47fb22180d5b4..d638cc88aa770 100644
--- a/drivers/media/dvb-frontends/lgdt3306a.c
+++ b/drivers/media/dvb-frontends/lgdt3306a.c
@@ -2213,6 +2213,11 @@ static int lgdt3306a_probe(struct i2c_client *client,
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


