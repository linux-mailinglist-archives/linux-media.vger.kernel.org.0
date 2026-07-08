Return-Path: <linux-media+bounces-67011-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 80kNBx1kTmo4LwIAu9opvQ
	(envelope-from <linux-media+bounces-67011-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F27279BC
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=YAzwHPkk;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67011-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67011-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 982273061A42
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852BA47886E;
	Wed,  8 Jul 2026 14:49:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2501243E4BF
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522159; cv=none; b=LcSQeJbuiAloQUpCHLJoebm2hFubwwc/VParPlAOI1VX0QFavTAENQmO/O3EEnzksAJFkrvnOJzZLxo455ODAaezYxUlWjD7r+m04p4JFXYI8MObWHAxeNgMffghvQXut/6lwnhZArWqsRHMa488KnvrxW+q6GsSjPdfofbAINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522159; c=relaxed/simple;
	bh=c52oyyw5r8nA+Plt1oz9KlUfBu4NHsmyYBt6O3jdtgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psN1QVGWX2dRU1GpqdUN6CTBwElNlYQvvxa67Tg/EWkB+ZTquPu40L/PdfMqOXcbd+JKoOTZUpaIV4KfvnksAHoB+615GlPtB7mT33HLdX+BZkb8kvltuTZL6cDwWmEdItEAmuluECd0TveNRxNTRQ86u/aE2J2kbmk7WsxlNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YAzwHPkk; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b27c7451so22008805e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522152; x=1784126952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pjq3H+Y5yrVTObysQWJZY5e4lJQtKVcgWqAJmGLgDbQ=;
        b=YAzwHPkkDLp/Xaw5tZ5+tvf1aXEeTpbukagvJbV3eEBjSNnWrVcNc6zg9d7wjL0a9y
         Zvl0tMOAD2nlbFOPGtdxD2XPMuuvKHu2HE9FoG9MRIXFs9amH1iX5E/07TBA7DfxvHqB
         YVSYeQwLk9MCrFL/DLR3xrpQmY0XbUTd0BfhrR9snYpyPVy9d1iIALH/7bfr1vkOBm7q
         vwY3fBq5t6N22j4ifCPem94LU6Lr02aegK+bAQt7h32ptsNm42p0H8mDqhNEd/rPty9J
         n4E5PtYj0Irh71OBPeTHpW8pWrJJgw50n6K7HFSblZs/QFUK20dVKAE6p1lfoGN/52dQ
         HcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522152; x=1784126952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pjq3H+Y5yrVTObysQWJZY5e4lJQtKVcgWqAJmGLgDbQ=;
        b=P9qJqtlDHlRKJS+iAjtsdsVRRi7s+p3SRNIepCPOQCd8UvJZn52E2Y0p4z8+L4d57Y
         GunS5IfP2ZNnz36VQVPAaRR0OutcKI7WvkXODOmpH0PxNLuEvshGMNHMhuDZHwcBpAb2
         prbM91068+6Jy8BQr/+AxEjp+gRQ1Qj3O18G7v2he+m0fnUJjslJ6aEBWpC9KyHYPkqz
         xomgZKOK97wUmqXSyjGyLAYeMR1HjvYNBJcpIUzKqNLtDg7pIMXJatAdUtl8G3aH3raw
         TsazcPWQXV9D46yH16PTMvjPsZQEHoTRJVlgjQ4z97oEp0XhasNkmGKSFBdcT3PlExO7
         Qb8Q==
X-Gm-Message-State: AOJu0Yziriz3M/uvP4Fj5/5KNXh2GYZ0t5jEF3bwbVVVSdKvLPMTUCNj
	Meyp5iQTeIkkom6lHCJqovPhYjdZXpnZcUGqjn99mTd4zCKIipSZ4gOvVjT2Ekth4Ok=
X-Gm-Gg: AfdE7cm2lhObrAtHH+rMhZyhz77BQot665M79DY+BbnM9GOTWs1V8oBA6cMJsJm0+mL
	E5Zj0L077LEm3dIbttED/2mM5LaitIbtJs1xfltT1SIxLG17FqCzbPiRDSGKGed0VlTYDFo6vnl
	dI0LhVxlFwH0o5sp1wPB9fgiiVVeczLTKQ2CC5jFRf1yH+dZvkjF8dfmdxRwskg7kuAZZncjVhz
	C8uehp3160rr1CZDc3sDns3YvKiLIlrmx2HlgN0k1LuHsBjqsWgEkybJx5/CrKbUQScke2Uy5x4
	3rIHHG7pD5h+jDymkHEjJgkU2wilEUaUWbSC1WZmNo659N4DbHYRI7octyKRZrUNKuRyU8274TX
	5R0kFCtzrXrVXfzr2vrft3BHHEpMWs/6A0iOtGqFE7aoqBisWt/dR0+42Gv3KGY5Uo5bpsY7hA7
	JfqXA1aDwX/IT7U0MmAtwxcOvB2VGscdYt7N8UEWuEoiXpEXyaaO3z2xLl8AAjy2TY
X-Received: by 2002:a05:600c:6288:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493e6371c95mr32486805e9.7.1783522152166;
        Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:39 +0100
Subject: [PATCH v3 03/20] media: imx355: Remove duplicated registers from
 the mode tables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-3-9df386a623d7@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67011-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE9F27279BC

A large number of registers are identical within all the modes.
Move those to imx355_global_regs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 345 +++------------------------------------------
 1 file changed, 23 insertions(+), 322 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ad9a9464175b..4eaccd9e90f1 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -221,6 +221,29 @@ static const struct imx355_reg imx355_global_regs[] = {
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
+	{ 0x030b, 0x01 },
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
@@ -229,9 +252,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x0a },
@@ -244,8 +264,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0349, 0xcb },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -253,32 +271,11 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
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
@@ -291,8 +288,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0349, 0xc7 },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -300,32 +295,11 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
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
@@ -338,8 +312,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -347,32 +319,11 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
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
@@ -385,8 +336,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0349, 0x33 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -394,32 +343,11 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
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
@@ -432,8 +360,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0349, 0x2f },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -441,32 +367,11 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
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
@@ -479,8 +384,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0349, 0x2b },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -488,32 +391,11 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
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
@@ -526,8 +408,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0349, 0x27 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -535,32 +415,11 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
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
@@ -573,8 +432,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -582,32 +439,11 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
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
@@ -620,8 +456,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x08 },
 	{ 0x034b, 0x63 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -629,32 +463,11 @@ static const struct imx355_reg mode_1640x922_regs[] = {
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
@@ -667,8 +480,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0349, 0x7f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -676,32 +487,11 @@ static const struct imx355_reg mode_1300x736_regs[] = {
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
@@ -714,8 +504,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0349, 0x77 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -723,32 +511,11 @@ static const struct imx355_reg mode_1296x736_regs[] = {
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
@@ -761,8 +528,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0349, 0x6f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -770,32 +535,11 @@ static const struct imx355_reg mode_1284x720_regs[] = {
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
@@ -808,8 +552,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0349, 0x67 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -817,32 +559,11 @@ static const struct imx355_reg mode_1280x720_regs[] = {
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
@@ -855,8 +576,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -864,26 +583,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
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


