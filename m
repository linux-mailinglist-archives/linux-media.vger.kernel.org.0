Return-Path: <linux-media+bounces-67014-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbbjBDtmTmreLwIAu9opvQ
	(envelope-from <linux-media+bounces-67014-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:01:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9DB727B68
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:01:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=HYqRnJDb;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67014-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67014-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B103166B38
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6404C6F14;
	Wed,  8 Jul 2026 14:49:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CB5414A31
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522162; cv=none; b=Y1jmiVGEkr8KM3ohdqshghYD5juvHdGIljsfbqqAboJJ6xTnjXEL8Y0VvZjBm1OopIpFYFCR3gvf7iXGFdf5FocQhzKBMurYNi55kkMMuZhHyQYhqqtKDwZe8qdn2xS99vaVaaKa/fmYHEhqRxwXpQvXyny9883ADIXAy2WTQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522162; c=relaxed/simple;
	bh=uptn9HEahdMTaqGmQxVJEJT5YRUy1nkqgIMVl2o0djI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuqoGhbW9ngoA59mORmcBvvWNxBlDOaU5CBn9kCDgMXHlr8lvX3s+szFt0GZYYHxjFelLPCqp+E1j4MuuCGYLGilclr/ykx1rdCQyE6Tdczv8Y5zDGuiDnC9rUY6+5ag7HhbedLv1D+99M8IjgNQC1hm2DpHRSqB68M8lQ1sGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HYqRnJDb; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so4703935e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522154; x=1784126954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pwzhsyb87YU04avI9KvPGSuu5cY5C4k8J1lsuCyaRo8=;
        b=HYqRnJDb3n44V1/+5cT3mQMyqFlUG9kGDrugka+tQ6UZTslRnadbotSiaqdoBjBo2Y
         NT5kxe0FwPlqIX8aHBurVH2IvjX/siZ6F5d15SWgzX6cJPGcOqkEVgnA5GLItoCpQf/A
         fVx605JQ7i2a3VcjmhUV4LCEcH3spX2mVt+cN8gS/tnyFZMGXz3vaFezufy7dOnxmRlo
         +9l5bRoa+2ql+Xj1pANWf+KyYVfeu4YSqNqkqT5Qk/2YL/7aVMgecYGZj4l/bax/iklA
         c4CNJhQDGLrDAZlEa4LWfYcOFT9xezdCpCohsFvIdQoUr3Rks3s0oAn7kn0uv8gp/jQi
         adNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522154; x=1784126954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pwzhsyb87YU04avI9KvPGSuu5cY5C4k8J1lsuCyaRo8=;
        b=LFHbwla7+Jn19ddeUuQ6+NChjxxdPKYqVO5ikuUs+cu/9OQkAPRMFdGOgpvKxOjpeW
         8uDieHOgXAFZqG1UpNvbvPbzqBOXEwMiE5oZZ7zPE/VRpZQ08q74GLBAP1OuS2uYFHee
         tIaYBrjo9X3onF/zzfTcZREpfEh+MdvBG+8uNTeYoIuVZ3FI6w868+96XkR1hbgUu5Yr
         9PlG+FXK5bGfrcOKCQAc8C6YHOb3wIfrShQhmglmtS3mBMbx8wE/rODqieSoDlcd5xzp
         +WLKnx3EVCkRvnQjy6e0VTcy1zeLwBDxnAIP5IW/LE0vlnEgsxFgLi5RnAo2A/QuGP9Z
         NSmQ==
X-Gm-Message-State: AOJu0YxoLZKXI0XJK3SXPnDtetZz/o8gJDwgA1z8BKoh5txuuMRIxYTr
	hVO+SAD2vXfvkLMq/UMEclZIWIslMaVTIMBlb9Yd30NCYY/Q9qnkri4Ahaec+cjVuo4=
X-Gm-Gg: AfdE7ckB6agSJK2KWbiRI59WVZFPMLYiJ7VL8A+PEVRJk279HQow08TvJ8sl5Np+DQv
	4xr/gC7cNYzjfj5RppQaE7EFyho8xmXVZRQxfsXTKTxO9p9MuwzAYsHdfzRAGnBl1Z9U9dlen4i
	r1vcc73hP9aXsqYBQo9EWjp8qpEcBHDt/P8bWoct0odPkVPrM+Qe20s0ZBWdIFr6AlM2GcP+uaP
	PMqkDdCGOYrz3zbLYUU2iDpQYNbfslJj+pewjS263NAWLn/rQFWU35IlK1bsw9sG61W7ijqxm7f
	xE0eZlr91CJvM4YcF/FDx2j0p6qjd9NQwiLoAxWwba+/qmMTWKkfasedfgDIXH+Nf6pJjE2ied3
	ALUOIahQ0g/66PW5W3lrefPmTtRtUXGYXXKQ3CpJ6h2oRbVEVHB02vyzqc9wnRh1FZWL8VTK8Y8
	OdY7Ta6A1ZprjlWzpfEtXhAymoy1yn9d1czVkYZ0Q2mUOxXZDS225LztiAyhDnMpUcrbnFEIQu4
	ko=
X-Received: by 2002:a05:600c:1f8e:b0:492:5e22:ef18 with SMTP id 5b1f17b1804b1-493e6861bc8mr26602435e9.9.1783522153744;
        Wed, 08 Jul 2026 07:49:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:41 +0100
Subject: [PATCH v3 05/20] media: imx355: Programmatically set the crop
 parameters for each mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-5-9df386a623d7@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67014-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C9DB727B68

Currently the cropping is set via register entries in the per mode
register lists. Add the crop information to the mode structure as
a v4l2_rect, and set the registers programmatically.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 290 +++++++++++++++++++--------------------------
 1 file changed, 121 insertions(+), 169 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 24c883a6c520..29bca1d98791 100644
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


