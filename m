Return-Path: <linux-media+bounces-60666-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OKXAJyH+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60666-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B14DF4DD
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14AC9301C5BA
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86374C043F;
	Wed,  6 May 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VLk3MA0h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3892A4A13A8
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091840; cv=none; b=OljFurh+CXDAOafGSwtLCq/tIh7ifNUb43j+4A2Gc+OxyfDagCtdaDMEGiAsDhEQ7cvxS4bgnBYn2Ekj0sTvF7vXtoy1UFn5AkdTWbBXf7xXpGRgvLCz0+n8URmh+dbX24IS5USttaRQ12OASgzTXtlNMjiX4boO7zE3NCS8rSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091840; c=relaxed/simple;
	bh=LIfdeYTBQzESHf0dap81X1vvmfJl+vklqFORmyoGYd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LxdDDXrlaE0C/a/B9gYnwAij8mBFYabi83oR+cBruVW2QGZ03G3e0xptgg2T68sya3DeVk155CgNlFUfvsNwGLCls7EFv2RkkpFean7UaTLylkJoMKlC+nse4hZPgwYgJEiqOiUcAettH62UJ7IPJ+aehOGU6Us2GNMaBXxmm2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VLk3MA0h; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so9225415e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091836; x=1778696636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdXx2gd2gTnToTt9XBiE+O899xdtsxweVQw+h4yD4a0=;
        b=VLk3MA0h7saapiSHbcNl5vFiqyC49U80iKUpnq6BXuWMeLT4pKExUFf/KFQ+JK6iYD
         5qOsFIKjtlKu4I2ffa9LSzcXnfsGH1bdwTx2pbPKo1nizipZ8JW42qUrfHw8xbplAB5e
         94ECfLi5QcWLfkEfG0GQcLZ7EqWa+ogCG9dbQ25KfJOYppfBNNTUszmBRll7EPS7X7db
         Nxvm/FvHstjSWDqbh3p46JZ6V+YtgMZPM/hO/mauuasgHG+u+eU0Y8/83V5yFlu68Gkj
         WOrd6IsP/Jc+phnUMMvUitstkBmNTLbglPbiIJkiszTUuiemRJ497jRQxLcpXAS7uh4h
         1SsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091836; x=1778696636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LdXx2gd2gTnToTt9XBiE+O899xdtsxweVQw+h4yD4a0=;
        b=PpXrD6syIqKSXBD114hygUJRLxLbFgtHI0qP6olWKZh7E0piljTUEfTiTELmoT9sw4
         3JLViz5yTxgpKcAdIcWT7ZBrufHzo7vuKTyAccrALPkBaByVeFi4vaQAMT+k1pM9d3+2
         QXZ0Nz/Wd6JNryj9fCZ6arMwCPspWOjnIPDRS4n6zbp4ISE2Z7UdDW6ab6TuEZw+FJVL
         1zL5NPFxaAmoMmS3Mr4sPyO2Lr1Htfvjhj9dyLzrwagYtmNI9h/HT6whpYoFG6gd6YS8
         BrwbE+M7UoFd9mK78Netx1hlSAxmqAcQ/EXYUwzKHf6m6aOAHk6RnzrxzRVbFS4EOQDp
         GhUw==
X-Gm-Message-State: AOJu0YyktcY5WoyVH4q39jIrGQbPNCvhcQN6/WaXU0iCEEf84y92DdwG
	/F21+KSdWnYSXJjWT/b4/WjvoK/yAZLoQS4E+mXNne/dnETq+si70Ii+Ngy4raRLMXhOQjC5Q7M
	NqSBw
