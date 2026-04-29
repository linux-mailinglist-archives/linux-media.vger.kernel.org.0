Return-Path: <linux-media+bounces-59975-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COikH40Q8mmPngEAu9opvQ
	(envelope-from <linux-media+bounces-59975-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:07:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B86D49556D
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 16:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF1B310BF34
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 14:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC013B27F5;
	Wed, 29 Apr 2026 14:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxkyfsFv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D2F33F58E
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471209; cv=none; b=Rwge89f6i8J69nUv+D9ehkEkNimmhsIqGHnNvRPebVz+2ZIva3CyRGxoiJ/9XsjAnobsIc1BYkVpwtYMeNgllRizkzGUHrsmcePUPiS2T9qOKEOsZ+0IcGD0wpy1NuC8cMljrCkvLPdjW6Co6H6KxfKmWPUi7+714mjdwjDd6Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471209; c=relaxed/simple;
	bh=uybU3a3N0n0+jby1CmvCwk1L1SefcxFqIYnY1BYddAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwOnq9vSlbVq6pERBi79Rv5mvymHoUBTkbHDxRfW+LzhTQQo4HjGg/MeB86ckFd0ALIIfiaXflLZnLJWhfBIAVwIm4BneylYiRpOvPwLNgx7747fCUvTfAGzL0jCQ9AtRveeNPsIT14I26Uup/7litlqMSq9fGolDd7vwM8arJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxkyfsFv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so113926005e9.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777471206; x=1778076006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=mxkyfsFvPVBCUGLbQM+72bZVdnssX9Y05xc2sKUybW9xAr80jXDNfSTDWEBc9ERQzK
         xRCC7+HbSaDH3E1ZhIqdShw3xKz+b4gNCKt8Fil+TOxwDZvMWMDUn8TbJG4Zz/5J8a3e
         4HtyqCkjWIFBsw119wcUumysVqAGQqahwKVcw00SjN8PeVD+9KgGKuF1XzIyG4PtLaX9
         Vlmc8X3fdV6DDhnip+sQwp7g+TD8kSyUxXSAXjSEgiae8b2gtGab/KqJJD6EaVWkGMu1
         hkBSFPPq8NO51el2QCMJCCkm1GxEcWfPNikhslB5Kvs8Dxdr82L5+JuLlFJF3k1YRlM6
         niMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471206; x=1778076006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXYxfb1OnKvjy9v+vQDtCcuNHO3JiDi1MdrPDxdzPQ4=;
        b=Rdz1ttnf2d+hdUz/ZxIM62DmTyLjc7NIXSkOcc7ZC6NKv9vDSxH9RyI89YV9smjJ4k
         JlcpJnSpxeXenXSB9PjilxvL/w0IjxVPn3sGZQFRcM0fmL4UKp9cH7xOR/2PtCJ3l6nH
         mOoBt91N6inM5qTDV9spKnad6a6dftVMFeuno0Gtn2n1BOnWXbKNZlXWWU2bhiSWbbbq
         w31UpvupEv1rblYyOpZ8vtngkCyt+QM+kX8sHZowjHexk8mIaLLKVQVFNo8M36JN1cff
         A9bvuAViZ/+gn2kY/HAqkNoWWcQguW3yJ8Pc0SySOcI/PpWum+YjlpJiG1JcG+OP5uTP
         p2Lg==
X-Gm-Message-State: AOJu0Yz6bp85hxTSSErV7FqC9PrFdcKYPWsDNEB1ciT2BavhdNSOT50Y
	YBPrLPl4lJIaCPNHDt37nUatPtFZdSm3KgUE9GLfZP25iDDxENleiaA5
X-Gm-Gg: AeBDiestpsSzRPw8PvDeUFDWrbd+OX4elWeaO5eTISEhTucu4w2SbAOPmYxtqv/8KvJ
	VwWPTArjE5T3ixbp83555faJbdeUVzzfYF1C01tq+CqMOMgXcCj6pcRHXCc+f+MIFZYM7Y8HaP0
	Tlk62Ue75fbjd4Stxc4nvdUhnO3klPHs33Wk5gLlfMJK7eY2yQG3UO6pwsFWVjYfznR6guSiQAK
	vnbPvDHwMBPZ5IziKVzHZaBi5Y8BtwTfC9sarn+/TFHh6BXeG95Y6F5L9sS1IB0G8ESdjSyIEQP
	WVeHAyEVmGZbArdINy5YAnMHnMyf8/yt0plb3msHALL5DOw/CSfbD4X5cD9KOqO7OMwgRakW3Cy
	KbX1hRKCAPk0n5yKSGLyjMH8hzeOWhAkI8bNWaUprS79Uc/aB3nG5OdRGejL5gEwVIrytl72pRM
	2SPSg9YRjQGd5hyZXNCiRNjrt61iFn1Pk5vjeTlorx3z7FGvGXYbKuye80x48HIwjOxtqZ7Hk9J
	w==
X-Received: by 2002:a05:600c:c048:b0:48a:6268:18a9 with SMTP id 5b1f17b1804b1-48a782dd8e3mr77937175e9.13.1777471202791;
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Received: from ?IPV6:2a00:f502:160:68fe:a26c:adcb:8da8:2? ([2a00:f502:160:68fe:a26c:adcb:8da8:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216eecsm5409919f8f.9.2026.04.29.07.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 07:00:02 -0700 (PDT)
Message-ID: <05df6383-5325-4f88-9638-22bc2d7a768d@gmail.com>
Date: Wed, 29 Apr 2026 17:00:00 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] clk: qcom: gcc-msm8939: mark Venus core
 GDSCs as hardware controlled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
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
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <1120b76e-3c98-4f32-821f-baab667dfc38@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B86D49556D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59975-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]



On 4/29/26 12:18 PM, Konrad Dybcio wrote:
> On 4/29/26 6:14 AM, Bryan O'Donoghue wrote:
>> On 27/04/2026 18:58, Erikas Bitovtas wrote:
>>> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
>>> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
>>> to these GDSCs to indicate that they are hardware controlled.
>>>
>>> Venus core clock cannot be enabled if Venus core GDSCs are switched off.
>>> But since they are hardware controlled, they can be switched off at
>>> any moment. Vote for the Venus core clock to enable it later when GDSCs
>>> get turned on.
>>>
>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>> ---
>>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
>>> index 45193b3d714b..420997b00ae0 100644
>>> --- a/drivers/clk/qcom/gcc-msm8939.c
>>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>       .halt_reg = 0x4c02c,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c02c,
>>>           .enable_mask = BIT(0),
>>> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>>>       .halt_reg = 0x4c034,
>>> +    .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>           .enable_reg = 0x4c034,
>>>           .enable_mask = BIT(0),
>>> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core0",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>>>       .pd = {
>>>           .name = "venus_core1",
>>>       },
>>> +    .flags = HW_CTRL,
>>>       .pwrsts = PWRSTS_OFF_ON,
>>>   };
>>>
>>>
>>> -- 
>>> 2.54.0
>>>
>>
>> The downstream opts to put the GDSC under hw control, which is not the same thing as it being under hw control, its up to you to put it under hw control.
>>
>> So you might want to be more conservative especially given you have a problem getting the encoder and decoder to run simultaneously - I might try parking this patch and then see what happens.
> 
> i.e., Bryan is asking you to replace HW_CTRL with HW_CTRL_TRIGGER
> 
I tried to revert the patch and replace HW_CTRL with HW_CTRL_TRIGGER -
both result in power collapse fails.> Konrad


