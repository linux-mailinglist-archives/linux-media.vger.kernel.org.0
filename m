Return-Path: <linux-media+bounces-60027-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNd4I9xs8mkMrAEAu9opvQ
	(envelope-from <linux-media+bounces-60027-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:41:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C449A376
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D42F43054F6B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40813A0EA5;
	Wed, 29 Apr 2026 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhNAQjxb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132C34B66F;
	Wed, 29 Apr 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777495239; cv=none; b=iFamJJ4ajDHjrZb5SkOSLgl7g5yDa+/NVHZnny9T0REWqWdI1aEdlsItrL18d+zyfedi/dbfxszvIYi8ssd1lugoIoSfRt4nf8Do/zCv+HhabddfO3feONSnFRbvqIrYninyFRzQk2mHeIDllRbVL25tVqymr9QexiAUEfGSo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777495239; c=relaxed/simple;
	bh=RMLcQJJNC4SMyMimRZPEc4qkILRGGn/CHxLxUpM36R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0lj4Kf7YfmWTcWhm9/11YE7+A0+VIbLECAssqnMUoA0CBUjDBxDkb4vVIOWyjBKFPxRUbCJwA3mM7UzIwOmiO0vb/pxtGa14S9/UhSgd/Iy+yDlC/sSA+HL9LQEBKXkSjXJRv+fe1CGZ1dEXGMIpq+rdISGZez4LbY0jFEfPwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhNAQjxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B55C19425;
	Wed, 29 Apr 2026 20:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777495238;
	bh=RMLcQJJNC4SMyMimRZPEc4qkILRGGn/CHxLxUpM36R8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RhNAQjxbf7tcUUT6ibsm+nTvGXa0U22X+Whm9Jml2ZlJ9IR7Z2xZ3HLRNNDjsp3Ue
	 DewjGx4aQfyGRT46Iq9MujiesFuM/C0H2Ot79znSS/s72bwPDfipO07cceFa2BybYY
	 wygS6Bmxq3gla8AOqNySNbiX1cyICe+zs6zfry3cgIZwP4fZFYbsol1UGmpLgueRWn
	 tUmCwVNATkaN2mqTYbvWzF0il1PlhvddydUI40gmcRknGV5nItcwchW6k/Qw2zO4eo
	 RCYyUcHXZVoKPspjZbK7kga7CdIHVtOqrAJP/9p8XfjNPn2hBkxR/dx0UCQ1+Pw0ZY
	 OmN7LMQmYlxoQ==
Message-ID: <1b72000f-ff3d-493b-bd70-e0f3d45d78ee@kernel.org>
Date: Wed, 29 Apr 2026 21:40:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <9kBbj8Jr-f6eqC6XfnJPf3gKQD-3WfzXgzl4KEVKhRZlW2_GftgFBsijqUgEvGcgmeFqPwtVquMmibHUMaR_sQ==@protonmail.internalid>
 <20260427-msm8939-venus-rfc-v3-7-288195bb7917@gmail.com>
 <0ee6bf23-17a3-4a7c-93d2-276e97cc3a14@kernel.org>
 <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
 <YFtrV3he8diR63hM-WC6tLDO2r5soHv4LHmm4YazfqNevyVk4RBsFsQIm5PqOCSDRzxi33BeOPp0NkQdB6iwGw==@protonmail.internalid>
 <05df6383-5325-4f88-9638-22bc2d7a768d@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <05df6383-5325-4f88-9638-22bc2d7a768d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 239C449A376
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
	TAGGED_FROM(0.00)[bounces-60027-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,apitzsch.eu,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
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

On 29/04/2026 15:00, Erikas Bitovtas wrote:
> 
> 
> On 4/29/26 12:18 PM, Konrad Dybcio wrote:
>> On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
>>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>>>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>>>> to these GDSCs to indicate that they are hardware controlled.
>>>>
>>>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>>>> But since they are hardware controlled, they can be switched off at
>>>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>>>> get turned on.
>>>>
>>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>>> ---
>>>>    drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>>>> index 45193b3d714b..420997b00ae0 100644
>>>> --- a/drivers/clk/qcom/gcc-msm8939.c
>>>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>>>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>>>
>>>>    static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>        .halt_reg = 0x4c02c,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>>        .clkr = {
>>>>            .enable_reg = 0x4c02c,
>>>>            .enable_mask = BIT(0),
>>>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>>
>>>>    static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>>>        .halt_reg = 0x4c034,
>>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>>        .clkr = {
>>>>            .enable_reg = 0x4c034,
>>>>            .enable_mask = BIT(0),
>>>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>>>        .pd = {
>>>>            .name = "venus_core0",
>>>>        },
>>>> +    .flags = HW_CTRL,
>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>    };
>>>>
>>>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>>>        .pd = {
>>>>            .name = "venus_core1",
>>>>        },
>>>> +    .flags = HW_CTRL,
>>>>        .pwrsts = PWRSTS_OFF_ON,
>>>>    };
>>>>
>>>>
>>>> --
>>>> 2.54.0
>>>>
>>>
>>> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
>>>
>>> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.
>>
>> i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER
>>
> I tried to revert the patch and replace HW_CTRL with HW_CTRL_TRIGGER -
> both result in power collapse fails.> Konrad
> 

I assume you still can't bring either core up as encoder in this case ?

i.e. what we'd like to understand is if perhaps for some reason the GDSC 
on/off control is the cause of the encoder failure.

I'm OOO at the moment but from memory I think the documentation for 8939 
states that it can do the same things 8916 can but with higher 
resolution - and clocks obviously.

Another core if I remember and something about HVEC.

I'm not sure what it says about HEVC.

Meh - two upstream decoders is better than zero upstream support.

Probably time to transition this series away from RFC..

---
bod

