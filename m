Return-Path: <linux-media+bounces-60668-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INanEVWH+2lpcQMAu9opvQ
	(envelope-from <linux-media+bounces-60668-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 311744DF495
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95C12300FCCC
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5509F401481;
	Wed,  6 May 2026 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YgDfmjf/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735884BCAC5
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091841; cv=none; b=HmuiPRdgP+zX8huF/Cib6nHeivxsZ3BOl1KGcawLSbDcjDfpepG6znPLEUnvvwDXHE1DMAI55NAYzlT6FpwSonSONwri7NTSDbtpj3yoIp7oDmPwyPRA6Zm7G6Rkl+LsGK6i085cNSgztSowmEqdovpotPtNykyOEzRR2Gzf2NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091841; c=relaxed/simple;
	bh=nMxZJWXRnDgD43Ym7GG8iVNGW7Q2yrYU06E7kRyzgXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GScLF3kfxk/DOcZSiYxNo1H77yWliIF2DuKesXtJsNvxQ8y249/+5M7aZdocfxu6uaaRDjLxdShp52cA+j8Mxr9mQXFEUldlba6IQ0yM5KGCzkD/ObXSY8t/QsqNFQg/zfwiBUm2tRLvzQF+n7LZVUkGurEjkjBizbcmzrW7NeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YgDfmjf/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so55555e9.0
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091838; x=1778696638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTmG4TheyujVIwA8IXh2Ny7XTEWWYA1UYh1rw2dfDn8=;
        b=YgDfmjf/YpaL9SBUlf1IGK/mWwZixtIWkZnWxuZHNU0QmOXWA6wWMSLPwYl+Mnq2fT
         J0DpDnMf2/5JRXSze0J4LP2lNTWhVzgg1XJy1i/SQNOIdwotq9ZkAZkZ0acc8zJKEBmb
         5AoP5AZ/Fu+UfFC2gU1gWhOlGeM6DWhuDCEC+BVfJSwNJW7A6UTX4TaVjaYuB24KynTT
         3FmSGwPsLdleuqy31jo4s6gXYou3iPBNE8BxPYY60+fjVfGcqsZ+r8vhIxPpuIy/Sz/h
         SpfXjJZvvjEMSTZEY3xPTrNKBM7lykzuwR6ws68HXBfU9EtIX1e6DzFrhDnTI++dV3+u
         9KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091838; x=1778696638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PTmG4TheyujVIwA8IXh2Ny7XTEWWYA1UYh1rw2dfDn8=;
        b=gbE7lx9LaK9KrM9zrvElsZxMdVPm/BqwRH0ZDK9va3I2MwzrtAq4k5iNeNArtRCdgg
         XPsowdI6qgo3X6q/9sK1qb65sM4IMuQ8PUijoG5UGmhJNyjxh+0InuRfvqXlHXoIKmit
         Uluk4lb/tjJrN3YVnBIPzJkl+aUmm2Png3IFPsd2g4p/ct2VhQ5ApwaOriIfN9ZVwPhn
         9s8BXFigx1AWYyb87iS8MoIEAhn+2bWAwm0v2rwFIDJXAv91km5ZBgpzuNlmB7fuoPqH
         2zX50VIIBS382H0n1W98X/nP2Xd40w5tiwLk2Snfh+45uzex3qjxc/1n1hGP1ncX4j3k
         WuNA==
X-Gm-Message-State: AOJu0YxRIgDsLLz637i/rERGs/Fy5E1Ab4U5kjWXzkZ6/+5rz2/vgHod
	YPPGP5S3dPaVY9MWvddJEX5b8/MeiEHXMnmpmxYu7F4sffuLlI9unhnoEzrPRYPiN+WylbFuQjz
	gr732
X-Gm-Gg: AeBDieuesWSMVj8wzbhLKGkpjPeg9A6HMInvnS+ts/wvIfylrgOD6KHU20Kzab7jBEn
	Z2rMprKEcEpY1JlvOxj+1CKPlmraheGeqoL3RfTO2YTWLUUD2TnBd5tQGt0pLyPDvrYbIf7eLsG
	5GkkBGA47kMmlqAB5oluu4yeb7NwRi4OQ2K712RaqY1quxf9qmVTI8gmDQQJoqgpPFlAZ5Pyf5A
	As1CNzc2CFilAAClEXqKmEXH5Yzn40Zy5LPWYyIIKxyeeK0cr1pqQpkjTzAGvcYMOLqi/Lp4F/k
	dF0rBP8ci3eCYnI20C+QdxaIhn1LsD7nNRhqLA6g6sogda+w1rdfXM56401CBYKStAkmoON/JTV
	ghdvQADfo1gMTHxRKPCaDhVJky9gjkk7LsAsRwWKRR7nZZmMuQZyxos/ZcASjxyiLi0mUKgR0tQ
	STTePtMzJdR5kqxSbE+S0Bhcb9
X-Received: by 2002:a05:600c:17d0:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e526e115bmr45169075e9.12.1778091837643;
        Wed, 06 May 2026 11:23:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:23:57 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:41 +0100
Subject: [PATCH 03/13] media: imx355: Programmatically set the crop
 parameters for each mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-3-660685030455@raspberrypi.com>
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
X-Rspamd-Queue-Id: 311744DF495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60668-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,raspberrypi.com:mid]

