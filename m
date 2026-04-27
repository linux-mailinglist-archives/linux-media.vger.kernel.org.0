Return-Path: <linux-media+bounces-59712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAwFIf2l72mvDgEAu9opvQ
	(envelope-from <linux-media+bounces-59712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:07:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B96CB478373
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83E2C3020644
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 18:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7BC3F0746;
	Mon, 27 Apr 2026 17:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5ZVQvp6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ECD3EE1FE
	for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312756; cv=none; b=dNTo7YfTY3sfpzhuB9zp0QXUbAQxN7pv1HI/OmNda35/15icqZ1I97Uxm3Vf9tuERfQdwdb5bumuBbPEXEe7yH7xSMVaNucb0gppB4rY3zOqX9CrYji3QUVRqVAxHXnGR6uTU2glKL31tWtAbUhjR7y0PTOShvVriXcDSadCXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312756; c=relaxed/simple;
	bh=xWCQTiEzfghbC7VbFI1MEd1lM2554cl+8OHIw3Kedgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sAj3LD7BJIbxtsEnK1azbDZAQrRLGZeJpEX6tIYCC3cEmhqPcadyCNE/AlapI4lKbxeCMf/nbRfHS59SSNtEOmJtkjTtERjiceC0nXQ2D2JpQ+Squxt2ivUTN4euYs7HjXeCswk1HgsqWK4Xl4egu7PD75ng4wdSRl0CZFH8gug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5ZVQvp6; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7b37d84a6b3so108936137b3.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2026 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312754; x=1777917554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=p5ZVQvp6TM0j/+XHmRcwDNTJPWaN261r7k6FsjHaTGeI285qLQCtHQJ9xgdScU6pbq
         RpNsQFtN7RSEGE+ccSPi54ek+KbCMYOH1YFuoZuHBs46NpR5Eo8xk0vC+LCdNhq4X+bo
         DTTarJZYrpketYNy2mA7zctymOEntvlvQhtitOu5ZHB8+8MGfQsFgVh54Vh4Er0AveP2
         f0u68oWeGx+DclCKgDfAj8M/8/xbGBaXYs1zXtUV7SMjrVMCHn0MAGUGNiJagr/IfImA
         JvhUohoOaU7lvLMwFTnJavaR18b3hdQhiod/hONYoGfomp2xXF9wglSoWCPdcROJgrX+
         iXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312754; x=1777917554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0h4F2YIx0fMm5jaITLIGlQr4i8xFco3Ysa7cVNzVI2U=;
        b=S9RtMuzZFrbRQ9CSG7jByQ59PuS+luhPOheQGDT3j5SU7iERK2opNXFKU2tpzY8GCQ
         Jy4SE+pOgJdAyDU04npAPaRXhQqO6j6E3CkVdCQWtQ8lgOJiM8ID4v0eDWEXoKqzaElu
         kiL15mxoY08L0xpu58eYr0ISAgoKB4Tf8nopQz+dyFpRbov/XRvkmAVs0U5LZCm9i9YH
         ASdDaGzc5dRyFD7Rtue6NWnjiMmm/Fnt6ty2veOh0RXXW/zx0yttaChFTYE9Z3urc1My
         auaBP3uCkaEgGHn2rG20p43aiG98xLvIjPoEwpMgv/grmo0VsB7N4kwrl4fZAMdeWgr9
         dZXA==
X-Gm-Message-State: AOJu0YzjftLFWfXwylTX+hcJaYQi8Za547gWlPikv1QDhvlRqhNEMwyq
	YMrjEnBcx3rmhXpp3sfakRXflMNKg6rX/n6bwXFy3pljqjNN89kMihAs
X-Gm-Gg: AeBDieuet4OZjtuksXCbjYbL/iivubD+POrY1B0bH2ZOq1QT4iCWl/kPZO+7k116tDp
	98puT9Ux9ccq5pJ5VM/GGkg7cwwlmbDBrMXAUtnwnKWhzGsMf/qhLbR+DlZyOKG4P0TsjGsUChG
	imAE6zlrVw7dxVmQ1bzkP2c8NybZA0tgeDyRUeKWETB8K63KbeXujxPP4okjYz08qvF0OeYDqUp
	uLlN4ZKGEJ3UzLaPvpnGMgU04XE9qbchADHtA+4n0nBhv54o1olft0AogmHDYHYeC2B4WRSuNsn
	YBRgCyKxOa9+OukMLgiujB9vrEul4PeG9JEUXPTp+2UtV3hXbNdu/SeboGQWljeZezSIYgUq1co
	mt6qXfFNfr12s5JltwC/8AwdhO/rH8bI/gtmtBx/p0KACZYWMH8PP7Q0OU5guAo8BNRgjf4Bu9F
	5gXUNfkEKIDaTR5DhbOFpI57/y7yM4SSCAVTKs
X-Received: by 2002:a05:690c:f06:b0:7b8:338d:7d7a with SMTP id 00721157ae682-7bceda1f77dmr4172297b3.14.1777312753954;
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:13 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:29 +0300
Subject: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core GDSCs
 as hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: B96CB478373
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59712-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Venus core clock cannot be enabled if Venus core GDSCs are switched off.
But since they are hardware controlled, they can be switched off at
any moment. Vote for the Venus core clock to enable it later when GDSCs
get turned on.

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


