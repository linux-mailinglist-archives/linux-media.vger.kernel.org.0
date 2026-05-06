Return-Path: <linux-media+bounces-60669-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIGpC+SH+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60669-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:26:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE64DF517
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DB853048152
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F78D4C0433;
	Wed,  6 May 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JALX1p+4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542FD4C0414
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091842; cv=none; b=qctPy69TG4hWP7RQ4T/yCzs3I2fqBBZJvXnT8czeMIUZBnhcVrJMJsfIzDgNafGzM2xDhJPKcNHRdI6D0y7MNA7fK7vCPbWJyKonBq07FgNHuNqvAp3IBXoOgGZ+fQYXt+4LGAj8RWPQCYAOiNls1ZpxEjuhl6nTEmbRAtEkgCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091842; c=relaxed/simple;
	bh=HhL9BPYWGTbEpdwe1+Oj9rZs/1DkUAcLY3/jKrhOTvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVe8svLpvOWsb37Ouw0oJ/5J7ooJOW1wQMh+Pd4UQs3oKXGHhT8JBl0+ST0zMOgGHOm9+2+cGdxBEnHG+r8hFJY0tQzTjk4QQKiqiHCF+rn99niXKLQMT3cAA6rpPlIlyJWsceQd2Npbay3h2CFsgDmPwF8yl1FPcnuETj2xY6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JALX1p+4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so103612055e9.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091838; x=1778696638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x68EB9TiSDc8QZUmo+43apWUQi8sDiO4HaVGa3lIAeE=;
        b=JALX1p+4LJyleP5xAy6ukKbUehIrqs1tClgG8e6c7yYpRNf6lGNWU1Z2Svdthou9fc
         CIDCnf+OfkU+ARkZf77WwhG32n31WVRdiJQk8dLYSM5QY3MRTRmWEMMimZnbsKvzk5lk
         pD/IbFOzq4N0iteT3H+KOB5MmT1ltUg5wJ9ihyOUUckIADkmotemnFhR8cxmMUm4rXRv
         CpZlrnZVZZodeYilOXwwGaGOlOLUo47mZH/go/CLkW7EG7LTYysGb1nwKUh/8TMHtnXz
         jGSdlxlfBUvxV5+82p1NOCopp1ZfEsfdVERPOIeWz54XQPMbzTg2m59uRPSgzBBQabKX
         Fhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091838; x=1778696638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x68EB9TiSDc8QZUmo+43apWUQi8sDiO4HaVGa3lIAeE=;
        b=Q92W6sdAZ4xB4l5paTJvAogFaqeOJUbvGbutKB2BSB5lFl0MjzxKyoR/Kp1mmdxjzs
         zJxIZBmb2fOfYVOlvtnkiCDOQoA7SRXApv85Vajvz2oxHde818mtU2bWWdoyMmev+1DB
         w8nN8bD45d1QbMOoUfbn/HEouWKRyjJXnzdPMomPlDBjvEDXqbRt2WFl5cbfBwXzCAj/
         qoqX6EMm3Gqq7aZ/IMphJnmTH2ki1ksaywwOCrR++F2o61xZOQoRRxwdXX1YMTtWJPoA
         a3LnhJwPjXLt01AO+FN8Vy2Fvk4m9Ubx5vjOfCoKthbHLH5NanEkjrSkPTL3rIE/eKd3
         +IYg==
X-Gm-Message-State: AOJu0YyeE//wqydXgsUl4ZopS6+k/DFpIZUz0EAUGpEH7X4yp7FrQ9nB
	pZD/XVUuHhdaLhw2twxvXbDMc5HK97kPpW6T363yygIU2W0mIRIMbGFVEp0sVGOSlox+hSLTZiN
	kF2ax
X-Gm-Gg: AeBDieuAivwkCa1S5MYE9rzAOXEinfydaMB2vg2ESR+/aWHiKaQZsQ5nuf42egfJRld
	72OxyKb/LrWzcHaodaiMgbwG4KwBcuFEeqSiXLppglZ09wogOd+efCTFpgMlPNL4Z5wLmKcdAKV
	SRgJOSdnETKF15hFLmfsrFWoAzks8O4WZW8fczorf3+DcpKFcp2f0p/LZIltIg/s5DfErF9Qgro
	Yqjm1oVnGFh2qNXCg3D1ZWhYB91uXNhgDEfbwTGHIUfyaGordvJeddeHWKsmMc/mqNZvDtgb8Ek
	Lm3xqZj0xvzIZciAHIAwZCu6LcvbU/O4hyTOlhzw1+lrd2DqPTCo7z1CBhIJIKb6X6Z6oCd3toa
	q7JbyAKK/ZU6BfARrpN3Oki5S86vsBW1YdGaRdK7PQFBAB5uOWyr3iBxIrdfZfmK0d20XSsYkAF
	84L5+SXkB98HpYzDwXS18ZPMu4
