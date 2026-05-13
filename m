Return-Path: <linux-media+bounces-61545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJpJInvtBGr7QQIAu9opvQ
	(envelope-from <linux-media+bounces-61545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:30:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC58553B0A1
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EE5530F5B13
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82793B635F;
	Wed, 13 May 2026 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kElhJVkM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4D3B6BE4
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707573; cv=none; b=YA8vVYKAaXxLNoiiNzbImXYJRa8UG7gErObNwQGwVt5WF8g1BxT7/9HBPcVqeSvTT5uwSiHlVWuPHKxbcgptx1CVZqz0dypajuBUkuGsiWRcqQuLYWLaDLSDkjUu9195//4i2RTma7jcDBhbpETmbVKVuINXfLhn08YSBkRaTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707573; c=relaxed/simple;
	bh=Mhm1RAoItZvNB+ZiZLFkYTogX/daRG9UI9iX9MangPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPBK9GD1Hj77+vj6nr9ecqHE3+9KXF0eQTGB1OpeYyRTWpNF+ycsBX2QsxloiBt4Dj+NmuWf+jyHKyruRYUEzXTmt7BNcnDKDqsD5XCwrfdUZYlYzAAIaIwcfBWMB6tiXMufn1hCmq21BS2pEeWSUKW/u+UR3iUoqn3zIwyvzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kElhJVkM; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503110d50.1
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707570; x=1779312370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=kElhJVkMLRmYobh5B474uxE3wgOKXhmo5Grw3Pu2p54Fw40VjYDEj5DMsgmCRkimHJ
         jP76ssUJH1XWh9kO/SvNVgnapldb6TxArGb/NK1Pkh32SOh/8XHAuaZwRW2lbtBaDN4F
         YG0TI87UMq64sEzBsRQ8JO7lCrXJ5sls5gJicohxLay+qRqd9NLyHvXcSWGYlE5mqG8u
         cQBw+AftvOrP4fFwD1P9441E2uRYD8D0aSbLRJ/Iiknuwe6aovIg//QEifx/lkIIKK9E
         Eog3YuQa/MZ7Iud8TkBDtAkc0BC6tnEue5RDH5fIgLgY5K3iEAWgVKLhYFT4yHGW5U15
         kc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707570; x=1779312370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=NxV1KZL4Wd0TOQVpB7vhqCsAkGQEnCRXyQm9vvbhbOfozsqVyv4zEPtanToeEZu/MW
         GZIqCokbwDeBu71Yf+q6Adc0TDL1nA4xsZ2ipiVDY+e6JKQTWYQinFfF33Nz7HusBAIb
         /ApiECr4rAp3gFAGmuVmdSAt7PNAImdkhbe+WgUxwVNFchUx0uvYLCAjv2VC5/MP8VaG
         C4IKILKSWH6O5TT1EgltDURptL6547EyMstJy5HOkz2YjuySF0e9O7OytU7XttxfSLDo
         Ncw3uQNUxnaUGkoHMH7s3Drb4d13VgnK0fMjASTNORXlx0yhoufvmHvrEbr+buZfXWJ5
         dUiw==
X-Gm-Message-State: AOJu0Yzb7rv56gV3kB7/CpagQVTg3ze62+xV4ChJHQdKMp5cX0BxVu7E
	d6xXp56dAVmAhYVLVhLl7pSrocbFHPN/fDf3IZhVRWWgDVePKPnjODNJ
X-Gm-Gg: Acq92OEugouQ3sdDSCY/cTwXIJcnsSIwgRyMfanoJBqdEbv2ahyCiwiB5KpsgAsJI32
	kfUu0hA8BLpGu+wy2Ve7i9mPp2I2dtP0Ujc6w/ZNpIYDnq8q9bEYVJMTZV9y6b84cVphYXG3uMC
	lzzLsoQpJN4bF/Qwn291ugutW+tsdI1ena5TUNB9KjTbEjIXQKwryvbnXuutjfAmxce+dxZDtSr
	0sebXQWhePuM0TYZtq/C8j72wtMTs40UW4EinnnpAGerRJ66ccNXgUQEo9ItCxdw+/pxieak8QU
	XGQXAxYNhZ8SZbpVej0OqI6oW6Io6bQaXQvQCLgQrL5te1zdRhZye5Uvo0w4KQSNIsbcywZJXX9
	zUnfSQpASUXyH+2AK/eAF+rr3dopZeoM3LnVI+/nf91/t0T8ervKiJRL82fCH87ZwRr6nOdFfKS
	gmBkzaB7Uwxvm/Pt8S1Go0vEEgQA==
X-Received: by 2002:a05:690c:c15:b0:7c6:e377:1dc6 with SMTP id 00721157ae682-7c7e3134169mr12889267b3.0.1778707569565;
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:34 +0300
Subject: [PATCH v7 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-5-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: EC58553B0A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61545-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL_TRIGGER
flag to these GDSCs to indicate that their control can be passed to
hardware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


