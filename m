Return-Path: <linux-media+bounces-11991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A698D072A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 17:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DED0284DAE
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E0F16938C;
	Mon, 27 May 2024 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJSYpdfY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B815FA9F;
	Mon, 27 May 2024 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825277; cv=none; b=J4/B7KdY0LCMeSLh0D5D0axyHyOlU06L4JRsrRmN3izvo1GvnIHp68WzeguqEMHyex6jcbk/NLrs7dt6HIJERJi+Bh25m2kHqJt3Gko74kVb+26wzu8ChQxeeuwi4Np4BRdPfZ7SfJaj90hTNNZCT2VoE1I0DvY4bGWnPDteb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825277; c=relaxed/simple;
	bh=Tw3zDUMJPnwZjnIYo1ORXpO1GQ+JnxUHJ0CmsdPjWLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uo9A/KdLI8T1mGx+TLskqjUuZy0xcVHRizmP3VunbBmP3dp/5/Qp1zWFbxeVpjPKGzdpAVWcpTxD5DV9P0UFgfIXIcLEBFo6utTnwjr8ynYxLg/Dmpd+8qLLdWT0oZ3gYuvBcy2KlIbfbDDYJPJXxQsBsqGIfoS82l6a4Slcvzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJSYpdfY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69EDC4AF07;
	Mon, 27 May 2024 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825277;
	bh=Tw3zDUMJPnwZjnIYo1ORXpO1GQ+JnxUHJ0CmsdPjWLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJSYpdfYB/Igelo9cFFGkNJ7d2bWv9AlipVfMt8mwInzF7QaaELaoL4rKcoXPBvKa
	 mcttLTOyp1pvm/gYezgwoiuzSGMA+BSm55OTL4iSlmoUoOMlCPw+DEBcb/Rblrpel2
	 BZuOkpXUwM2wvtE7T2Q6od8tJzYdsNHm/n4Y/tXXzRPeJX88x3Om1NDyUNwgjIQCqd
	 DLHKy/ey+iept/HpTAEGbvmCs+rFqxqt9g/iyhjFilQNxTNtCUbTX54I43fMMud8Us
	 0UL6pn3G9P/qoiiZeLMlIMGPVulNsbgimGg4KLvvFPIZsH1Ffv2LgItkD9jGoMKCHo
	 /IG4bvX6C1Zjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zheyu Ma <zheyuma97@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan.Cameron@huawei.com,
	mcgrof@kernel.org,
	hverkuil-cisco@xs4all.nl,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hkallweit1@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 14/20] media: lgdt3306a: Add a check against null-pointer-def
Date: Mon, 27 May 2024 11:52:57 -0400
Message-ID: <20240527155349.3864778-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
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


