Return-Path: <linux-media+bounces-60672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPsHMlCI+2kscQMAu9opvQ
	(envelope-from <linux-media+bounces-60672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AA4DF54B
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 20:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD16B3070881
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 18:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CDF4C8FEC;
	Wed,  6 May 2026 18:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Q/54O1Ww"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561C4BCAC5
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778091844; cv=none; b=RT8CJdr4H3jg1+K/CoIC2e4dWNs1bWCFswZcBym2jta6kX5P+hDdCSQcmEXWIWnlntUA3gaLkN5smiDKeB/R9BZr/acQMT97rdKXwh/v3AhlCEmjm9uUX8MUpDH3HpVuiTxvZ/QAwUqA5RVwMVnMGRz5xCAWM7RvqKLg61U2cS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778091844; c=relaxed/simple;
	bh=SfnupgvsaE+KntuR8wdm0hOaeampEppC/mVIP4AhNG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lM1ZMWvVkYSoy02Omg6TLBJMEn0b/TkOdePYszZ1xNanX3lnvKOVMeZ10++2rQ/SZZywpMr1AD2C6L3Wn+uv2Pbb+7srBU4NQ9IHev618mIO3H4H1nEf2MUF6+tJXb9bdKlusICqmmAyhNLSOH9/+Y7pVYX7QdAEjPBkyVdGZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Q/54O1Ww; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so66952695e9.2
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778091841; x=1778696641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ltSx+SbMYHd3qP17Hz/lMF6RjYMG0bZVxmlIIBtbk0=;
        b=Q/54O1Wwh1dr9RvIzsQ3E9eZlTC7BdpalXspZR9/ao00sRnaMRJGWcpuseM+pd8Y+B
         yYz5SsZ7shQyhsLNK3CNa2b7ujaZ52Eo09iaHDWV63RqzUPaKog1dZZ7YfxNn0c5tYiJ
         c2toBYeZkz9eB0IFTyZAVAivbJPQyY9DHxfS/pC9vIsqpeGuyWh/ACDLoQHh6BBPN6Ol
         LJz2YQ8e6/YDmXtTqgnshB6JgTithGCWO/eHqEYWEwLW3Djez2J42EWHZhEAoF3C3ceM
         OLkjPJ3drvDOoxIkrC+9AbBi05OjGZ41HMgL+jjWTa61uSRe9M8VYvDVMeBDbL1s9odi
         mJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091841; x=1778696641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ltSx+SbMYHd3qP17Hz/lMF6RjYMG0bZVxmlIIBtbk0=;
        b=K3FGj+qEnPlCaxRKvP0I74nzjGvX5UhB2w7H7Z58j6UR7rrq3wPzEwhLnbv0Lu7hfp
         EuOQ4GFsP7icub7YWih0LwbfJ5iXhwZw7tK/4kGzebU2eaBrmJUQ5X9pPtMIIXx6+tCV
         KyFDSc0ZCyZk4CgSdt227R7qUnMrcMo9S+LxAM8xWR8UMKml4yLCAsWhzAy3UEs0zB7q
         jdPjEyiebPuJrzJdwWj49c5B2tKNLeYkCKaAPY+2O/T3za2CTxPUFwGvT3MD+Au9Tr0b
         X3F/OUpO51ufkXniVzqkMXnjFUVW4d66dt4G32V/6BVBvoKJ61dNt/lEqDATqrTMv9NM
         69iQ==
X-Gm-Message-State: AOJu0Yxe3GKf9zdKPi66uApUKMIg3X4i7l3BVYHsKGTwsqYR0lHekJcu
	23hGXGdEoFFG2jBHhRb8Hv8I/oCzNt5I2dKb8YDFHLuc/rOseKPHLQCT15YGZhUIoUWth1AkEFM
	UWh05
X-Gm-Gg: AeBDievo4xGurnm/9cW39lbMlfFXJAeqv/QgXkWtyou1l3uAB913o6LSyBjuLzlX4bj
	FhnEgfou1zLejhwCpb0Bbie6aQgkzLOM21JXztoBwuFlCC2YeydjYsboCTX3Pk51NCzC7xfV58O
	uZoeqW/nOk7NeRNnkYkgQeBsj+HGk6Hp5M7qWlpBKDeo5KG49iWumN8ubyxRlpaIOG1AVncpSy6
	YDVumqm7rxethLeDZmq1lV5TRfev5bUo+iNzH1u8wtqjSJkR9eJe39FDwzsn38dT0AFdCYAWaxr
	skiqhFqQEY67Sq4mQIW/1jff/tcEzH7QG+uc4wXkqAUdFvqty/2+7B123yKW7ubq2cmRuvy31U7
	I+VCiN82Wq6LDQXBPmDw0Rd/n+TrzthbHtLdPI7eAa7WWQ3mgWEWOKg1q2vjx/HIHyTwZTTuPDZ
	EHfmgAQGQp6ab7h+jnJSTT6cQgVWWFieZZRYqKFK6lj2iXfQ==
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr84367995e9.27.1778091840816;
        Wed, 06 May 2026 11:24:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48e5313b023sm36165675e9.5.2026.05.06.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:24:00 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 06 May 2026 19:23:45 +0100
Subject: [PATCH 07/13] media: imx355: Remove link_freq_index from each mode
 as ununsed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-media-imx355-v1-7-660685030455@raspberrypi.com>
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
X-Rspamd-Queue-Id: 2A9AA4DF54B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60672-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

The link_freq_index value in imx355_mode is unused, so remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 422454e529a7..b0cddb614775 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -82,7 +82,6 @@
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
@@ -111,9 +110,6 @@ struct imx355_mode {
 	/* H-timing */
 	u32 llp;
 
-	/* index of link frequency */
-	u32 link_freq_index;
-
 	/* Default register values */
 	struct imx355_reg_list reg_list;
 
@@ -367,7 +363,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -384,7 +379,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
@@ -401,7 +395,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
@@ -418,7 +411,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -435,7 +427,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -452,7 +443,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -469,7 +459,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -486,7 +475,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -503,7 +491,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -520,7 +507,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -537,7 +523,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -554,7 +539,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -571,7 +555,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -588,7 +571,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,

-- 
2.34.1


