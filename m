Return-Path: <linux-media+bounces-67655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3nEiFhRzV2r6OAEAu9opvQ
	(envelope-from <linux-media+bounces-67655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF4175DB23
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:46:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="jl/JE4y2";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67655-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67655-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EF2C301CD3E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B1E4611C7;
	Wed, 15 Jul 2026 11:44:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26B44CF59
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115859; cv=none; b=Xe6s+WE5br5BuRq0ByAPhEqQY6GA2EBVfmt5xgPn5ByI++Y4C1aUbExvDuPLm8nb4TnWQEMV83DUx9YO0iMwKE1qzinmE2Jk2Mv8MWJOUd1JLaveEAhKTtoVZiivE/XfF27ct+tUbKHhf1FRM9GLEO08WR/l6ir3iTcOafFO2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115859; c=relaxed/simple;
	bh=wqkitN5tW+qsIkaXe0dl5rCtTLGiBd7TWW1o/DfPW1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxQ3xreNZFUfcrethnlxCKEu8EI9HwGQv6HqSPMeUFj9WWCvBYRJQx6hq7BwREjYH1IQW0cSZFqDAH7oFEEwn28iwq6RhYvo82LZCwmWt7IM6qz12+gCjszc34sF83CZazzx5ha4j5YCQLT0QXVJNrOQCRVbFWdclcvFT59CGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jl/JE4y2; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-470174001a0so1072122f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115855; x=1784720655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+7U9Gq7RsgJEjog9vowp9MZwvnIxwjwziQPVrI23AQ=;
        b=jl/JE4y2hiXNzyxURqpQOiWs9CaXkjGtGYC/Pl42Z+mscBDK8cZCXCLfluwaOwC+n6
         st9qzS8uUf4WIECoSX3ehEULAF8lRkybI0R+LCoFZGWttm3nxVaPMc309qKerDRsVcn+
         8QuTu2UjliY9IiHMrpPi5IgSR1ZIoRp/YqosRg0QKtKd4sNdXpNKRImpNvi/VecVrTYB
         wIbUmP5lId0gcpqvkzDNt0+O4Uotc0N9urloeSBiqRGpp8CdJ14Ks/PgIMOgCog5yiyD
         SrsfqnvibV3HJPqC5U6qk+FOdt0kMdEgjn4WaPRTTFGb28XZ6wzmnH5DFvw1QLgr9e87
         3H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115855; x=1784720655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+7U9Gq7RsgJEjog9vowp9MZwvnIxwjwziQPVrI23AQ=;
        b=Oi9Auz40c6e3JNcnr0HKEbeM3vYkPhNSRJoC+DQpUVyPaB72imzhYmBbz2u7pIBhJP
         CZp7eSw9F8pxjeDKqndjVhn3iuJAldf7MnKint0jFKkWW6W2uvfEqdzBgxHQ+p2UoF1B
         Rw/ykJEQwtUsNVnBcZVv2DmcQa5nEnSpyGhuFM7KVZ7QW9MST6613F+y4fDc+ezlHXLi
         S4/fSmU+0T8btwxelgBtEz+V1aCGgL2JOTdZ+PdhQSKtfl/Bznyz2WWzY9T8+aw/qBk5
         Ky3WjGrALjgJ3nb4tZlNslW04T3HAu3SGf5n16EXihikeL2U01a2cLaV53XK/iVA5C8z
         I7aQ==
X-Gm-Message-State: AOJu0Yzq/c9MpsCqyaJGMOPjFjhLCRljJDLNulGzT+KkMT2Iv+/1qukc
	R3heljEBuM7bAmpZ787UyaM2PPwMkf9u0AuIGqRduWdTiyIQxBFFvs73EPK2/gZcbdM=
X-Gm-Gg: AfdE7clK0C+HBH/GDjfjsxS0AMPTbpXCtWDKgiP0etaWvWGv7bg0RpqK8kArjeVWTjS
	lRMv/Fn2Bao3dTHS1EVHtIO506Cm6K2cuiqeyLlt3KUdTnc2zmbzyrUExrHiRcULuaQmXwlyDuI
	AZ+X1VQHzdNJi7qXImMJKTxtxhoZa07S5JnO9GkvtCmXLNnFUlQK3bpUti7FEbwpfcujC9EXDev
	gJRAAsMUmvq76Z36ZIX7xviQPs+k/xkfMiloQBtjmX+YsqHpAPoOTTkwDKIo1b9VwfIlxhZGq3n
	kjTZHBh9gpOUJYOdIe10MmdCHRoNsDMnQ60wQat1p/cJ+5bPBOQHLLFSV68wwR+SMOhbinLw+0U
	xwEDNz+5tA52ibGfQaKw8hs2Foh/N9AnQGlVMHan+xii4ncDAs0o3DG2TVap8WkntRGgfgtNz5k
	BtGi8bcWcW9B+2gGxvghi6dh1zzNWW7myZTC/02XV06M18uWOVwBH49LJTx7diSPRZPUj1MjBMN
	mg=
X-Received: by 2002:a05:6000:2210:b0:47d:df97:8186 with SMTP id ffacd0b85a97d-47f2dc8d716mr21510062f8f.7.1784115855183;
        Wed, 15 Jul 2026 04:44:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:19 +0100
Subject: [PATCH v4 06/21] media: imx355: Programmatically set the crop
 parameters for each mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-6-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67655-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4DF4175DB23

Currently the cropping is set via register entries in the per mode
register lists. Add the crop information to the mode structure as
a v4l2_rect, and set the registers programmatically.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 290 +++++++++++++++++++--------------------------
 1 file changed, 121 insertions(+), 169 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b40d89d86156..123ceed26d05 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,13 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_X_ADD_START		0x0344
+#define IMX355_REG_Y_ADD_START		0x0346
+#define IMX355_REG_X_ADD_END		0x0348
+#define IMX355_REG_Y_ADD_END		0x034a
+#define IMX355_REG_X_OUT_SIZE		0x034c
+#define IMX355_REG_Y_OUT_SIZE		0x034e
+
 /* Exposure control */
 #define IMX355_REG_EXPOSURE		0x0202
 #define IMX355_EXPOSURE_MIN		1
@@ -88,6 +95,7 @@ struct imx355_mode {
 	u32 width;
 	/* Frame height */
 	u32 height;
+	struct v4l2_rect crop;
 
 	/* V-timing */
 	u32 fll_def;
@@ -254,21 +262,9 @@ static const struct imx355_reg_list imx355_global_setting = {
 static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x08 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x08 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcb },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x97 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xc4 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0x90 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -276,21 +272,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x08 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x08 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xc7 },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x97 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xc0 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0x90 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -298,21 +282,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xd0 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0xa0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -320,21 +292,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa0 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xac },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x33 },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xf3 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x94 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x48 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -342,21 +302,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa0 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xac },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x2f },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xf3 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x90 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x48 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -364,21 +312,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa8 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xb4 },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x2b },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xeb },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x84 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x38 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -386,21 +322,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa8 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xb4 },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x27 },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xeb },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x80 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x38 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -408,21 +332,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x06 },
