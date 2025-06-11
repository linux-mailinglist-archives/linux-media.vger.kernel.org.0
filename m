Return-Path: <linux-media+bounces-34537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B1AD5E50
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 20:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CB271BC21CB
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 18:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D5D26A0AB;
	Wed, 11 Jun 2025 18:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hEp2WiPD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9E017A31F
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667045; cv=none; b=qY6hy8CqdMEqoVGL5n4nsImCVMPo1Ljxo1EDUw55gQT6EcpuS0eCgtB5+j4lY6TAOAwjtrV9d8Yp5t9MnHxXE3sXWXZBYTqewp2J8GjaevBvfDubB1XfCywbZbYSBZUrAdF/VOecMdnj/vUgAcNpQ2J6mxUAt+M0P9FGndzwMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667045; c=relaxed/simple;
	bh=i7gGdufPkSGRwB6IPZKAt6alZaKpalTRVeGTcHa0rDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaqSkLVk9mfD3EdKsS9whXmv8P+w5MzEJISsUAnq8RvKKnjX764Lig/tnxA7a3DkzsO1SQh/K0la1O50N1IZVQsMMmcfxgM7G/J6aB8YU5ZY5SFsHCBOk936leNOYswtWRaHJin7FQ0PGaWVhks/ghBQAgOU4SKmIUO+TYVkkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hEp2WiPD; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so156699f8f.2
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 11:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667041; x=1750271841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgYBfY2UR29MQlCGcRFEVcrLVgS61xcAj8mfuW0laMQ=;
        b=hEp2WiPDuXfZ9f3XhKZ/PJSBZrBA1nspeqUhsyJmy5UxhK3JvwnxnorzGAUDiGtpqW
         BczdVAmQ0CQti+OxQiheFfcVUD01xKkFOpEnJ+10plYZYlBiqudX3EJ5iTXp+0ee9Bi7
         u/ofqYX8t1SQLb6PswiU769wsxlvbsFAnUL4Y6T/9HHVAK7fHHlikFNK/2MpAovD9ZTZ
         /cd3fNfVOPBabMdCOOQlYc2AyNXpeVaL+DNUZ5oUDfa8QODx401dpNRuYOTJnoTCqBmF
         KqPESMzyIcDJm2+VmOvaH4XzlAerUj6xF+Zg6TlS+QScHM7S1/zpUSeDWr6pL1e0YSlp
         4I+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667041; x=1750271841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgYBfY2UR29MQlCGcRFEVcrLVgS61xcAj8mfuW0laMQ=;
        b=AKZbIk+MFxHXBg3guPQ6OeJ/D2PWy7mAbqvd7W30hXljXQyR82dmW1p7+EWzqH09cr
         KHvIbyriT+e10R2LwSz4ThbFk/JuIrq1Vue8otYXVNo6m70nHElR8uOGMbHhpD/BbJih
         j6wzkHrP5IxMC16Oc2URJItnwBWEg/chejaO/v3waJ8j80xVHC3o4Slkq9nJJG4h5w8P
         b3987vgiFtd2wCLa1swIJd24qflkndIWWVTgQwkg267HHaKxw/48WfH4YzYx4aiIMM5B
         pt7jDaDrwUG6V6ob3L7cJyi2RS0nnb8kzgwzoZqKlnjKgepcXSs2+mY1Gg3llD4XF9K9
         ZQmw==
X-Forwarded-Encrypted: i=1; AJvYcCV3VRCrcwzU7cdxLwjoPuZq/v07rdfBFqraKzb1w3+ctczAkznViRJ2fmj+TseEu/qnjteXOvE/ox+qYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRzusLJUaRY1UY8zZEXu6U2trJyAgnJtTxGx+IJgPe3zN0q5D8
	EZ+iJyCXDMbyUHpS9V++knSWzY201uMVdg2REiIGg+9FrDInkWsC8jMs4jWx1w3WPAo=
X-Gm-Gg: ASbGncur6xopo1vlmpQq3a5ce3AO0EkoxlwlK/1U9235DAKSLv3huHEPvSck/sGvWnb
	nXnMrgzrGRCNEAal0vjdo0fvOxIu2Xn9X1WXBS18ZWTr0SUlHtjAjXxWJffA1hzTVvDQqco1P9F
	jEnXLgL8NVhouTSuqHj2TdB48YJLZlfMUyR564JvRU5dbwx9sj4aV2FNLytthZs4mdJWNY0M10I
	HEzxheuLzYjD7ViIiQVxLrbkGN3ufQnmagi+zSKsF+ELOI9F84c8d99hD6KO5fe9O2tFeHUdL0F
	1QQivY00IvC/38wDocbX51lJCWBAwP+PZ1U8cIdD6j1HOnJfrbhVWg==
