Return-Path: <linux-media+bounces-67653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5pIACGdzV2okOQEAu9opvQ
	(envelope-from <linux-media+bounces-67653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:47:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E275DB81
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="sn/HHTNj";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67653-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67653-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C696130CF094
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A4A44D03B;
	Wed, 15 Jul 2026 11:44:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2DA44BC9A
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115856; cv=none; b=T6B5OvNTyUIfPwBqRv2jF/Do9PIjdJTJHohmRiMjibNGX6Rla8p233Cod1xjiH/yEwOWvgaxluI8KkKH7D/df14omf6qICt+zaIs5FKiXiw7/RZ6JSJX5uq/4/5lP5426z6b8h5aufFAz4Amupp2Epj1czPTIN6cy1MFTfSHh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115856; c=relaxed/simple;
	bh=VXJyCifFcDOGXUzWvgbcA2jr2HPZZF9pnUtbRXaMQXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rOvcGPOHwfI8tAh0E68jJwPod7/PkhfVOcQmsoe/cyTqAWejkc5PKpY7LXnw+w7hHm/eUSQQ/L+SRF63nmP1H4mvsqUfOvcDOH3h/AxhCtLvXnYRNterRM7xIhonwFkQWdls+zISlBY6HR3edS4uMcuSFe3UdVKbgZP+nGDE2Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=sn/HHTNj; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so28825945e9.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115852; x=1784720652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9m/Lvt/FJvscI1oD1bvc2p62YRgrUa8VBdz5pLrBPz4=;
        b=sn/HHTNjX4ABfbErsldtxBpfdBXZzUaC8CJFIVv/8UWvi55mJBEteRNrAfadQLRvWH
         LYCDVHk1tRFRvSdWjnh4XjP3W+9ue4AqvaeMfAWmbvneqp3GxSYPtz/qMJ8f8GHGjdak
         KTmQ6SgZjgewF7Jtw5cf61hpw/ZGuRB2+hS8HqzpH/Owv4X+zxKPTrY/rTDO0mt/Ojmm
         jahIT8HgfLBelrtUupy/aDy2VXRoujMvQ3V23tNrigbxddkEdkUwtVtx7dD3YD8H33QM
         yE/vkpnMY1QyNkCp9DjlPs0X5v5ntuwi3nt40A1UkjTtEyYrpciO6l3uq/bvF2mvprHk
         /9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115852; x=1784720652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9m/Lvt/FJvscI1oD1bvc2p62YRgrUa8VBdz5pLrBPz4=;
        b=mo85gOGoAQ/P5+Gqvb+NvAo55d+5S973S44V7UegOJpPUHjk8n6inOD8ou7N5qfrQq
         4XiAbPF3R/TMygNbri+QWYfntrPgDdVQwg+OjTqynEqtbDFWwFHRRvzBH7M+ts+giJDL
         mDRZUVzLeKR3YbwtURJ/0Pz3JXynb7qXRMV7y1Ve6i+rktPalOMh8elgR2csaNBkSyqb
         48kCEEa1ZJD8mFxP229wcQLZ5A6DfIdOqLw/G0KYgRbZnGFy2lFDI0VaRWIXzkItFCtG
         HKvWUxLe3e0rz4JL8LcKM7BN98c/HguGnhZ4ETJC6GV7F+juvGt05zWqlDCo3TS6pJtB
         UdWQ==
X-Gm-Message-State: AOJu0YxH25Idcm338eIyxUhpYC6T6ZSKK3R3ZYmcIn1S4jQQNMEho5KG
	ONZrzGHPdFD4g3vYofUZVgxKu5+xdBOV+8UkLzZBIA572Uip6Esp2YbxEsf/0fW6C9o=
X-Gm-Gg: AfdE7cmzTJ/rED4blPuV0+SXqc5k4AdSg2/ttAhymk1xd4tS7wlkN2FvoRGoylVL6UF
	Eq+7A2g/aglOmRBxkfxq1Qp5njvHEJI8lRwhwFCQcT3FHGG9HSK4XJjo37RsStiEiNRtReRFqP3
	9Py4mu+SNd58Dq23T3DKdfnDHXhaPznUL9KbcKO08RvVW2E+nwJKsAud8ii1yur4AiKAKFTZ6qC
	FHIh+V8wSenCm1F46o5lRnaep5ULS7DSgd6Q9PD2+/QI6TWMBvfU06pxq/STlFTAKwSgJEmJvsT
	ydZRIVdakVRUUAnEkalh4SEoBUrxnS392Mng0IBmX43cpbcQT+t3l44FcBHKhyWWRQxjJGcQiC2
	VvT6E0Zd0ff5ewKnevb8SBUkU36NcC2inHxz4O0L5daTnOLuohv3scogI8zKs6LUykOM0+Vns1f
	tb+v81jy9JhQUjXegNnCAC6zdsQgyS7ET26l2tegGu8a2L4K1iXCBzpPtPLIgeAI/5
X-Received: by 2002:a05:600c:8b8c:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-4953f6869f7mr10543965e9.9.1784115852075;
        Wed, 15 Jul 2026 04:44:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:17 +0100
Subject: [PATCH v4 04/21] media: imx355: Remove duplicated registers from
 the mode tables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-4-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67653-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B34E275DB81

A large number of registers are identical within all the modes.
Move those to imx355_global_regs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 345 +++------------------------------------------
 1 file changed, 23 insertions(+), 322 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index a6ee7532018f..01d6c28a2656 100644
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


