Return-Path: <linux-media+bounces-66883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eYv+IKEyTWrUwQEAu9opvQ
	(envelope-from <linux-media+bounces-66883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C471E204
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b="hjqo68N/";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66883-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66883-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE9E13018A8D
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E651C43F4CB;
	Tue,  7 Jul 2026 17:06:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9343C7B1
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443985; cv=none; b=V82flolDKQActxkqL+fgyrBVeJbUvz+j+tRmxL7PDnTOJ9w2FpmOAK1n5n8RMNHclqFvXEDt6tTDJ05owxZh/XWQ3RRwx8q9wEr37Ne54yq24SHbwBzz1FtHTvgYPAKQ9pwIp1BoZ3ieYB6blR+JEcSpmmYOdHGeg1ujaAat+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443985; c=relaxed/simple;
	bh=7wPLB5qxZzZcqlNyu8hcmCgAKLpamdTFAUjtl7sujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYxaw/zpwur7a3CMSSlPfzy4zqKy4l4/kWPa+afaQ1K2DjrGUoFcW8e3B/XWodjKagSA2yH94c5GKdUCxCeFE31Knb0bJ9XOWlAku92Y8TFp6x+9GYOuh8ZRSqFbJmLyUF2M/xbRfqWvMSXKCXnCQPR1lgPKKgXHtfiYTarlraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hjqo68N/; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47d6c634f45so2114174f8f.3
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443982; x=1784048782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF6jbYLgBHixEFRkr7oWISoSB0GJvYVYu8+UfLZI1rk=;
        b=hjqo68N/Jfz2s6TbD2xjgZp6fajujXkQuj5jCWky+i/wLMPEFU7TcBeYC8LjD/BbqH
         V/ROliR0FdrPu0BMitDrBRVNUJgsOlrbGroxaSzBRPQOStiGAG9Oly0H6piHMaX2z3Lw
         b+x8rIq91bZ+1ESNVJ44WfS6cY2TAPX6Mi9x4BUiURP1vUWvyfvM+i17mBATg/ypWktj
         aclkr5g6GKGV2bj6aHHevvIgYLQZThERHPR6XQ5Wmg9xl1CDQX6MVp/Z80j8eZIu5STS
         XOIcwZ74qgf0rj2dwqp8JOTHqX9CmRNrVccYRjbruAceiMncLrvt0vOpyYmrtngteVOg
         i6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443982; x=1784048782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nF6jbYLgBHixEFRkr7oWISoSB0GJvYVYu8+UfLZI1rk=;
        b=DZ7KXZzs8B1zJHpmqG8et7zjkiFK2HELLdYNUSwDU5Nu3JyrI5oru9eurZfw7BAbyS
         MV8g4VEfGqD9HotAvNv2kE1Ti4QRrpjG+/ehQcoJAb3iaMGOrZVpXKghPhb8McoDQyx0
         +oS4uXoUqD57GeXAsvwDunL9CzLt7wSMvoPpEzeKQoU7qBnoo8LdR/TkoZMNeJ3xhtuq
         +mM3cw/RgLxtWBZ4gcIAwuzBITdvjQ58qJlPWk0vL9i9szCk3hSkQTgUIot+qhf4sChN
         Xvd2mcK75ZfAfhPnqvshqZfY+H7APGXIqnkNE8G6N/fJTv8oR56x+LP7t69FSy0Gz7Vl
         8h/Q==
X-Gm-Message-State: AOJu0Yy407urANatJQrs17VGsqmsDjMLo1DpKKBPdYM/4xtJQ9Gea6th
	6tfcIDR6OczGoX1UVRpNIDVVh7Vt9APx/Roj+FJciUlETf3oluQ7aDWxSpBKnwhopjc=
X-Gm-Gg: AfdE7cnIW1yhC7pQmzXutmvj7dZUHlg7GgXeAni7SMOjqQBXlm0aOdYpVBFinijtL+Y
	pIdvwjUYMTRbees3LDRwCpIEWnXUCblK8Bv7073ksmUmgkPz6RPQI56x9BHxDJEENlGpYg+VuoC
	p6FE564faI8vVYRKSJ9+nlMZ8k663FNoAe0/IqyLp0I9yjQemqH9d5e2kuKY4nzBwv1DBP6d044
	MALmM63aWi+Z5zxshLN2lL3P3UhYWkSIhS8sjyIj3rO9ADU5iigQjmCgBTJRBH+/DZ1zNhtUfIW
	O1kADuYI+qEZ9i67Fb++4pNKbHTxR/K6tBRsSnKFBcalDboNsTp5FK1AY4zPJdn2e+Vk4uXcImq
	w2QpNuh6yX8UBtS85foPpLAv/XJaTSH9ctR8zBZm4t+gJtznY0EcAov66Bs0fx37tS3UmrLYKXQ
	hDAXtsMm06yZG/BmA9Ov/ebGFRLYnYL2w6GzLo4g9fjem68pWhb39+uNHiA27unjmw
X-Received: by 2002:adf:fd86:0:b0:475:f3c5:f8a5 with SMTP id ffacd0b85a97d-47de66987a8mr5419185f8f.15.1783443981683;
        Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:40 +0100
Subject: [PATCH v2 08/20] media: imx355: Remove link_freq_index from each
 mode as ununsed
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-8-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66883-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C9C471E204

The link_freq_index value in imx355_mode is unused, so remove it.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cfc47b5100c4..20cf6afee43e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -81,7 +81,6 @@
 
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
 };
@@ -365,7 +361,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -383,7 +378,6 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -419,7 +412,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -437,7 +429,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -455,7 +446,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -473,7 +463,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -491,7 +480,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -509,7 +497,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -527,7 +514,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -545,7 +531,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -563,7 +548,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -581,7 +565,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -599,7 +582,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,

-- 
2.34.1


