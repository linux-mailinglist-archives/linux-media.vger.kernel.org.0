Return-Path: <linux-media+bounces-66878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SGVvOFAyTWq7wQEAu9opvQ
	(envelope-from <linux-media+bounces-66878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089871E1B2
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=ULm++hJO;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66878-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66878-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9E86303EBB3
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6CB43B6EC;
	Tue,  7 Jul 2026 17:06:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679C43784B
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443981; cv=none; b=nG5kjtwJ3fzLloYSrrdJhJRRwC7mARN46hJDlvhHkwjsYQdS+OeeBwrKhtqXIDUR2CDF9v0Ki/Cv07qUch9TBhMB+XeihyfBG8RL7YkYIdJjwozbg5gdzntdmKt/jDCDp4kr9YM3NCelWAtLoDm/4nVgHkp6xGACbwtxhNrpPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443981; c=relaxed/simple;
	bh=uYK/lqxTmTM9kS+ZQnhD+cW2cFFcg5w9GQr4c2rhP8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4DD4fjJiHatApXUrmNlxPg1QnWoILaDD1BIl0Om8QC1IRf2DdkcNxlzMl6foL79x/2C1nTQwWj8S63Cp0zlUjQd2BPL4wDL+V9TIcGWNaJaGoYnH41D3852tP7IBK0hUxr1AOqGbonBtvWheQ+7GQF2zoKfBdEg6gSkeDDXWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ULm++hJO; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso2722926f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443977; x=1784048777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufy0L2iNQK74Cx0uiIUyUz+k15S2SV27jk2HsgCXY2o=;
        b=ULm++hJOzT9wU6ZOCghPM+8cddFLf975lpvzEyVaCqOhKDvvua8NTAx79OoRDZkUKS
         jXNyQdiSSpXBAtaeTuYombS8n4QY/SgaxDZukfbcOE3ed4Gvd64yW+7qW/lVGAmEx6kD
         cdsa1hMvaDqSoonyA8raOtka3b3tRuO73RQRgh6GMebfOgpCdhQQwWUQXrx0+1gU+reK
         mGhjU7u0q7ldzKQTMJ4562Y/E0bYsUpBXKDF/5JD9Awy15kjy00Y/DmDnyKjuH95/IcO
         EqnVPtKh/07E8fqWNzoYo//gNtK2JeyHN7AI2Ro2xDiau5+k2UkCmTOwY5i8jj1ZyWzU
         7z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443977; x=1784048777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufy0L2iNQK74Cx0uiIUyUz+k15S2SV27jk2HsgCXY2o=;
        b=YTIJQ7p9ehrJzmNgZ5h0hLqokYLe8P3C3nlOj5HtQUp0G96tue4kFTt1oNsBH6kyQM
         fdzzBfV05zoBLsAV99TpN3l2BXzsNrcxWDfGUgxavH/LNBRsOJU+uvQGf+CR/bgm0ye+
         0C2tu4/X9hTb3uokflijKApP9cj5yLOR8+OtnUtxKsTQL1aC0btKk0sMElDF75J/SrMv
         jZ+VPd4tBP8oGhSwELkE8GufnlSsky9P/ENkfv+NpR3AaFMgiEeKnIwmo6LDwdCl1deZ
         urwzOE0AbR1E5kATd7s7rvx278U2qu13+I6J5Pfg+XdB9wJgy5xwZykfJbfKy7F+AWQF
         YLMA==
X-Gm-Message-State: AOJu0Yw3Qk9sPpKe40w7JwLTgvxogHczvEZvlVGwPlqR4q60zIN0qFc3
	lNDbXuLgazssXUJZDdtWLoDtZ+o0V1vI/D9DINhkvFQaLNQK/VKft/MYxLBxHxd9n26fN7ytGF5
	czhVx
X-Gm-Gg: AfdE7cmBNQ59ktuRoGZpn3q7c20N6OV3KSB6tdZ1JC683IiageHqRa+FHxodxHDd4ic
	V828YKq47nmSC5KckGgb4NubdLOLOZF34/FPw7rc4e3zFD5gsBuUZnJuy78HNkg4TgA/0V95IfR
	1E5ZJYYvu7bPghD0f7ZWOD9dPTOH59bxTg4yaGshAR6j5ZcAYf1V0G0CjTCvzm3qL1cFGjXRi2Q
	P4giNSrQEMVZxVjjlVqC/EFnvjscqyXb71GA4M05XzjaRfqTcksT84qEpsqAxX+6xBXbvlFQI1p
	80u7aNylDpIWQZP+mqqtHbMY/POC+NBrgIA61i6Tsplqz0vBCsNyivFzvBY7McReben7FdYU6lU
	HV8I4bObICYgA9Q3uggh+3jPLtVAwfEzl9qVJ643ym2jaIqB6tN0IkESiDD/wc2W7e/iyNwkbYD
	mARl8cDK6hKW1i06NmNShiNFyF0DKMqZMN3EsaA6gBorI2+/uK+n5v8luV5JAjFogQ
X-Received: by 2002:a05:6000:4381:b0:472:55a:ef96 with SMTP id ffacd0b85a97d-47de66ce0c5mr7336594f8f.39.1783443977083;
        Tue, 07 Jul 2026 10:06:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:35 +0100
Subject: [PATCH v2 03/20] media: imx355: Remove duplicated registers from
 the mode tables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-3-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66878-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9089871E1B2

A large number of registers are identical within all the modes.
Move those to imx355_global_regs.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 344 +++------------------------------------------
 1 file changed, 22 insertions(+), 322 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ad9a9464175b..83a59aa8b098 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -221,6 +221,28 @@ static const struct imx355_reg imx355_global_regs[] = {
 	{ 0x68b0, 0x00 },
 	{ 0x3058, 0x00 },
 	{ 0x305a, 0x00 },
+	{ 0x0112, 0x0a },
+	{ 0x0113, 0x0a },
+	{ 0x0114, 0x03 },
+	{ 0x0301, 0x05 },
+	{ 0x0303, 0x01 },
+	{ 0x0305, 0x02 },
+	{ 0x0306, 0x00 },
+	{ 0x0307, 0x78 },
+	{ 0x030d, 0x02 },
+	{ 0x0310, 0x00 },
+	{ 0x0220, 0x00 },
+	{ 0x0222, 0x01 },
+	{ 0x0820, 0x0b },
+	{ 0x0821, 0x40 },
+	{ 0x3088, 0x04 },
+	{ 0x6813, 0x02 },
+	{ 0x6835, 0x07 },
+	{ 0x6836, 0x01 },
+	{ 0x6837, 0x04 },
+	{ 0x684d, 0x07 },
+	{ 0x684e, 0x01 },
+	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg_list imx355_global_setting = {
@@ -229,9 +251,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x0a },
@@ -244,8 +263,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0349, 0xcb },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -253,32 +270,11 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x034d, 0xc4 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x0a },
@@ -291,8 +287,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0349, 0xc7 },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -300,32 +294,11 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x034d, 0xc0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x0a },
@@ -338,8 +311,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -347,32 +318,11 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x034d, 0xd0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0xa0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x05 },
@@ -385,8 +335,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0349, 0x33 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -394,32 +342,11 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x034d, 0x94 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x05 },
@@ -432,8 +359,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0349, 0x2f },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -441,32 +366,11 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x034d, 0x90 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x05 },
@@ -479,8 +383,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0349, 0x2b },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -488,32 +390,11 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x034d, 0x84 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x05 },
@@ -526,8 +407,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0349, 0x27 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -535,32 +414,11 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x034d, 0x80 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -573,8 +431,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -582,32 +438,11 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -620,8 +455,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x08 },
 	{ 0x034b, 0x63 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -629,32 +462,11 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x03 },
 	{ 0x034f, 0x9a },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -667,8 +479,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0349, 0x7f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -676,32 +486,11 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x034d, 0x14 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -714,8 +503,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0349, 0x77 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -723,32 +510,11 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x034d, 0x10 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -761,8 +527,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0349, 0x6f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -770,32 +534,11 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x034d, 0x04 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
 	{ 0x0340, 0x05 },
@@ -808,8 +551,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0349, 0x67 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -817,32 +558,11 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x034d, 0x00 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x02 },
@@ -855,8 +575,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -864,26 +582,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x034d, 0x34 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0x68 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
-	{ 0x0306, 0x00 },
-	{ 0x0307, 0x78 },
-	{ 0x030b, 0x01 },
-	{ 0x030d, 0x02 },
-	{ 0x0310, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
-	{ 0x0820, 0x0b },
-	{ 0x0821, 0x40 },
-	{ 0x3088, 0x04 },
-	{ 0x6813, 0x02 },
-	{ 0x6835, 0x07 },
-	{ 0x6836, 0x01 },
-	{ 0x6837, 0x04 },
-	{ 0x684d, 0x07 },
-	{ 0x684e, 0x01 },
-	{ 0x684f, 0x04 },
 };
 
 static const char * const imx355_test_pattern_menu[] = {

-- 
2.34.1