Currently the cropping is set via register entries in the per mode
register lists. Move those into the mode structure and set them
programmatically.

x_out_size and y_out_size are duplicates of width and height, but
are retained in this patch for ease of review.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 296 +++++++++++++++++++--------------------------
 1 file changed, 127 insertions(+), 169 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 8ea510218c7c..6179fe74c897 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -34,6 +34,13 @@
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
@@ -102,6 +109,13 @@ struct imx355_mode {
 
 	/* Default register values */
 	struct imx355_reg_list reg_list;
+
+	u16 x_add_start;
+	u16 y_add_start;
+	u16 x_add_end;
+	u16 y_add_end;
+	u16 x_out_size;
+	u16 y_out_size;
 };
 
 struct imx355_clk_params {
@@ -256,21 +270,9 @@ static const struct imx355_reg_list imx355_global_setting = {
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
@@ -278,21 +280,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
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
@@ -300,21 +290,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
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
@@ -322,21 +300,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
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
@@ -344,21 +310,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
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
@@ -366,21 +320,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
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
@@ -388,21 +330,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
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
@@ -410,21 +340,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
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
@@ -432,21 +350,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
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
@@ -454,21 +360,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
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
@@ -476,21 +370,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
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
@@ -498,21 +380,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
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
@@ -520,21 +390,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
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
@@ -542,21 +400,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
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
@@ -590,6 +436,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
 		},
+		.x_add_start = 0x0000,
+		.y_add_start = 0x0000,
+		.x_add_end = 0x0ccf,
+		.y_add_end = 0x099f,
+		.x_out_size = 0x0cd0,
+		.y_out_size = 0x09a0,
 	},
 	{
 		.width = 3268,
@@ -602,6 +454,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
 		},
+		.x_add_start = 0x0008,
+		.y_add_start = 0x0008,
+		.x_add_end = 0x0ccb,
+		.y_add_end = 0x997,
+		.x_out_size = 0x0cc4,
+		.y_out_size = 0x0990,
 	},
 	{
 		.width = 3264,
@@ -614,6 +472,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
 		},
+		.x_add_start = 0x0008,
+		.y_add_start = 0x0008,
+		.x_add_end = 0x0cc7,
+		.y_add_end = 0x0997,
+		.x_out_size = 0x0cc0,
+		.y_out_size = 0x0990,
 	},
 	{
 		.width = 1940,
@@ -626,6 +490,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
 		},
