Return-Path: <linux-media+bounces-62226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEdgOcFxDWroxQUAu9opvQ
	(envelope-from <linux-media+bounces-62226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:33:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14C589D41
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBE0F300E174
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956503AF643;
	Wed, 20 May 2026 08:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EraA7ikw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E28534D4EA;
	Wed, 20 May 2026 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265973; cv=none; b=ftSSaLyBtU9eyw1CRmnQSCs6mwFEToQ+nDKSiFuE7WPNmpL5pAp+QR7Bfan25DppUwmnefj+9AoHf39+WPcaqxW1aM+8ppyPAgpQtMth4tKt9Sxdj4wuUMaa2FyqyhROGOuXjbU9bhcfLDNR4jyad8oxcaJ0V+sCj6yniYJzSRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265973; c=relaxed/simple;
	bh=LDpDhxRpBfVpi13r5lyYCmeVykn//KKpy8BnEIX31PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpMsf3PC0GkjOQVnvtp1Vy4QLdoXYK51/tPu0RbqkFqxd/4HBESvMrD3VtVuPlvRMK6Jg9J5HRqg+O+jM3j0FlE4/KBNYQczlOBLM+d6CktmtXW6TOr1svidzZGCuEWA3gJS11fTAf90iVLscu+hlJGYmWvVb9NTSN0XudlXCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EraA7ikw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21A11F000E9;
	Wed, 20 May 2026 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779265971;
	bh=YKrFOQNx0hwSBXjTU6sfU7/cmZEOZ9u9Bp2K+er5Jc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EraA7ikwHrH9vZTHR7BcY3VGsmKuh64M9dGdXINYL2Rj//o7FFNof+NMneSyLoTdX
	 yzEfFu2u1pz41QY2AM29vPQJuE0F74jPcLlehwY+0P1Y2HbcsOOwTiKQY0dMox5pJs
	 nJKe09okhaL8a3i9Thg8mb0yjDG1dabxhhrbLHG/chkKhHNiry9lqi2/wgwtekeL+8
	 YKL/U3MNOvdAvISeZBfXqt2jwudypNj+JbxekTr1idxHADGj4SAOqU4qobPcNLczUK
	 wbZIhQmMgj0/vCcSI1g+6YQFjiXzCM0HX+Dy1xiXVkyG1jVcliV0dvpZoUS5WlFIH7
	 lVsGvQHYvwAgg==
Message-ID: <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
Date: Wed, 20 May 2026 09:32:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62226-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CB14C589D41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 16:10, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..243d31a32e92 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
> 
>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>   	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT_SKIP,
>   	.clkr = {
>   		.enable_reg = 0x4c02c,
>   		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
> 
>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>   	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT_SKIP,
>   	.clkr = {
>   		.enable_reg = 0x4c034,
>   		.enable_mask = BIT(0),
> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>   	.pd = {
>   		.name = "venus_core0",
>   	},
> +	.flags = HW_CTRL_TRIGGER,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>   	.pd = {
>   		.name = "venus_core1",
>   	},
> +	.flags = HW_CTRL_TRIGGER,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> 
> --
> 2.54.0
> 

@Tanyia

Can you confirm this change please ?

---
bod

