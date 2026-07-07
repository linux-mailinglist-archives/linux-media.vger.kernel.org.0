Return-Path: <linux-media+bounces-66882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gqg7C5QyTWrQwQEAu9opvQ
	(envelope-from <linux-media+bounces-66882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C217171E1F2
	for <lists+linux-media@lfdr.de>; Tue, 07 Jul 2026 19:08:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=ipS3xobq;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66882-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66882-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1138F301BA57
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2026 17:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263D143E4AB;
	Tue,  7 Jul 2026 17:06:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE8E43784A
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 17:06:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443984; cv=none; b=IfFeqwwyFk7u3zsS0xd9HsLQzNsJEqHTIDD0287ADfs+sQ054yL24xkwPQ2sbqNyUWHZHzaCZto5mCxm+ooqoOqCYHYA+6Qjn8TaXqREr300hbqW4b18+HEHbu5ZgsSys/Y/wVhOys+/CRrUhLNc6UialmH5rWPHgQm1nxkETIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443984; c=relaxed/simple;
	bh=PFkZIUGI8c5gKx0ZfGBiuXQnWrcqWPcJ4PDkAcsK8b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6CwfyVM1tqJF53B0ZcGUvpxBdrX6oGWXaXBUH4TNy4qvjg9VnbcALONF0mye+9ErjVqcHyi7OL8HI15e81WuEvprSgFJCXLIBNhzGZRN+vJL2YRkcB2BWuRGZkmYGqMpc3MbBm7s+Za0rw95MHK4ZSn9x09OQ0C4rOr9plEpoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ipS3xobq; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so32129645e9.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443981; x=1784048781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOJ1x8VZvdDC9hBUkn9XRjGYXcp7CmDAs2/sVHErw+4=;
        b=ipS3xobqPJxluEYHB02JBAbzrflJv/tbpGh27GCwqQLUzTwb9sTswrbHcd90W+bbgv
         9VFaCN4BIlB7ZuQCiw8eyUlHjG0IlXBUGnkiE+rjdydrIZmRlQJiRei8huof74bnAqvM
         8dk6KSonH3Dfq7N3wa1zmGDoKlCVZyMMahNxRIsnujmJ5hJ7baauXaJUgzK7mr7hb6Dr
         BG8D3R/r00NTt9BvaTXCUh+402mQVxGxEpTLLT/zVkg3Ohnpwve581QZvGpx75QBjZxJ
         IRgJ703Co1QfdiCQs5xY6wdbyNPpCkS4VblxEzcPrMWL40RLvqkTd6VVrDn8n7CT10Fx
         6wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443981; x=1784048781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOJ1x8VZvdDC9hBUkn9XRjGYXcp7CmDAs2/sVHErw+4=;
        b=EuJVEznVCHeHoiE09PtQviEquhrpgQ5+MFsRZPHk2xwVoorjw5hL524VrlKQQJbyuu
         XtZKVU/53SwvK8OB2nuf8zOgX5AYtW7LLOeAIW3ektLtCkWcMaQghF+xbfVTat5+Y9kq
         Kab3eT/HDrXcAS6z5UmefCg9y9R7TWkPABGJq5Sl3o2z9RVRKZ3gCriXhBgrqXNCbvlF
         3DAcsV9pDZ6KFJvHNkQ3pgRaZkx1BFvMiC9QZS1GHhKsLQuJmtEbimQtZtld1aAIVr5h
         e7o9CO/C6rly1kdP9SReNWQTkKRxbHNnmfHR5zy8tF0GJhIWvKpoaLfXkGlqHRTp5ah+
         /GoQ==
X-Gm-Message-State: AOJu0YxpsGbL6XM0/jAFfmsoDp/lEOMTtccTOJB8RbreaUMvT0FChHwT
	x+iNBmPQ0iNYAxN/2g8tDB83n6uDtiusPp6hYxZqe6LuXak96QUxxHg71n9kKMo4LLs=
X-Gm-Gg: AfdE7cmRWo1vBoH6lQHziFsoRtgXRMp2oRHAuV7wXRA/r4gvZmXXwbYFsHwEki8ATIZ
	gLNeQGYpGyw8VSZ+xwEEgCgdj0Jhe9JX7rmCRrnxPOHG2wXOCTyoOtqTk4LONAaMTf7jVYKXCLf
	B5hi7kss1J+udIAjgT0VhUhkzxlNkNuoNQSEULeyuSANwOnVPGdaOxo5/68SVlv/n4dyMW5bOkE
	ARK+lBVNaHv9VFuzgy50t+DuHshiZjut8zyjScsnHa/BrWTKD1He+raTqmhBB+0qXhONkwefQo0
	bxyFxOIitME8u5N9wCdrKcEiVwPHzlj1hlSiOtDR1uCLiiy27a2R6sFfY6zeaEojCyda8XfJRGw
	ia5TzCg+Y1+yRP5dtiDvenz76Wu4w8tyuBVzF3FPdTjj4x+2aD6AMjMOjFjiDoEOBuRDw4c+5wp
	CzckQXR/BXbgl+viYdVgGd6pYj8zLNTBTexiAPFBwiFOTNEvwv7kt4kGjCJTieP+s1
X-Received: by 2002:a05:600c:860b:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493df065f66mr71013645e9.23.1783443980824;
        Tue, 07 Jul 2026 10:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:39 +0100
Subject: [PATCH v2 07/20] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-7-1683ec07b897@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66882-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tian.shu.qiu@intel.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C217171E1F2

Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 66e70650e666..cfc47b5100c4 100644
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
 
@@ -262,113 +266,71 @@ static const struct imx355_reg_list imx355_global_setting = {
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
@@ -973,6 +935,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	u8 binning_mode;
 	int ret;
 
 	/* Global Setting */
@@ -1018,6 +981,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
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