+		.x_add_start = 0x02a0,
+		.y_add_start = 0x02ac,
+		.x_add_end = 0x0a33,
+		.y_add_end = 0x06f3,
+		.x_out_size = 0x0794,
+		.y_out_size = 0x0448,
 	},
 	{
 		.width = 1936,
@@ -638,6 +508,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
 		},
+		.x_add_start = 0x02a0,
+		.y_add_start = 0x02ac,
+		.x_add_end = 0x0a2f,
+		.y_add_end = 0x06f3,
+		.x_out_size = 0x0790,
+		.y_out_size = 0x0448,
 	},
 	{
 		.width = 1924,
@@ -650,6 +526,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
 		},
+		.x_add_start = 0x02a8,
+		.y_add_start = 0x02b4,
+		.x_add_end = 0x0a2b,
+		.y_add_end = 0x06eb,
+		.x_out_size = 0x0784,
+		.y_out_size = 0x0438,
 	},
 	{
 		.width = 1920,
@@ -662,6 +544,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
 		},
+		.x_add_start = 0x02a8,
+		.y_add_start = 0x02b4,
+		.x_add_end = 0x0a27,
+		.y_add_end = 0x06eb,
+		.x_out_size = 0x0780,
+		.y_out_size = 0x0438,
 	},
 	{
 		.width = 1640,
@@ -674,6 +562,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
 		},
+		.x_add_start = 0x0000,
+		.y_add_start = 0x0000,
+		.x_add_end = 0x0ccf,
+		.y_add_end = 0x099f,
+		.x_out_size = 0x0668,
+		.y_out_size = 0x04d0,
 	},
 	{
 		.width = 1640,
@@ -686,6 +580,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
 		},
+		.x_add_start = 0x0000,
+		.y_add_start = 0x0130,
+		.x_add_end = 0x0ccf,
+		.y_add_end = 0x0863,
+		.x_out_size = 0x0668,
+		.y_out_size = 0x039a,
 	},
 	{
 		.width = 1300,
@@ -698,6 +598,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
 		},
+		.x_add_start = 0x0158,
+		.y_add_start = 0x01f0,
+		.x_add_end = 0x0b7f,
+		.y_add_end = 0x07af,
+		.x_out_size = 0x0514,
+		.y_out_size = 0x02e0,
 	},
 	{
 		.width = 1296,
@@ -710,6 +616,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
 		},
+		.x_add_start = 0x0158,
+		.y_add_start = 0x01f0,
+		.x_add_end = 0x0b77,
+		.y_add_end = 0x07af,
+		.x_out_size = 0x0510,
+		.y_out_size = 0x02e0,
 	},
 	{
 		.width = 1284,
@@ -722,6 +634,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
 		},
+		.x_add_start = 0x0168,
+		.y_add_start = 0x0200,
+		.x_add_end = 0x0b6f,
+		.y_add_end = 0x079f,
+		.x_out_size = 0x0504,
+		.y_out_size = 0x02d0,
 	},
 	{
 		.width = 1280,
@@ -734,6 +652,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
 		},
+		.x_add_start = 0x0168,
+		.y_add_start = 0x0200,
+		.x_add_end = 0x0b67,
+		.y_add_end = 0x079f,
+		.x_out_size = 0x0500,
+		.y_out_size = 0x02d0,
 	},
 	{
 		.width = 820,
@@ -746,6 +670,12 @@ static const struct imx355_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,
 		},
+		.x_add_start = 0x0000,
+		.y_add_start = 0x0000,
+		.x_add_end = 0x0ccf,
+		.y_add_end = 0x099f,
+		.x_out_size = 0x0334,
+		.y_out_size = 0x0268,
 	},
 };
 
@@ -1076,6 +1006,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
+	const struct imx355_mode *mode;
 	int ret;
 
 	/* Global Setting */
@@ -1087,13 +1018,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
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
+			       mode->x_add_start);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
+			       mode->y_add_start);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
+			       mode->x_add_end);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
+			       mode->y_add_end);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
+			       mode->x_out_size);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
+			       mode->y_out_size);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1


