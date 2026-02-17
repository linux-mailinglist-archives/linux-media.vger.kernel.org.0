Return-Path: <linux-media+bounces-52988-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPf0GwaglGknGAIAu9opvQ
	(envelope-from <linux-media+bounces-52988-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 18:06:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9C014E850
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 18:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34BEC3007A50
	for <lists+linux-media@lfdr.de>; Tue, 17 Feb 2026 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DDD36F431;
	Tue, 17 Feb 2026 17:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZO8u/UQh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB72BD030;
	Tue, 17 Feb 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771347966; cv=none; b=HHr4zEDwTGQ4xtz+VT/8xKxeR6X179PBnq2UMW3GJTbcM+mYtx3q+0YcdABVo/cuPF9UhOacnm8Z+tXNs+LaNZON/gXm1dqYv5omqeqJNJt8F1DyxiBqBTP1bURMhUNg8p2cqQfHutAjplrVZg2VpkQ0D7Lr+Lvfo7xFfUqFjpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771347966; c=relaxed/simple;
	bh=OIiUD/1C3K/G4eVgh0WXMWAxBp0KWfvZbf0rdNyWZgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpDtc3+6CgNm8Qa4WoiwAU++laOJStZef9AERT282OgGJFscLt5hC15BvpcSAQyMDUT/hzD8fHMGJ7Eax/HaIqfsxaz7UMWsg67YVMwteEP5r+Zz20ortwithZdxPyEJrJ27LVu6fr1TXhYsp/3U6f00NIjegFsCO0K1pgoiO/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZO8u/UQh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266E1C4CEF7;
	Tue, 17 Feb 2026 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771347965;
	bh=OIiUD/1C3K/G4eVgh0WXMWAxBp0KWfvZbf0rdNyWZgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZO8u/UQhSdUBE9q1WYCbf+6xSm2cbvdJJucPkVGbEjK1rA2e67hUf/sfPGG+oOJ3v
	 nw9m+Fgm4Xp7iMk5gvvi+ArZk6p5W2ReONTeK4XifluGAkVYoy6hdaB/7nbK9GdGoO
	 fV68oaFgFYb8uNBrtx6BBUPTEXJ5hmvEFKvHGOe5UmmwsYrkVvLU2WOyrPdwQUfRhr
	 9XlM8ZCG3v9i/msc8NigofULclq0tkilIuQuOEHsVJRDktv2IxnJVP0fjLybp0aQCj
	 RAA16YZnautyXvTAduhYVGqd8Y0fINQawV9qS7MKtzIGG86MX+p0MExhs3espJlxwD
	 Wnnu57xwUHxmA==
Message-ID: <0bce5fdd-0035-4962-a929-c6e5e0f9308f@kernel.org>
Date: Tue, 17 Feb 2026 18:05:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <20260126-kaanapali-iris-v1-1-e2646246bfc1@oss.qualcomm.com>
 <r642meaclfme7thmb6spkna6xiuhbjuqw6x32jndjqhwqjtbbr@qkcziz3cyxb6>
 <b5ac0ab7-2540-4691-99b8-18d67ac63717@oss.qualcomm.com>
 <dhcsnc6y2r2bcjlc54ebo2hakc4tufub6f4oluqq6etjzdlas2@ggwzwoz24kjc>
 <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5170c5df-e22e-46c0-9713-3c4e7bbdbf63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52988-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC9C014E850
X-Rspamd-Action: no action

On 17/02/2026 16:34, Vikash Garodia wrote:
> 
> On 2/17/2026 8:06 PM, Dmitry Baryshkov wrote:
>> On Tue, Feb 17, 2026 at 07:13:39PM +0530, Vikash Garodia wrote:
>>>
>>> On 1/27/2026 8:39 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jan 26, 2026 at 05:55:44PM +0530, Vikash Garodia wrote:
>>>>> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
>>>>> compared to previous generation, iris3x, it has,
>>>>> - separate power domains for stream and pixel processing hardware blocks
>>>>>     (bse and vpp).
>>>>> - additional power domain for apv codec.
>>>>> - power domains for individual pipes (VPPx).
>>>>> - different clocks and reset lines.
>>>>>
>>>>> iommu-map include all the different stream-ids which can be possibly
>>>>> generated by vpu4 hardware.
>>>>
>>>> It's not how it can be defined.
>>>
>>> Do you mean to elaborate the different entries within iommu-map or to
>>> elaborate the different stream ids and how they are grouped into different
>>> functions ?
>>
>> The comment was sent three weeks ago.
> 
> yeah, if you could still recollect, you can comment.
> 
>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>> ---
>>>>>    .../bindings/media/qcom,kaanapali-iris.yaml        | 234 +++++++++++++++++++++
>>>>>    1 file changed, 234 insertions(+)
>>>>>
>>>>> +
>>>>> +  iommu-map: true
>>>>
>>>> This is totally underspecifified.
>>>
>>> oneof would be a better approach describing the possible stream-ids.
>>
>> oneOf of what? It is items with the definition of each item.
> 
> something like below,
> 
> properties:
>    iommu-map:
>      description: |
>        List of IOMMU stream IDs corresponding to hardware function IDs.
>        The number of entries depends on the SoC variant.
>      type: array
>      oneOf:
>        - minItems: 8
>          maxItems: 8
>          items:
>            type: integer
>            description: IOMMU stream IDs
> 
>        - minItems: 9
>          maxItems: 9
>          items:
>            type: integer
>            description: IOMMU stream IDs


This gives no useful description. Can it be something else than IOMMU
stream ID? No, it cannot. Saying then that this is stream ID is like
saying listing clocks and calling them "clock input".

This should be list of descriptions explaining their function/purpose or
whatever region is there mapped.

Best regards,
Krzysztof

