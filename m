Return-Path: <linux-media+bounces-58903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLnHDevp4GmmnQAAu9opvQ
	(envelope-from <linux-media+bounces-58903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:53:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5DC40F3E4
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6297A318BC1A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98643D3339;
	Thu, 16 Apr 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AV++Rqct"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352D3D091F
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347086; cv=none; b=B/yC4mcmLzaLQFfOPFtPxRddn1jtNxQrTM4b8ZAbLaoHe/xdTIbqmsJElgm1hnHgEMU+ZIw7sblQaTEWLmf6/Zz2jF62QicN1oyQflOMzProqF2CNJBBJf4PwiSI/88fld5Za3LzPmuTkN39SLAdvcd56ligK6G3Z27Vo4ocH30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347086; c=relaxed/simple;
	bh=J7sL2NkZEJqTZ+HCRxCtzgI2NKoz7YhzKRP568/WqHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+mx/2OGFbWqfCmQHDMOwAr5SDA21bSIpw6fRIZ6LRt15qMcw+91A1lpSV1z5duCLc4mpyfj9E8CAV7/gTEs1xI8tDhLc300OVwl7GWYxDSdr8TXEq9cOTYOyN91qqzhq0GKbP+92wIj2atqCTW47Jluksn6dIPZP8v9aTDFnmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AV++Rqct; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7982c3b7dfcso79735627b3.0
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347082; x=1776951882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVm9l0nqXtaLey0hcJAht7fACRxgOJUi3K+WFaTIsMA=;
        b=AV++RqctfEknEDf1kZXvEZXWKISTRNtx7HjvRPEZT8JYUJ0PrsGu/ehI0vbr//D4CW
         KG0yDUU6OelquoPRS9Pcu1I8P8wgyhXoB5kLX7XVmj4gI2lZwdaCSuElmAcAU51Oqpzw
         gKsmKQIm7H3eZ/jtR8Z1Q/LPdY1ufRiWtydvtMV0G3IDwKocU5F8LfHgi1tIVeL/YjQm
         +cCvZSDFbvWyUrbh9dADh8CYDKkwO/NbESqEstD5u0h4gtLgQDT/6I3ASwEvfvreCdXk
         Dku4GICizqMuDX6PbYqUEegkTDmbjSOoH32FyJey9Ya8vK2VZpBO7jFYzRYJjOr1wq/S
         MmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347082; x=1776951882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fVm9l0nqXtaLey0hcJAht7fACRxgOJUi3K+WFaTIsMA=;
        b=C91TYKPWkNt9YBEVLZgxFzAytI1OaYwlLOATS/tHyNQVO1V7ZMiSb4SefXXzZcXbzh
         Elq2wMN5smg7T4b4YN4nK9B7yW4aDuV6v4i941AzPwu6gXc3wOjE16AvC7XprXJsTJDH
         WSnr6WdZBc8Ho36KE5KiU+VXON/pQqfp9/+HgpnjFXIwATLFD4FX0dlmZttzJGThjPc2
         WbsxenjOCyaMuKM/OUNPFA5uNUEG4grgJiI3dflujxzgjdUMsLdX8E6/dyJ/tVX6TiKd
         7zvzPqSEJ0CsI5fbasGs0zRsjQ0U7k7CiGCUGw/ySr5XDFaQfiaPUuiw/t0pEZD+TfRA
         Zd/g==
X-Gm-Message-State: AOJu0Yx8JxmmYiPFLwkZwwO/LTOuG2pMlEjiYstzwUDtRz46NvCQYc3z
	C7VyqElkOfvwZk01zZpJaBionRP5cBQdWMT/L/ZF36MvOYBTLW3xjw+t
X-Gm-Gg: AeBDiesN9qDpvaDwbs/zNXYaSzOMoCXHGnV5C4KaZg/uXa2LMNogBW1KBtxhxD78w9x
	GnsE2Da5CXFzs/1CXEEokEFMy5JGd5C2fD8pNs3W642aVaZuRiGRzOwZsMySmGQpwVdIZqjJLVe
	p2he1Afmx3UFqgRCejB/QI3qGRR01qeOfBV7Y6QulwG+zTb6MPsENesGI8GtiE7ACldqNgQ59Po
	rVUnO88XOk/ZSwPS2uLlVUVu2UX3YT40YNePHI0+OYw8v0Fw4AZ3NGCwfeZRWPmidlIHTGesCZS
	bvkzjMBcGictM3Yd86uPpOUab7zjCzxCwb8Iek7CBRmiTs8QhSGplFvWU50N+movOk3oBYFVtpb
	bfBJz9qSLqvPZcH6hYFy8LqmLAlzt13zQ3Q/ysbLarJOxN0nMq5aUMXHITmuJdbAepzzLI6gTGT
	7ZyiF2bDV7CoN5iwHdMHKpS0ovIw==
X-Received: by 2002:a05:690c:c4fa:b0:7b3:401f:2e64 with SMTP id 00721157ae682-7b3401f3ba0mr177002007b3.22.1776347081837;
        Thu, 16 Apr 2026 06:44:41 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b76931854esm23363737b3.37.2026.04.16.06.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:44:41 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 16 Apr 2026 16:43:54 +0300
Subject: [PATCH RFC 07/10] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-msm8939-venus-rfc-v1-7-a09fcf2c23df@gmail.com>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58903-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA5DC40F3E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
to these GDSCs to indicate that they are hardware controlled.

Because they can be switched off at any moment, also skip voting for
it so it can be enabled later.

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
2.53.0


