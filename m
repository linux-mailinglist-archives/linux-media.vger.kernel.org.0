Return-Path: <linux-media+bounces-56757-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BcyBfFxwWkQTQQAu9opvQ
	(envelope-from <linux-media+bounces-56757-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:01:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362D2F94DE
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 18:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C60730C4AB8
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 16:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D659D3B9D85;
	Mon, 23 Mar 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvwXyc4S"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC543B19AF;
	Mon, 23 Mar 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282221; cv=none; b=JegIF1Sa6BAtn/f5dzo6uZ+zTusSDS4thT2ynhxWdAv0r1t90RAfZ2RoMgEkYb0V3SHcxWbE41C4ZohoHUMvKig8rLGVWa4m6gTJqDZeed8KuokdGrBaysR4M8529FNgeNOy8+FeKRWCjFym0F8y1sfxPSDjmPn+4HKwGlAdskc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282221; c=relaxed/simple;
	bh=VsUdHqlhlUvKyc0L42d22zQZPq5fA8QvNwLkufbeD1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/2nj8wAiZWI6m9RPjdgR81HP27zaFjTwdNrdMm+KxbX4pRg2HfdAg1sZ3saaKmcZ6hDcHBsMtshEKnVlZ1bNC8+JKKlZ+irxntmr/ajDudcAwa4IuRA7Om/PdEzah1ohdv2Mr86if4uR62VXV2ZfMw0F304c59oHjWg3YkDvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvwXyc4S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B58C4CEF7;
	Mon, 23 Mar 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774282220;
	bh=VsUdHqlhlUvKyc0L42d22zQZPq5fA8QvNwLkufbeD1c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NvwXyc4SAjEhAiKz0fyLNIoXMjAq9f8xSn9n6quSTymEUZHI/zNPV4zBufs6qus4b
	 INXCXaqdZF4gVbyFy353rpJRYyU4ssJEz/YuWpnQQhBCyxttjo+17dRCcOsQH1Iv3s
	 z5p/NbDUdWkdI2hNI4WjXAV7DsiKGLjwW76xXo/D9FafW2AZa+qeR4Jak37GPR2+ue
	 GHY9izFAlZkqdoDeTxjVJ26xKhrtUbL67JX6TmE6p0nemDW3f2FWy4ayn7GrNh6T0e
	 yMnBFLRgNSDFNfKRNEWWxGo/4vdmO56gELXngeZEJiFpyzbyRpXMLOnPk/XHi1iZRq
	 Y99CjmVdq9Wng==
Message-ID: <478a3bbf-ea44-4bc4-a841-f7f0eba1d963@kernel.org>
Date: Mon, 23 Mar 2026 17:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-2-loic.poulain@oss.qualcomm.com>
 <94b415bf-9a76-4d31-add4-6283e8b43b72@kernel.org>
 <CAFEp6-3xmL4q9eSLpUZjdP5z1yCr_AJxSLmzqF70S05DK7Or1Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFEp6-3xmL4q9eSLpUZjdP5z1yCr_AJxSLmzqF70S05DK7Or1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56757-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1362D2F94DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23/03/2026 17:03, Loic Poulain wrote:
> Hi Krzysztof,
> 
> On Mon, Mar 23, 2026 at 2:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 23/03/2026 13:58, Loic Poulain wrote:
>>> Add Devicetree binding documentation for the Qualcomm Camera Subsystem
>>> Offline Processing Engine (OPE) found on platforms such as Agatti.
>>> The OPE is a memory-to-memory image processing block which operates
>>> on frames read from and written back to system memory.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>
>> I don't see explanation in cover letter why this is RFC, so I assume
>> this is not ready, thus not a full review but just few nits to spare you
>> resubmits later when this becomes reviewable.
>>
>>> ---
>>>  .../bindings/media/qcom,camss-ope.yaml        | 86 +++++++++++++++++++
>>>  1 file changed, 86 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>>> new file mode 100644
>>> index 000000000000..509b4e89a88a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
>>
>> Filename must match compatible.
> 
> Some bindings (for example clock/qcom,mmcc.yaml) do not strictly
> follow this rule and instead use a more generic filename that groups
> multiple device-specific compatibles. I mention this because my
> intention with a generic filename was to allow the binding to cover
> additional compatibles in the future.
> 
> As I understand it, in the current state I should either:
> - rename the file so that it matches the specific compatible, e.g.
> qcom,qcm2290-camss-ope.yaml, or

This one.

> - keep the generic filename (qcom,camss-ope.yaml) and add a top-level
> const: qcom,camss-ope compatible to justify the generic naming.

Because this would be a reverse logic... Name of file is never an
argument/reason to add a compatible.


> 
> Any preferred/valid direction?
> 
>>
>>> @@ -0,0 +1,86 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>
>> ...
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - interconnects
>>> +  - interconnect-names
>>> +  - iommus
>>> +  - power-domains
>>> +  - power-domain-names
>>> +
>>> +additionalProperties: true
>>
>> There are no bindings like that. You cannot have here true.
> 
> ok.
> 
>>
>> Also, lack of example is a no-go.
> 
> Ouch, yes. Would it make sense to have dt_binding_check catch this
> kind of issue?

Not sure if worth implementing. Every new binding is a copy of existing
one and 99% of them have examples, so how new binding could be created
without one? This is highly unlikely and most likely there are other
issues as well, because process is broken, so dtschema won't help.

And with LLM you can write whatever will pass dtschema but still make
not sense.

Best regards,
Krzysztof

