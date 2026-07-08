Return-Path: <linux-media+bounces-67013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lb+0Kx9kTmo7LwIAu9opvQ
	(envelope-from <linux-media+bounces-67013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 918C67279C1
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=SRYRgKln;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67013-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67013-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F1603014340
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12D2492516;
	Wed,  8 Jul 2026 14:49:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65044D6A1
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522161; cv=none; b=Md73tbZqKG7GLM8ExKnPcoAW7mctVuPl6n5+zM86DS8ggtQWtvhop2WzO+IN1ouO/2xaDdPCqR1z200ndoQMBFG4v+tspcL+WllcHwzcckEiICMe/Mg6W9hNDqsLvzyf4k/VUOtGzfaRHcqprmR8QUbbtfVLhkrVHHH4WXNdJ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522161; c=relaxed/simple;
	bh=W23XwrRaIK45UKWx+pemC8iWWRlXIUUJWHH74piX54c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rVxYb6ZXYf9Yzjxo705txMV4jFu5M9dId4wtq2D1bv8+2q3mmx82KAyjoNfOywqOwl5Si6tTqPDUUHavL+TSx9q6k7j7titBmG+A/IkPvoupmagN683ywQWQdjr7Dc14/FD2DMkzApDr3KB+KsjrXVqowoGYcMjDEp7Pvp5rw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SRYRgKln; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e497643fso4224685e9.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522153; x=1784126953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJcpwUL5OnSXVi1yEj1ZgDZ7aAujN4ZxyzVguEBXsyw=;
        b=SRYRgKlnwEAbdY2mhfvJmN3I3uE5D/4t1RYTUR3AV9VrD1l3TBGVIs5TlZBIy8OZ0N
         E2ybG+v2iWu+AXHIcaWTeyu24xv+BdB4sR5+FcDcY2XOowb+4gLkIU4vjFEBSyHaFG0y
         /3P/COVlD7MEnUqDueeO88DPv3DP8ifQi05BPDJby72lPlouRA5Xg3ZTAS0YnWgPqPp0
         E0+fEPdePBxbhkggWtcdoDVphDMJpCvrA8dt3y5C1meKqoxUIy8Hp3hBhWy/ltcfXLbl
         FZpsqmdJItSxEKtGJMMXQiYzq75uvuoIKBWfp8WngG56GQfwe0S9mAH3/ZJo7Ci47Fnj
         EwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522153; x=1784126953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJcpwUL5OnSXVi1yEj1ZgDZ7aAujN4ZxyzVguEBXsyw=;
        b=PS2a7KQ9833w4m9bUxD0h91XVyND1JzXSEUMlN2OG95bhy1Vj/7rcDC0NMw3TGtu2I
         Dw5lfN5DSFzTiwpDIvdPzHqcIpBFbYNih36xsj85pU9x6tHfAt/sIThME0sLqhSDADQp
         JiTxxKSLJWLnLqUWmqwBcgtybSZ72u2WZ/wEzX14O11H1M0rs0EFgc0cX96Y5hMuEKZo
         xR8y9n88+x8E8b+k73Wk34+xeHbr+bhciQGowxKFDwUTFos0h2/1tNODbumPq1i5UnPa
         jNGG9YYMxJodv+HSRIs3h+K6hDupBXqR9lozmv0q2P+A442vXjJuVMSPSK5GRYepQK3q
         rc+Q==
X-Gm-Message-State: AOJu0YwqcEdSIy8kxNTKp8rb5taTyMLBOS9mE7K4z0jByu3FAINQBzNb
	YtFbgXrpUE6Ay5jf/YoXH2H8JUoD2QIQg8FAE+Yr1pzIqMpzgizw2SAmqtIDAAowM9M=
X-Gm-Gg: AfdE7cnIPBnx6pAkzw9Rhju+1s3z/N+1wnGPz5JaY33lFrOOTdELA5iBeQ+EZxAEfEH
	8ZSdkP/w7FdLjvJ0JkHiu1nnGab7L3YsKUpsdS7q18TlaP5sp8OjXjlpaI+X2Wix8X21Jh0jjAM
	QP+o/uxKZbNgd3zKMVjXw/cS4RDhloVW1QjeUfJSEIA43tPRmyK5l+5u1dPzahmTpgZ/RMxhqKc
	5x27Vs4qfH2SGuijccQDOtjQB2g7BtpvppMu4eNM2f6pW8STrSlvURNQv6eKt003BhQY0JUIrtR
	SbtQlQ+iigXvJSQAwcghCnM2PN0lDYgu602+viYtFoI/y2bj/iz8pAhTCVPM7R8USMJpeEYxgLm
	dVg5zzjDDwzPIoo8WuUGYq8NUkFg2ZzWBLZRgAyjjzCAp6n4rhpXz+BJolpBAsvgrsvI4bJSD+w
	z3ZEfIOr3q4NcTt2AUYgfxISRayly/ToZxBF5TkCF1lvtkAV/U10ZjqS42bZdUCeRXIp41klO5g
	CI=
X-Received: by 2002:a05:600c:4512:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493e6893c66mr27120565e9.11.1783522152948;
        Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:40 +0100
Subject: [PATCH v3 04/20] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-4-9df386a623d7@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67013-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 918C67279C1

Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
from the mode register list.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 4eaccd9e90f1..24c883a6c520 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -254,8 +254,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -278,8 +276,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -302,8 +298,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -326,8 +320,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -350,8 +342,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -374,8 +364,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -398,8 +386,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -422,8 +408,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -446,8 +430,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x01 },
@@ -470,8 +452,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -494,8 +474,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -518,8 +496,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -542,8 +518,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -566,8 +540,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x02 },
-	{ 0x0341, 0x8c },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },

-- 
2.34.1


