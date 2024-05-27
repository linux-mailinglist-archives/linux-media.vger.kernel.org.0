Return-Path: <linux-media+bounces-11997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB878D07E7
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2227B2A80E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34D915A85C;
	Mon, 27 May 2024 15:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkXZ8hVR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F033616DEC8;
	Mon, 27 May 2024 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825461; cv=none; b=pa5ce1YUrmVEMY636PrEWfuKncFH1C5dJiJ6zhF07X1KWTtfYFJPYDSGEtmZTG+51lG9Jc9CfveqicvBKzhMJE5WP11ISXpbC6gEobKJODBDXLbVOuI3LOR+NkOvqSIej1waKiWR8MjSPaRBuDlAFrgVpIm5DpE2awA/Yd6/F1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825461; c=relaxed/simple;
	bh=uq3FQDC58HjOwyxAqCT7Qtm3ab+Bwz0osmRhwDaLGXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dthyWtYfNkBi3WD48t/ZFDbyDKtkx+L6IAeHSaB20mbQf6TRBUaWjv59Q7PYmekV47gWzz/JDIBxzGBpP86TVkCOCG5pCRNdZIjFARpvrQh5fS4L7gc8+XP65ZACr0+gHSbX5C7QK+odczjulpS+yU893F3BfN7X2B4ukMLZLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkXZ8hVR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85922C32781;
	Mon, 27 May 2024 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825460;
	bh=uq3FQDC58HjOwyxAqCT7Qtm3ab+Bwz0osmRhwDaLGXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZkXZ8hVRYK0g7Qv5RnTZBypULJpyg2bqOOvm5OJ3rqzbY9YXoqcA7+hI/Q3qPhbY5
	 C9HtwfvFchpB6jRgcx32RDB/mB2yfLOgya+CXp0y+eNGONIsimDbPoSbmVdagVgS5F
	 oLQHih2cNjfaiBnGP4ragoZEgPFws0mtDSnD39hVCr47lB8K2lKcwyzjY6VUIZeQUF
	 X3kVyKk+cqkLfbCf3G3dvvT7tnOIpiau9jnRfZ+BqdwNlhp1lrbpFG/OqwSvyNi2gm
	 j9dAlpZr+u60i+j+fVKqsSZFC5xID3g2DKR31OO47wmF6yhoxIw9XXp85OsaB90pra
	 Vmift8NIAgMyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andriy.shevchenko@linux.intel.com,
	wsa+renesas@sang-engineering.com,
	peda@axentia.se,
	mcgrof@kernel.org,
	hkallweit1@gmail.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 07/11] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:56:44 -0400
Message-ID: <20240527155710.3865826-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155710.3865826-1-sashal@kernel.org>
References: <20240527155710.3865826-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.92
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
index 6dfa8b18ed671..fccadfcd76bef 100644
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