X-Google-Smtp-Source: AGHT+IHHT50NdMoz+n9TfRr2G7Tew6o4zd1nSosAD5QXIFC2jG2M1x+AHqx1qfPmXTcOGk2hed8jOw==
X-Received: by 2002:a05:6000:26c5:b0:3a4:d0fe:428a with SMTP id ffacd0b85a97d-3a558a27540mr3799331f8f.28.1749667041208;
        Wed, 11 Jun 2025 11:37:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 11 Jun 2025 19:37:13 +0100
Subject: [PATCH 1/4] media: tc358743: Add support for 972Mbit/s link freq
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-media-tc358743-v1-1-708556026f9d@raspberrypi.com>
References: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
In-Reply-To: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Adds register setups for running the CSI lanes at 972Mbit/s,
which allows 1080P50 UYVY down 2 lanes.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/tc358743.c | 48 +++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3d6703b75bfa..b87db3de20db 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1993,6 +1993,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
 	/*
 	 * The CSI bps per lane must be between 62.5 Mbps and 1 Gbps.
 	 * The default is 594 Mbps for 4-lane 1080p60 or 2-lane 720p60.
+	 * 972 Mbps allows 1080P50 UYVY over 2-lane.
 	 */
 	bps_pr_lane = 2 * endpoint.link_frequencies[0];
 	if (bps_pr_lane < 62500000U || bps_pr_lane > 1000000000U) {
@@ -2006,23 +2007,42 @@ static int tc358743_probe_of(struct tc358743_state *state)
 			       state->pdata.refclk_hz * state->pdata.pll_prd;
 
 	/*
-	 * FIXME: These timings are from REF_02 for 594 Mbps per lane (297 MHz
-	 * link frequency). In principle it should be possible to calculate
+	 * FIXME: These timings are from REF_02 for 594 or 972 Mbps per lane
+	 * (297 MHz or 486 MHz link frequency).
+	 * In principle it should be possible to calculate
 	 * them based on link frequency and resolution.
 	 */
-	if (bps_pr_lane != 594000000U)
+	switch (bps_pr_lane) {
+	default:
 		dev_warn(dev, "untested bps per lane: %u bps\n", bps_pr_lane);
-	state->pdata.lineinitcnt = 0xe80;
-	state->pdata.lptxtimecnt = 0x003;
-	/* tclk-preparecnt: 3, tclk-zerocnt: 20 */
-	state->pdata.tclk_headercnt = 0x1403;
-	state->pdata.tclk_trailcnt = 0x00;
-	/* ths-preparecnt: 3, ths-zerocnt: 1 */
-	state->pdata.ths_headercnt = 0x0103;
-	state->pdata.twakeup = 0x4882;
-	state->pdata.tclk_postcnt = 0x008;
-	state->pdata.ths_trailcnt = 0x2;
-	state->pdata.hstxvregcnt = 0;
+		fallthrough;
+	case 594000000U:
+		state->pdata.lineinitcnt = 0xe80;
+		state->pdata.lptxtimecnt = 0x003;
+		/* tclk-preparecnt: 3, tclk-zerocnt: 20 */
+		state->pdata.tclk_headercnt = 0x1403;
+		state->pdata.tclk_trailcnt = 0x00;
+		/* ths-preparecnt: 3, ths-zerocnt: 1 */
+		state->pdata.ths_headercnt = 0x0103;
+		state->pdata.twakeup = 0x4882;
+		state->pdata.tclk_postcnt = 0x008;
+		state->pdata.ths_trailcnt = 0x2;
+		state->pdata.hstxvregcnt = 0;
+		break;
+	case 972000000U:
+		state->pdata.lineinitcnt = 0x1b58;
+		state->pdata.lptxtimecnt = 0x007;
+		/* tclk-preparecnt: 6, tclk-zerocnt: 40 */
+		state->pdata.tclk_headercnt = 0x2806;
+		state->pdata.tclk_trailcnt = 0x00;
+		/* ths-preparecnt: 6, ths-zerocnt: 8 */
+		state->pdata.ths_headercnt = 0x0806;
+		state->pdata.twakeup = 0x4268;
+		state->pdata.tclk_postcnt = 0x008;
+		state->pdata.ths_trailcnt = 0x5;
+		state->pdata.hstxvregcnt = 0;
+		break;
+	}
 
 	state->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						    GPIOD_OUT_LOW);

-- 
2.34.1


