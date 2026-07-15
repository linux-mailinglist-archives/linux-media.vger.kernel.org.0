Return-Path: <linux-media+bounces-67654-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nYAlKnpzV2opOQEAu9opvQ
	(envelope-from <linux-media+bounces-67654-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:48:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61175DB99
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:48:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="t/fK+58R";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67654-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67654-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53A3F303E8E6
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1180344C678;
	Wed, 15 Jul 2026 11:44:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52A44C673
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115857; cv=none; b=hlA4E+ShgYmU9n+b0e3Vvut16MdUAun44ZhhSgcwn4NBuNbUt3xntbcvpdssVpTPI5p0+nvHRT3FuvCAOhGJLnIIZnnx0IixG7wg3c0u5Zr8nBprTq3KryIOWRBMextuXmpEbxb+rm+5opCrhlqhjeaOPMsK9OY/k3KjAd7Mx70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115857; c=relaxed/simple;
	bh=B3V+HwP2YfOyiyHB6H9H9T7aO3Q5SXhcKZNK2vZkcIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOW8scabgAwCQtKZaonSyS00+/JmWUfia6F8Z0wLlMtJtRk91O3LV60MuQmE20e26StTj7XgxNLmHY8fspIipU7fK7s1tqsvkmKtNeE+q3yByOMwbibxWLPO/KRhvrHNE7N4kTCSN9rPbe1w9QD/79zIyBk3GxmZchJNKclduRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t/fK+58R; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so36817435e9.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115854; x=1784720654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JXztZss7n+GcgZQ7d9yNTwhZSqmPdrdCaY06YjdH6M=;
        b=t/fK+58RClzIrkTFd0XZq+89d5D7omk3q4SUnpsdUuhlh2FOxwNfB4r4vsKOs2BHjN
         bS52dQpfXqDC5nuUwdnwUFqwxYHMwFtn7nszK8MT/gVCfvdNMlfVMn8ikhHYPVsowap7
         bKtEihydcVNDhH4UyCzbxyInnH8mgpfWmjyclVkoDFcvHzjMGdnOe9qt3WKGrXhbRNhu
         JpEcLtw53vP7me7nTNN0N6GlMFL8JCg2drH/fMGhDTOEbK4TseTnO2ZycBlx98MNPlPu
         gVBFO5G9Wi7FW/ju5X5bT0mOJdTMFLQOue8S+YEqMOdVKnuLf5KmtgsCdoFvK8Osd6vW
         R6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115854; x=1784720654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JXztZss7n+GcgZQ7d9yNTwhZSqmPdrdCaY06YjdH6M=;
        b=XE3nnrFosbgAqMdWOD4Z/FPD5Gqyc1KOBTpeXgvE2lnLi5i/PJe74ixvMn2K2cf9j/
         gZzhjpZ2ygtGEgs/g1a5GJIGYWuRFUyrEnnqqGZExmiT852xi0yRsaj1gJ+G9GyVRPS0
         Wgp+MEhWOn1tuZnlW9vOqWaNPPbxzleRWq+Oh5hyj0PPxdZRivRdg5Q6/VLodS3ScqKh
         E7gzh2o0mV/Ag8/Lzq52oqn+mfyZV14/zJ/K8vw1pBrdSbnhzjYApAkPTTh0EL98iDJX
         VM1Y75J8ZePlZxRy9q+mGg5jOr4PyReOee5QONCiN6Hd5E9r7Ya2fbPHowACTyNd5OXB
         xdOw==
X-Gm-Message-State: AOJu0Yz6hTxJJkQwMhunPVF3+NGZUNpQG+xGJJX2Pkd7HNvhnAVSkw7e
	j8b1T8K2k9CEZf+aCauJQC0rqzCJWBhP8BS86uS8r8JqgUXlkOVyuop914j1bI8RdGs=
X-Gm-Gg: AfdE7cl290bqhKe26ywDBU4nr+kLct+WnSwzA64PjAHiCiA81OjHZehESgHT5DPzQgK
	HqKjlt+rfl7/TKDf0y2Ox5+PYKPvWfY95vm5nR3EoVrPL/so5ZrtitXCgZTFpJ/GOuiiLToUpk5
	ZC3oTATGR+zqipj4Akq1J9Xn+U9SDphdsaQGDttVJ4zpIxwGonshdyKOUxTSOydfumKwyrF+YXd
	3PgUZTCVKVzx5OvOIG0uaSTbAKVTK/5hHjzxBHzNhoBw/0SBxATCvr641LsbDUPe1/g2BbAh/S3
	tTK7ZdfhTLJz0bBVV+53hBqiPFS7uF/exUDbzxx240qw0gsHb6UgQur27vOP3gSni+j8CAsvLGw
	IjelZGdjrbrXdkE9cPWFVRgjqj8rFRvXVmCpOqM6UyuCqE6TqTUWLkAyaqvMpeZBc/erGkn1Kes
	WQ9LvVXjcfAxcF+yBHLVvovwugQb6kdmz/VRJwuc/ilIa5+3jVZ6P8VkOFJ7xXhqBE
X-Received: by 2002:a05:600c:e547:10b0:493:f7d9:8183 with SMTP id 5b1f17b1804b1-495389e40admr47630215e9.39.1784115853895;
        Wed, 15 Jul 2026 04:44:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:18 +0100
Subject: [PATCH v4 05/21] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-5-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67654-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B61175DB99

Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
from the mode register list.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 01d6c28a2656..b40d89d86156 100644
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