X-Gm-Gg: AeBDievjqT/WAiEHTJppjagMBYPnCdqzAa6f2FNdrkjAVKgafz/vXyWYk9PYvs1JGND
	ggulcnio8f0UzmzBt/JRfdbb/Gz34vIrcHJ728I0EtnjLjcS2ET55ohNlvXa7JEWxNUBGQYny+O
	9C43/LDfwfMmh8L8e3+TCQ5JD831u6lsexvGDNCRj1rVvDQCWbAI01HdRQpy4XD7NLra/FpsZfP
	DFQMVwFRyic04/ufDGeF3RFNcfg8Tl5dODf4/tuJT0meIn3jtaxn2aFS5kZ0MechhkGhkc87NmS
	T0gwjjJAutpMuSExjzkzR05hT3Ea+n+hzNoBHuSaxN3LSmywS3/0XYojpnFyNeRPelpJwmiVsgO
	cJEJQRrgpgjokjYrR/70Ws0RL24/XuSKFKLfNwli4QzKWLbf3k7xNjfXRXJXgylCVoIQgtkYbbd
	L9yW+N/99NalFpt4tMeMQXQ7/eXSfs1PSs49nhxvKLoZV9bg==
X-Received: by 2002:a05:600d:d:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48e522c0909mr52615305e9.14.1778091836305;
        Wed, 06 May 2026 11:23:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:55 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:39 +0100
Subject: [PATCH 01/13] media: imx355: Remove duplicated registers from the
 mode tables
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-1-660685030455@raspberrypi.com>
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
In-Reply-To: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 20260414-imx355-24mhz-v1-1-9ae77bc6e7ec@ixit.cz, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: 586B14DF4DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60666-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

A large number of registers are identical within all the modes.
Move those to imx355_global_regs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 314 +++------------------------------------------
 1 file changed, 20 insertions(+), 294 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index f9ec13bb27d1..a694d4d742ae 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -226,6 +226,26 @@ static const struct imx355_reg imx355_global_regs[] = {
 	{ 0x68b0, 0x00 },
 	{ 0x3058, 0x00 },
 	{ 0x305a, 0x00 },
+	{ 0x0112, 0x0a },
+	{ 0x0113, 0x0a },
+	{ 0x0114, 0x03 },
+	{ 0x0301, 0x05 },
+	{ 0x0303, 0x01 },
+	{ 0x0305, 0x02 },
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
@@ -234,9 +254,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0112, 0x0a },
-	{ 0x0113, 0x0a },
-	{ 0x0114, 0x03 },
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
 	{ 0x0340, 0x0a },
@@ -249,8 +266,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0349, 0xcb },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -258,30 +273,11 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x034d, 0xc4 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -294,8 +290,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0349, 0xc7 },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x97 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -303,30 +297,11 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x034d, 0xc0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0x90 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -339,8 +314,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -348,30 +321,11 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x034d, 0xd0 },
 	{ 0x034e, 0x09 },
 	{ 0x034f, 0xa0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -384,8 +338,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0349, 0x33 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -393,30 +345,11 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x034d, 0x94 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -429,8 +362,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0349, 0x2f },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xf3 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -438,30 +369,11 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x034d, 0x90 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x48 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -474,8 +386,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0349, 0x2b },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -483,30 +393,11 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x034d, 0x84 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -519,8 +410,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0349, 0x27 },
 	{ 0x034a, 0x06 },
 	{ 0x034b, 0xeb },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -528,30 +417,11 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x034d, 0x80 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0x38 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -564,8 +434,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -573,30 +441,11 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x04 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -609,8 +458,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x08 },
 	{ 0x034b, 0x63 },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -618,30 +465,11 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x034d, 0x68 },
 	{ 0x034e, 0x03 },
 	{ 0x034f, 0x9a },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -654,8 +482,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0349, 0x7f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -663,30 +489,11 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x034d, 0x14 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -699,8 +506,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0349, 0x77 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0xaf },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -708,30 +513,11 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x034d, 0x10 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xe0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -744,8 +530,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0349, 0x6f },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -753,30 +537,11 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x034d, 0x04 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -789,8 +554,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0349, 0x67 },
 	{ 0x034a, 0x07 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -798,30 +561,11 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x034d, 0x00 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0xd0 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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
@@ -834,8 +578,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0349, 0xcf },
 	{ 0x034a, 0x09 },
 	{ 0x034b, 0x9f },
-	{ 0x0220, 0x00 },
-	{ 0x0222, 0x01 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -843,24 +585,8 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x034d, 0x34 },
 	{ 0x034e, 0x02 },
 	{ 0x034f, 0x68 },
-	{ 0x0301, 0x05 },
-	{ 0x0303, 0x01 },
-	{ 0x0305, 0x02 },
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


