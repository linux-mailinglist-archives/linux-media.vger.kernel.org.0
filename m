Return-Path: <linux-media+bounces-67657-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /O5YALRzV2pFOQEAu9opvQ
	(envelope-from <linux-media+bounces-67657-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042B75DBB5
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=kQOJ5zpT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67657-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67657-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C642730E4D8E
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01AA46AEFB;
	Wed, 15 Jul 2026 11:44:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D643044C66B
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115861; cv=none; b=s/C2saP8TUxXmfh5WQVsiB3/h9wcaubwo18PhiZAq+TQMXOPZI7mPAZ1I2WtGP1jLYvEivcbxP3JpG/FPqci4G+lOfFhT/2+TEhsQQzVRQ1aP5RPcXzoXTmg96ILA2Bniryh5nEWnbOsCAOi4m0RxNK/fFFL8D9JrdvdO2Xf14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115861; c=relaxed/simple;
	bh=aZ8n57U1j2jY+o1haOa0aouu6Bwg3e2b0NapU1cYUUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MChqoX6jLAJL9Y0G7PKdtB/0nrAwd03VpzTYFsbwr4zAKlsdxtuCqP73kLDL6uTK4kdHGr5rPB/4HKOZgvIUv5DYE0FVrfQiEnnA7FU1OEiYmuAsTCHR1qVWGVdbOB90cwYZsKX800QEUVlzdZl9vSpHxjxSY43AVoMpVhBe2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kQOJ5zpT; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47dec32798aso5511907f8f.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115857; x=1784720657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaA0Iag3STAJeBMnk4x8b7GHaELfh57GksWF24FaP5Q=;
        b=kQOJ5zpTjh7puS+qtU9Sj5Wnu8A16H104rTHRtkn4s6HRZfI05hJ1X1weMV+bTjRuG
         MDiQ/ZzffBqg6dqADY2Hbc+E8vmvcSjfhNwsz8P6EoJvzSJ0T08z9xemw6dJq+X8Gp46
         423WIwYAeyvelk4N6naI6lFCvnEv/9BBy/Yv7mMTrkQ4unU9aa0b2IbSiDqnBba18L4S
         1c6gaMeHYkP9lx277uFmTQ4Fl7KVj1LqDK2RgPdWttIEkTjEpWqkeQp9fthyD60dWh4k
         KM1soToXx0s1OtbEcy2XyQ/hu3guw1NjcVQHBniGLQQovhF/spQWZ9QkB36M77g8hElB
         sMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115857; x=1784720657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaA0Iag3STAJeBMnk4x8b7GHaELfh57GksWF24FaP5Q=;
        b=joj0h3N7u3Sr6cUGYCmgJ/ZuF6RRW0ckPdaZb6vBeU6Qz0K1HlJrgB8iTW4UrhK5w2
         cdea4vIvAuMWQJ9oJ8L41JKs5q6RR0DdpH/kdljQyVEAFlr1V6xkngbdkkxee/JN2xVB
         5Zn67jsXckEbPWxu9kw+UWmNTS8qIAB3hsamrj+qJvUh1jIKpJ4vduo9pNUbDYEHplJO
         qJLvr41i7yan7LuUkrXvzVrOi/T+Sj5jJ//9NF0o2z3sn6cJvpIG/bv9sWRQYSjHmVJM
         f73YfTSQgW48gbTASOWl0srFj52YbFgj40Zzp5qPoc2eKTTEShjXpc9EBNFFtiQBGdbD
         Ehug==
X-Gm-Message-State: AOJu0Yx7w430orN21SRqd2MNZKC2LX6Cwxgo4N5HdP0cFdEd1b2Nw5Xf
	5tdGQPRQqU/BbTMv4zwcM1LRVjDUkYMf0uJKk6nSOe2ACoVGyiuNGi8dMioss2Sk8osTJeCs9Vq
	X0Q09
X-Gm-Gg: AfdE7clipKflf7o/aiMWYaBtg5mV/uBWTTgnaD4/BkjoPWASlG3og8Ta46BehWqmeSl
	W8Av4RoFZ3hL2l0+Mb5/beDn2UdXs52EPzcQwohgTwSu3ymBnxQJntbJo2AIRAQEB+TvDZWbO7T
	/4ne/4HC4XagzvMi5YGwl2cF/IwSENmZB4LtjinS9bqQztV1Rt+yqfGEE6YUcZXz5uCRBhN7sT7
	Zs4uJQ3vF3/wkhDX/GL3BNVZay3i/9cHkQVlNF46qgihPeYy5ev266bGT952I8zfRxOT4JozzgR
	ijsquKnufvyNudgKEJqdU2sdrqd/BNPVvm+eRtziBktF4Hk50lB1ywgg2RFehby7EicM2fBSrcA
	VUU/xKHTvlV52o/e/9Wc6k3rEktrkxQk0qr75YMEMlnA+gJwjZK+qi2a9XeY4vLopeD+lYY01cL
	AqLU/y0aHaG0s30nt5/orjLiX6bxiiK4Yk4HBsHlbPjO9Paa/RB5qu5ok+zqXxewJ9
X-Received: by 2002:a05:6000:4602:b0:47d:fb9e:c3f6 with SMTP id ffacd0b85a97d-47f488573eamr6671556f8f.20.1784115857101;
        Wed, 15 Jul 2026 04:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:21 +0100
Subject: [PATCH v4 08/21] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-8-f7f966fb9ffd@raspberrypi.com>
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
	TAGGED_FROM(0.00)[bounces-67657-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8042B75DBB5

Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index e9f4bea67d3a..95487b12939d 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -72,6 +72,10 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_BINNING_MODE		0x0900
+#define IMX355_REG_BINNING_TYPE		0x0901
+#define IMX355_REG_BINNING_WEIGHTING	0x0902
+
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		0x0101
 
@@ -263,113 +267,71 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x44 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 };
@@ -974,6 +936,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	u8 binning_mode;
 	int ret;
 
 	/* Global Setting */
@@ -1019,6 +982,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	binning_mode = ((mode->crop.width / mode->width) << 4) |
+			(mode->crop.height / mode->height);
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
+			       binning_mode == 0x11 ? 0x00 : 0x01);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
+			       binning_mode);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1


