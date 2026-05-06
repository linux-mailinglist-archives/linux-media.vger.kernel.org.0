Return-Path: <linux-media+bounces-60670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOJpLVWH+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D554DF49B
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B2253015704
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014DB4C77B5;
	Wed,  6 May 2026 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="JO04K5dN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC954C6EEF
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091843; cv=none; b=YtV+X07aE8eTrpYWJ3Dmy2++3/ua8MGs6pplMbsIsnWuB1s1jTwu/afWUm7JPFgmwEQP/i6tS/RE5tG6RasfFcmMBQ0D3/h7GSzSbGOsYjUtVsYXpGQ7Qk21SwiwkmpdxX60SfVbW50XSsI9r5Clh8QsK4tOFNMk4qTV5X5k/u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091843; c=relaxed/simple;
	bh=f6gIPNFF3ZGz6Dzi7iDBzYYDWPkgTeyPnawayseqnaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4s5vMHsAOUEOKK31vPAcE1JBs03Dh+SD7W0DIMfcAKtbB6JdlUj8q4eNfmlIEedOPNKffXAkQPpjaGQcPBqyBmc/Bcd0uO/Hrh2nE8M+dG8cKb1m92JyT3z+vFM14Z4vWsZ3RoIgy/abQNMtehCJfhlUTAFvjjXk7owQbsjtd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=JO04K5dN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b0786beso44653125e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091839; x=1778696639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epOeXOJbCmT1H5jV/iuLaOOTzE2n5vMU5EsH3hJ6nfk=;
        b=JO04K5dNXASssIQ6yMJz/D7kQQA5sFoguuS5KdFcAVxu5gdqGY2d3CXZBsdDnruf0s
         tXDZGh6O4npIfvz6wTc2iRvnOdZfSdrQV7meET7EVJYokaMr8W1N4YDLek2PQFgfsiVp
         C/pnAaZJ7CA9uTEFvBfGVvmDWz5Iiik1faflPd+u4gG5nWvgYGUZz5o5Eyb0eo6ZLhRv
         4QVf3EPoV4MbfluL356wttVXDPhHTJsnXYomsvHCSl9QUI7aLf/JXNkrdSR3a8UrLGoS
         gx+hNUvqxfZ1yPY6oc8yFsOXGs+0jNp0rfNu9XejVJ1YQYR04jpGZY6x4wroKLfogTxi
         SvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091839; x=1778696639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=epOeXOJbCmT1H5jV/iuLaOOTzE2n5vMU5EsH3hJ6nfk=;
        b=syZ4fQz2SDsxPrH63CFv9xEeeJRAV0sRiTmexl5c2UUpUuvFhJgAzegJrD98SuJnHl
         8haiHWfvpZWlO+QdSHdQTv1d2qrrWabU9MFFxXhlpsQLhFDUQ/Lno3hIFTqh4mKaq2cA
         ho/xi5RcHShgYFUxpcHYORJTIuTBXpCd9vsfgStbhZgXFYsYx7W8kKVYG9yqKYfIltqO
         ppYtJk+APJD2iXkqxVpAEPQIAGxBATB2mNxGADEM22fuX3zCRYjCenznh2OBEKIAR9AV
         d4BIBZyKencudrceGGrbernTwtVoZLc+3Cw/47uG2kqHjy8onQVYugED8jUzeWyLlEV3
         T01Q==
X-Gm-Message-State: AOJu0Yxinf8EfXtmwCVWx1fyLMMo171RKGWLxsxhAF9nyheAeIh0KI53
	VespBrTQ9dZpi/kvNeS2CqkcYkdtLNBbzEkZseJ5ovSEh7Oh3a7yQB3HiX3WkiUTl7lHPSyMuR0
	xFyt2
X-Gm-Gg: AeBDietR/uZl4M/G9T2+RIjfqSviLJRe6l0IGwtv1qcpRLmnVZSOgBTlQ8ZDzGMPsPG
	31L8CZhMRH+yeomRyDTsiDbBpLKUcZSElpWGhFYfCEgs3NMGbXhtNHDCHWmdlYMp8pJsi2cxt8p
	MTBWnbNhsb1JDUwbrpAo41Af95j/k/eXOYpohsYEnEY/BlxsZjtfiHCHgpKc19hwud41g4t0jZK
	4H9jmY+MtDZOCl6YbYrFxSXCec5vouIjZa1d/dMYuelAJGMKhvECr7aBTKy383Qn3XdsT/1jb4n
	YU0tCF5E8eh6RbjXdHBKD0dqVuUm1ZXZ3Bd2vQVAl7GOYzKY1rs1yR4NTe+JgVGZVmNrf2az/1B
	DXBBJIH4t3oiBiQd2WzPg9z3iZ491GnxW2d8ibAcMVu8rq1isxEuwmBMZJqLF1Fyf2zb3Tddz77
	GVbM4dK9V5ipzUsuGktrXKpf82
X-Received: by 2002:a05:600c:12d4:b0:488:9439:881a with SMTP id 5b1f17b1804b1-48e51e0bba9mr50399125e9.2.1778091839295;
        Wed, 06 May 2026 11:23:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:58 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:43 +0100
Subject: [PATCH 05/13] media: imx355: Set register LINE_LENGTH_PCK
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-5-660685030455@raspberrypi.com>
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
X-Rspamd-Queue-Id: 57D554DF49B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60670-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The driver already has the LLP value stored in the mode structure,
but also had the same value set via register writes in the mode's
register list. Remove this duplication.

This can't be implemented via a s_ctrl handler for V4L2_CID_HBLANK
as __v4l2_ctrl_handler_setup doesn't call s_ctrl for read only
controls.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
---
 drivers/media/i2c/imx355.c | 38 ++++++++++----------------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 589bad6c58e4..56a82f37709e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -34,6 +34,9 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_LLP			0x0342
+#define IMX355_LLP_MAX			0xffff
+
 #define IMX355_REG_X_ADD_START		0x0344
 #define IMX355_REG_Y_ADD_START		0x0346
 #define IMX355_REG_X_ADD_END		0x0348
@@ -266,8 +269,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -276,8 +277,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -286,8 +285,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -296,8 +293,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -306,8 +301,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -316,8 +309,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -326,8 +317,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
@@ -336,8 +325,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -346,8 +333,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -356,8 +341,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -366,8 +349,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -376,8 +357,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -386,8 +365,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0342, 0x07 },
-	{ 0x0343, 0x2c },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
@@ -396,8 +373,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0342, 0x0e },
-	{ 0x0343, 0x58 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
@@ -1041,6 +1016,13 @@ static int imx355_start_streaming(struct imx355 *imx355)
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