X-Received: by 2002:a05:600c:6d7:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48e51e0bc19mr49132215e9.5.1778091838526;
        Wed, 06 May 2026 11:23:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:57 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:42 +0100
Subject: [PATCH 04/13] media: imx355: Remove the duplication between
 width/height and x/y_out_size
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-4-660685030455@raspberrypi.com>
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
X-Rspamd-Queue-Id: 7CBE64DF517
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
	TAGGED_FROM(0.00)[bounces-60669-lists,linux-media=lfdr.de];
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

The register settings x_out_size and y_out_size are just width and
height, so drop the values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 6179fe74c897..589bad6c58e4 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -114,8 +114,6 @@ struct imx355_mode {
 	u16 y_add_start;
 	u16 x_add_end;
 	u16 y_add_end;
-	u16 x_out_size;
-	u16 y_out_size;
 };
 
 struct imx355_clk_params {
@@ -440,8 +438,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
-		.x_out_size = 0x0cd0,
-		.y_out_size = 0x09a0,
 	},
 	{
 		.width = 3268,
@@ -458,8 +454,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0008,
 		.x_add_end = 0x0ccb,
 		.y_add_end = 0x997,
-		.x_out_size = 0x0cc4,
-		.y_out_size = 0x0990,
 	},
 	{
 		.width = 3264,
@@ -476,8 +470,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0008,
 		.x_add_end = 0x0cc7,
 		.y_add_end = 0x0997,
-		.x_out_size = 0x0cc0,
-		.y_out_size = 0x0990,
 	},
 	{
 		.width = 1940,
@@ -494,8 +486,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02ac,
 		.x_add_end = 0x0a33,
 		.y_add_end = 0x06f3,
-		.x_out_size = 0x0794,
-		.y_out_size = 0x0448,
 	},
 	{
 		.width = 1936,
@@ -512,8 +502,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02ac,
 		.x_add_end = 0x0a2f,
 		.y_add_end = 0x06f3,
-		.x_out_size = 0x0790,
-		.y_out_size = 0x0448,
 	},
 	{
 		.width = 1924,
@@ -530,8 +518,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02b4,
 		.x_add_end = 0x0a2b,
 		.y_add_end = 0x06eb,
-		.x_out_size = 0x0784,
-		.y_out_size = 0x0438,
 	},
 	{
 		.width = 1920,
@@ -548,8 +534,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x02b4,
 		.x_add_end = 0x0a27,
 		.y_add_end = 0x06eb,
-		.x_out_size = 0x0780,
-		.y_out_size = 0x0438,
 	},
 	{
 		.width = 1640,
@@ -566,8 +550,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
-		.x_out_size = 0x0668,
-		.y_out_size = 0x04d0,
 	},
 	{
 		.width = 1640,
@@ -584,8 +566,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0130,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x0863,
-		.x_out_size = 0x0668,
-		.y_out_size = 0x039a,
 	},
 	{
 		.width = 1300,
@@ -602,8 +582,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x01f0,
 		.x_add_end = 0x0b7f,
 		.y_add_end = 0x07af,
-		.x_out_size = 0x0514,
-		.y_out_size = 0x02e0,
 	},
 	{
 		.width = 1296,
@@ -620,8 +598,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x01f0,
 		.x_add_end = 0x0b77,
 		.y_add_end = 0x07af,
-		.x_out_size = 0x0510,
-		.y_out_size = 0x02e0,
 	},
 	{
 		.width = 1284,
@@ -638,8 +614,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0200,
 		.x_add_end = 0x0b6f,
 		.y_add_end = 0x079f,
-		.x_out_size = 0x0504,
-		.y_out_size = 0x02d0,
 	},
 	{
 		.width = 1280,
@@ -656,8 +630,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0200,
 		.x_add_end = 0x0b67,
 		.y_add_end = 0x079f,
-		.x_out_size = 0x0500,
-		.y_out_size = 0x02d0,
 	},
 	{
 		.width = 820,
@@ -674,8 +646,6 @@ static const struct imx355_mode supported_modes[] = {
 		.y_add_start = 0x0000,
 		.x_add_end = 0x0ccf,
 		.y_add_end = 0x099f,
-		.x_out_size = 0x0334,
-		.y_out_size = 0x0268,
 	},
 };
 
@@ -1044,11 +1014,11 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
-			       mode->x_out_size);
+			       mode->width);
 	if (ret)
 		return ret;
 	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
-			       mode->y_out_size);
+			       mode->height);
 	if (ret)
 		return ret;
 

-- 
2.34.1


