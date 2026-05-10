Return-Path: <linux-media+bounces-61021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOuyOYNUAGp5GQEAu9opvQ
	(envelope-from <linux-media+bounces-61021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB8D503691
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 11:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12DE630086BF
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 09:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A3537C92E;
	Sun, 10 May 2026 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKvODCBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF437CD2C
	for <linux-media@vger.kernel.org>; Sun, 10 May 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406488; cv=none; b=qQP630J1pvRKjLLJgs1Y5SPJ9Sf7Ea4J1OOiDfM3d/48BkYiE+oYkbFJX/eM5lSoADO59CCzVpc4uR3U/QXxeRYbeDxGxFyc8rUNW+4qrw8qmK9gCK81VK7EbkZ3wlJMHJRu6EjuRlclsM0Rl0LN7EOvC1GZo99pEd55buhLisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406488; c=relaxed/simple;
	bh=LVWWWUYdv9PCfUhr1DTi4tk8Hze1kjyRj4+I8oegEow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0AXJtZGK/UfqzQLMWI2bJVnNTr5SkQp3PgVl7PBGEQFLdak4wicIxZb0VpauMssTnHxzy7eCT2wgELUtTy5kgoGyD+jKQCEepfEzraGy/BY9K5Zos4KHa0zP9nW8vWlATFuTbZaVss2/vgq4G1Eldt4BxtAl2z0mlPaX7BjTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKvODCBM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so21658585e9.1
        for <linux-media@vger.kernel.org>; Sun, 10 May 2026 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406485; x=1779011285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=RKvODCBMXGHFhmD+8r3Nqe0oYd2nUXpE3d7VKaUzaj9Bla3JjpSb90JCwiz9ASi50Q
         Smhy3PQ9U6t3WSsF3BtGjAMHkmkAl1ZmCAW5U9T/qhigXX0qym9bsOLR1X5mMCL5p00+
         6OVrDcHWOgw6L2Hr8eCa624MwnriX8hH2T3e7zeRsfkHANW3Y8maceDumTCd1kiYk6Ht
         ig90YfLXoT/qTRt7/1aw9AoQvD5V35xxnOWDfuLD/k6sv/skdG+ArFpNfQEh5t+lx2Wh
         +/WB6/MxKSvzCz4680wdVnZeT+jVJkLfYKWOLu92HULup4Z0tlmoha+umPFXK4xTCZln
         V/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406485; x=1779011285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgYHSDLzlb7ot3DGMDiEetIcL4BenND3LUUZjAQekh8=;
        b=JX2AtGGEVQO3PiLOHhu5ZaRKjiweRr4GwoCBumKqOcDKvkiNRvS7XtUACP719wjcy1
         9N7v82mXyP6P7HXwVuyIYWUJTsupH+iIPoRICHz4B1/dzpMPVSpUCOnLSsO4qsovzzD3
         PAZ4jXgjhIIB5/TwhtsgUCl7RzwVYVqIUPqbUXF/74QYtrW+dM79ubmzF7rsC+bv8ycq
         9ZL2RhvUbGuKNZBFZbzwpzgYKf1ThZuSwN5F8a5bkTBe1HlLBLQ8Px87QBusUDVgnrob
         1ETVOiPXLPCeeGW86d+xKqR4NsWek6M5ZRh5NuMPO1rEeVFFHm3uloDBYCGKmmxCzA7C
         SShQ==
X-Gm-Message-State: AOJu0YwaNvL0tFf0nBzxBaPTbuBcOwYN9q4h+V9IDaCxQLGD+8yu6/pA
	wRxPSsywr3Gc0wFrdCSg+7rbYzZx4nVcx9lg7wQ32AxVULVAWiJ5M290
X-Gm-Gg: Acq92OGmb+PkKg1wCpHNaTP5rpsVj3LwCKOCiaTkzd0sl3+5pCLelCt0SLLvzRb8634
	jShRhxt7epjPFdYD1VMCfOMBpmnY0MoAWoX06MG0jKrnzE0j0cE79Gm5oWGTpNdpCx5cnhQnDp6
	gNH8J1tDumf//usFqWRAs+gWGjJh7IG8hYCh8Sll5BaijLsQEBoEbLAKySdvMV0AixRCxcBlwak
	ie/RMPX6iJfOi56OsZD3hGveeNxejNBk3Z0L8lPsihagaVexbpjwLolp/3yhR4GjaU/Awh0rYjq
	oerGJ3Un/h0IHqtSWl/3B8jbdZmCtVVPra+4KNOzOwQVHRA7/bGgknTQzib5BaDrHYhzJVQ0HA0
	mD0uxRV9JtwzctPxXKcaFOYtVCFnd9VhA6a1dqyEKQnQJ3RYQfX0mTyVrijRqA8U+mq0PAK6Q58
	0HfAXHNi+nOPYhHcL9kMXFsoilUOuJ
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr174341785e9.7.1778406485414;
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:05 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:43 +0300
Subject: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
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
X-Rspamd-Queue-Id: 0AB8D503691
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61021-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to pass their control to hardware.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are set to be hardware controlled, they can be switched
off at any moment. Vote for the Venus core clock to enable it later when
GDSCs get turned on.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..420997b00ae0 100644
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
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


