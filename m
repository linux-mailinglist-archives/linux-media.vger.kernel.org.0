Return-Path: <linux-media+bounces-59767-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDmBBRde8GnDSQEAu9opvQ
	(envelope-from <linux-media+bounces-59767-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:13:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABEB47E8C1
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4343305E9B1
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 07:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F533B0ADD;
	Tue, 28 Apr 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f69C224W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C253AA1B2;
	Tue, 28 Apr 2026 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360225; cv=none; b=SNniDVVM1T2iTDUJ2zmPgEHxkPLtbMn3dYwQaCVgefOguHTkwNXzD5sMcqb0iVBWNrtxZzmZIsRV56MOfoPICVIAJvVU6oHwMaYcEVrkb2+7K1w5ZVwm+ThA2IjFP1/G5SMkktGAXtLj6PKJnukSx8JEOMBg6W67sbop23bUvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360225; c=relaxed/simple;
	bh=TtoGexmgAiwUbNPhRjJiMmOOiVKbBVpRUGsDRKUVH1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhbrN+sWKedPQqzKydAGBsp+kNC9dud3mnoANrlfiG2XtQcwnooHcJibBoVEuxKgYC/JvhCxvmyFZ04Mhy+3KGTwhkKFA6y09gXkHXNYkMngYXZ217+b/e2WsGbtQN7Rxj97uv+lQCNON5F80hrl9YurLJrrvm6aZ4rxq2HldLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f69C224W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DC1C2BCB6;
	Tue, 28 Apr 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777360225;
	bh=TtoGexmgAiwUbNPhRjJiMmOOiVKbBVpRUGsDRKUVH1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f69C224W4LOKHE7t55Ksp7Y4hpBRp4cwPKqPzt36knA3cZSUAvfi68GFPbkB1CGEX
	 6aa2XgD+oJibpT7osVJpLOOk37Nbb1n6GPP9T0l1msAru9Cq9Cj0oYXa3sJ1xoPdsT
	 +Q93i1A6O19kKyMYZAzoUoCj+caJoziwZCa4URV3c8sDR7mLt6FdOcDy/c/hP4VDCY
	 806r2K/gx90h6M9XXqAJetRHC0MuqKLE87pHthvigZw+nLBDPhMGipmjojt1nL/RGb
	 ioRPYcP3lisDoBpM0bkUAKrJwa9NFYUcDiaPXvdbn6emeRMtfidwvhGBInd3Y4XEgY
	 x6oQ2iPBpXXxQ==
Message-ID: <56d609dd-62be-47eb-8ba3-c5d70d773113@kernel.org>
Date: Tue, 28 Apr 2026 08:10:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 04/11] arm64: dts: qcom: msm8939: Add venus node
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
 <Xfiq_WNTU9P-ThZLMs4plWE5hwtmwyVyKJc1bD5BKdhERGouucNpyuenIoKQiKfZKaRzP-PdamsNlQ8vezjrRg==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-4-288195bb7917@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8ABEB47E8C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59767-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 27/04/2026 18:58, Erikas Bitovtas wrote:
> +			video-decoder {
> +				compatible = "venus-decoder";
> +				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +				clock-names = "core0", "core1";
> +				power-domains = <&gcc VENUS_CORE0_GDSC>,
> +						<&gcc VENUS_CORE1_GDSC>;
> +				power-domain-names = "core0", "core1";
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
> +					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
> +				clock-names = "core0", "core1";
> +				power-domains = <&gcc VENUS_CORE0_GDSC>,
> +						<&gcc VENUS_CORE1_GDSC>;
> +				power-domain-names = "core0", "core1";
> +			};

So to be fair in this case you do have a reason to have an encoder and 
decoder compatible here _but_ it should be the case that one one of the 
sub-devices contains CORE0 related stuff and the other CORE1 related stuff.

Because in that case the sub-devices actually represent individual 
hardware settings.

So listing power-domains and clocks for both cores in each node like 
this militates against that.

The other thing is to double check of the encoder and decoder are 
inter-changable here i.e. can either core be encoder or decoder or is it 
fixed ?

I believe on older generations - perhaps not on 8939 it is not 
interchangable.

If it is interchangable then declaring either node specifically encoder 
or decoder is incorrect so you should declare that inline in venus itself.

Perhaps Vikash or Dikshita could confirm whether or not the cores have 
fixed encoder/decoder functionality.

TBH I think you should stick to the inline declaration.

---
bod

