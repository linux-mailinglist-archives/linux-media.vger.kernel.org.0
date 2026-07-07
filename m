Return-Path: <linux-media+bounces-66881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XHYfG0MyTWq3wQEAu9opvQ
	(envelope-from <linux-media+bounces-66881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337771E19D
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:07:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=dNY6G1vo;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66881-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66881-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4C57301BB9F
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F03375ADF;
	Tue,  7 Jul 2026 17:06:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7343B6C7
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443983; cv=none; b=iZdRBgC0fCpPT6vYhUZ7Wot0xoNys14bEtvv0Zd7EDZyiGEDE/lOEP+G9Dv4WKUPkxntLMcRKP2P3+KFz3E7+5usc9q4urGh+huksWcD/+Z09piHh9IderMirYWoAAEASNDp6JKMpgmvq4wFPqs7sztOYVH+wQyIkdG+hlxeRp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443983; c=relaxed/simple;
	bh=HQJ/Ie+2S0zkCH8tb0YTK46iEh7rox5jpQzKt5Wwveg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEE+DJ8rVfbTxnSa3EPDdEgtlEeO0Wpy2enS8HQY48L7dNxGvzTM+B+i7FMEq6fdsIdwyGHzjrYdqVLuOA1hqkBNrxj+yPxFS30WOn46OrQ+KLrp90bHrqkPXTocM+vmx3RuY0IvN9+90v43nKsIVwYnts8BbhBnp77xMiao8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dNY6G1vo; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so32129455e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443980; x=1784048780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2Cy3oDNso38IWq2Zx6vkOBXD0S6afSS2z3CCsQoqsM=;
        b=dNY6G1votZmk0SWmOxcUdH7DDlbJdHBpDfwiIWM5IF1o1VmCyThFw5a9KxSNqi3rRM
         toHiTDGY6iNdag8JMqah7uBZt/a37J6ik87OpY+GAJCIzvgCVZPlYx3gLIbZQcdDyuEm
         WIac6yxHChCPSRD2TV0VXir1fg8DU6Tmjo8zSJgyVwrWYFA5l7bpobAXW6jU5MNfzSCp
         Fsk4iIYqy8R011KBbJz+VDvEJbq9kbVMEHF0Am63Sa+YkYsfO/34WYWtv+mza3CXOBVp
         Uj1pGLOpFuOiCEyRdweEcsNVryzmeeTmtx3lIMT3+9JyjLJMp0gNRQyyvtqwGMjkoHx1
         VwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443980; x=1784048780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2Cy3oDNso38IWq2Zx6vkOBXD0S6afSS2z3CCsQoqsM=;
        b=d7XQuzaoGoDUVwhdEufJwWIxroCT8bWFTt/sutx1SvldXu262sqJoYN9CYQ1I/CZIg
         LuKIDoNyWTkGYfGLu/oFMQP6SNPch6A7vLdpCFNCZ8Wcil3lTCteRIe43naZLM29CP91
         UjZBrkmSIwNeS2LmdlJB5DQry+JPvaWKiEsDsOfGl6KZt3XbxPCzRLKENnnsxbz6VaeG
         30Msume63X1LNCffvA1/K16ovw2rP4GUVYomU+b8oyJfdfJfYcIZef0PWR3x/sMCevlT
         5Fa1LPWi+Vfa9BecPYiUMitYHG8AncqvaxDsIuXO0OcQLbaBWD/3OvNhVaNVmCEaVBIF
         eWvw==
X-Gm-Message-State: AOJu0YxkkdVs3axIVZHyf4AgEw5NXjJOhMx0KhRVEzE0UqPj8HNewp+H
	Oqw9IMfPpDvfKMbjmVHw8Pf/UwSu3aKMdfyEE7swv8b6LatU42InBnqoz2v2KSXUuTI=
X-Gm-Gg: AfdE7cnDODNwyalaeTO2N3ymrzv4/RrXgeME6wtRTQFFMUZDE7LkEazoskVo5jvLY4j
	UZK8ghQ/uaWihavLT5yMrxqRsmh711aq7qB6FL2osMiPKp0QEB5gdnfVOBJ7Vq4hk/+T9UC2VCM
	J53wct2+Nh2DClVHqmFhBHzFSCbMvaa5RA9SMG1ZyblBc8FquvQ6h0tCMbrxPRNOO7gmAF2IuiZ
	oBctxW31/CGinOflsVGxLvhHPKuFcW6U4C7MUl6vLvm4+xNqaCDNaw0AujlhnZ9qFEps2Bx3Xop
	4yezr9wpg97H1/huO7xt0aPgnDnsvY49qtOAW14x6exesqYbM2xtRnPN07IQ/RdJWSq5GfkAYdl
	JXERoDJqVr2eJQ2PLuiqYesn7TcfatXQw56N7J6Ut6LzmK//yUDybmUP/EiJcL86S+9zBn7tjQM
	2y8QwgPwKNsdqybMpyjv6DeuyHMZTs3LTDhIT5g0gFmUZVF1NbcsNk7HI+uk86+T8o
X-Received: by 2002:a05:600c:4f81:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493df041a17mr69949875e9.10.1783443979865;
        Tue, 07 Jul 2026 10:06:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:38 +0100
Subject: [PATCH v2 06/20] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-6-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66881-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0337771E19D

The driver already has the LLP value stored in the mode structure,
but also had the same value set via register writes in the mode's
register list. Remove this duplication.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 363b5667b6c9..66e70650e666 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,9 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_LLP			0x0342
+#define IMX355_LLP_MAX			0xffff
+
 #define IMX355_REG_X_ADD_START		0x0344
 #define IMX355_REG_Y_ADD_START		0x0346
 #define IMX355_REG_X_ADD_END		0x0348
@@ -259,8 +262,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -269,8 +270,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -279,8 +278,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -289,8 +286,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -299,8 +294,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -309,8 +302,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -319,8 +310,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -329,8 +318,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -339,8 +326,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -349,8 +334,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -359,8 +342,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -369,8 +350,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -379,8 +358,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -389,8 +366,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -1058,6 +1033,13 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	/* set line length */
+	ret = imx355_write_reg(imx355, IMX355_REG_LLP,
+			       imx355->hblank->val + imx355->cur_mode->width,
+			       2);
+	if (ret)
+		return ret;
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx355->sd.ctrl_handler);
 	if (ret)

-- 
2.34.1