-	{ 0x034d, 0x68 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -430,21 +342,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0x30 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x08 },
-	{ 0x034b, 0x63 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x06 },
-	{ 0x034d, 0x68 },
-	{ 0x034e, 0x03 },
-	{ 0x034f, 0x9a },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -452,21 +352,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x58 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0xf0 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x7f },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0xaf },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x14 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xe0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -474,21 +362,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x58 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0xf0 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x77 },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0xaf },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x10 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xe0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -496,21 +372,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x68 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x6f },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x04 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -518,21 +382,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x68 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x67 },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x00 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -540,21 +392,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x03 },
-	{ 0x034d, 0x34 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0x68 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 };
@@ -580,6 +420,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3280,
 		.height = 2464,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -592,6 +438,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3268,
 		.height = 2448,
+		.crop = {
+			.width = 3268,
+			.height = 2448,
+			.left = 8,
+			.top = 8,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -604,6 +456,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3264,
 		.height = 2448,
+		.crop = {
+			.width = 3264,
+			.height = 2448,
+			.left = 8,
+			.top = 8,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -616,6 +474,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1940,
 		.height = 1096,
+		.crop = {
+			.width = 1940,
+			.height = 1096,
+			.left = 672,
+			.top = 684,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -628,6 +492,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1936,
 		.height = 1096,
+		.crop = {
+			.width = 1936,
+			.height = 1096,
+			.left = 672,
+			.top = 684,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -640,6 +510,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1924,
 		.height = 1080,
+		.crop = {
+			.width = 1924,
+			.height = 1080,
+			.left = 680,
+			.top = 692,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -652,6 +528,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
+		.crop = {
+			.width = 1920,
+			.height = 1080,
+			.left = 680,
+			.top = 692,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -664,6 +546,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1640,
 		.height = 1232,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -676,6 +564,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1640,
 		.height = 922,
+		.crop = {
+			.width = 3280,
+			.height = 1844,
+			.left = 0,
+			.top = 304,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -688,6 +582,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1300,
 		.height = 736,
+		.crop = {
+			.width = 2600,
+			.height = 1472,
+			.left = 344,
+			.top = 496,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -700,6 +600,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1296,
 		.height = 736,
+		.crop = {
+			.width = 2592,
+			.height = 1472,
+			.left = 344,
+			.top = 496,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -712,6 +618,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1284,
 		.height = 720,
+		.crop = {
+			.width = 2568,
+			.height = 1440,
+			.left = 360,
+			.top = 512,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -724,6 +636,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
+		.crop = {
+			.width = 2560,
+			.height = 1440,
+			.left = 360,
+			.top = 512,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -736,6 +654,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 820,
 		.height = 616,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
@@ -1074,6 +998,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
+	const struct imx355_mode *mode;
 	int ret;
 
 	/* Global Setting */
@@ -1085,13 +1010,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	}
 
 	/* Apply default values of current mode */
-	reg_list = &imx355->cur_mode->reg_list;
+	mode = imx355->cur_mode;
+	reg_list = &mode->reg_list;
 	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(imx355->dev, "failed to set mode");
 		return ret;
 	}
 
+	/* Set readout crop and size registers  */
+	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
+			       mode->crop.left);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
+			       mode->crop.top);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
+			       mode->crop.width + mode->crop.left - 1);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
+			       mode->crop.height + mode->crop.top - 1);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
+			       mode->width);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
+			       mode->height);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1


