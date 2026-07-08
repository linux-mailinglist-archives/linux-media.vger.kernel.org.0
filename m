Return-Path: <linux-media+bounces-67015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RvfJJRBnTmodMAIAu9opvQ
	(envelope-from <linux-media+bounces-67015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:04:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A42727BD1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:04:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=QeexdPjJ;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67015-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67015-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CD2F306F121
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FC14C77C1;
	Wed,  8 Jul 2026 14:49:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CEC44B696
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522163; cv=none; b=XMTctumwb5ICzkd4lfwnlkElemy1gsYuBSQ4oZCfHD0m6qRCMlcpmvLWySLagqKMTV3ETKMNtl/q8qp9W0+dQBUAFtaVT6p4jz8Iw1uNb0e5HfxBmCsywuqbqNJ1NYsTKjvjD82xQBterlYgf7AJFETz+wynsDgpgvj9XvONYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522163; c=relaxed/simple;
	bh=HhVZI9HK2acxh/kCiAWqs9TnSmdjguE30P1zXNPnXi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTG0dPUlBBywRgPhUqVpZKYy8lwPXis6HvsmIr9vL85nZjJkraMid+vxq26gkcwztx2vDNgkMgYH9wXTqa5vcohObCG1FyFu66nEJ48FqyWO8CXRDyAVw3IFbv2FPbzh6WglVQIwp1xHMTY3HlgxnRAIVYgSf3IjaPqpKM8I54Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QeexdPjJ; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b7612475so6840055e9.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522156; x=1784126956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpAz3t9DkUynz5Ilo0pkqB1DUV2Whn3ZOP7/Xd5aH4E=;
        b=QeexdPjJfKtJDaWvPEKOV7SY28EWuf9rSud+GD0CB9Dj+6B40/huKdNLN2S8TtHMA7
         pOeoIXKfL6M0xPAEn7JV7vVYfxxeyIB9oA0KbIeMxOwZQ/NKB94u4Gz6FLwkX24pGkRV
         7PPeVnP10Ujk09Wi3ls0sfFyWZvxFk1WPOuQAVmkKfu4OOFhthvG1mDm3GGCntm5uzZE
         b8tD+76gMQs9bo7iYWw3e6lDqDM68nqAiBQ6Fbh7q2PWFdldCN3T/UCyHFwwsXwHJwVD
         OwZl+XqbmEl4tVX9QzSahsuXTX2CA0/fChjKkJvrNi1xSzmdm1DdFfOs3CmlM0JSWCHZ
         PZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522156; x=1784126956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpAz3t9DkUynz5Ilo0pkqB1DUV2Whn3ZOP7/Xd5aH4E=;
        b=oHneX1bKmrKlzhnjSY0xf4S5rmDcmft6jVtoRDpR1dGetdICMjoK9FqEReIaJ2QSvJ
         ird9Mci2dSjhghv/yu7zbxxIG1HCiL94uir12oE8aCqLuw+1MWQUFjPldZC7YvQX9tL7
         8y5rxm9wok81C+mdQ6uZICxtrgpv24BLHQwFpDuufFQkySdmiJnJyBBMdpC4H0gy0uAc
         plALf3H783SYzinhKIELmlJUHpxDusjFOF7IEa2lKWJn01RZcgOrUhMdV5GDEL48OSW7
         xBc6QsPkemh4mvKOzgMLUfORdeeErB27QCT2fFm8kYa++5nXE5yPSO62qGRntQjL8noz
         s5Zw==
X-Gm-Message-State: AOJu0Yxvf1zSnH1PJtBc013+a4TmfqRRyZlrhW9Kq3fasdXmYwdvVVOT
	duuRHJXkDH64U9nDXs62SnKv57Uay0f9LiQ4RgWO7h74S9TV/adOdhpGJS8trtm32Rg=
X-Gm-Gg: AfdE7cnbaFq1ZayTrl3hFvQhUmNLRNSbOpd28Ky8pPe3uZzMFd4rZ+ICDSntXGS2mZx
	VSJ3PY2jTG+yWVEKr72fsDXC3PDjFZOw+KspBJJsZh/o8S9M7SRYhaZ8E82POr/dF84VHtoClEu
	i1NPmV9/tAGxbgmQuEtv+THegKyQLOnzoP4/qMs6xULp2BQKkjHygbVsgB4X3hqF0aDwdPLCRNH
	laWkOECdTDpksIJDE5OxDqv6OksUSjvnh7BH0IlRoQjN5GY4zOpf9YWdQSUt3P/oVqP6Pxt1aPK
	mEHAqpsZmgb2sLUcIOaYOJXQ//MlNKmRH1ieMGs6tMKk5HAmC7rG7gOheVGpaJl0ixKFrAUhZNz
	lM1W4tmm9/Q2R5WzZ4qhQDesNfpgwURfqcHU3EUU8F4miwOCQBtZ1XSMjZD2NNWyZDhqtCwHoxW
	hSWuNJR7OBrCqa35tEe611upGzboB1BATJA4Ti2yGSLdY9jlwr2yCDaAagPBjxEtbO
X-Received: by 2002:a05:600c:8b62:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493e6843f10mr32091395e9.9.1783522156025;
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:44 +0100
Subject: [PATCH v3 08/20] media: imx355: Remove link_freq_index from each
 mode as ununsed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-8-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67015-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 47A42727BD1

The link_freq_index value in imx355_mode is unused, so remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 1010c32fe969..2880e03b3f08 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -81,7 +81,6 @@
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
@@ -111,9 +110,6 @@ struct imx355_mode {
 	/* H-timing */
 	u32 llp;
 
-	/* index of link frequency */
-	u32 link_freq_index;
-
 	/* Default register values */
 	struct imx355_reg_list reg_list;
 };
@@ -366,7 +362,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -384,7 +379,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
@@ -402,7 +396,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
@@ -420,7 +413,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -438,7 +430,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -456,7 +447,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -474,7 +464,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -492,7 +481,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -510,7 +498,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -528,7 +515,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -546,7 +532,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -564,7 +549,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -582,7 +566,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -600,7 +583,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,

-- 
2.34.1


