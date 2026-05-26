Return-Path: <linux-media+bounces-62803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM+CDyGlFWqJXAcAu9opvQ
	(envelope-from <linux-media+bounces-62803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:50:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A90405D6D9E
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 15:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A4AF304A789
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081203FBB76;
	Tue, 26 May 2026 13:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2VeFqz/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF843ACA5D;
	Tue, 26 May 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803048; cv=none; b=f6FgOJuqHYSJFB9zw9DbBh6X7Fbgf4ZHL2MRAKGovAc/wwQ9/yKrYxuE+4GT6CCUm1kKs9SSXNzKyheAY55rRi1rzyyPbHMY4Vco09PLes2OWUYlATmHpHsxtc9wzrQhHkrB3FBRa1vAxKIXLWwJjai53Q2P84aXdxWiCvHyBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803048; c=relaxed/simple;
	bh=mYPxTOETVmAboVVh4FgTiR8dtOcapXs73a154Du1G34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yb0onQRA9pCGGr4mZgyPFQb9rP9/qX2vPjLTYpxx9cXBgIbk+ruazcBx/kmGLwa6wLILZOZTpLYcJ2gcdS4HJfad0c2FWpvx0EoulwaxiNPwIlwHv0x4CxbURe368EmOSiqFA83DxTdwGNRDisGEeb37NHBMDNwz0EXGUexVObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2VeFqz/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B501F000E9;
	Tue, 26 May 2026 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803046;
	bh=QN4MjxVxMCgHqIddjx5qFUH8kBX74IXWCOYQd8AGPF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=P2VeFqz/YoBHO5qKpq1kWeVcozXN6qvysMLmCpOLtoEBJMUeW4Sg0HzSnyUepLLzq
	 duWNBSGAnD0+dP3s4QbNdkb4WfiQ0bevih37fV2GndAYAukITQQBllwx77Pnw9BjWD
	 G8n/9/0Yh3EF9dZHl/V4JsVenF8Um7YZxC8oySDPiYir/qkQDp5k7udr6dNzjk48J5
	 Bv0D3thJbwPjTH/fZ9p3JBNhYyXPv/RTgzWj8MrsioHzkUGBHqZzWh0Yugq/5gExUW
	 Io+Hr8VBcYTZ3Mv6SEP81dJKkbvN96+5vufh2Du401OcMj6UDch9fxBIY/RxtsYCAH
	 iKGfAbKGGkyaw==
Message-ID: <607a69d1-cc2e-4543-9dc9-a63f83a1ee0b@kernel.org>
Date: Tue, 26 May 2026 14:43:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
 <gO634V-8H3-u5Fpc-OhdhU02KNxJ7-9XC6npigDRHkM9npjunHw3Q1W3MqgQ97U9vhJxkmciuEFUNqyGTxN1uA==@protonmail.internalid>
 <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-2-bb1069f3fe02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62803-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A90405D6D9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/2026 14:24, Erikas Bitovtas wrote:
> Allow Venus core GDSCs to have their control passed to hardware, so they
> can be powered on by Venus firmware.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..956295289ae8 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
> 
>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>   	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT,
>   	.clkr = {
>   		.enable_reg = 0x4c02c,
>   		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
> 
>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>   	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT,
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
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

